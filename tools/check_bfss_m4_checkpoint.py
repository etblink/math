#!/usr/bin/env python3
"""Schema-2 live checkpoint validation; never a substitute for Lean/CI evidence."""
from __future__ import annotations
import ast
import hashlib
import json
from pathlib import Path
import re
import subprocess

BRANCH = 'integration/bfss-unified-research-20261108'
SHA = re.compile(r'[0-9a-f]{40}')

def require(ok, message):
    if not ok:
        raise AssertionError(message)

def blob(path):
    data = path.read_bytes()
    return hashlib.sha1(b'blob '+str(len(data)).encode()+b'\0'+data).hexdigest()

def check_checkpoint(root: Path, s: dict):
    require(s.get('schema_version') == 2, 'M4 schema mismatch')
    require(s.get('purpose') == 'canonical_live_checkpoint_not_proof_receipt', 'proof/checkpoint conflation')
    require(s.get('branch') == BRANCH and s.get('milestone') == 'M4', 'unreviewed branch or milestone')
    require(s.get('roadmap') == 'BFSS_ACTIVE_ROADMAP.md', 'roadmap moved')
    require(s.get('toolchain') == {'lean':'4.34.1','mathlib':'d13f23b723b8a846827a245b89c10fc7d3f11612'}, 'toolchain drift')
    h = s['historical_checkpoint']
    require(h['git_blob'] == 'db3005c09dab0eb6983975ba91ff9332aaa78d46'
            and blob(root/h['path']) == h['git_blob'], 'historical G15/G16 checkpoint lost or changed')
    a = s['active']
    require(re.fullmatch(r'P3-M4-[A-Z0-9]+', a.get('gate','')), 'malformed M4 gate')
    require(a.get('status') in {'RED_UNQUALIFIED','PENDING_STRICT_CI','GREEN_QUALIFIED','BLOCKED'}, 'unreviewed status')
    require(a.get('qualification') == (a['status']=='GREEN_QUALIFIED'), 'unqualified gate promoted')
    anchors = s['accepted_anchors']
    require({x['gate'] for x in anchors} >= {'P3-M4-LB1C1','P3-M4-LB1L2'}, 'accepted anchors erased')
    require(s['last_qualified'] in anchors, 'last-qualified anchor not indexed')
    for x in anchors + [a]:
        for kind in ('source','consumer','workflow'):
            require(SHA.fullmatch(x.get(kind+'_blob','')) is not None, 'missing blob '+kind)
            require(blob(root/x[kind]) == x[kind+'_blob'], 'pinned bytes changed: '+x[kind])
        if x in anchors:
            require(x.get('verdict') == 'GREEN' and x.get('run_id') and SHA.fullmatch(x.get('tested_sha','')),
                    'accepted anchor lacks exact receipt')
            require(x.get('source_reports',0) == x.get('consumer_reports',0) > 0, 'incomplete anchor consumers')
            require(set(x['allowed_axioms']) == {'propext','Classical.choice','Quot.sound'}, 'anchor axiom policy changed')
            require(str(x['run_id']) in (root/x['receipt']).read_text(), 'anchor receipt does not name run')
    workflow = (root/a['workflow']).read_text()
    match = re.search(r'(?m)^\s*pins=(\{.*\})$', workflow)
    if match is not None:
        # Historical accepted workflows use one literal pin dictionary.
        pins = ast.literal_eval(match[1])
    else:
        # CT0 uses a multiline dictionary with one source path prefix.
        # Parse only restricted static AST; never execute workflow code.
        lines = workflow.splitlines()
        starts = [i for i, line in enumerate(lines)
                  if re.fullmatch(r'\s*pins=\{\s*', line)]
        require(len(starts) == 1, 'strict workflow pin table missing or ambiguous')
        start = starts[0]
        ends = [i for i in range(start + 1, len(lines))
                if re.fullmatch(r'\s*\}\s*', lines[i])]
        require(bool(ends), 'strict workflow multiline pin table unclosed')
        finish = ends[0]
        pin_ast = ast.parse('\n'.join(lines[start:finish + 1]).lstrip()).body
        require(len(pin_ast) == 1 and isinstance(pin_ast[0], ast.Assign)
                and len(pin_ast[0].targets) == 1
                and isinstance(pin_ast[0].targets[0], ast.Name)
                and pin_ast[0].targets[0].id == 'pins'
                and isinstance(pin_ast[0].value, ast.Dict),
                'strict workflow pin syntax is not an explicit dictionary')
        bases = re.findall(r'(?m)^\s*base=(["\'][^\n]+["\'])$', workflow)
        require(len(bases) == 1, 'strict workflow pin base missing or ambiguous')
        base = ast.literal_eval(bases[0])
        require(isinstance(base, str) and base.startswith('lean/'),
                'strict workflow pin base must be original Lean path')
        def pin_string(node):
            if isinstance(node, ast.Constant) and isinstance(node.value, str):
                return node.value
            if isinstance(node, ast.Name) and node.id == 'base':
                return base
            if isinstance(node, ast.BinOp) and isinstance(node.op, ast.Add):
                return pin_string(node.left) + pin_string(node.right)
            raise AssertionError('unsupported dynamic pin expression')
        pins = {}
        for path_node, hash_node in zip(pin_ast[0].value.keys, pin_ast[0].value.values):
            path_value, digest = pin_string(path_node), pin_string(hash_node)
            require(path_value not in pins and re.fullmatch(r'[0-9a-f]{40}', digest) is not None,
                    'duplicate pin path or malformed Git blob SHA')
            pins[path_value] = digest
    require(isinstance(pins, dict) and bool(pins), 'strict workflow empty pin table')
    require(pins.get(a['source']) == a['source_blob'] and pins.get(a['consumer']) == a['consumer_blob'],
            'source/consumer workflow binding differs from live state')
    for path, expected in pins.items():
        require(blob(root/path) == expected, 'strict donor drift: '+path)
    require('-DwarningAsError=true' in workflow and 'maxRecDepth' not in (root/a['source']).read_text(),
            'strict policy changed')
    if a['status'] in {'RED_UNQUALIFIED','GREEN_QUALIFIED'}:
        require(a.get('run_id') and SHA.fullmatch(a.get('tested_sha','')), 'verdict lacks exact execution')
        receipt = (root/a['receipt']).read_text()
        require(str(a['run_id']) in receipt and a['tested_sha'] in receipt, 'verdict receipt mismatch')
        if a.get('evidence_archive'):
            require(hashlib.sha256((root/a['evidence_archive']).read_bytes()).hexdigest()==a['artifact_sha256'],
                    'complete evidence archive missing or changed')
        else:
            require(a['status'] == 'RED_UNQUALIFIED' and a.get('failure_phase') == 'PREFLIGHT_BEFORE_LEAN'
                    and a.get('artifact_id') and re.fullmatch(r'[0-9a-f]{64}', a.get('artifact_sha256',''))
                    and blob(root/a['evidence_job_log']) == a['evidence_job_log_blob'],
                    'preflight RED requires complete pinned job log and exact provider artifact reference')
    if a['status']=='GREEN_QUALIFIED':
        expected_reports = 3 if a['gate'] == 'P3-M4-CT0' else 2
        require(a.get('source_reports') == a.get('consumer_reports') == expected_reports
                and a.get('strict_outcome') == 'success' and a.get('strict_marker'),
                'incomplete strict qualification')
        require('STRICT GREEN' in (root/a['receipt']).read_text(),
                'green lacks acceptance receipt')
        if a['gate'] == 'P3-M4-CT0':
            import zipfile
            require(a.get('run_id') == 43983772199
                    and a.get('tested_sha') == '7f7ae98f77858f79beccd9e1efdd334b513e2f56'
                    and a.get('artifact_id') == 14285716957
                    and a.get('artifact_sha256') == '9e0a0118673c45300ff90414d039a64987d41dc04dd4559368c4bb2e595a7b8d'
                    and a.get('evidence_archive_blob') == blob(root/a['evidence_archive'])
                    and a.get('evidence_job_log_blob') == blob(root/a['evidence_job_log'])
                    and a.get('evidence_preservation_job_log_blob') == blob(root/a['evidence_preservation_job_log'])
                    and a.get('evidence_manifest_blob') == blob(root/a['evidence_manifest'])
                    and a.get('evidence_preservation_run') == 43987114193,
                    'CT0 original evidence bytes or rehash provenance drift')
            manifest = json.loads((root/a['evidence_manifest']).read_text())
            require(manifest['original_artifact_sha256'] == a['artifact_sha256']
                    and manifest['original_evidence_git_blob'] == a['evidence_archive_blob']
                    and manifest['tested_sha'] == a['tested_sha']
                    and manifest['strict_run'] == a['run_id']
                    and manifest['preservation_run'] == a['evidence_preservation_run']
                    and manifest['cold_jobs'] == a['cold_build_jobs'] == 9180
                    and len(manifest['source_reports']) == len(manifest['consumer_reports']) == 3,
                    'CT0 original evidence manifest mismatch')
            with zipfile.ZipFile(root/a['evidence_archive']) as z:
                expected_names = {'tested-commit.txt','preflight.log','cold-source.log',
                                  'source-axioms.log','consumer.log'}
                require(z.testzip() is None and set(z.namelist()) == expected_names,
                        'CT0 original ZIP integrity or entries mismatch')
                require(z.read('tested-commit.txt').decode().strip() == a['tested_sha'],
                        'CT0 original ZIP tested commit mismatch')
                require('BFSS_M4_CT0_EXACT_SOURCE_CONSUMER_DONOR_TOOLCHAIN_AND_CHECKPOINT_PREFLIGHT_PASS'
                        in z.read('preflight.log').decode(),
                        'CT0 original preflight missing')
                require('Build completed successfully (9180 jobs).'
                        in z.read('cold-source.log').decode(),
                        'CT0 original cold build missing')
                for name in ('source-axioms.log','consumer.log'):
                    report = z.read(name).decode()
                    require('sorryAx' not in report and 'error:' not in report
                            and report.count('depends on axioms:') == 3,
                            'CT0 archived root reports changed: '+name)
            require(a['strict_marker'] in (root/a['evidence_job_log']).read_text()
                    and 'BFSS_CT0_R2_ORIGINAL_ZIP_REHASH_PASS' in
                        (root/a['evidence_preservation_job_log']).read_text(),
                    'CT0 original strict and preservation receipts missing')
    if a['gate'] == 'P3-M4-CT0':
        require(s['last_qualified']['gate'] ==
                    ('P3-M4-CT0' if a['status'] == 'GREEN_QUALIFIED' else 'P3-M4-LB1P0B')
                and a['expected_source_reports'] == a['expected_consumer_reports'] == 3
                and a['independent_controls'] == 4
                and a.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound']
                and ((a.get('attempt') == 'R1'
                      and a.get('pending_tested_sha') == '144d2d1d9c7b14199ad5ebf9e0c0dfe13410e55e'
                      and a.get('pending_run_id') == 43980155870)
                     or (a.get('attempt') == 'R2'
                      and a.get('previous_red_run') == 43980155870
                      and a.get('previous_red_tested_sha') == '144d2d1d9c7b14199ad5ebf9e0c0dfe13410e55e'
                      and a.get('prior_red_artifact_id') == 14284665134
                      and a.get('prior_red_artifact_sha256') == '8657ba3a6002428c8e7194d88460ac7998ed2ed4b86aeeaf6816613a3953e3b3'
                      and a.get('prior_red_job_log_blob') == blob(root/a['prior_red_job_log'])
                      and str(a['previous_red_run']) in (root/a['prior_red_receipt']).read_text()
                      and a.get('source_blob') != '6f884308f3029d5e2b227ddcabd0558e35c2c6f8')),
                'CT0 registration cannot erase predecessor, R1 RED, or strict contract')
    if a['status']=='PENDING_STRICT_CI':
        require(a.get('accepted_predecessor_run') == s['last_qualified']['run_id'],
                'pending gate qualified-predecessor drift')
        first_attempt = (a.get('attempt') == 'R1'
                         and a.get('accepted_predecessor_run') == s['last_qualified']['run_id'])
        retry = a.get('attempt') != 'R1' and bool(a.get('previous_red_run'))
        require((root/a['prospective_receipt']).is_file()
                and SHA.fullmatch(a.get('contract_commit','')) is not None
                and (first_attempt or retry), 'pending gate lacks qualified predecessor/prior RED and pre-gate contract')
    f = s['strategic_focus']
    for key in ('full_G16_qualified','physical_Spin9_qualified','full_bivector_bracket_qualified',
                'physical_Hardy_fidelity_qualified','positive_eigenpair_qualified'):
        require(f.get(key) is False, 'physical promotion needs separately reviewed schema: '+key)
    roadmap = (root/s['roadmap']).read_text()
    require('LIVE CONSOLIDATION CHECKPOINT' in roadmap and 'BFSS_GATE_STATE.json' in roadmap,
            'live roadmap not discoverable')
    watch = (root/'.github/workflows/bfss-roadmap-watch.yml').read_text()
    require('P3M4*.lean' in watch and 'BFSSP3M4*.lean' in watch and 'check_bfss_m4_checkpoint.py' in watch,
            'M4 source/consumer/checker changes do not trigger watchdog')
    changes = subprocess.check_output(['git','diff','--name-only','HEAD^','HEAD'],cwd=root,text=True).splitlines()
    source_dir = 'lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/'
    for name in changes:
        stem = Path(name).stem
        if name.endswith('.lean') and ((name.startswith(source_dir) and stem.startswith(('P3D5','P3M2','P3M3','P3M4','P3M5')))
                or name.startswith('lean/diagnostics/BFSSP3M4')):
            require(name in {a['source'],a['consumer']}, 'source changed outside active contract: '+name)
    print('BFSS_ROADMAP_CHECK_PASS schema 2 milestone M4 accepted',s['last_qualified']['gate'],
          'active',a['gate'],a['status'])
