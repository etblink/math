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
        expected_reports = (1 if a['gate'] in {'P3-M4-QTC1G0','P3-M4-W0A0','P3-M4-W0A2','P3-M4-W0A3','P3-M4-W0B1','P3-M4-W0H0','P3-M4-W0H1A'} else
                            3 if a['gate'] in {'P3-M4-CT0','P3-M4-QTC0C','P3-M4-W0B2A','P3-M4-W0B2B','P3-M4-W0C0','P3-M4-W0C2A','P3-M4-W0C2B0','P3-M4-W0C2B0N'} else 2)
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
    if a['gate'] == 'P3-M4-QTC0A' and a['status'] == 'GREEN_QUALIFIED':
        import zipfile
        require(a.get('run_id') == 44001621836
                and a.get('job_id') == 133766836613
                and a.get('tested_sha') == 'c2697826a7ebd258f604e60def408a84f52a61b9'
                and a.get('source_blob') == 'b0b519e46566856e100bf6aa882f9fcdf37d397e'
                and a.get('consumer_blob') == '9d1dc845bea73d8e07549c69d9ef07804509f52e'
                and a.get('workflow_blob') == 'f765eab05612b9f4ea0ec94ec8f981fe19b130d2'
                and a.get('artifact_id') == 14292159303
                and a.get('artifact_sha256') == 'bf8d93fe00846c9ea26815d32ee331424d9510d1816b66cd98c90ef82baf724c'
                and a.get('evidence_archive_blob') == blob(root/a['evidence_archive'])
                == '7cebb61b36ba22283cbd27a8d5f91b301b7303e2'
                and a.get('evidence_job_log_blob') == blob(root/a['evidence_job_log'])
                and a.get('evidence_manifest_blob') == blob(root/a['evidence_manifest'])
                and a.get('cold_build_jobs') == 8963,
                'QTC0A original strict artifact/metadata or accepted bytes drift')
        manifest = json.loads((root/a['evidence_manifest']).read_text())
        require(manifest['original_artifact_sha256'] == a['artifact_sha256']
                and manifest['original_evidence_git_blob'] == a['evidence_archive_blob']
                and manifest['original_tested_sha'] == a['tested_sha']
                and manifest['original_run'] == a['run_id']
                and manifest['original_job'] == a['job_id']
                and manifest['job_log_git_blob'] == a['evidence_job_log_blob']
                and len(manifest['source_reports']) == len(manifest['consumer_reports']) == 2
                and manifest['independent_controls'] == 4
                and manifest['auditor_negative_controls'] == 6,
                'QTC0A evidence manifest does not match qualified gate')
        with zipfile.ZipFile(root/a['evidence_archive']) as z:
            expected_files = {'tested-commit.txt', 'preflight.log', 'cold-source.log',
                              'source-axioms.log', 'consumer.log'}
            require(z.testzip() is None and set(z.namelist()) == expected_files,
                    'QTC0A provider-original ZIP damaged or incomplete')
            for name, digest in manifest['evidence_files'].items():
                require(hashlib.sha256(z.read(name)).hexdigest() == digest,
                        'QTC0A provider-original member SHA256 changed: '+name)
            require(z.read('tested-commit.txt').decode().strip() == a['tested_sha']
                    and 'BFSS_M4_QTC0A_SOURCE_CONSUMER_EVERGREEN_DONORS_PREDECESSOR_AND_STOP_PREFLIGHT_PASS'
                    in z.read('preflight.log').decode()
                    and 'Build completed successfully (8963 jobs).' in z.read('cold-source.log').decode(),
                    'QTC0A tested commit, source preflight or native build incomplete')
            pat = re.compile(r"(?m)^'([^'\n]+)' depends on axioms: \[([^\]]*)\]")
            expected_roots = {
                'source-axioms.log': {'originalFock_commutator_complex_smul',
                                      'originalFock_quadratic_covariance_expanded'},
                'consumer.log': {'originalFock_complex_scalar_consumer',
                                 'originalFock_quadratic_covariance_consumer'}}
            allowed = {'propext', 'Classical.choice', 'Quot.sound'}
            for name, expected in expected_roots.items():
                report = z.read(name).decode()
                found = pat.findall(report)
                require('sorryAx' not in report and 'error:' not in report
                        and len(found) == 2
                        and {ident.rsplit('.', 1)[-1] for ident, _ in found} == expected,
                        'QTC0A original theorem root audit changed: '+name)
                for _, axioms in found:
                    require({token.strip() for token in axioms.split(',') if token.strip()} <= allowed,
                            'QTC0A report contains unapproved axiom')
        joblog = (root/a['evidence_job_log']).read_text()
        require(a['strict_marker'] in joblog
                and 'BFSS_M4_QTC0A_AUDITOR_POSITIVE_AND_6_NEGATIVE_CONTROLS_PASS' in joblog,
                'QTC0A complete job log lacks strict or mutant-auditor marker')
    if a['gate'] == 'P3-M4-LB1P1' and a['status'] == 'GREEN_QUALIFIED':
        import zipfile
        require(a.get('run_id') == 43998813826
                and a.get('job_id') == 133757449826
                and a.get('tested_sha') == 'de3af5cd0f7aa82de8aa9c7439bee46d02a37a02'
                and a.get('artifact_id') == 14290894037
                and a.get('artifact_sha256') == '6bcfef6696d6399c3f03ade5c0f97a732ee2f802ba9ab8ff13e6e6734d0db9a6'
                and a.get('evidence_archive_blob') == blob(root/a['evidence_archive'])
                and a.get('evidence_job_log_blob') == blob(root/a['evidence_job_log'])
                and a.get('evidence_preservation_job_log_blob') == blob(root/a['evidence_preservation_job_log'])
                and a.get('evidence_manifest_blob') == blob(root/a['evidence_manifest'])
                and a.get('evidence_preservation_run') == 44000111416
                and a.get('cold_build_jobs') == 8965,
                'P1 original GREEN source/consumer/ZIP/rehash receipt mismatch')
        manifest = json.loads((root/a['evidence_manifest']).read_text())
        require(manifest['original_artifact_sha256'] == a['artifact_sha256']
                and manifest['original_evidence_git_blob'] == a['evidence_archive_blob']
                and manifest['original_tested_sha'] == a['tested_sha']
                and manifest['original_run'] == a['run_id']
                and manifest['independent_preservation_run'] == a['evidence_preservation_run']
                and manifest['cold_build_jobs'] == a['cold_build_jobs']
                and len(manifest['source_reports']) == len(manifest['consumer_reports']) == 2,
                'P1 original GREEN evidence manifest drift')
        with zipfile.ZipFile(root/a['evidence_archive']) as z:
            want_files = {'tested-commit.txt','preflight.log','cold-source.log',
                          'source-axioms.log','consumer.log'}
            require(z.testzip() is None and set(z.namelist()) == want_files,
                    'P1 original ZIP corrupt or partial')
            require(z.read('tested-commit.txt').decode().strip() == a['tested_sha']
                    and 'BFSS_M4_LB1P1_SOURCE_CONSUMER_DONOR_TOOLCHAIN_STOP_RULE_PREFLIGHT_PASS'
                    in z.read('preflight.log').decode(),
                    'P1 original tested commit or preflight mismatch')
            require('Build completed successfully (8965 jobs).' in z.read('cold-source.log').decode()
                    and 'sorryAx' not in z.read('cold-source.log').decode(),
                    'P1 original cold proof mismatch')
            pat = re.compile(r"(?m)^'([^'\n]+)' depends on axioms: \[([^\]]*)\]")
            roots = {
                'source-axioms.log': {
                    'originalFock_fourFactor_commutator_from_two_covariances',
                    'originalSource48_fourMajorana_commutator'},
                'consumer.log': {
                    'originalFock_fourFactor_conditional_consumer',
                    'originalSource48_fourMajorana_consumer'}}
            allowed = {'propext','Classical.choice','Quot.sound'}
            for filename, expected_names in roots.items():
                report = z.read(filename).decode()
                found = pat.findall(report)
                require('sorryAx' not in report and 'error:' not in report
                        and len(found) == 2
                        and {name.rsplit('.',1)[-1] for name, _ in found} == expected_names,
                        'P1 archived original theorem roots mismatch')
                for _, axioms in found:
                    require({x.strip() for x in axioms.split(',') if x.strip()} <= allowed,
                            'P1 archived original report contains unapproved axiom')
        require(a['strict_marker'] in (root/a['evidence_job_log']).read_text()
                and 'BFSS_P1_R2_ORIGINAL_GREEN_ZIP_REHASH_PASS'
                in (root/a['evidence_preservation_job_log']).read_text(),
                'P1 original strict success or independent rehash marker missing')
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
    if a['gate'] == 'P3-M4-CT1G0':
        require(s['last_qualified']['gate'] == 'P3-M4-CT0'
                and s['last_qualified']['run_id'] == 43983772199
                and a.get('expected_source_reports') == a.get('expected_consumer_reports') == 3
                and a.get('independent_controls') == 4
                and a.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound'],
                'CT1G0 source/consumer/gate contract drift')
        if a.get('attempt') == 'R2':
            require(a.get('previous_red_run') == 43988822460
                    and a.get('previous_red_tested_sha') == 'a04d3240b8e1649ca058772af7a98f73095a177c'
                    and a.get('prior_red_artifact_id') == 14287816678
                    and a.get('prior_red_artifact_sha256') == 'c03e06d90de7d0a7e946a55d27f5bd2c2d7e03981355d80ad512ff8dbe61d75e'
                    and a.get('prior_red_job_log_blob') == blob(root/a['prior_red_job_log'])
                    and a.get('prior_red_evidence_archive_blob') == blob(root/a['prior_red_evidence_archive'])
                    and hashlib.sha256((root/a['prior_red_evidence_archive']).read_bytes()).hexdigest() == a['prior_red_artifact_sha256']
                    and str(a['previous_red_run']) in (root/a['prior_red_receipt']).read_text()
                    and a.get('source_blob') != 'e4837ccb96108ecabcebfd0ba2534398fe0ddb2a'
                    and a.get('consumer_blob') != '2d38aa70c6b4a55d4b8af3245d6d63b15839d697',
                    'CT1G0 R2 does not retain original R1 RED or unchanged original gate limits')
    if a['gate'] == 'P3-M4-LB1P1':
        require(s['last_qualified']['gate'] ==
                    ('P3-M4-LB1P1' if a['status'] == 'GREEN_QUALIFIED' else 'P3-M4-CT0')
                and s['last_qualified']['run_id'] ==
                    (43998813826 if a['status'] == 'GREEN_QUALIFIED' else 43983772199)
                and a.get('attempt') in {'R1','R2'}
                and a.get('expected_source_reports') == a.get('expected_consumer_reports') == 2
                and a.get('independent_controls') == 4
                and a.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound']
                and a.get('stop_rule_inherited') == 'CT1G0_R1_R2_STOPPED_NO_R3',
                'P1 strict scope, Fock theorem roots or accepted predecessor drift')
        stopped = s.get('previous_active_CT1G0_R2_stopped',{})
        require(stopped.get('gate') == 'P3-M4-CT1G0'
                and stopped.get('attempt') == 'R2'
                and stopped.get('status') == 'RED_UNQUALIFIED'
                and stopped.get('qualification') is False
                and stopped.get('stopped') is True
                and stopped.get('stop_reason') == 'TWO_ANALOGOUS_NATIVE_RECURSION_FAILURES'
                and stopped.get('run_id') == 43991790285
                and stopped.get('previous_red_run') == 43988822460
                and stopped.get('artifact_sha256') == 'a4611075b4eb0ce42f010e2530e1b2d351c5adc3eee43a3709c091b296a2efe8'
                and stopped.get('evidence_archive_blob') == blob(root/stopped['evidence_archive'])
                and stopped.get('evidence_job_log_blob') == blob(root/stopped['evidence_job_log'])
                and hashlib.sha256((root/stopped['evidence_archive']).read_bytes()).hexdigest()
                    == stopped['artifact_sha256']
                and '43991790285' in (root/stopped['receipt']).read_text()
                and '43988822460' in (root/stopped['architecture_review']).read_text(),
                'prior CT1 original REDs lost or stop rule bypassed')
    if a['gate'] == 'P3-M4-LB1P1' and a.get('attempt') == 'R2':
        require(a.get('previous_red_run') == 43996551474
                and a.get('previous_red_tested_sha') == 'c34911208aae4964283b39454ed41d990eb1306e'
                and a.get('prior_red_artifact_id') == 14290412981
                and a.get('prior_red_artifact_sha256') == '0d873a2259c24bc4ccdbb3be175869ad413504dcd0cd12fe8b25830e557e7420'
                and a.get('prior_red_archive_blob') == blob(root/a['prior_red_archive'])
                and a.get('prior_red_job_log_blob') == blob(root/a['prior_red_job_log'])
                and hashlib.sha256((root/a['prior_red_archive']).read_bytes()).hexdigest() == a['prior_red_artifact_sha256']
                and '43996551474' in (root/a['prior_red_receipt']).read_text()
                and a.get('source_blob') == '9a2899e24c02cb5a5dd58159605a34195fce3856'
                and a.get('consumer_blob') == '5822a7290c04e5fc88b297ad14d9d16b8c290bbd',
                'P1 R2 prior original donor-name RED or unchanged consumer missing')
    if a['gate'] == 'P3-M4-QTC0A':
        require(s['last_qualified']['gate'] ==
                    ('P3-M4-QTC0A' if a['status'] == 'GREEN_QUALIFIED' else 'P3-M4-LB1P1')
                and s['last_qualified']['run_id'] ==
                    (44001621836 if a['status'] == 'GREEN_QUALIFIED' else 43998813826)
                and a.get('attempt') == 'R1'
                and a.get('first_atom') == 'WEIGHTED_QUADRATIC_LEIBNIZ_EXPANSION'
                and a.get('expected_source_reports') == a.get('expected_consumer_reports') == 2
                and a.get('independent_controls') == 4
                and a.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound'],
                'QTC0A weighted-only gate / accepted P1 predecessor drift')
        p1 = s.get('previous_active_LB1P1_R2_qualified',{})
        require(p1.get('gate') == 'P3-M4-LB1P1'
                and p1.get('status') == 'GREEN_QUALIFIED'
                and p1.get('qualification') is True
                and p1.get('run_id') == 43998813826
                and p1.get('artifact_sha256') == '6bcfef6696d6399c3f03ade5c0f97a732ee2f802ba9ab8ff13e6e6734d0db9a6'
                and p1.get('evidence_archive_blob') == blob(root/p1['evidence_archive'])
                and hashlib.sha256((root/p1['evidence_archive']).read_bytes()).hexdigest()
                    == p1['artifact_sha256']
                and p1.get('evidence_job_log_blob') == blob(root/p1['evidence_job_log'])
                and p1.get('evidence_manifest_blob') == blob(root/p1['evidence_manifest']),
                'qualified original P1 strict ZIP or independent evidence lost')
        stopped = s.get('previous_active_CT1G0_R2_stopped',{})
        require(stopped.get('gate') == 'P3-M4-CT1G0'
                and stopped.get('status') == 'RED_UNQUALIFIED'
                and stopped.get('stopped') is True
                and stopped.get('stop_reason') == 'TWO_ANALOGOUS_NATIVE_RECURSION_FAILURES'
                and stopped.get('run_id') == 43991790285
                and stopped.get('previous_red_run') == 43988822460
                and stopped.get('evidence_archive_blob') == blob(root/stopped['evidence_archive'])
                and hashlib.sha256((root/stopped['evidence_archive']).read_bytes()).hexdigest()
                    == stopped['artifact_sha256'],
                'CT1G0 two-RED stop history must remain preserved')
    if a['gate'] == 'P3-M4-QTC0B':
        require(s['last_qualified']['gate'] == 'P3-M4-QTC0A'
                and s['last_qualified']['status'] == 'GREEN_QUALIFIED'
                and s['last_qualified']['run_id'] == 44001621836
                and (a.get('attempt') == 'R1' or
                     (a.get('attempt') == 'R2'
                      and a.get('previous_red_run') == 44012367725
                      and a.get('prior_red_artifact_id') == 14296824993
                      and a.get('prior_red_artifact_sha256') == 'a50bc06b6f5ac03c15be16de7b943910ca55bc3a7960f40829c1049e8402c5c1'))
                and a.get('first_atom') == 'GENERIC_QUADRATIC_TENSOR_COEFFICIENT_REINDEXING'
                and a.get('accepted_predecessor_run') == 44001621836
                and a.get('expected_source_reports') == a.get('expected_consumer_reports') == 2
                and a.get('independent_controls') == 7
                and a.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound'],
                'QTC0B staged tensor contraction must inherit accepted QTC0A')
        prior = s.get('previous_active_QTC0A_R1_qualified',{})
        require(prior.get('run_id') == 44001621836
                and prior.get('status') == 'GREEN_QUALIFIED'
                and prior.get('source_blob') == 'b0b519e46566856e100bf6aa882f9fcdf37d397e'
                and prior.get('consumer_blob') == '9d1dc845bea73d8e07549c69d9ef07804509f52e'
                and prior.get('workflow_blob') == 'f765eab05612b9f4ea0ec94ec8f981fe19b130d2'
                and prior.get('artifact_sha256') == 'bf8d93fe00846c9ea26815d32ee331424d9510d1816b66cd98c90ef82baf724c'
                and prior.get('evidence_archive_blob') == blob(root/prior['evidence_archive'])
                and hashlib.sha256((root/prior['evidence_archive']).read_bytes()).hexdigest()
                     == prior['artifact_sha256'],
                'QTC0B may not lose prior original provider ZIP or accepted source')
        if a.get('attempt') == 'R2':
            old = s.get('previous_active_QTC0B_R1_RED', {})
            require(old.get('status') == 'RED_UNQUALIFIED'
                    and old.get('qualification') is False
                    and old.get('run_id') == 44012367725
                    and old.get('tested_sha') == '7fbb73ee8b3f46d1a1d657c18c797d26ea2cc5c0'
                    and old.get('source_blob') == 'ab7b1dbf31ad92000184204f14d083400d39bc00'
                    and old.get('consumer_blob') == a.get('consumer_blob')
                    and old.get('artifact_sha256') == 'a50bc06b6f5ac03c15be16de7b943910ca55bc3a7960f40829c1049e8402c5c1'
                    and old.get('evidence_archive_blob') == blob(root/old['evidence_archive'])
                    and hashlib.sha256((root/old['evidence_archive']).read_bytes()).hexdigest() == old['artifact_sha256']
                    and old.get('evidence_job_log_blob') == blob(root/old['evidence_job_log'])
                    and '44012367725' in (root/old['receipt']).read_text()
                    and a.get('prior_red_artifact_sha256') == old['artifact_sha256']
                    and a.get('prior_red_archive_blob') == old['evidence_archive_blob']
                    and a.get('prior_red_job_log_blob') == old['evidence_job_log_blob'],
                    'QTC0B R2 must preserve original provider ZIP, whole R1 RED and first causal')
        if a.get('stopped') is True:
            import zipfile
            require(a.get('attempt') == 'R2'
                    and a.get('status') == 'RED_UNQUALIFIED'
                    and a.get('qualification') is False
                    and a.get('stop_reason') == 'TWO_ANALOGOUS_NATIVE_DIRECT_FOCK_REWRITE_ELABORATION_FAILURES'
                    and a.get('run_id') == 44014529416
                    and a.get('job_id') == 133809148410
                    and a.get('tested_sha') == '7bef2507e243824b0b8bcba9893d292c8d93fc88'
                    and a.get('source_blob') == '6836880557ec917cd14c54f4f3b011f9aa840a74'
                    and a.get('consumer_blob') == '00755f559de156912d301efd91d944711ae382f6'
                    and a.get('workflow_blob') == '59880991d90f1e8b6f7c387f34133cc04c31f7c4'
                    and a.get('artifact_id') == 14297929785
                    and a.get('artifact_sha256') == 'f7fa7726865600cab92e1270b558dcc856ad0cfc28318f2bb7d95e74b7ab8dbb'
                    and a.get('evidence_archive_blob') == blob(root/a['evidence_archive'])
                    == '485d47d68a5425a79d720248a4b64b972da619ab'
                    and a.get('evidence_job_log_blob') == blob(root/a['evidence_job_log'])
                    == '6290b76858d5e736b04af723532d94fec6b3e532'
                    and a.get('evidence_manifest_blob') == blob(root/a['evidence_manifest'])
                    == '9b99cc5346defa99307cd6dd6fe5b11430473892'
                    and a.get('source_reports') == a.get('consumer_reports') == 0
                    and a.get('independent_consumer_executed') is False
                    and '44014529416' in (root/a['receipt']).read_text()
                    and '44012367725' in (root/a['architecture_review']).read_text(),
                    'QTC0B R2 two-red stop/bytes, proof scope or exact provider ZIP changed')
            require(s.get('previous_active_QTC0B_R2_stopped') == a
                    and s.get('previous_active_QTC0B_R2_pending',{}).get('attempt') == 'R2',
                    'QTC0B R2 pending state or stopped acceptance lost')
            manifest = json.loads((root/a['evidence_manifest']).read_text())
            require(manifest.get('original_run') == a['run_id']
                    and manifest.get('original_job') == a['job_id']
                    and manifest.get('original_tested_sha') == a['tested_sha']
                    and manifest.get('original_artifact_sha256') == a['artifact_sha256']
                    and manifest.get('original_evidence_git_blob') == a['evidence_archive_blob']
                    and manifest.get('full_job_log_git_blob') == a['evidence_job_log_blob']
                    and manifest.get('zip_size_bytes') == 3984
                    and manifest.get('source_axioms') == 'sorryAx_PRESENT_FROM_UNRESOLVED_GOALS',
                    'QTC0B R2 original artifact manifest does not match accepted red')
            with zipfile.ZipFile(root/a['evidence_archive']) as z:
                members = {'preflight.log', 'tested-commit.txt', 'cold-source.log'}
                require(z.testzip() is None and set(z.namelist()) == members
                        and set(manifest['zip_entries']) == members,
                        'QTC0B R2 original ZIP corrupted or incomplete')
                for filename, expected in manifest['zip_entries'].items():
                    require(hashlib.sha256(z.read(filename)).hexdigest() == expected,
                            'QTC0B R2 original member drift: '+filename)
                require(z.read('tested-commit.txt').decode().strip() == a['tested_sha']
                        and 'BFSS_M4_QTC0B_R2_ACCEPTED_QTC0A_ORIGINAL_R1_RED_AND_TYPED_SUM_REPAIR_PREFLIGHT_PASS'
                        in z.read('preflight.log').decode()
                        and 'P3M4QTC0BOriginalFockQuadraticTensorContraction.lean:113:28'
                        in z.read('cold-source.log').decode()
                        and 'P3M4QTC0BOriginalFockQuadraticTensorContraction.lean:155:34'
                        in z.read('cold-source.log').decode(),
                        'QTC0B R2 first and second error or original preflight not preserved')
            full_log = (root/a['evidence_job_log']).read_text()
            require('sorryAx' in full_log
                    and 'error: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4QTC0BOriginalFockQuadraticTensorContraction.lean:113:28'
                    in full_log
                    and 'error: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4QTC0BOriginalFockQuadraticTensorContraction.lean:155:34'
                    in full_log,
                    'QTC0B R2 complete job log lacks two errors or sorryAx')
        stopped = s.get('previous_active_CT1G0_R2_stopped',{})
        require(stopped.get('status') == 'RED_UNQUALIFIED'
                and stopped.get('stopped') is True
                and stopped.get('run_id') == 43991790285,
                'QTC0B cannot evade stopped original native CT1 route')
        require(s.get('next_planned',{}).get('gate') ==
                    ('P3-M4-QTC0C' if a.get('stopped') is True else 'P3-M4-QTC1')
                and s['next_planned'].get('status') == 'PROSPECTIVE_NOT_STAGED'
                and not s['next_planned'].get('source_staged')
                and not s['next_planned'].get('consumer_staged')
                and not s['next_planned'].get('workflow_staged'),
                'QTC1 real source bridge may not be silently promoted')
    if a['gate'] == 'P3-M4-QTC0C' and a['status'] == 'GREEN_QUALIFIED':
        import zipfile
        require(a.get('run_id') == 44016807302
                and a.get('job_id') == 133816584592
                and a.get('tested_sha') == '6683cf53cfab96d3bf225658ce21874d3b134e17'
                and a.get('artifact_id') == 14299581585
                and a.get('artifact_sha256') == '1a95148f7dc41086683592b670257734c7726f0fff0929e4b59930a65ffefa0e'
                and a.get('source_blob') == '9448c9a47c605cb6aba2cfc798ae28a0213c9411'
                and a.get('consumer_blob') == '4ec2e6eb6b98b6039326765454e563038258f869'
                and a.get('workflow_blob') == '9d6cec275b32e307694fa9cf84926618d2c430be'
                and a.get('evidence_archive_blob') == blob(root/a['evidence_archive'])
                == '721c3b827bffafbe61d3d81720a103fb5297e389'
                and a.get('evidence_job_log_blob') == blob(root/a['evidence_job_log'])
                == '8fd0bf888505b499d4585671b31f3fa278ab31e6'
                and a.get('evidence_manifest_blob') == blob(root/a['evidence_manifest'])
                == '34a81dcc4248eb0f9920cc664f5de0e87b477de0'
                and a.get('cold_build_jobs') == 3092
                and a.get('source_reports') == a.get('consumer_reports') == 3
                and a.get('independent_controls') == 7,
                'QTC0C strict acceptance, source/consumer blobs or original evidence drift')
        require(s.get('previous_active_QTC0C_R1_pending',{}).get('gate') == 'P3-M4-QTC0C'
                and s['previous_active_QTC0C_R1_pending'].get('status') == 'PENDING_STRICT_CI'
                and s['previous_active_QTC0C_R1_pending'].get('source_blob') == a['source_blob']
                and s['previous_active_QTC0C_R1_pending'].get('consumer_blob') == a['consumer_blob'],
                'QTC0C launch chronology erased')
        m = json.loads((root/a['evidence_manifest']).read_text())
        require(m.get('gate') == a['gate']
                and m.get('verdict') == a['status']
                and m.get('run_id') == a['run_id']
                and m.get('job_id') == a['job_id']
                and m.get('tested_sha') == a['tested_sha']
                and m.get('artifact_id') == a['artifact_id']
                and m.get('artifact_sha256') == a['artifact_sha256']
                and m.get('artifact_git_blob') == a['evidence_archive_blob']
                and m.get('complete_job_log_git_blob') == a['evidence_job_log_blob']
                and m.get('source_sha') == a['source_blob']
                and m.get('consumer_sha') == a['consumer_blob']
                and m.get('workflow_sha') == a['workflow_blob']
                and m.get('cold_build_jobs') == a['cold_build_jobs']
                and m.get('original_zip_bytes') == 2062
                and m.get('controls') == 7
                and m.get('auditor_negative_mutants') == 6
                and m.get('whitelist') == ['propext','Classical.choice','Quot.sound'],
                'QTC0C accepted evidence manifest mismatch')
        with zipfile.ZipFile(root/a['evidence_archive']) as z:
            expected_files = {'tested-commit.txt','preflight.log','cold-source.log',
                              'source-axioms.log','consumer.log','auditor.log'}
            require(z.testzip() is None
                    and set(z.namelist()) == expected_files
                    and set(m['original_zip_entries']) == expected_files,
                    'QTC0C original ZIP integrity or archive manifest entries drift')
            for name, digest in m['original_zip_entries'].items():
                require(hashlib.sha256(z.read(name)).hexdigest() == digest,
                        'QTC0C original archived member SHA256 drift: '+name)
            require(z.read('tested-commit.txt').decode().strip() == a['tested_sha']
                    and 'BFSS_M4_QTC0C_ABSTRACT_SOURCE_CONSUMER_GREEN_RED_HISTORY_AND_TOOLCHAIN_PREFLIGHT_PASS'
                       in z.read('preflight.log').decode()
                    and 'Build completed successfully (3092 jobs).' in z.read('cold-source.log').decode(),
                    'QTC0C provider-original tested SHA, preflight or cold build absent')
            required_markers = {'BFSS_M4_QTC0C_AUDITOR_POSITIVE_AND_6_NEGATIVE_CONTROLS_PASS',
                                'BFSS_M4_QTC0C_ABSTRACT_3_SOURCE_3_CONSUMER_7_CONTROLS_STRICT_GREEN'}
            require(all(x in z.read('auditor.log').decode() for x in required_markers),
                    'QTC0C original archived auditor not strict GREEN')
            pat = re.compile(r"(?m)^'([^'\n]+)' depends on axioms: \[([^\]]*)\]")
            expected_roots = {
                'source-axioms.log': {'coefficient_left', 'coefficient_right','coefficient_both'},
                'consumer.log': {'left_consumer', 'right_consumer','both_consumer'}}
            allowed = {'propext','Classical.choice','Quot.sound'}
            for filename, names in expected_roots.items():
                report = z.read(filename).decode()
                found = pat.findall(report)
                require('sorryAx' not in report and 'error:' not in report
                        and len(found) == 3
                        and {name.rsplit('.',1)[-1] for name, _ in found} == names,
                        'QTC0C original source/consumer axiom roots not exact')
                for name, ax in found:
                    require({token.strip() for token in ax.split(',') if token.strip()} <= allowed,
                            'QTC0C unapproved axiom: '+name)
        full = (root/a['evidence_job_log']).read_text()
        require(a['strict_marker'] in full
                and 'BFSS_M4_QTC0C_AUDITOR_POSITIVE_AND_6_NEGATIVE_CONTROLS_PASS' in full,
                'QTC0C original complete job log lacks strict and negative auditor receipts')
    if a['gate'] == 'P3-M4-QTC0C':
        require(s['last_qualified']['gate'] ==
                    ('P3-M4-QTC0C' if a['status'] == 'GREEN_QUALIFIED' else 'P3-M4-QTC0A')
                and s['last_qualified']['run_id'] ==
                    (44016807302 if a['status'] == 'GREEN_QUALIFIED' else 44001621836)
                and a['attempt'] == 'R1'
                and a['first_atom'] == 'ABSTRACT_ORDERED_WORD_COEFFICIENT_CONTRACTION_NO_FOCK'
                and a['expected_source_reports'] == a['expected_consumer_reports'] == 3
                and a['independent_controls'] == 7
                and a['accepted_predecessor_run'] == 44001621836
                and a['allowed_axioms'] == ['propext','Classical.choice','Quot.sound'],
                'QTC0C source/consumer contract drift')
        prior = s.get('previous_active_QTC0B_R2_stopped', {})
        require(prior.get('status') == 'RED_UNQUALIFIED'
                and prior.get('qualification') is False
                and prior.get('stopped') is True
                and prior.get('stop_reason') ==
                    'TWO_ANALOGOUS_NATIVE_DIRECT_FOCK_REWRITE_ELABORATION_FAILURES'
                and prior.get('run_id') == a.get('predecessor_stopped_run') == 44014529416
                and prior.get('artifact_sha256') == a.get('predecessor_stopped_artifact_sha256')
                == 'f7fa7726865600cab92e1270b558dcc856ad0cfc28318f2bb7d95e74b7ab8dbb'
                and prior.get('evidence_archive_blob') == blob(root/prior['evidence_archive'])
                and hashlib.sha256((root/prior['evidence_archive']).read_bytes()).hexdigest() == prior['artifact_sha256']
                and prior.get('evidence_job_log_blob') == blob(root/prior['evidence_job_log'])
                and '44014529416' in (root/prior['receipt']).read_text()
                and s.get('previous_active_before_QTC0C') == prior,
                'QTC0C must not erase source-direct QTC0B two-RED history')
        red1 = s.get('previous_active_QTC0B_R1_RED', {})
        require(red1.get('run_id') == 44012367725
                and red1.get('artifact_sha256') == 'a50bc06b6f5ac03c15be16de7b943910ca55bc3a7960f40829c1049e8402c5c1'
                and red1.get('evidence_archive_blob') == blob(root/red1['evidence_archive'])
                and red1.get('evidence_job_log_blob') == blob(root/red1['evidence_job_log']),
                'QTC0C cannot erase source-direct R1 RED')
        source = (root/a['source']).read_text()
        consumer = (root/a['consumer']).read_text()
        require(source.startswith('import Mathlib.Tactic\n')
                and source.count('import ') == 1
                and '[AddCommMonoid M] [Module ℂ M]' in source
                and 'Fermion 2' not in source
                and 'ContinuousLinearMap' not in source
                and 'Matrix.transpose_apply' in source
                and 'Finset.sum_comm' in source
                and len(re.findall(r'(?m)^theorem\s+',source)) == 3
                and len(re.findall(r'(?m)^theorem\s+',consumer)) == 3
                and len(re.findall(r'(?m)^example\b',consumer)) == 7,
                'QTC0C abstract coefficient isolation or seven controls lost')
        require(s.get('next_planned',{}).get('gate') == 'P3-M4-QTC0D'
                and s['next_planned'].get('status') == 'PROSPECTIVE_NOT_STAGED'
                and not s['next_planned'].get('source_staged')
                and not s['next_planned'].get('consumer_staged')
                and not s['next_planned'].get('workflow_staged'),
                'QTC0D source Fock adapter must remain unqualified/prospective')
    if a['gate'] == 'P3-M4-QTC0D' and a['status'] == 'GREEN_QUALIFIED':
        import zipfile
        require(a.get('run_id') == 44018395393
                and a.get('job_id') == 133821734785
                and a.get('tested_sha') == '274f896c72f5fdb876d51d71b41cb97b41a4a107'
                and a.get('artifact_id') == 14299603963
                and a.get('artifact_sha256') == '7b19d5dc6d02f14c9ae831382b4d2f8c42d20d5a0ab4ad585d8e8858e9b1a54f'
                and a.get('source_blob') == 'e52b8ca7a440e04ab3c3a93187e5100daa39e074'
                and a.get('consumer_blob') == 'e6745b9f77fb8b1fbea58f4bb6055826320f342f'
                and a.get('workflow_blob') == '8ddd78052a0d4eba6ea20bc0b97e034c517430ae'
                and a.get('evidence_archive_blob') == blob(root/a['evidence_archive'])
                == 'c0de176f927ba70bed4494534f881d2ff93e732d'
                and a.get('evidence_job_log_blob') == blob(root/a['evidence_job_log'])
                == '2d5c6032dc7e1955febf8b15742c30ecd862795d'
                and a.get('evidence_manifest_blob') == blob(root/a['evidence_manifest'])
                == 'c8e471be7579908012983e96caa580964a61cd0a'
                and a.get('source_reports') == a.get('consumer_reports') == 2
                and a.get('cold_build_jobs') == 8965
                and a.get('independent_controls') == 7,
                'QTC0D native original Fock acceptance or original evidence drift')
        prior = s.get('previous_active_QTC0D_R1_pending',{})
        require(prior.get('gate') == a['gate']
                and prior.get('status') == 'PENDING_STRICT_CI'
                and prior.get('source_blob') == a['source_blob']
                and prior.get('consumer_blob') == a['consumer_blob']
                and prior.get('workflow_blob') == a['workflow_blob'],
                'QTC0D launch chronology erased')
        m = json.loads((root/a['evidence_manifest']).read_text())
        require(m.get('gate') == a['gate']
                and m.get('verdict') == a['status']
                and m.get('run_id') == a['run_id']
                and m.get('job_id') == a['job_id']
                and m.get('tested_sha') == a['tested_sha']
                and m.get('artifact_id') == a['artifact_id']
                and m.get('artifact_sha256') == a['artifact_sha256']
                and m.get('artifact_blob') == a['evidence_archive_blob']
                and m.get('complete_job_log_blob') == a['evidence_job_log_blob']
                and m.get('source_blob') == a['source_blob']
                and m.get('consumer_blob') == a['consumer_blob']
                and m.get('workflow_blob') == a['workflow_blob']
                and m.get('archive_bytes') == 4120
                and m.get('cold_build_jobs') == 8965
                and m.get('controls') == 7
                and m.get('negative_auditor_mutants') == 6
                and m.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound'],
                'QTC0D original provider ZIP manifest drift')
        with zipfile.ZipFile(root/a['evidence_archive']) as z:
            expected = {'tested-commit.txt','preflight.log','cold-source.log',
                        'source-axioms.log','consumer.log','auditor.log'}
            require(z.testzip() is None and set(z.namelist()) == expected
                    and set(m['zip_entries']) == expected,
                    'QTC0D provider-original ZIP corrupted or incomplete')
            for name, digest in m['zip_entries'].items():
                require(hashlib.sha256(z.read(name)).hexdigest() == digest,
                        'QTC0D original ZIP member SHA256 drift '+name)
            require(z.read('tested-commit.txt').decode().strip() == a['tested_sha']
                    and m['preflight_marker'] in z.read('preflight.log').decode()
                    and 'Build completed successfully (8965 jobs).' in z.read('cold-source.log').decode()
                    and m['strict_marker'] in z.read('auditor.log').decode()
                    and m['auditor_marker'] in z.read('auditor.log').decode(),
                    'QTC0D original strict source, job or auditor evidence absent')
            pat = re.compile(r"(?m)^'([^'\n]+)' depends on axioms: \[([^\]]*)\]")
            roots = {
                'source-axioms.log': {'originalFock_quadratic_covariance_tensor',
                                     'originalFock_quadratic_covariance_skew'},
                'consumer.log': {'originalFock_tensor_covariance_consumer',
                                 'originalFock_skew_covariance_consumer'}}
            allowed = {'propext','Classical.choice','Quot.sound'}
            for name, expected_roots in roots.items():
                report = z.read(name).decode()
                found = pat.findall(report)
                require('sorryAx' not in report and 'error:' not in report
                        and len(found) == 2
                        and {x.rsplit('.',1)[-1] for x,_ in found} == expected_roots,
                        'QTC0D source/consumer root audits are incomplete')
                for theorem, axioms in found:
                    require({x.strip() for x in axioms.split(',') if x.strip()} <= allowed,
                            'QTC0D extra/unapproved axiom '+theorem)
        log = (root/a['evidence_job_log']).read_text()
        require(a['strict_marker'] in log and m['auditor_marker'] in log,
                'QTC0D full original job log lacks 2+2 or auditor-positive markers')
    if a['gate'] == 'P3-M4-QTC0D':
        require(s['last_qualified']['gate'] == ('P3-M4-QTC0D' if a['status'] == 'GREEN_QUALIFIED' else 'P3-M4-QTC0C')
                and s['last_qualified']['run_id'] == (44018395393 if a['status'] == 'GREEN_QUALIFIED' else 44016807302)
                and s['last_qualified']['status'] == 'GREEN_QUALIFIED'
                and a['attempt'] == 'R1'
                and a['first_atom'] == 'SOURCE_EXACT_FOCK_THIN_ADAPTER_FROM_QTC0A_AND_QTC0C'
                and a['accepted_predecessor_run'] == 44016807302
                and a['expected_source_reports'] == a['expected_consumer_reports'] == 2
                and a['independent_controls'] == 7
                and a['allowed_axioms'] == ['propext','Classical.choice','Quot.sound'],
                'QTC0D native thin-adapter contract or QTC0C predecessor drift')
        qtc0c = s.get('previous_active_QTC0C_R1_qualified', {})
        require(qtc0c.get('gate') == 'P3-M4-QTC0C'
                and qtc0c.get('status') == 'GREEN_QUALIFIED'
                and qtc0c.get('run_id') == 44016807302
                and qtc0c.get('source_blob') == '9448c9a47c605cb6aba2cfc798ae28a0213c9411'
                and qtc0c.get('consumer_blob') == '4ec2e6eb6b98b6039326765454e563038258f869'
                and qtc0c.get('artifact_sha256') == '1a95148f7dc41086683592b670257734c7726f0fff0929e4b59930a65ffefa0e'
                and qtc0c.get('evidence_archive_blob') == blob(root/qtc0c['evidence_archive'])
                and hashlib.sha256((root/qtc0c['evidence_archive']).read_bytes()).hexdigest() == qtc0c['artifact_sha256']
                and qtc0c.get('evidence_job_log_blob') == blob(root/qtc0c['evidence_job_log']),
                'QTC0D may not erase accepted QTC0C source, consumer and provider-original ZIP')
        qtc0a = next((x for x in s['accepted_anchors'] if x.get('gate') == 'P3-M4-QTC0A'), {})
        require(qtc0a.get('run_id') == 44001621836
                and qtc0a.get('source_blob') == 'b0b519e46566856e100bf6aa882f9fcdf37d397e'
                and qtc0a.get('evidence_archive_blob') == blob(root/qtc0a['evidence_archive']),
                'QTC0D may not erase accepted QTC0A source or archive')
        stopped = s.get('previous_active_QTC0B_R2_stopped', {})
        require(stopped.get('stopped') is True
                and stopped.get('run_id') == a.get('stopped_QTC0B_R2') == 44014529416
                and stopped.get('artifact_sha256') == 'f7fa7726865600cab92e1270b558dcc856ad0cfc28318f2bb7d95e74b7ab8dbb'
                and stopped.get('evidence_archive_blob') == blob(root/stopped['evidence_archive'])
                and stopped.get('evidence_job_log_blob') == blob(root/stopped['evidence_job_log']),
                'QTC0D cannot silently revive stopped direct QTC0B route')
        source = (root/a['source']).read_text()
        consumer = (root/a['consumer']).read_text()
        require('Fermion 2 →L[ℂ] Fermion 2' in source
                and 'originalFock_quadratic_covariance_expanded' in source
                and 'coefficient_both (fun i j => x i * x j) a b' in source
                and 'originalFock_left_local_expansion' in source
                and 'originalFock_right_local_expansion' in source
                and '(1 / 4 : ℂ)' in source
                and 'Matrix.transpose_apply' not in source
                and not re.search(r'(?m)^import\s+\S*P3M4QTC0B',source)
                and len(re.findall(r'(?m)^theorem\s+',source)) == 2
                and len(re.findall(r'(?m)^theorem\s+',consumer)) == 2
                and len(re.findall(r'(?m)^example\b',consumer)) == 7,
                'QTC0D lost thin-source-adapter separation or controls')
        require(s.get('next_planned',{}).get('gate') == 'P3-M4-QTC1'
                and s['next_planned'].get('status') == 'PROSPECTIVE_NOT_STAGED'
                and not s['next_planned'].get('source_staged')
                and not s['next_planned'].get('consumer_staged')
                and not s['next_planned'].get('workflow_staged'),
                'QTC1 real-source normalization must remain prospective')
    if a['gate'] == 'P3-M4-QTC1' and a.get('attempt') == 'R1' and a['status'] == 'RED_UNQUALIFIED':
        import zipfile
        require(a['run_id'] == 44020471704
                and a['tested_sha'] == '02859a9d28ec971bbd53a0f3bdad2638e87c3707'
                and a['job_id'] == 133828475926
                and a['artifact_id'] == 14301386967
                and a['artifact_sha256'] == '4effa4881bb7d33f5397873db92bfa4279e351dbda9d1991062356fe1ed73bd8'
                and a['evidence_archive_blob'] == blob(root/a['evidence_archive'])
                == '8ae6ad676712bd361d4a4a0568fc5924a3c3daa5'
                and a['evidence_job_log_blob'] == blob(root/a['evidence_job_log'])
                == 'aa18bfb54c64d248849508c60d6cfd7f66d32cea'
                and a['evidence_manifest_blob'] == blob(root/a['evidence_manifest'])
                == '96ad74210394739ccee2d168269d377f1bf29762'
                and a['source_reports'] == a['consumer_reports'] == 0
                and a['independent_consumer_executed'] is False,
                'QTC1 R1 unqualified original RED bytes or source-only failure changed')
        m = json.loads((root/a['evidence_manifest']).read_text())
        require(m.get('run_id') == a['run_id']
                and m.get('tested_sha') == a['tested_sha']
                and m.get('artifact_sha256') == a['artifact_sha256']
                and m.get('archive_blob') == a['evidence_archive_blob']
                and m.get('complete_job_log_blob') == a['evidence_job_log_blob']
                and m.get('zip_size_bytes') == 3729
                and m.get('source_axioms') == 'sorryAx_FROM_UNRESOLVED_GOALS',
                'QTC1 R1 exact original RED manifest drift')
        with zipfile.ZipFile(root/a['evidence_archive']) as z:
            require(z.testzip() is None
                    and set(z.namelist()) == {'cold-source.log','preflight.log','tested-commit.txt'}
                    and set(m['members']) == set(z.namelist()),
                    'QTC1 R1 original RED ZIP corruption or lost member')
            for name, digest in m['members'].items():
                require(hashlib.sha256(z.read(name)).hexdigest() == digest,
                        'QTC1 R1 original member SHA256 changed: '+name)
            require(z.read('tested-commit.txt').decode().strip() == a['tested_sha']
                    and 'BFSS_M4_QTC1_SOURCE_REAL_COMPLEX_K_QUARTER_DONORS_AND_EVIDENCE_PREFLIGHT_PASS'
                       in z.read('preflight.log').decode()
                    and 'P3M4QTC1OriginalSourceRealComplexQuarterBridge.lean:47:8'
                       in z.read('cold-source.log').decode()
                    and 'P3M4QTC1OriginalSourceRealComplexQuarterBridge.lean:71:8'
                       in z.read('cold-source.log').decode(),
                    'QTC1 R1 original RED first/second diagnostic absent')
        require('sorryAx' in (root/a['evidence_job_log']).read_text()
                and '44020471704' in (root/a['receipt']).read_text(),
                'QTC1 R1 original whole log or RED receipt missing')
    if a['gate'] == 'P3-M4-QTC1' and a.get('attempt') == 'R2' and a['status'] == 'RED_UNQUALIFIED':
        import zipfile
        require(a.get('run_id') == 44022359538
                and a.get('job_id') == 133834549263
                and a.get('tested_sha') == 'ceb4ec46e1763a82d64f4c42c1646c81c851dfef'
                and a.get('artifact_id') == 14301697221
                and a.get('artifact_sha256') == '8ed71c1a193032813804829c975e35f5fce8f666609c344d142601aabe05a6ff'
                and a.get('evidence_archive_blob') == blob(root/a['evidence_archive'])
                == '387e2c5d271459d524259800a269e752ab0b9001'
                and a.get('evidence_job_log_blob') == blob(root/a['evidence_job_log'])
                == '8cb9db0265e187278bed283b081bda0adf21ae99'
                and a.get('evidence_manifest_blob') == blob(root/a['evidence_manifest'])
                == '1930e3d228e4795ef3bbd327e4d1ca85f3cc5ac2'
                and a.get('source_blob') == '91ae604dbd8129320c0822bac16b4302c14d3c15'
                and a.get('consumer_blob') == '24113406f779e1f2dcd769c9c400d0b897dda6a9'
                and a.get('workflow_blob') == 'b201182dc7cbeba887cecff439f41d70a20af748'
                and a.get('stopped') is True
                and a.get('stop_reason') == 'TWO_ANALOGOUS_SOURCE48_DEFINITIONAL_JOIN_RECURSION_REDS'
                and a.get('stop_scope') == 'NO_DIRECT_QTC1_R3_SAME_SOURCE_K_TO_COMPLEX_Q_SPECIALIZATION_NO_RESOURCE_ESCALATION'
                and a.get('failure_phase') == 'COLD_NEW_SOURCE'
                and a.get('error_line') == 81
                and a.get('error_column') == 6
                and a.get('source_reports') == a.get('consumer_reports') == 0
                and a.get('independent_consumer_executed') is False
                and a.get('generic_root_standard_axioms_reported') is True
                and a.get('generic_root_qualified_in_gate') is False
                and a.get('source_K_join_sorryAx') is True,
                'QTC1 R2 original RED verdict or fixed two-RED stop drift')
        pending = s.get('previous_active_QTC1_R2_pending',{})
        require(pending.get('gate') == 'P3-M4-QTC1'
                and pending.get('attempt') == 'R2'
                and pending.get('status') == 'PENDING_STRICT_CI'
                and pending.get('source_blob') == a['source_blob']
                and pending.get('consumer_blob') == a['consumer_blob']
                and pending.get('workflow_blob') == a['workflow_blob']
                and pending.get('previous_red_run') == 44020471704,
                'QTC1 R2 exact launch chronology lost')
        m = json.loads((root/a['evidence_manifest']).read_text())
        require(m.get('verdict') == 'RED_UNQUALIFIED'
                and m.get('run_id') == a['run_id']
                and m.get('job_id') == a['job_id']
                and m.get('tested_sha') == a['tested_sha']
                and m.get('artifact_id') == a['artifact_id']
                and m.get('artifact_sha256') == a['artifact_sha256']
                and m.get('artifact_git_blob') == a['evidence_archive_blob']
                and m.get('complete_job_log_blob') == a['evidence_job_log_blob']
                and m.get('source_blob') == a['source_blob']
                and m.get('consumer_blob') == a['consumer_blob']
                and m.get('workflow_blob') == a['workflow_blob']
                and m.get('archive_bytes') == 3674
                and m.get('source_first_root_qualified_in_strict_gate') is False
                and m.get('independent_consumer_executed') is False
                and m.get('method_stop') == a['stop_reason'],
                'QTC1 R2 provider original ZIP manifest or stopped result drift')
        with zipfile.ZipFile(root/a['evidence_archive']) as z:
            expected = {'cold-source.log','preflight.log','tested-commit.txt'}
            require(z.testzip() is None
                    and set(z.namelist()) == expected
                    and set(m['original_zip_entries']) == expected,
                    'QTC1 R2 original ZIP corrupt or incomplete')
            for name, digest in m['original_zip_entries'].items():
                require(hashlib.sha256(z.read(name)).hexdigest() == digest,
                        'QTC1 R2 original ZIP member drift: '+name)
            cold = z.read('cold-source.log').decode()
            require(z.read('tested-commit.txt').decode().strip() == a['tested_sha']
                    and 'BFSS_M4_QTC1_R2_R1_RED_SOURCE_REAL_COMPLEX_K_QUARTER_DONORS_AND_EVIDENCE_PREFLIGHT_PASS'
                    in z.read('preflight.log').decode()
                    and 'P3M4QTC1OriginalSourceRealComplexQuarterBridge.lean:81:6'
                    in cold
                    and 'maximum recursion depth has been reached' in cold
                    and "'FCP.BFSSP3M4QTC1OriginalSourceRealComplexQuarterBridge.originalFock_real_quarter_quadratic' depends on axioms: [propext,"
                    in cold
                    and "'FCP.BFSSP3M4QTC1OriginalSourceRealComplexQuarterBridge.originalSource48BivectorK_eq_originalFockQuadratic' depends on axioms: [propext,"
                    in cold
                    and 'sorryAx' in cold,
                    'QTC1 R2 true source first root standard and second root sorryAx lost')
        log = (root/a['evidence_job_log']).read_text()
        require('P3M4QTC1OriginalSourceRealComplexQuarterBridge.lean:81:6' in log
                and 'sorryAx' in log
                and '44022359538' in (root/a['receipt']).read_text()
                and '44020471704' in (root/a['architecture_decision']).read_text()
                and '44022359538' in (root/a['architecture_decision']).read_text(),
                'QTC1 R2 complete log or architecture stop receipt drift')
        require(s.get('next_planned',{}).get('gate') == 'P3-M4-QTC1G0'
                and s['next_planned'].get('status') == 'PROSPECTIVE_NOT_STAGED'
                and not s['next_planned'].get('source_staged')
                and not s['next_planned'].get('consumer_staged')
                and not s['next_planned'].get('workflow_staged'),
                'QTC1 two-RED architecture stop cannot silently advance to same route')
    if a['gate'] == 'P3-M4-QTC1':
        require(s['last_qualified']['gate'] == 'P3-M4-QTC0D'
                and s['last_qualified']['run_id'] == 44018395393
                and s['last_qualified']['status'] == 'GREEN_QUALIFIED'
                and a.get('attempt') in {'R1','R2'}
                and a.get('first_atom') ==
                    'ORIGINAL_REAL_TO_COMPLEX_K_QUARTER_COEFFICIENT_NORMALIZATION'
                and a.get('accepted_predecessor_run') == 44018395393
                and a.get('expected_source_reports') == a.get('expected_consumer_reports') == 2
                and a.get('independent_controls') == 7
                and a.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound'],
                'QTC1 source real/complex quarter contract or accepted QTC0D drift')
        if a.get('attempt') == 'R2':
            import zipfile
            old = s.get('previous_active_QTC1_R1_RED',{})
            require(old.get('status') == 'RED_UNQUALIFIED'
                    and old.get('qualification') is False
                    and old.get('run_id') == a.get('previous_red_run') == 44020471704
                    and old.get('job_id') == 133828475926
                    and old.get('tested_sha') == '02859a9d28ec971bbd53a0f3bdad2638e87c3707'
                    and old.get('source_blob') == a.get('prior_red_source_blob')
                    == '127cd129a375f7f024c882deb62d1220de26aa0d'
                    and old.get('consumer_blob') == a.get('consumer_blob')
                    == '24113406f779e1f2dcd769c9c400d0b897dda6a9'
                    and old.get('artifact_id') == a.get('prior_red_artifact_id') == 14301386967
                    and old.get('artifact_sha256') == a.get('prior_red_artifact_sha256')
                    == '4effa4881bb7d33f5397873db92bfa4279e351dbda9d1991062356fe1ed73bd8'
                    and old.get('evidence_archive_blob') == a.get('prior_red_archive_blob')
                    == blob(root/old['evidence_archive'])
                    == '8ae6ad676712bd361d4a4a0568fc5924a3c3daa5'
                    and old.get('evidence_job_log_blob') == a.get('prior_red_job_log_blob')
                    == blob(root/old['evidence_job_log'])
                    == 'aa18bfb54c64d248849508c60d6cfd7f66d32cea'
                    and old.get('evidence_manifest_blob') == blob(root/old['evidence_manifest'])
                    and hashlib.sha256((root/old['evidence_archive']).read_bytes()).hexdigest()
                       == old['artifact_sha256']
                    and '44020471704' in (root/old['receipt']).read_text(),
                    'QTC1 R2 may not erase any original R1 source, ZIP or full job log')
            m = json.loads((root/old['evidence_manifest']).read_text())
            require(m.get('zip_size_bytes') == 3729 and m.get('source_axioms')
                    == 'sorryAx_FROM_UNRESOLVED_GOALS', 'QTC1 R1 failure scope erased')
            with zipfile.ZipFile(root/old['evidence_archive']) as z:
                require(z.testzip() is None
                        and set(z.namelist()) == set(m['members'])
                        == {'cold-source.log','preflight.log','tested-commit.txt'},
                        'QTC1 R1 original provider RED archive corrupted')
                for name, digest in m['members'].items():
                    require(hashlib.sha256(z.read(name)).hexdigest() == digest,
                            'QTC1 original provider ZIP member lost: '+name)
                require(z.read('tested-commit.txt').decode().strip() == old['tested_sha']
                        and 'P3M4QTC1OriginalSourceRealComplexQuarterBridge.lean:47:8'
                            in z.read('cold-source.log').decode()
                        and 'P3M4QTC1OriginalSourceRealComplexQuarterBridge.lean:71:8'
                            in z.read('cold-source.log').decode(),
                        'QTC1 original R1 RED diagnostics lost')
            require(s.get('previous_active_QTC1_R1_pending',{}).get('status')
                    == 'PENDING_STRICT_CI'
                    and a.get('contract_commit') == '03dca0b288e0f72d74c0b0fb6f665443c5472045'
                    and a.get('prior_red_artifact_sha256') == m['artifact_sha256'],
                    'QTC1 R2 new contract or original launch chronology erased')
        previous = s.get('previous_active_QTC0D_R1_qualified',{})
        require(previous.get('gate') == 'P3-M4-QTC0D'
                and previous.get('status') == 'GREEN_QUALIFIED'
                and previous.get('run_id') == 44018395393
                and previous.get('source_blob') == 'e52b8ca7a440e04ab3c3a93187e5100daa39e074'
                and previous.get('consumer_blob') == 'e6745b9f77fb8b1fbea58f4bb6055826320f342f'
                and previous.get('artifact_sha256') == '7b19d5dc6d02f14c9ae831382b4d2f8c42d20d5a0ab4ad585d8e8858e9b1a54f'
                and previous.get('evidence_archive_blob') == blob(root/previous['evidence_archive'])
                and hashlib.sha256((root/previous['evidence_archive']).read_bytes()).hexdigest() == previous['artifact_sha256']
                and previous.get('evidence_job_log_blob') == blob(root/previous['evidence_job_log']),
                'QTC1 may not erase accepted QTC0D original provider artifact or consumer')
        stopped = s.get('previous_active_QTC0B_R2_stopped',{})
        require(stopped.get('stopped') is True
                and stopped.get('run_id') == a.get('prior_stopped_QTC0B_R2') == 44014529416
                and stopped.get('evidence_archive_blob') == blob(root/stopped['evidence_archive'])
                and stopped.get('evidence_job_log_blob') == blob(root/stopped['evidence_job_log']),
                'QTC1 cannot evade previous stopped direct-Fock QTC0B')
        donor = root/'lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/'
        require(a.get('real_source_donor_blob') == blob(donor/'P3M4LB1SOriginalSource48SkewMatrixFockBivector.lean')
                == 'd7d460fc8d2806234816e8bd2088f9cebb6addd4'
                and a.get('real_source_gamma_blob') == blob(donor/'SU2BFSSSource48NormalizedFockGammaProbe.lean')
                == '7abc03723b3111e4a03389b722054e50d6a9bf30'
                and a.get('real_source_K_covariance_donor_blob') == blob(donor/'P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean')
                == 'c2e7a7c665121283cde13ae5dabc183362b6b420',
                'QTC1 exact original Source48 K/gamma/covariance donors changed')
        source=(root/a['source']).read_text()
        consumer=(root/a['consumer']).read_text()
        require('Fermion 2 →L[ℂ] Fermion 2' in source
                and 'originalFockOperator_real_smul_eq_complex_smul' in source
                and 'originalSource48BivectorK' in source
                and 'sourceNormalizedGamma' in source
                and '(B p q / 4 : ℝ)' in source
                and '(1 / 4 : ℂ)' in source
                and (('exact_mod_cast hr' in source) if a.get('attempt') == 'R1'
                     else ('push_cast' in source and 'exact_mod_cast hr' not in source))
                and len(re.findall(r'(?m)^theorem\s+',source)) == 2
                and len(re.findall(r'(?m)^theorem\s+',consumer)) == 2
                and len(re.findall(r'(?m)^example\b',consumer)) == 7,
                'QTC1 not bounded to generic real scalar normalization and original K')
        require(s.get('next_planned',{}).get('gate') ==
                    ('P3-M4-QTC1G0' if a.get('stopped') is True else 'P3-M4-QTC2')
                and s['next_planned'].get('status') == 'PROSPECTIVE_NOT_STAGED'
                and not s['next_planned'].get('source_staged')
                and not s['next_planned'].get('consumer_staged')
                and not s['next_planned'].get('workflow_staged'),
                'QTC2 source K covariance/bracket may not be pre-qualified')
    if a['gate'] == 'P3-M4-QTC1G0':
        require(s['last_qualified']['gate'] ==
                    ('P3-M4-QTC1G0' if a['status'] == 'GREEN_QUALIFIED' else 'P3-M4-QTC0D')
                and s['last_qualified']['run_id'] ==
                    (a['run_id'] if a['status'] == 'GREEN_QUALIFIED' else 44018395393)
                and a['attempt'] == 'R1'
                and a['accepted_predecessor_run'] == 44018395393
                and a['first_atom'] ==
                    'ORIGINAL_FOCK_GENERIC_REAL_COMPLEX_ONE_QUARTER_ONLY_NO_SOURCE48_JOIN'
                and a['expected_source_reports'] == a['expected_consumer_reports'] == 1
                and a['independent_controls'] == 7
                and a['allowed_axioms'] == ['propext','Classical.choice','Quot.sound']
                and a['stopped_QTC1_R2'] == 44022359538
                and a['stopped_QTC1_R1'] == 44020471704,
                'QTC1G0 separate one-root mathematical donor or frozen history changed')
        prior=s.get('previous_active_QTC1_R2_stopped',{})
        require(prior.get('gate') == 'P3-M4-QTC1'
                and prior.get('attempt') == 'R2'
                and prior.get('status') == 'RED_UNQUALIFIED'
                and prior.get('qualification') is False
                and prior.get('stopped') is True
                and prior.get('stop_reason') ==
                    'TWO_ANALOGOUS_SOURCE48_DEFINITIONAL_JOIN_RECURSION_REDS'
                and prior.get('run_id') == a['stopped_QTC1_R2']
                and prior.get('artifact_sha256') ==
                    a['stopped_QTC1_R2_original_artifact_sha256']
                == '8ed71c1a193032813804829c975e35f5fce8f666609c344d142601aabe05a6ff'
                and prior.get('evidence_archive_blob') == blob(root/prior['evidence_archive'])
                and hashlib.sha256((root/prior['evidence_archive']).read_bytes()).hexdigest()
                    == prior['artifact_sha256']
                and prior.get('evidence_job_log_blob') == blob(root/prior['evidence_job_log'])
                and prior.get('evidence_manifest_blob') == blob(root/prior['evidence_manifest'])
                and '44022359538' in (root/prior['receipt']).read_text(),
                'QTC1G0 cannot forget the original R2 failed source or two-RED architecture stop')
        red1=s.get('previous_active_QTC1_R1_RED',{})
        require(red1.get('gate') == 'P3-M4-QTC1'
                and red1.get('status') == 'RED_UNQUALIFIED'
                and red1.get('run_id') == a['stopped_QTC1_R1']
                and red1.get('artifact_sha256') ==
                    '4effa4881bb7d33f5397873db92bfa4279e351dbda9d1991062356fe1ed73bd8'
                and red1.get('evidence_archive_blob') == blob(root/red1['evidence_archive'])
                and red1.get('evidence_job_log_blob') == blob(root/red1['evidence_job_log']),
                'QTC1G0 cannot forget first source-specialization RED')
        qtc0d = next((x for x in s['accepted_anchors'] if x.get('gate') == 'P3-M4-QTC0D'),{})
        require(qtc0d.get('run_id') == 44018395393
                and qtc0d.get('source_blob') == 'e52b8ca7a440e04ab3c3a93187e5100daa39e074'
                and qtc0d.get('evidence_archive_blob') == blob(root/qtc0d['evidence_archive']),
                'QTC1G0 cannot erase accepted native original Fock QTC0D')
        donor=root/'lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1SOriginalSource48SkewMatrixFockBivector.lean'
        require(a.get('real_smul_donor_blob') == blob(donor)
                == 'd7d460fc8d2806234816e8bd2088f9cebb6addd4',
                'QTC1G0 real smul source donor drift')
        source=(root/a['source']).read_text()
        consumer=(root/a['consumer']).read_text()
        require(source.startswith('import Mathlib.Tactic\n')
                and len(re.findall(r'(?m)^import ',source)) == 2
                and 'Fermion 2 →L[ℂ] Fermion 2' in source
                and 'originalFockOperator_real_smul_eq_complex_smul' in source
                and 'push_cast' in source
                and '(B p q / 4 : ℝ)' in source
                and '(1 / 4 : ℂ)' in source
                and 'sourceNormalizedGamma' not in source
                and 'originalSource48BivectorK' not in source
                and len(re.findall(r'(?m)^theorem\s+',source)) == 1
                and len(re.findall(r'(?m)^theorem\s+',consumer)) == 1
                and len(re.findall(r'(?m)^example\b',consumer)) == 7,
                'QTC1G0 must stay source-independent and preserve seven controls')
        require(s.get('next_planned',{}).get('gate') == 'P3-M4-QTC1G1'
                and s['next_planned'].get('status') == 'PROSPECTIVE_NOT_STAGED'
                and not s['next_planned'].get('source_staged')
                and not s['next_planned'].get('consumer_staged')
                and not s['next_planned'].get('workflow_staged'),
                'QTC1G1 specialized adapter must remain prospective')
    if a['gate'] == 'P3-M4-W0A0' and a['status'] == 'GREEN_QUALIFIED':
        # First accepted QIT/SCC axis crosswalk: source and independently importing
        # consumer are each ONE root, without weakening older M4 gate controls.
        import zipfile
        expected_red_sha = 'e805e4eb1515a045031768794d1cb74786b3c64c0caff708f16fac80db45b58b'
        expected_green_sha = 'b54da01cabbe477a91379d21fe447761419cc85a48755b9450e45f5b328d7d97'
        require(a.get('attempt') == 'R2' and a.get('accepted_predecessor_run') == 44024718712
                and a.get('run_id') == 44039594189 and a.get('job_id') == 133890665630
                and a.get('tested_sha') == '5d8703c8beb932dd3745302d5712bc2970c672ba'
                and a.get('source_blob') == '175cd63e2ef031818b61a51b73eb59782fe38add'
                and a.get('consumer_blob') == 'c58f6d3e49bbcb4b7d2c88a08f57f7e07b61ce63'
                and a.get('workflow_blob') == 'fa105ff051ae6acb0d75a73aa509403f8b588680'
                and a.get('source_reports') == a.get('consumer_reports') == 1
                and a.get('cold_build_jobs') == 9124 and a.get('independent_controls') == 2
                and a.get('auditor_negative_tests') == 6 and a.get('artifact_id') == 14309387668
                and a.get('artifact_sha256') == expected_green_sha
                and a.get('evidence_archive_blob') == '3ddc359754cab20045315a4167a9e5d15e316f80'
                and a.get('evidence_job_log_blob') == '61bcc25ac6d6a5c3ce6d18284d314a44d9bc4b98'
                and a.get('evidence_manifest_blob') == '6ed7ce7c54c6ff70028107adeccad97f6695cee8'
                and a.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound']
                and s['last_qualified'] == a and s['accepted_anchors'][-1] == a,
                'W0A0 green requires exact one-root original Fock evidence and source')
        prev = next((x for x in s['accepted_anchors'] if x.get('gate') == 'P3-M4-QTC1G0'), {})
        require(prev.get('run_id') == 44024718712 and prev.get('qualification') is True,
                'W0A0 may not erase last qualified QTC1G0')
        red = s.get('previous_active_W0A0_R1_RED', {})
        require(red.get('status') == 'RED_UNQUALIFIED' and red.get('qualification') is False
                and red.get('run_id') == 44033364617
                and red.get('tested_sha') == 'd4f6c7a090ffba44ba7f091c831e568aba154c26'
                and red.get('artifact_id') == 14307206335
                and red.get('artifact_sha256') == expected_red_sha,
                'W0A0 R1 source elaboration RED and source-axiom failure must be preserved')
        red_path = root/'research/quantum-information/diagnostics/BFSS_M4_W0A0_R1_44033364617_evidence.zip'
        require(blob(red_path) == 'f356fec7fbb63bd660712f043503bc70b1eae673'
                and hashlib.sha256(red_path.read_bytes()).hexdigest() == expected_red_sha,
                'W0A0 original R1 provider RED ZIP missing or altered')
        with zipfile.ZipFile(red_path) as z:
            require(z.testzip() is None
                    and set(z.namelist()) == {'cold-source.log','preflight.log','tested-commit.txt'}
                    and z.read('tested-commit.txt').decode().strip() == red['tested_sha']
                    and 'P3M4W0A0OriginalSourceAxisWitness.lean:38:18'
                        in z.read('cold-source.log').decode()
                    and 'sorryAx' in z.read('cold-source.log').decode(),
                    'W0A0 original R1 RED diagnostics not traceable')
        manifest = json.loads((root/a['evidence_manifest']).read_text())
        require(manifest['status'] == 'GREEN_QUALIFIED' and manifest['strict_run'] == a['run_id']
                and manifest['strict_job'] == a['job_id'] and manifest['tested_sha'] == a['tested_sha']
                and manifest['original_artifact_sha256'] == expected_green_sha
                and manifest['original_archive_git_blob'] == a['evidence_archive_blob']
                and manifest['original_artifact_bytes'] == 13705
                and manifest['original_job_log_git_blob'] == a['evidence_job_log_blob']
                and manifest['previous_red_archive_git_blob'] == blob(red_path)
                and manifest['preservation_run'] == 44042299335
                and manifest['cold_build_jobs'] == 9124
                and manifest['strict_auditor_negative_tests'] == 6,
                'W0A0 source/provider-manifest crosswalk failed')
        allowed = {'propext','Classical.choice','Quot.sound'}
        roots = {'source-axioms.log':'originalComplexEquiv_allLabelAxis_eq_activeGamma',
                 'consumer.log':'originalComplexEquiv_allLabelAxis_consumer'}
        allowed_names = {'auditor.log','cold-source.log','consumer.log','preflight.log',
                         'source-axioms.log','tested-commit.txt'}
        with zipfile.ZipFile(root/a['evidence_archive']) as z:
            require(z.testzip() is None and set(z.namelist()) == allowed_names,
                    'W0A0 exact provider original ZIP member set/integrity mismatch')
            require(z.read('tested-commit.txt').decode().strip() == a['tested_sha']
                    and 'BFSS_W0A0_ALL_48_LABELS_AND_QUALIFIED_DONORS_PREFLIGHT_PASS'
                        in z.read('preflight.log').decode()
                    and 'Build completed successfully (9124 jobs).'
                        in z.read('cold-source.log').decode()
                    and 'sorryAx' not in z.read('cold-source.log').decode()
                    and 'error:' not in z.read('cold-source.log').decode()
                    and a['strict_marker'] in z.read('auditor.log').decode(),
                    'W0A0 exact cold source, preflight or auditor failed')
            for member,expected in manifest['original_zip_members'].items():
                contents = z.read(member)
                require(len(contents) == expected['bytes']
                        and hashlib.sha256(contents).hexdigest() == expected['sha256'],
                        'W0A0 original provider ZIP entry failed SHA-256: '+member)
            pattern = re.compile(r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)")
            for member,theorem in roots.items():
                report = z.read(member).decode()
                observed = pattern.findall(report)
                require('error:' not in report and 'sorryAx' not in report
                        and len(observed) == 1
                        and observed[0][0].rsplit('.', 1)[-1] == theorem
                        and {x.strip() for x in observed[0][1].split(',') if x.strip()} <= allowed,
                        'W0A0 approved source/consumer root violated: '+member)
        joblog = (root/a['evidence_job_log']).read_text()
        require(a['strict_marker'] in joblog
                and 'Build completed successfully (9124 jobs).' in joblog
                and 'BFSS_W0A0_ALL_48_LABELS_AND_QUALIFIED_DONORS_PREFLIGHT_PASS' in joblog,
                'W0A0 original full job log or cold build not preserved')
        source = (root/a['source']).read_text()
        consumer = (root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\s+',source)) == 1
                and len(re.findall(r'(?m)^theorem\s+',consumer)) == 1
                and len(re.findall(r'(?m)^example\b',consumer)) == 2
                and 'congrArg (fun t : Source48Label =>' in source
                and '(Pi.single t (1 : ℝ) : Source48Vector)' in source
                and 'originalComplexEquiv_sourceAxis_eq_activeGamma' in source
                and 'originalSource48BivectorK' not in source,
                'W0A0 must remain an original 48-label axis crosswalk, not full bracket')
        next_gate = s.get('next_planned', {})
        require(next_gate.get('gate') == 'P3-M4-W0A1'
                and next_gate.get('status') == 'PROSPECTIVE_NOT_STAGED'
                and next_gate.get('source_staged') is False
                and next_gate.get('consumer_staged') is False
                and next_gate.get('workflow_staged') is False,
                'W0A1 must remain prospective until its own pre-gate contract')
    if a['gate'] == 'P3-M4-W0A1' and a['status'] == 'GREEN_QUALIFIED':
        # Qualified real-vector donor/active transport, not a new complex
        # generator-span, center, trace, full witness, or K-bracket theorem.
        import zipfile
        require(a.get('attempt') == 'R1' and a.get('accepted_predecessor_run') == 44039594189
                and a.get('run_id') == 44043503665 and a.get('job_id') == 133903484817
                and a.get('tested_sha') == 'cca989b7ab1e6ce836231c70bb7e6eabd9a4cceb'
                and a.get('source_blob') == '18330e00cc1917ffa97833c9cf7bcfcb35afefdd'
                and a.get('consumer_blob') == '9fd63b7cc0cd85b3cb10bb2b7b3d41b4b27a43ba'
                and a.get('workflow_blob') == '7adcdfcbcc9e99866a061181adaabf2758769f8c'
                and a.get('source_reports') == a.get('consumer_reports') == 2
                and a.get('independent_controls') == 3 and a.get('auditor_negative_tests') == 6
                and a.get('cold_build_jobs') == 9125 and a.get('artifact_id') == 14311446591
                and a.get('artifact_sha256') == 'e5af3d64296888ea824482fca8f74261e8d12c3ecac5a7cb36d579c92d2f08d5'
                and a.get('evidence_archive_blob') == 'ee39bccb7f61c497926bdb7eac9527cc53384d74'
                and a.get('evidence_job_log_blob') == '2f01abc4f2e5cb868e283bf24084ee872d558774'
                and a.get('evidence_manifest_blob') == '8f24d1b98d8c02d9460c8a150925fb374e2f191b'
                and a.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound']
                and s['last_qualified'] == a and s['accepted_anchors'][-1] == a,
                'W0A1 exact qualified original source/consumer or provider evidence missing')
        predecessor = next((x for x in s['accepted_anchors'] if x.get('gate') == 'P3-M4-W0A0'), {})
        require(predecessor.get('status') == 'GREEN_QUALIFIED'
                and predecessor.get('run_id') == 44039594189
                and predecessor.get('evidence_archive_blob') == '3ddc359754cab20045315a4167a9e5d15e316f80',
                'W0A1 may not erase original W0A0 qualified predecessor or R1 negative evidence')
        red = s.get('previous_active_W0A0_R1_RED', {})
        require(red.get('status') == 'RED_UNQUALIFIED'
                and red.get('run_id') == 44033364617
                and red.get('artifact_sha256') == 'e805e4eb1515a045031768794d1cb74786b3c64c0caff708f16fac80db45b58b',
                'W0A1 cannot erase original W0A0 dependent Pi.single failure')
        manifest = json.loads((root/a['evidence_manifest']).read_text())
        require(manifest.get('status') == 'GREEN_QUALIFIED'
                and manifest.get('strict_run') == a['run_id']
                and manifest.get('strict_job') == a['job_id']
                and manifest.get('tested_sha') == a['tested_sha']
                and manifest.get('original_archive_git_blob') == a['evidence_archive_blob']
                and manifest.get('original_archive_sha256') == a['artifact_sha256']
                and manifest.get('original_archive_bytes') == 13833
                and manifest.get('preservation_run') == 44047203535
                and manifest.get('job_log_git_blob') == a['evidence_job_log_blob']
                and manifest.get('cold_build_jobs') == 9125
                and manifest.get('independent_controls') == 3
                and manifest.get('auditor_negative_tests') == 6,
                'W0A1 exact independent provider evidence manifest mismatch')
        members = manifest['original_zip_members']
        expected_names = {'auditor.log','consumer.log','cold-source.log',
                          'preflight.log','source-axioms.log','tested-commit.txt'}
        require(set(members) == expected_names, 'W0A1 ZIP member manifest changed')
        with zipfile.ZipFile(root/a['evidence_archive']) as z:
            require(z.testzip() is None and set(z.namelist()) == expected_names,
                    'W0A1 provider original ZIP corrupted or incomplete')
            for name, expected in members.items():
                contents = z.read(name)
                require(len(contents) == expected['bytes']
                        and hashlib.sha256(contents).hexdigest() == expected['sha256'],
                        'W0A1 exact ZIP member failed digest: '+name)
            require(z.read('tested-commit.txt').decode().strip() == a['tested_sha']
                    and 'BFSS_W0A1_EXACT_ORIGINAL_REAL_LINEAR_W0A0_GREEN_R1_RED_DONORS_PREFLIGHT_PASS'
                        in z.read('preflight.log').decode()
                    and 'Build completed successfully (9125 jobs).'
                        in z.read('cold-source.log').decode()
                    and 'sorryAx' not in z.read('cold-source.log').decode()
                    and 'error:' not in z.read('cold-source.log').decode()
                    and a['strict_marker'] in z.read('auditor.log').decode(),
                    'W0A1 cold build, preflight or six-mutant auditor not accepted')
            pat = re.compile(r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)")
            allowed = {'propext','Classical.choice','Quot.sound'}
            expected = {
                'source-axioms.log': {'originalNormalized_allSourceLabel_eq_activeGamma',
                                     'originalFockGammaRealLinear_eq_sourceGammaRealLinear'},
                'consumer.log': {'originalNormalized_allSourceLabel_consumer',
                                 'originalFockGammaRealLinear_consumer'}
            }
            for name, roots in expected.items():
                report = z.read(name).decode()
                found = pat.findall(report)
                require('error:' not in report and 'sorryAx' not in report
                        and len(found) == 2
                        and {n.rsplit('.',1)[-1] for n,_ in found} == roots,
                        'W0A1 source or independent consumer roots malformed: '+name)
                for _, axioms in found:
                    require({u.strip() for u in axioms.split(',') if u.strip()} <= allowed,
                            'W0A1 axiom drift: '+name)
        log = (root/a['evidence_job_log']).read_text()
        require(a['strict_marker'] in log
                and 'Build completed successfully (9125 jobs).' in log
                and 'BFSS_W0A1_EXACT_ORIGINAL_REAL_LINEAR_W0A0_GREEN_R1_RED_DONORS_PREFLIGHT_PASS' in log,
                'W0A1 complete original CI log not pinned or genuine')
        source = (root/a['source']).read_text()
        consumer = (root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\s+', source)) == 2
                and len(re.findall(r'(?m)^theorem\s+', consumer)) == 2
                and len(re.findall(r'(?m)^example\b', consumer)) == 3
                and 'originalFockGammaRealLinear_eq_sourceGammaRealLinear' in source
                and 'donor_normalized_eq_active_source_axis' in source
                and 'Finset.sum_congr rfl' in source
                and 'originalSource48BivectorK' not in source
                and 'maxRecDepth' not in source,
                'W0A1 scoped original-source real-linear carrier changed')
        nxt = s.get('next_planned', {})
        require(nxt.get('gate') == 'P3-M4-W0A2'
                and nxt.get('status') == 'PROSPECTIVE_NOT_STAGED'
                and nxt.get('source_staged') is False
                and nxt.get('consumer_staged') is False
                and nxt.get('workflow_staged') is False,
                'W0A2 complexification gate not allowed without separate contract')
    if a['gate'] == 'P3-M4-W0A2' and a['status'] == 'GREEN_QUALIFIED':
        # Accept exactly one original real Clifford generator theorem,
        # independent one-root consumer and original provider evidence.
        import zipfile
        require(a.get('attempt') == 'R1' and a.get('accepted_predecessor_run') == 44043503665
                and a.get('run_id') == 44048184200 and a.get('job_id') == 133919001260
                and a.get('tested_sha') == '58219d2de55b7bba212effe50deec3d27eb361ac'
                and a.get('source_blob') == 'd444e0c08b4a3ae63653c9807c39c140940a67be'
                and a.get('consumer_blob') == 'b9d9dee2bb6f72d959f9602a8b09154fb439879e'
                and a.get('workflow_blob') == '9485e28f14d6b7e802d1f2d5539356399075401c'
                and a.get('source_reports') == a.get('consumer_reports') == 1
                and a.get('independent_controls') == 2 and a.get('auditor_negative_tests') == 6
                and a.get('cold_build_jobs') == 9126 and a.get('artifact_id') == 14313710380
                and a.get('artifact_sha256') == '543977c735a7f5fa11b852b23ef40e6f43d6b9850de4ed925f241b9e120904a6'
                and a.get('evidence_archive_blob') == '57e4229d1e9ba35f919fcbcae9e78bf47ac25ba1'
                and a.get('evidence_job_log_blob') == 'f1bd0a14b939435ae67a7266c32ad82d0617c3df'
                and a.get('evidence_manifest_blob') == '8f5940a4fddd453b1674c98bf744e8fe3dbf427e'
                and a.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound']
                and s['last_qualified'] == a and s['accepted_anchors'][-1] == a,
                'W0A2 one-root source/consumer or original-provider evidence mismatch')
        prev = next((x for x in s['accepted_anchors'] if x.get('gate') == 'P3-M4-W0A1'), {})
        require(prev.get('status') == 'GREEN_QUALIFIED'
                and prev.get('run_id') == 44043503665
                and prev.get('evidence_archive_blob') == 'ee39bccb7f61c497926bdb7eac9527cc53384d74',
                'W0A2 may not erase W0A1 qualified original evidence')
        w0a0 = next((x for x in s['accepted_anchors'] if x.get('gate') == 'P3-M4-W0A0'), {})
        require(w0a0.get('status') == 'GREEN_QUALIFIED'
                and w0a0.get('run_id') == 44039594189
                and w0a0.get('evidence_archive_blob') == '3ddc359754cab20045315a4167a9e5d15e316f80',
                'W0A2 may not erase W0A0 qualified green evidence')
        red = s.get('previous_active_W0A0_R1_RED', {})
        require(red.get('status') == 'RED_UNQUALIFIED' and red.get('run_id') == 44033364617
                and red.get('evidence_archive_blob') == 'f356fec7fbb63bd660712f043503bc70b1eae673',
                'W0A2 may not erase W0A0 original R1 source RED')
        manifest = json.loads((root/a['evidence_manifest']).read_text())
        require(manifest['status'] == 'GREEN_QUALIFIED'
                and manifest['strict_run'] == a['run_id']
                and manifest['strict_job'] == a['job_id']
                and manifest['tested_sha'] == a['tested_sha']
                and manifest['original_archive_git_blob'] == a['evidence_archive_blob']
                and manifest['original_archive_sha256'] == a['artifact_sha256']
                and manifest['original_archive_bytes'] == 13853
                and manifest['preservation_run'] == 44050703909
                and manifest['cold_build_jobs'] == 9126
                and manifest['independent_controls'] == 2
                and manifest['auditor_negative_tests'] == 6
                and manifest['job_log_git_blob'] == a['evidence_job_log_blob'],
                'W0A2 provider original manifest or run provenance mismatch')
        member_names = {'auditor.log','consumer.log','cold-source.log',
                        'preflight.log','source-axioms.log','tested-commit.txt'}
        require(set(manifest['original_zip_members']) == member_names,
                'W0A2 provider ZIP member manifest incomplete')
        allowed = {'propext','Classical.choice','Quot.sound'}
        roots = {'source-axioms.log':'originalComplexEquiv_realGenerator_eq_activeGamma',
                 'consumer.log':'originalComplexEquiv_realGenerator_consumer'}
        pat = re.compile(r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)")
        with zipfile.ZipFile(root/a['evidence_archive']) as z:
            require(z.testzip() is None and set(z.namelist()) == member_names,
                    'W0A2 original ZIP corrupt or missing source/consumer logs')
            for name, expected in manifest['original_zip_members'].items():
                data = z.read(name)
                require(len(data) == expected['bytes']
                        and hashlib.sha256(data).hexdigest() == expected['sha256'],
                        'W0A2 original ZIP member differs from pinned source: '+name)
            require(z.read('tested-commit.txt').decode().strip() == a['tested_sha']
                    and 'BFSS_W0A2_ORIGINAL_REAL_GENERATOR_W0A1_GREEN_W0A0_RED_GREEN_PREFLIGHT_PASS'
                        in z.read('preflight.log').decode()
                    and 'Build completed successfully (9126 jobs).'
                        in z.read('cold-source.log').decode()
                    and 'error:' not in z.read('cold-source.log').decode()
                    and 'sorryAx' not in z.read('cold-source.log').decode()
                    and a['strict_marker'] in z.read('auditor.log').decode(),
                    'W0A2 cold original compilation, pin preflight or auditor marker failed')
            for name, theorem in roots.items():
                report = z.read(name).decode()
                found = pat.findall(report)
                require('error:' not in report and 'sorryAx' not in report
                        and len(found) == 1 and found[0][0].rsplit('.',1)[-1] == theorem
                        and {x.strip() for x in found[0][1].split(',') if x.strip()} <= allowed,
                        'W0A2 original source or consumer axiom audit violation: '+name)
        job = (root/a['evidence_job_log']).read_text()
        require(a['strict_marker'] in job
                and 'Build completed successfully (9126 jobs).' in job
                and 'BFSS_W0A2_ORIGINAL_REAL_GENERATOR_W0A1_GREEN_W0A0_RED_GREEN_PREFLIGHT_PASS' in job,
                'W0A2 complete original Git-pinned job log invalid')
        source = (root/a['source']).read_text()
        consumer = (root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\s+',source)) == 1
                and len(re.findall(r'(?m)^theorem\s+',consumer)) == 1
                and len(re.findall(r'(?m)^example\b',consumer)) == 2
                and 'originalComplexEquiv_generator_eq_donor' in source
                and 'originalFockGammaRealLinear_eq_sourceGammaRealLinear' in source
                and '1 ⊗ₜ[ℝ] v' in source
                and 'originalSource48BivectorK' not in source,
                'W0A2 original real-vector Clifford generator scope exceeded')
        nxt = s.get('next_planned', {})
        require(nxt.get('gate') == 'P3-M4-W0A3'
                and nxt.get('status') == 'PROSPECTIVE_NOT_STAGED'
                and nxt.get('source_staged') is False
                and nxt.get('consumer_staged') is False
                and nxt.get('workflow_staged') is False,
                'W0A3 must remain prospective until its separate pre-gate contract')
    if a['gate'] == 'P3-M4-W0A3' and a['status'] == 'GREEN_QUALIFIED':
        # Exact original pure tensor z ⊗ real source v; no arbitrary
        # complex tensor induction, commutant or full witness claims.
        import zipfile
        require(a.get('attempt') == 'R1'
                and a.get('accepted_predecessor_run') == 44048184200
                and a.get('run_id') == 44051746176
                and a.get('job_id') == 133930997733
                and a.get('tested_sha') == 'eb248117ccf9913c837c7ce3d113be1384a11377'
                and a.get('source_blob') == '3a8d37dd0b065345b0a27529830dd0a1ee99a5b3'
                and a.get('consumer_blob') == '18ebec2e1265b2efd5e78baa69e0fbe9675f8c32'
                and a.get('workflow_blob') == '4ca801d2566c846b97b13e41f8965c277e285daf'
                and a.get('source_reports') == a.get('consumer_reports') == 1
                and a.get('independent_controls') == 2
                and a.get('auditor_negative_tests') == 6
                and a.get('cold_build_jobs') == 9127
                and a.get('artifact_id') == 14314887042
                and a.get('artifact_sha256') == 'a7cf6534bc40bdc1edd5ef99e7c7519f9d4cfec85339e2dd5d24ce076a3d578d'
                and a.get('evidence_archive_blob') == '845be0ed709f4fe44e288f116cc17eba4fcc5b9d'
                and a.get('evidence_job_log_blob') == '9ed614bf6fdb5c35cfc61a744cde7729206b9878'
                and a.get('evidence_manifest_blob') == 'f044308eab933c90b6f170c405e420323ef748c7'
                and a.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound']
                and s['last_qualified'] == a
                and s['accepted_anchors'][-1] == a,
                'W0A3 exact one-root green original Fock evidence missing')
        prior = next((x for x in s['accepted_anchors'] if x.get('gate') == 'P3-M4-W0A2'), {})
        require(prior.get('run_id') == 44048184200
                and prior.get('status') == 'GREEN_QUALIFIED'
                and prior.get('evidence_archive_blob') == '57e4229d1e9ba35f919fcbcae9e78bf47ac25ba1',
                'W0A3 must preserve original W0A2 accepted archive')
        red = s.get('previous_active_W0A0_R1_RED', {})
        require(red.get('run_id') == 44033364617
                and red.get('evidence_archive_blob') == 'f356fec7fbb63bd660712f043503bc70b1eae673',
                'W0A3 must preserve W0A0 source RED')
        manifest = json.loads((root/a['evidence_manifest']).read_text())
        require(manifest['status'] == 'GREEN_QUALIFIED'
                and manifest['strict_run'] == a['run_id']
                and manifest['strict_job'] == a['job_id']
                and manifest['tested_sha'] == a['tested_sha']
                and manifest['original_archive_sha256'] == a['artifact_sha256']
                and manifest['original_archive_git_blob'] == a['evidence_archive_blob']
                and manifest['original_archive_bytes'] == 13857
                and manifest['cold_build_jobs'] == 9127
                and manifest['independent_controls'] == 2
                and manifest['auditor_negative_tests'] == 6
                and manifest['original_job_log_git_blob'] == a['evidence_job_log_blob']
                and manifest['preservation_run'] == 44054210444,
                'W0A3 original provider evidence manifest mismatch')
        members = {'auditor.log','cold-source.log','consumer.log','preflight.log',
                   'source-axioms.log','tested-commit.txt'}
        require(set(manifest['original_zip_members']) == members,
                'W0A3 original ZIP member manifest incomplete')
        pat = re.compile(r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)")
        allowed = {'propext','Classical.choice','Quot.sound'}
        roots = {
            'source-axioms.log':'originalComplexEquiv_pureTensorGenerator_eq_activeGamma',
            'consumer.log':'originalComplexEquiv_pureTensorGenerator_consumer'
        }
        with zipfile.ZipFile(root/a['evidence_archive']) as z:
            require(z.testzip() is None and set(z.namelist()) == members,
                    'W0A3 original provider ZIP integrity/contents failed')
            for name, info in manifest['original_zip_members'].items():
                contents = z.read(name)
                require(len(contents) == info['bytes']
                        and hashlib.sha256(contents).hexdigest() == info['sha256'],
                        'W0A3 ZIP member SHA-256 failed: '+name)
            require(z.read('tested-commit.txt').decode().strip() == a['tested_sha']
                    and 'BFSS_W0A3_ORIGINAL_COMPLEX_PURE_TENSOR_W0A2_GREEN_DONORS_PREFLIGHT_PASS'
                        in z.read('preflight.log').decode()
                    and 'Build completed successfully (9127 jobs).'
                        in z.read('cold-source.log').decode()
                    and 'sorryAx' not in z.read('cold-source.log').decode()
                    and 'error:' not in z.read('cold-source.log').decode()
                    and a['strict_marker'] in z.read('auditor.log').decode(),
                    'W0A3 exact tested commit, preflight, original build or audit failed')
            for name, theorem in roots.items():
                report = z.read(name).decode()
                found = pat.findall(report)
                require('error:' not in report and 'sorryAx' not in report
                        and len(found) == 1
                        and found[0][0].rsplit('.',1)[-1] == theorem
                        and {x.strip() for x in found[0][1].split(',') if x.strip()} <= allowed,
                        'W0A3 source or independent consumer roots/axioms drifted: '+name)
        job = (root/a['evidence_job_log']).read_text()
        require(a['strict_marker'] in job
                and 'Build completed successfully (9127 jobs).' in job
                and 'BFSS_W0A3_ORIGINAL_COMPLEX_PURE_TENSOR_W0A2_GREEN_DONORS_PREFLIGHT_PASS'
                    in job,
                'W0A3 complete original CI job log not preserved')
        source = (root/a['source']).read_text()
        consumer = (root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\s+',source)) == 1
                and len(re.findall(r'(?m)^theorem\s+',consumer)) == 1
                and len(re.findall(r'(?m)^example\b',consumer)) == 2
                and 'TensorProduct.smul_tmul' in source
                and 'originalComplexEquiv_realGenerator_eq_activeGamma' in source
                and 'z • sourceGammaRealLinear v' in source
                and 'originalSource48BivectorK' not in source,
                'W0A3 source pure-tensor scope was enlarged')
        nxt = s.get('next_planned', {})
        require(nxt.get('gate') == 'P3-M4-W0A4'
                and nxt.get('status') == 'PROSPECTIVE_NOT_STAGED'
                and nxt.get('source_staged') is False
                and nxt.get('consumer_staged') is False
                and nxt.get('workflow_staged') is False,
                'W0A4 must remain prospective before its own contract')
    if a['gate'] == 'P3-M4-W0A4' and a.get('attempt') == 'R2':
        import zipfile
        old = s.get('previous_active_W0A4_R1_RED', {})
        require(old.get('gate') == 'P3-M4-W0A4'
                and old.get('attempt') == 'R1'
                and old.get('status') == 'RED_UNQUALIFIED'
                and old.get('qualification') is False
                and old.get('run_id') == 44055363556
                and old.get('job_id') == 133943222828
                and old.get('tested_sha') == '14b96aca0d455098fcd54486840f3b905eda2dd7'
                and old.get('source_blob') == '606fcdd173d4c31f191d29e7de53a742cdcbf1aa'
                and old.get('consumer_blob') == '18fec08b3259513e63deff44319eb90b759b6b5f'
                and old.get('artifact_sha256') == '7deda8b0723841d8a35e19dd8587211254b7e3a8cebaa317918321a54d96dcb6'
                and old.get('evidence_archive_blob') == 'ef3ad039799680fde9f0d1669f130ef275f9a2a3'
                and old.get('evidence_job_log_blob') == '6f635122f8ab1a3078851aac68214462a4124488'
                and old.get('evidence_manifest_blob') == '80118a64933e161b4b5faf196dad4a06dcd0b5a7'
                and old.get('failure_phase') == 'COLD_ORIGINAL_LEAN_SOURCE'
                and blob(root/old['evidence_archive']) == old['evidence_archive_blob']
                and blob(root/old['evidence_job_log']) == old['evidence_job_log_blob']
                and blob(root/old['evidence_manifest']) == old['evidence_manifest_blob'],
                'W0A4 R2 must preserve exact source RED from original R1')
        prev_manifest = json.loads((root/old['evidence_manifest']).read_text())
        require(prev_manifest['status'] == 'RED_UNQUALIFIED'
                and prev_manifest['original_archive_git_blob'] == old['evidence_archive_blob']
                and prev_manifest['preservation_green_run'] == 44058037250
                and prev_manifest['original_archive_bytes'] == 13594,
                'W0A4 R1 RED original evidence metadata drift')
        with zipfile.ZipFile(root/old['evidence_archive']) as z:
            require(z.testzip() is None
                    and set(z.namelist()) == {'preflight.log','cold-source.log','tested-commit.txt'}
                    and z.read('tested-commit.txt').decode().strip() == old['tested_sha'],
                    'W0A4 R1 provider archive lost original three-member RED')
            cold = z.read('cold-source.log').decode()
            require('Unknown identifier' in cold
                    and 'AlgebraTensorModule.lift' in cold
                    and 'change' in cold and 'build failed' in cold,
                    'W0A4 R1 original failure evidence no longer diagnostic')
        require(a.get('previous_red_run') == 44055363556
                and a.get('accepted_predecessor_run') == 44051746176
                and s['last_qualified']['run_id'] == 44051746176
                and a.get('source_blob') == '489d71f3ac7d51f19caf45bd89640b646e9ca882'
                and a.get('consumer_blob') == old.get('consumer_blob'),
                'W0A4 R2 source/consumer changed beyond one-namespace repair')
        patched_source = (root/a['source']).read_text()
        require(patched_source.count('  TensorProduct.AlgebraTensorModule.lift') == 1,
                'W0A4 R2 must contain exactly one qualified lift')
        original_source_bytes = patched_source.replace(
            '  TensorProduct.AlgebraTensorModule.lift',
            '  AlgebraTensorModule.lift',1).encode('utf-8')
        reconstructed_source_blob = hashlib.sha1(
            ('blob '+str(len(original_source_bytes))+'\0').encode('utf-8')
            + original_source_bytes).hexdigest()
        require(reconstructed_source_blob == '606fcdd173d4c31f191d29e7de53a742cdcbf1aa',
                'W0A4 R2 source is not byte-exact one-namespace repair of R1 RED')
    if a['gate'] == 'P3-M4-W0A4' and a.get('attempt') == 'R2' and a['status'] == 'RED_UNQUALIFIED':
        import zipfile
        require(a.get('stopped') is True
                and a.get('stop_reason') == 'TWO_CONSECUTIVE_ORIGINAL_COMPLEX_LINEAR_MAP_CONSTRUCTION_REDS'
                and a.get('qualification') is False
                and a.get('run_id') == 44059417729
                and a.get('job_id') == 133957082631
                and a.get('tested_sha') == '22f86b1b4dde9856420c8318ea0e2b6f3b341502'
                and a.get('artifact_id') == 14317629742
                and a.get('artifact_sha256') == '5c4589b34218e6d34b7bc8fe3fbba8badb7f3bf0553522802fc9d3f763a47c90'
                and a.get('evidence_archive_blob') == 'c1d7f4436e22dd5698058ea3b5557d131823de9d'
                and a.get('evidence_job_log_blob') == 'c8d16f4c41bfe15e2ceb05664a7efc3d5aef4d9d'
                and a.get('evidence_manifest_blob') == '51adef7627da2dd4c0aa0abd3f832a8f392403db'
                and a.get('source_blob') == '489d71f3ac7d51f19caf45bd89640b646e9ca882'
                and a.get('consumer_blob') == '18fec08b3259513e63deff44319eb90b759b6b5f'
                and a.get('workflow_blob') == 'f2a80f5e2eb125c7a4beccd167fa1c185c224fe6'
                and a.get('previous_red_run') == 44055363556
                and s['last_qualified']['gate'] == 'P3-M4-W0A3'
                and s['last_qualified']['run_id'] == 44051746176
                and s['accepted_anchors'][-1]['gate'] == 'P3-M4-W0A3',
                'W0A4 R2 stopped native source RED cannot promote or lose original evidence')
        m = json.loads((root/a['evidence_manifest']).read_text())
        require(m['status'] == 'RED_UNQUALIFIED'
                and m['stopped'] is True
                and m['original_run'] == a['run_id']
                and m['original_job'] == a['job_id']
                and m['tested_sha'] == a['tested_sha']
                and m['original_provider_archive_bytes'] == 374
                and m['original_provider_archive_sha256'] == a['artifact_sha256']
                and m['original_provider_archive_git_blob'] == a['evidence_archive_blob']
                and m['original_job_log_git_blob'] == a['evidence_job_log_blob']
                and m['prior_red']['run'] == 44055363556
                and m['prior_red']['original_zip_git_blob'] ==
                    s['previous_active_W0A4_R1_RED']['evidence_archive_blob'],
                'W0A4 R2 original provider evidence manifest drift')
        names = {'preflight.log','tested-commit.txt'}
        require(set(m['original_provider_archive_members']) == names,
                'W0A4 R2 provider artifact only has two members; no cold-source.log')
        with zipfile.ZipFile(root/a['evidence_archive']) as z:
            require(z.testzip() is None and set(z.namelist()) == names
                    and z.read('tested-commit.txt').decode().strip() == a['tested_sha']
                    and 'BFSS_W0A4_R2_NAMESPACE_ONLY_W0A3_GREEN_R1_RED_DONORS_PREFLIGHT_PASS'
                        in z.read('preflight.log').decode(),
                    'W0A4 R2 provider-original RED artifact corrupt or not exact')
            for name, info in m['original_provider_archive_members'].items():
                data = z.read(name)
                require(len(data) == info['bytes']
                        and hashlib.sha256(data).hexdigest() == info['sha256'],
                        'W0A4 R2 original ZIP member mismatch: '+name)
        job = (root/a['evidence_job_log']).read_text()
        require('P3M4W0A4OriginalFullComplexGammaTransport.lean:41:8: Type mismatch'
                    in job
                and 'smul_smul z w sourceGammaRealLinear' in job
                and 'RingHom.id ℂ' in job and 'sorryAx' in job
                and 'error: build failed' in job,
                'W0A4 R2 original full job log lacks native failing proof')
        require('cold-source.log omitted' in m['evidence_gap']
                and s['next_planned']['status'] == 'PROSPECTIVE_NOT_STAGED'
                and s['next_planned']['source_staged'] is False,
                'W0A4 stop must not conceal incomplete ZIP or stage next theorem')
    if a['gate'] == 'P3-M4-W0B0' and a.get('attempt') == 'R1' and a['status'] == 'PENDING_STRICT_CI':
        import zipfile
        require(a.get('attempt') == 'R1' and a.get('qualification') is False
                and a.get('accepted_predecessor_run') == 44051746176
                and a.get('source_blob') == 'd3cbdd7446f06e203959776abee3629b8269f572'
                and a.get('consumer_blob') == '159c561d6e73e3c86959cd239deb10984064e92e'
                and a.get('workflow_blob') == '5eef739aaf906f90c603fecc84dda28e2391c594'
                and a.get('contract_commit') == '812cc2b8ea6ace9b2210c3ec7ef05742a33fb87d'
                and a.get('expected_source_reports') == 2
                and a.get('expected_consumer_reports') == 2
                and a.get('independent_controls') == 2
                and a.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound']
                and s['last_qualified']['gate'] == 'P3-M4-W0A3'
                and s['last_qualified']['run_id'] == 44051746176
                and s['accepted_anchors'][-1] == s['last_qualified'],
                'W0B0 source/consumer or last-qualified W0A3 drift')
        w0a3 = next((x for x in s['accepted_anchors'] if x.get('gate') == 'P3-M4-W0A3'), {})
        require(w0a3.get('status') == 'GREEN_QUALIFIED'
                and w0a3.get('run_id') == 44051746176
                and w0a3.get('source_blob') == '3a8d37dd0b065345b0a27529830dd0a1ee99a5b3'
                and w0a3.get('evidence_archive_blob') == '845be0ed709f4fe44e288f116cc17eba4fcc5b9d',
                'W0B0 cannot use unaccepted W0A3 donor')
        r1 = s.get('previous_active_W0A4_R1_RED',{})
        r2 = s.get('previous_active_W0A4_R2_stopped',{})
        require(r1.get('status') == r2.get('status') == 'RED_UNQUALIFIED'
                and r1.get('qualification') is False
                and r2.get('qualification') is False
                and r1.get('run_id') == 44055363556
                and r2.get('run_id') == 44059417729
                and r2.get('stopped') is True
                and r2.get('stop_reason') == 'TWO_CONSECUTIVE_ORIGINAL_COMPLEX_LINEAR_MAP_CONSTRUCTION_REDS'
                and r1.get('evidence_archive_blob') == 'ef3ad039799680fde9f0d1669f130ef275f9a2a3'
                and r2.get('evidence_archive_blob') == 'c1d7f4436e22dd5698058ea3b5557d131823de9d'
                and r1.get('evidence_job_log_blob') == '6f635122f8ab1a3078851aac68214462a4124488'
                and r2.get('evidence_job_log_blob') == 'c8d16f4c41bfe15e2ceb05664a7efc3d5aef4d9d'
                and r1.get('evidence_manifest_blob') == '80118a64933e161b4b5faf196dad4a06dcd0b5a7'
                and r2.get('evidence_manifest_blob') == '51adef7627da2dd4c0aa0abd3f832a8f392403db',
                'W0B0 must preserve both original W0A4 stopped RED diagnostics')
        for red in (r1,r2):
            require(blob(root/red['evidence_archive']) == red['evidence_archive_blob']
                    and blob(root/red['evidence_job_log']) == red['evidence_job_log_blob']
                    and blob(root/red['evidence_manifest']) == red['evidence_manifest_blob'],
                    'Original RED evidence bytes changed during W0B0')
        with zipfile.ZipFile(root/r2['evidence_archive']) as z:
            require(z.testzip() is None
                    and set(z.namelist()) == {'preflight.log','tested-commit.txt'},
                    'W0A4 R2 provider original ZIP must remain two-member incomplete')
        require('P3M4W0A4OriginalFullComplexGammaTransport.lean:41:8: Type mismatch'
                in (root/r2['evidence_job_log']).read_text(),
                'W0A4 R2 native source failure log lost')
        src = (root/a['source']).read_text()
        consumer = (root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\s+',src)) == 2
                and len(re.findall(r'(?m)^theorem\s+',consumer)) == 2
                and len(re.findall(r'(?m)^example\b',consumer)) == 2
                and 'Commute.sum_right' in src
                and 'TensorProduct.inductionOn' in src
                and 'originalComplexEquiv_pureTensorGenerator_eq_activeGamma' in src
                and 'AlgebraTensorModule.lift' not in src
                and 'activeGammaComplexLinear' not in src
                and 'OriginalFullComplexGammaTransport' not in src
                and 'OriginalFullComplexGammaTransport' not in consumer,
                'W0B0 proof must bypass stopped native W0A4 construction')
        nxt = s.get('next_planned',{})
        require(nxt.get('gate') == 'P3-M4-W0B1'
                and nxt.get('status') == 'PROSPECTIVE_NOT_STAGED'
                and nxt.get('source_staged') is False
                and nxt.get('consumer_staged') is False
                and nxt.get('workflow_staged') is False,
                'W0B1 cannot stage before W0B0 strict acceptance')
    if a['gate'] == 'P3-M4-W0B0' and a.get('attempt') == 'R2' and a['status'] == 'PENDING_STRICT_CI':
        import zipfile
        old = s.get('previous_active_W0B0_R1_RED',{})
        require(old.get('gate') == 'P3-M4-W0B0'
                and old.get('attempt') == 'R1'
                and old.get('status') == 'RED_UNQUALIFIED'
                and old.get('qualification') is False
                and old.get('run_id') == 44064728599
                and old.get('job_id') == 133975334691
                and old.get('tested_sha') == 'e668c0a6a542a5f5712c0bcaf9c219e96b3649ed'
                and old.get('source_blob') == 'd3cbdd7446f06e203959776abee3629b8269f572'
                and old.get('consumer_blob') == '159c561d6e73e3c86959cd239deb10984064e92e'
                and old.get('workflow_blob') == '5eef739aaf906f90c603fecc84dda28e2391c594'
                and old.get('artifact_id') == 14320782146
                and old.get('artifact_sha256') == 'd7ade4d6b28b8ea442d2a7130b5c9a20a40e1d4481d0a7ff5d54704234483010'
                and old.get('evidence_archive_blob') == '7a74c38049c3cff6e0bdd1c6e7d2ea72c75deb07'
                and old.get('evidence_job_log_blob') == '9b450ff0e633f7fb3c908805754c7d95fb992808'
                and old.get('evidence_manifest_blob') == '7db61cffda4a8a75cf63250f4d82737316fb0ad9'
                and blob(root/old['evidence_archive']) == old['evidence_archive_blob']
                and blob(root/old['evidence_job_log']) == old['evidence_job_log_blob']
                and blob(root/old['evidence_manifest']) == old['evidence_manifest_blob'],
                'W0B0 R2 cannot lose original R1 RED source or original provider evidence')
        m = json.loads((root/old['evidence_manifest']).read_text())
        require(m['status'] == 'RED_UNQUALIFIED'
                and m['strict_run'] == old['run_id']
                and m['original_archive_bytes'] == 13540
                and m['original_archive_sha256'] == old['artifact_sha256']
                and m['original_archive_git_blob'] == old['evidence_archive_blob']
                and m['original_job_log_git_blob'] == old['evidence_job_log_blob']
                and m['preservation_workflow_run'] == 44108072439,
                'W0B0 R1 original RED evidence manifest drift')
        expected={'cold-source.log','preflight.log','tested-commit.txt'}
        require(set(m['original_archive_members']) == expected,
                'W0B0 original source RED three ZIP members missing')
        with zipfile.ZipFile(root/old['evidence_archive']) as z:
            require(z.testzip() is None and set(z.namelist()) == expected
                    and z.read('tested-commit.txt').decode().strip() == old['tested_sha']
                    and 'BFSS_W0B0_ORIGINAL_GAMMA_COMMUTANT_W0A3_GREEN_W0A4_R1_R2_STOP_PREFLIGHT_PASS'
                        in z.read('preflight.log').decode(),
                    'W0B0 R1 original provider ZIP does not match original source')
            for name, desc in m['original_archive_members'].items():
                data=z.read(name)
                require(len(data) == desc['bytes']
                        and hashlib.sha256(data).hexdigest() == desc['sha256'],
                        'W0B0 R1 original provider ZIP member hash mismatch: '+name)
            cold=z.read('cold-source.log').decode()
            require('SMulCommClass ℝ Op Op' in cold
                    and 'failed to synthesize instance of type class' in cold
                    and 'sorryAx' in cold and 'build failed' in cold,
                    'W0B0 R1 original native source failure missing')
        require(a.get('accepted_predecessor_run') == 44051746176
                and a.get('previous_red_run') == 44064728599
                and a.get('source_blob') == 'c67f30bb76a9990e508a8a050a8c3313e694bda7'
                and a.get('consumer_blob') == old['consumer_blob']
                and a.get('workflow_blob') == '8636cb31e5d80eff47a6d628b5c79957c425a5de'
                and a.get('contract_commit') == '5c43690a791c101a6837a24827f84da1dac24345'
                and s['last_qualified']['gate'] == 'P3-M4-W0A3'
                and s['last_qualified']['run_id'] == 44051746176,
                'W0B0 R2 scalar-only repair exact source/consumer/parent drift')
        src = (root/a['source']).read_text()
        new = "  rw [RCLike.real_smul_eq_coe_smul (K := ℂ)\n    (v p) (sourceNormalizedGamma p)]\n  exact (h p).smul_right (v p : ℂ)"
        require(src.count(new) == 1,'W0B0 R2 repair hunk missing or repeated')
        restored = src.replace(new,'  exact (h p).smul_right (v p)',1).encode('utf-8')
        restored_git_blob = hashlib.sha1(
            ('blob '+str(len(restored))+'\0').encode('utf-8')+restored).hexdigest()
        require(restored_git_blob == old['source_blob'],
                'W0B0 R2 source changed beyond one real-to-complex scalar repair')
        require('OriginalFullComplexGammaTransport' not in src
                and 'activeGammaComplexLinear' not in src
                and 'AlgebraTensorModule.lift' not in src,
                'W0B0 R2 reopened stopped W0A4 linear extension')
        require(s.get('previous_active_W0A4_R2_stopped',{}).get('stopped') is True
                and s['next_planned']['gate'] == 'P3-M4-W0B1'
                and s['next_planned']['status'] == 'PROSPECTIVE_NOT_STAGED',
                'W0B0 R2 must retain stopped W0A4 and prospective W0B1')
    if a['gate'] == 'P3-M4-W0B0' and a.get('attempt') == 'R2' and a['status'] == 'GREEN_QUALIFIED':
        import zipfile
        require(a.get('qualification') is True
                and a.get('verdict') == 'GREEN'
                and a.get('strict_outcome') == 'success'
                and a.get('run_id') == 44109519633
                and a.get('job_id') == 134130970856
                and a.get('tested_sha') == '68ed5e35c7268951779d9d35aa4f87f59fee2b67'
                and a.get('source_blob') == 'c67f30bb76a9990e508a8a050a8c3313e694bda7'
                and a.get('consumer_blob') == '159c561d6e73e3c86959cd239deb10984064e92e'
                and a.get('workflow_blob') == '8636cb31e5d80eff47a6d628b5c79957c425a5de'
                and a.get('source_reports') == a.get('consumer_reports') == 2
                and a.get('independent_controls') == 2
                and a.get('auditor_negative_tests') == 6
                and a.get('cold_build_jobs') == 9128
                and a.get('artifact_id') == 14339909789
                and a.get('artifact_sha256') == 'e21cc898a2e5ab41b52e93a804b602129b539de151665a742e43d1773872f890'
                and a.get('evidence_archive_blob') == 'abbebbf9e7d2eeefeeef901a415030e09551c2d6'
                and a.get('evidence_job_log_blob') == 'd2b6066d6911de727f69a671218c1e87e7ed60d0'
                and a.get('evidence_manifest_blob') == '14191c98fcf7b8ac2f8e8503ab5998cb1590e230'
                and a.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound']
                and a.get('strict_marker') ==
                    'BFSS_W0B0_R2_COMPLEX_SCALAR_2_SOURCE_2_CONSUMER_2_CONTROLS_STRICT_GREEN'
                and s['last_qualified'] == a
                and s['accepted_anchors'][-1] == a,
                'W0B0 original 2-source 2-consumer strict GREEN must be fully qualified')
        m = json.loads((root/a['evidence_manifest']).read_text())
        require(m['status'] == 'GREEN_QUALIFIED'
                and m['strict_run'] == a['run_id']
                and m['strict_job'] == a['job_id']
                and m['tested_sha'] == a['tested_sha']
                and m['source_blob'] == a['source_blob']
                and m['consumer_blob'] == a['consumer_blob']
                and m['workflow_blob'] == a['workflow_blob']
                and m['original_archive_bytes'] == 13960
                and m['original_archive_sha256'] == a['artifact_sha256']
                and m['original_archive_git_blob'] == a['evidence_archive_blob']
                and m['original_job_log_git_blob'] == a['evidence_job_log_blob']
                and m['preservation_run'] == 44114511786
                and m['cold_build_jobs'] == 9128
                and m['independent_controls'] == 2
                and m['auditor_negative_tests'] == 6,
                'W0B0 original GREEN provider manifest metadata mismatch')
        member_names = {'auditor.log','cold-source.log','consumer.log',
                        'preflight.log','source-axioms.log','tested-commit.txt'}
        require(set(m['original_zip_members']) == member_names
                and blob(root/a['evidence_archive']) == a['evidence_archive_blob']
                and blob(root/a['evidence_job_log']) == a['evidence_job_log_blob']
                and blob(root/a['evidence_manifest']) == a['evidence_manifest_blob']
                and hashlib.sha256((root/a['evidence_archive']).read_bytes()).hexdigest() == a['artifact_sha256'],
                'W0B0 original evidence bytes or six-member manifest missing')
        pat = re.compile(r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)")
        roots = {
            'source-axioms.log': {
                'sourceGammaRealLinear_commute',
                'originalComplexEquiv_generator_commutes'
            },
            'consumer.log': {
                'sourceGammaRealLinear_commute_consumer',
                'originalComplexEquiv_generator_commutes_consumer'
            }
        }
        allowed={'propext','Classical.choice','Quot.sound'}
        with zipfile.ZipFile(root/a['evidence_archive']) as z:
            require(z.testzip() is None and set(z.namelist()) == member_names,
                    'W0B0 original archive CRC or six-member list mismatched')
            for name,info in m['original_zip_members'].items():
                member=z.read(name)
                require(len(member) == info['bytes']
                        and hashlib.sha256(member).hexdigest() == info['sha256'],
                        'W0B0 provider-original member digest drift: '+name)
            require(z.read('tested-commit.txt').decode().strip() == a['tested_sha']
                    and 'BFSS_W0B0_R2_ORIGINAL_COMPLEX_SCALAR_W0A3_GREEN_W0A4_STOP_W0B0_R1_RED_PREFLIGHT_PASS'
                        in z.read('preflight.log').decode()
                    and 'Build completed successfully (9128 jobs).' in z.read('cold-source.log').decode()
                    and 'error:' not in z.read('cold-source.log').decode()
                    and 'sorryAx' not in z.read('cold-source.log').decode()
                    and a['strict_marker'] in z.read('auditor.log').decode(),
                    'W0B0 original cold source, tested SHA, donor preflight or auditor failed')
            for name,expected in roots.items():
                report=z.read(name).decode()
                found=pat.findall(report)
                require('error:' not in report and 'sorryAx' not in report
                        and len(found)==2
                        and {x.rsplit('.',1)[-1] for x,_ in found} == expected
                        and all({a.strip() for a in axioms.split(',') if a.strip()} <= allowed
                                for _,axioms in found),
                        'W0B0 source/independent consumer two-root axiom audit failed: '+name)
        job=(root/a['evidence_job_log']).read_text()
        require('Build completed successfully (9128 jobs).' in job
                and a['strict_marker'] in job
                and 'BFSS_W0B0_R2_ORIGINAL_COMPLEX_SCALAR_W0A3_GREEN_W0A4_STOP_W0B0_R1_RED_PREFLIGHT_PASS'
                    in job,
                'W0B0 full provider-original green job log missing')
        source=(root/a['source']).read_text()
        consumer=(root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\s+',source))==2
                and len(re.findall(r'(?m)^theorem\s+',consumer))==2
                and len(re.findall(r'(?m)^example\b',consumer))==2
                and 'RCLike.real_smul_eq_coe_smul' in source
                and 'Commute.sum_right' in source
                and 'TensorProduct.inductionOn' in source
                and 'originalComplexEquiv_pureTensorGenerator_eq_activeGamma' in source
                and 'activeGammaComplexLinear' not in source
                and 'OriginalFullComplexGammaTransport' not in source,
                'W0B0 must retain direct commutator predicate proof architecture')
        previous = next((x for x in s['accepted_anchors']
                         if x.get('gate') == 'P3-M4-W0A3'),{})
        require(previous.get('run_id') == 44051746176
                and previous.get('evidence_archive_blob') == '845be0ed709f4fe44e288f116cc17eba4fcc5b9d',
                'W0B0 must retain exact qualified W0A3 original donor')
        red=s.get('previous_active_W0B0_R1_RED',{})
        require(red.get('status') == 'RED_UNQUALIFIED'
                and red.get('run_id') == 44064728599
                and red.get('evidence_archive_blob') == '7a74c38049c3cff6e0bdd1c6e7d2ea72c75deb07'
                and red.get('evidence_job_log_blob') == '9b450ff0e633f7fb3c908805754c7d95fb992808'
                and blob(root/red['evidence_archive']) == red['evidence_archive_blob']
                and blob(root/red['evidence_job_log']) == red['evidence_job_log_blob'],
                'W0B0 source R1 original RED negative knowledge erased')
        stopped=s.get('previous_active_W0A4_R2_stopped',{})
        require(stopped.get('stopped') is True
                and stopped.get('status') == 'RED_UNQUALIFIED'
                and stopped.get('stop_reason') ==
                    'TWO_CONSECUTIVE_ORIGINAL_COMPLEX_LINEAR_MAP_CONSTRUCTION_REDS'
                and stopped.get('evidence_archive_blob') ==
                    'c1d7f4436e22dd5698058ea3b5557d131823de9d',
                'W0B0 GREEN cannot erase stopped W0A4 two-original-RED architecture')
        nxt=s.get('next_planned',{})
        require(nxt.get('gate') == 'P3-M4-W0B1'
                and nxt.get('status') == 'PROSPECTIVE_NOT_STAGED'
                and nxt.get('source_staged') is False
                and nxt.get('consumer_staged') is False
                and nxt.get('workflow_staged') is False,
                'W0B1 full Clifford-induction theorem must remain prospective')
    if a['gate'] == 'P3-M4-W0B1' and a.get('attempt') == 'R2' and a['status'] == 'RED_UNQUALIFIED':
        import zipfile
        require(a.get('stopped') is True
                and a.get('stop_reason') == 'TWO_ANALOGOUS_ORIGINAL_SCALAR_INDUCTION_SOURCE_REDS_STOP'
                and a.get('qualification') is False and a.get('verdict') == 'RED'
                and a.get('strict_outcome') == 'failure'
                and a.get('run_id') == 44127193329
                and a.get('job_id') == 134194094284
                and a.get('tested_sha') == '4ec854fb464abdc2f5af5bcd4206531b8102e28e'
                and a.get('artifact_id') == 14347939975
                and a.get('artifact_sha256') == 'bfadd329f067ca9e7926b245e0ed9b2989e7b4594eb9868eb401e5cf985b87a2'
                and a.get('source_blob') == '93244f15ae511cd4abbac13e216eed6b1988c009'
                and a.get('consumer_blob') == '9ea114c7f8a8c26b814b3abe9fd5c6a1e853e53a'
                and a.get('workflow_blob') == '1f43a7d9ac86d42457020730a53d59eb5db48f41'
                and a.get('previous_red_run') == 44117272657
                and a.get('evidence_archive_blob') == '813b3325da4f721afc0bb313a710410eb40a3bcf'
                and a.get('evidence_job_log_blob') == '918c09a60ef1e99a9f8e1d56f380353719cb1fdc'
                and a.get('evidence_manifest_blob') == '9a4991d9ce4aeda01ad08684f436d5b9a88bbd48'
                and a.get('preservation_run') == 44132100611
                and s['last_qualified']['gate'] == 'P3-M4-W0B0'
                and s['last_qualified']['run_id'] == 44109519633
                and s['accepted_anchors'][-1] == s['last_qualified'],
                'W0B1 R2 second source RED must be STOPPED with exact qualified donor')
        r1=s.get('previous_active_W0B1_R1_RED',{})
        require(r1.get('gate') == 'P3-M4-W0B1'
                and r1.get('attempt') == 'R1'
                and r1.get('run_id') == 44117272657
                and r1.get('status') == 'RED_UNQUALIFIED'
                and r1.get('source_blob') == '6c9cae683665fb6cda2a6e8ff10d388f6a268a05'
                and r1.get('consumer_blob') == '9ea114c7f8a8c26b814b3abe9fd5c6a1e853e53a'
                and r1.get('evidence_archive_blob') == 'a448d2ae775926ee05ab4a9028e29e8061fecdac'
                and r1.get('evidence_job_log_blob') == '7e8310126b2e5af543ec1f7274ce5467dbc59552'
                and r1.get('evidence_manifest_blob') == 'a78963305bb75e7ab154f8c40a0c8d5ab7299f29',
                'W0B1 R1 native source RED evidence altered or erased')
        for red in (r1,a):
            require(blob(root/red['evidence_archive']) == red['evidence_archive_blob']
                    and blob(root/red['evidence_job_log']) == red['evidence_job_log_blob']
                    and blob(root/red['evidence_manifest']) == red['evidence_manifest_blob'],
                    'W0B1 provider-original RED ZIP, job log or manifest drift')
            m=json.loads((root/red['evidence_manifest']).read_text())
            raw=(root/red['evidence_archive']).read_bytes()
            require(m['status'] == 'RED_UNQUALIFIED'
                    and m['run_id'] == red['run_id']
                    and m['job_id'] == red['job_id']
                    and m['tested_sha'] == red['tested_sha']
                    and m['original_zip']['sha256'] == red['artifact_sha256']
                    and m['original_zip']['size'] == len(raw)
                    and hashlib.sha256(raw).hexdigest() == red['artifact_sha256'],
                    'W0B1 original provider RED SHA or run manifest mismatch')
            with zipfile.ZipFile(root/red['evidence_archive']) as z:
                require(z.testzip() is None
                        and set(z.namelist()) == {'cold-source.log','preflight.log','tested-commit.txt'}
                        and z.read('tested-commit.txt').decode().strip() == red['tested_sha']
                        and 'sorryAx' in z.read('cold-source.log').decode(),
                        'W0B1 original source RED ZIP member mismatch')
                for member in m['original_zip']['members']:
                    data=z.read(member['name'])
                    require(len(data) == member['size']
                            and hashlib.sha256(data).hexdigest() == member['sha256'],
                            'W0B1 original ZIP member checksum mismatch')
        with zipfile.ZipFile(root/r1['evidence_archive']) as z:
            require('Unknown identifier' in z.read('cold-source.log').decode()
                    and 'map_algebraMap' in z.read('cold-source.log').decode(),
                    'W0B1 R1 first native scalar failure missing')
        with zipfile.ZipFile(root/a['evidence_archive']) as z:
            cold=z.read('cold-source.log').decode()
            require('P3M4W0B1OriginalFullCliffordCommutantInduction.lean:43:6' in cold
                    and 'Type mismatch: After simplification' in cold
                    and 'FockOp' in cold and 'build failed' in cold,
                    'W0B1 R2 second scalar mismatch source RED missing')
        job=(root/a['evidence_job_log']).read_text()
        require('Type mismatch: After simplification' in job
                and 'sorryAx' in job and 'error: build failed' in job,
                'W0B1 R2 full native RED job log missing')
        source=(root/a['source']).read_text()
        original=source.replace('AlgEquiv.commutes','map_algebraMap')
        require(source.count('AlgEquiv.commutes') == 1
                and hashlib.sha1(b'blob '+str(len(original.encode())).encode()+b'\x00'+original.encode()).hexdigest()
                    == r1['source_blob'],
                'W0B1 R2 source must be original R1 with exactly one lemma substitution')
        require(a.get('source_reports') == 0 and a.get('consumer_reports') == 0
                and a.get('failure_phase') == 'COLD_ORIGINAL_LEAN_SOURCE'
                and a.get('accepted_predecessor_run') == 44109519633
                and str(a['run_id']) in (root/a['receipt']).read_text(),
                'W0B1 STOP incorrectly qualified source or independent consumer')
        nxt=s['next_planned']
        require(nxt.get('gate') == 'P3-M4-W0G0'
                and nxt.get('status') == 'PROSPECTIVE_NOT_STAGED'
                and nxt.get('source_staged') is False
                and nxt.get('consumer_staged') is False
                and nxt.get('workflow_staged') is False
                and (root/'research/quantum-information/BFSS_QIT_SCC_W0G0_SCALAR_ACTION_ADAPTER_FORWARD_2026_11_17.md').is_file(),
                'W0G0 generic scalar action research must remain prospective after stop')

    if a['gate'] == 'P3-M4-W0B1' and a['status'] == 'PENDING_STRICT_CI':
        import zipfile
        require(a.get('attempt') == 'R2'
                and a.get('qualification') is False
                and a.get('accepted_predecessor_run') == 44109519633
                and a.get('source_blob') == '93244f15ae511cd4abbac13e216eed6b1988c009'
                and a.get('consumer_blob') == '9ea114c7f8a8c26b814b3abe9fd5c6a1e853e53a'
                and a.get('workflow_blob') == '1f43a7d9ac86d42457020730a53d59eb5db48f41'
                and a.get('contract_commit') == '663641a1acd078eb3cc9a71e58ff56c74b389566'
                and a.get('expected_source_reports') == 1
                and a.get('expected_consumer_reports') == 1
                and a.get('independent_controls') == 2
                and a.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound']
                and s['last_qualified']['gate'] == 'P3-M4-W0B0'
                and s['last_qualified']['run_id'] == 44109519633
                and s['last_qualified']['status'] == 'GREEN_QUALIFIED'
                and s['accepted_anchors'][-1] == s['last_qualified'],
                'W0B1 original Clifford algebra induction active source or qualified W0B0 drift')
        donor=s['last_qualified']
        require(donor.get('source_blob') == 'c67f30bb76a9990e508a8a050a8c3313e694bda7'
                and donor.get('consumer_blob') == '159c561d6e73e3c86959cd239deb10984064e92e'
                and donor.get('evidence_archive_blob') == 'abbebbf9e7d2eeefeeef901a415030e09551c2d6'
                and donor.get('evidence_job_log_blob') == 'd2b6066d6911de727f69a671218c1e87e7ed60d0'
                and blob(root/donor['evidence_archive']) == donor['evidence_archive_blob']
                and blob(root/donor['evidence_job_log']) == donor['evidence_job_log_blob'],
                'W0B1 cannot import a not-fully-accepted original W0B0 donor')
        red=s.get('previous_active_W0B0_R1_RED',{})
        require(red.get('status') == 'RED_UNQUALIFIED'
                and red.get('run_id') == 44064728599
                and red.get('evidence_archive_blob') == '7a74c38049c3cff6e0bdd1c6e7d2ea72c75deb07'
                and red.get('evidence_job_log_blob') == '9b450ff0e633f7fb3c908805754c7d95fb992808'
                and blob(root/red['evidence_archive']) == red['evidence_archive_blob']
                and blob(root/red['evidence_job_log']) == red['evidence_job_log_blob'],
                'W0B1 must preserve failed R1 original real-scalar typeclass evidence')
        stopped=s.get('previous_active_W0A4_R2_stopped',{})
        require(stopped.get('status') == 'RED_UNQUALIFIED'
                and stopped.get('stopped') is True
                and stopped.get('run_id') == 44059417729
                and stopped.get('stop_reason') ==
                   'TWO_CONSECUTIVE_ORIGINAL_COMPLEX_LINEAR_MAP_CONSTRUCTION_REDS'
                and stopped.get('evidence_archive_blob') == 'c1d7f4436e22dd5698058ea3b5557d131823de9d'
                and blob(root/stopped['evidence_archive']) == stopped['evidence_archive_blob'],
                'W0B1 must retain stopped original complex-linear lift failures')
        r1=s.get('previous_active_W0B1_R1_RED',{})
        require(a.get('previous_red_run') == 44117272657
                and r1.get('run_id') == 44117272657
                and r1.get('status') == 'RED_UNQUALIFIED'
                and r1.get('qualification') is False
                and r1.get('source_blob') == '6c9cae683665fb6cda2a6e8ff10d388f6a268a05'
                and r1.get('consumer_blob') == '9ea114c7f8a8c26b814b3abe9fd5c6a1e853e53a'
                and r1.get('workflow_blob') == '6565dd372ccb5ba6f553242b3180de8de1ac7e21'
                and r1.get('evidence_archive_blob') == 'a448d2ae775926ee05ab4a9028e29e8061fecdac'
                and r1.get('evidence_job_log_blob') == '7e8310126b2e5af543ec1f7274ce5467dbc59552'
                and r1.get('evidence_manifest_blob') == 'a78963305bb75e7ab154f8c40a0c8d5ab7299f29'
                and blob(root/r1['evidence_archive']) == r1['evidence_archive_blob']
                and blob(root/r1['evidence_job_log']) == r1['evidence_job_log_blob']
                and blob(root/r1['evidence_manifest']) == r1['evidence_manifest_blob'],
                'W0B1 R1 original source RED evidence must remain Git-pinned')
        import zipfile
        with zipfile.ZipFile(root/r1['evidence_archive']) as z:
            require(z.testzip() is None
                    and set(z.namelist()) == {'cold-source.log','preflight.log','tested-commit.txt'}
                    and 'Unknown identifier `map_algebraMap`' in z.read('cold-source.log').decode(),
                    'W0B1 R1 original source failure evidence invalid')
        source=(root/a['source']).read_text()
        raw=source.replace('AlgEquiv.commutes','map_algebraMap')
        require(source.count('AlgEquiv.commutes') == 1
                and hashlib.sha1(b'blob '+str(len(raw.encode())).encode()+b'\x00'+raw.encode()).hexdigest()
                    == '6c9cae683665fb6cda2a6e8ff10d388f6a268a05',
                'W0B1 R2 must only substitute scalar lemma')
        consumer=(root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\s+',source))==1
                and len(re.findall(r'(?m)^theorem\s+',consumer))==1
                and len(re.findall(r'(?m)^example\b',consumer))==2
                and 'CliffordAlgebra.induction' in source
                and 'originalComplexEquiv_generator_commutes' in source
                and 'Algebra.commutes' in source
                and 'AlgEquiv.commutes' in source
                and 'map_algebraMap' not in source
                and 'map_mul' in source and 'map_add' in source
                and 'activeGammaComplexLinear' not in source
                and 'OriginalFullComplexGammaTransport' not in source
                and 'originalSource48BivectorK' not in source,
                'W0B1 must prove complete Clifford image using already accepted W0B0 generator commutation')
        nxt=s.get('next_planned',{})
        require(nxt.get('gate') == 'P3-M4-W0B2'
                and nxt.get('status') == 'PROSPECTIVE_NOT_STAGED'
                and nxt.get('source_staged') is False
                and nxt.get('consumer_staged') is False
                and nxt.get('workflow_staged') is False,
                'W0B2 Schur adapter must remain prospective before W0B1 acceptance')
    if a['gate'] == 'P3-M4-W0G0' and a['status'] == 'PENDING_STRICT_CI':
        import zipfile
        require(a.get('attempt') == 'R1'
                and a.get('qualification') is False
                and a.get('accepted_predecessor_run') == 44109519633
                and a.get('source_blob') == 'ff4f7f2a123e5b554ef08f09bffbcd9eec0c1a32'
                and a.get('consumer_blob') == 'b1e2d8077f798c4b9526ddb61b9a50b58c093474'
                and a.get('workflow_blob') == 'dee2c3f91077e4fcf89b370745fffecd68f963c0'
                and a.get('contract_commit') == '41411b859527fa3501aa857c1106e336b04adca7'
                and a.get('expected_source_reports') == 2
                and a.get('expected_consumer_reports') == 2
                and a.get('independent_controls') == 2
                and a.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound']
                and s['last_qualified']['gate'] == 'P3-M4-W0B0'
                and s['last_qualified']['run_id'] == 44109519633
                and s['last_qualified']['status'] == 'GREEN_QUALIFIED'
                and s['accepted_anchors'][-1] == s['last_qualified'],
                'W0G0 generic scalar interface cannot drift from qualified W0B0')
        old=s.get('previous_active_W0B1_R2_stopped',{})
        r1=s.get('previous_active_W0B1_R1_RED',{})
        require(old.get('gate') == 'P3-M4-W0B1'
                and old.get('attempt') == 'R2'
                and old.get('run_id') == 44127193329
                and old.get('status') == 'RED_UNQUALIFIED'
                and old.get('stopped') is True
                and old.get('stop_reason') == 'TWO_ANALOGOUS_ORIGINAL_SCALAR_INDUCTION_SOURCE_REDS_STOP'
                and old.get('source_blob') == '93244f15ae511cd4abbac13e216eed6b1988c009'
                and old.get('consumer_blob') == '9ea114c7f8a8c26b814b3abe9fd5c6a1e853e53a'
                and r1.get('run_id') == 44117272657
                and r1.get('status') == 'RED_UNQUALIFIED'
                and r1.get('source_blob') == '6c9cae683665fb6cda2a6e8ff10d388f6a268a05',
                'W0G0 cannot erase two stopped W0B1 source REDs')
        for red in (r1,old):
            require(blob(root/red['evidence_archive']) == red['evidence_archive_blob']
                    and blob(root/red['evidence_job_log']) == red['evidence_job_log_blob']
                    and blob(root/red['evidence_manifest']) == red['evidence_manifest_blob'],
                    'W0G0 predecessor native RED evidence drift')
            with zipfile.ZipFile(root/red['evidence_archive']) as z:
                require(z.testzip() is None
                        and set(z.namelist()) == {'cold-source.log','preflight.log','tested-commit.txt'}
                        and z.read('tested-commit.txt').decode().strip() == red['tested_sha'],
                        'W0G0 predecessor source RED original ZIP invalid')
        harness=s.get('w0g0_preflight_r1',{})
        require(harness.get('run_id') == 44134589228
                and harness.get('status') == 'PREFLIGHT_ONLY_RED'
                and harness.get('failure_phase') == 'PREFLIGHT_BEFORE_LEAN'
                and harness.get('source_blob') == 'ff4f7f2a123e5b554ef08f09bffbcd9eec0c1a32'
                and harness.get('consumer_blob') == 'b1e2d8077f798c4b9526ddb61b9a50b58c093474'
                and harness.get('original_zip_blob') == '49bfe05f74a3afa2a167e45d4b178438c2c8390b'
                and harness.get('full_job_log_blob') == '7881bc0df7d4eeae68619a87fd0893a797e90456'
                and harness.get('manifest_blob') == '0d15093773a1e970776f171b6f9bee9b199b6b7a'
                and blob(root/harness['original_zip']) == harness['original_zip_blob']
                and blob(root/harness['full_job_log']) == harness['full_job_log_blob']
                and blob(root/harness['manifest']) == harness['manifest_blob'],
                'W0G0 R1 original harness-only RED must remain pinned')
        with zipfile.ZipFile(root/harness['original_zip']) as z:
            require(z.testzip() is None
                    and set(z.namelist()) == {'preflight.log','tested-commit.txt'}
                    and 'AssertionError' in z.read('preflight.log').decode()
                    and z.read('tested-commit.txt').decode().strip() == harness['tested_sha'],
                    'W0G0 harness-only original provider ZIP invalid')
        source=(root/a['source']).read_text()
        consumer=(root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\s+',source))==2
                and len(re.findall(r'(?m)^theorem\s+',consumer))==2
                and len(re.findall(r'(?m)^example\b',consumer))==2
                and 'Algebra.commute_algebraMap_right' in source
                and 'AlgEquiv.commutes' in source
                and 'CliffordAlgebra.induction' not in source
                and 'originalComplexCliffordFockAlgEquiv' not in source
                and not re.search(r'(?m)^import .*BFSS',source)
                and consumer.startswith('import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0G0GenericScalarActionAdapter\n'),
                'W0G0 generic source/consumer proof boundary changed')
        nxt=s.get('next_planned',{})
        require(nxt.get('gate') == 'P3-M4-W0H0'
                and nxt.get('status') == 'PROSPECTIVE_NOT_STAGED'
                and nxt.get('source_staged') is False
                and nxt.get('consumer_staged') is False
                and nxt.get('workflow_staged') is False,
                'W0H0 source-specific adapter cannot stage before generic strict qualification')
    if a['gate'] == 'P3-M4-W0G0' and a['status'] == 'GREEN_QUALIFIED':
        import zipfile
        require(a.get('attempt') == 'R1'
                and a.get('qualification') is True
                and a.get('verdict') == 'GREEN'
                and a.get('strict_outcome') == 'success'
                and a.get('run_id') == 44135729729
                and a.get('job_id') == 134224620570
                and a.get('tested_sha') == '0f5324182bfd3200b5eb7198cabdb0723fea842b'
                and a.get('artifact_id') == 14351389019
                and a.get('artifact_sha256') == '4624751eec2ac6e549e9bf0faeb4a33963ad78eab7bfe383e2dc7302cc3561f4'
                and a.get('source_blob') == 'ff4f7f2a123e5b554ef08f09bffbcd9eec0c1a32'
                and a.get('consumer_blob') == 'b1e2d8077f798c4b9526ddb61b9a50b58c093474'
                and a.get('workflow_blob') == 'dee2c3f91077e4fcf89b370745fffecd68f963c0'
                and a.get('evidence_archive_blob') == 'ed7e477d931b0822ffb5dfd87f1bee5c9f4163ac'
                and a.get('evidence_job_log_blob') == '71cbbb0b37e35eb6cf556d699bc64e56beb9af74'
                and a.get('evidence_manifest_blob') == '973d8bb06c529449306dde077678e9d6875fc878'
                and a.get('preservation_run') == 44137767800
                and a.get('source_reports') == a.get('consumer_reports') == 2
                and a.get('expected_source_reports') == a.get('expected_consumer_reports') == 2
                and a.get('independent_controls') == 2
                and a.get('auditor_negative_tests') == 6
                and a.get('cold_build_jobs') == 1042
                and a.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound']
                and a.get('strict_marker') ==
                    'BFSS_W0G0_2_GENERIC_SOURCE_2_CONSUMER_2_CONTROLS_SIX_MUTANTS_STRICT_GREEN'
                and s['last_qualified'] == a and s['accepted_anchors'][-1] == a,
                'W0G0 generic algebra scalar bridge acceptance or provider anchor drift')
        original_donor = next((x for x in s['accepted_anchors'] if x.get('gate') == 'P3-M4-W0B0'),{})
        source_exact = s.get('last_qualified_source_exact_original_BFSS',{})
        require(original_donor.get('run_id') == 44109519633
                and original_donor.get('source_blob') == 'c67f30bb76a9990e508a8a050a8c3313e694bda7'
                and original_donor.get('evidence_archive_blob') == 'abbebbf9e7d2eeefeeef901a415030e09551c2d6'
                and source_exact.get('gate') == 'P3-M4-W0B0'
                and source_exact.get('run_id') == 44109519633
                and source_exact.get('qualification') is True
                and source_exact.get('evidence_archive_blob') == original_donor['evidence_archive_blob'],
                'generic W0G0 cannot masquerade as last original BFSS source qualification')
        m = json.loads((root/a['evidence_manifest']).read_text())
        require(m.get('gate') == 'P3-M4-W0G0'
                and m.get('attempt') == 'R1'
                and m.get('status') == 'GREEN_STRICT_PROVIDER_ORIGINAL_UNPROMOTED'
                and m.get('run_id') == a['run_id']
                and m.get('job_id') == a['job_id']
                and m.get('tested_sha') == a['tested_sha']
                and m.get('source_blob') == a['source_blob']
                and m.get('consumer_blob') == a['consumer_blob']
                and m.get('workflow_blob') == a['workflow_blob']
                and m.get('artifact_id') == a['artifact_id']
                and m.get('original_zip',{}).get('size') == 2047
                and m['original_zip']['sha256'] == a['artifact_sha256']
                and m.get('cold_build_jobs') == 1042
                and m.get('negative_mutants') == 6
                and m.get('independent_controls') == 2
                and m.get('source_reports') == m.get('consumer_reports') == 2
                and m.get('predecessor_qualified_run') == 44109519633
                and m.get('stopped_original_source_red_runs') == [44117272657,44127193329]
                and m.get('harness_only_red_run') == 44134589228
                and m.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound'],
                'W0G0 original provider manifest metadata missing or mismatched')
        require(blob(root/a['evidence_archive']) == a['evidence_archive_blob']
                and blob(root/a['evidence_job_log']) == a['evidence_job_log_blob']
                and blob(root/a['evidence_manifest']) == a['evidence_manifest_blob']
                and hashlib.sha256((root/a['evidence_archive']).read_bytes()).hexdigest()
                    == a['artifact_sha256']
                and hashlib.sha256((root/a['evidence_job_log']).read_bytes()).hexdigest()
                    == m['original_job_log']['sha256'],
                'W0G0 provider-original six-member ZIP or complete original job log drift')
        names = {'auditor.log','cold-source.log','consumer.log',
                 'preflight.log','source-axioms.log','tested-commit.txt'}
        allowed = {'propext','Classical.choice','Quot.sound'}
        pat = re.compile(r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)")
        def audit(text, required):
            require('error:' not in text and 'sorryAx' not in text,
                    'W0G0 source or consumer has error or sorryAx')
            found=pat.findall(text)
            require(len(found) == len(required)
                    and [n.rsplit('.',1)[-1] for n,_ in found] == required
                    and all({t.strip() for t in axioms.split(',') if t.strip()} <= allowed
                            for _,axioms in found),
                    'W0G0 source or independent consumer axiom roots unqualified')
        with zipfile.ZipFile(root/a['evidence_archive']) as z:
            require(z.testzip() is None and set(z.namelist()) == names,
                    'W0G0 original six-member provider ZIP corrupt')
            for member in m['original_zip']['members']:
                raw=z.read(member['name'])
                require(len(raw) == member['size']
                        and hashlib.sha256(raw).hexdigest() == member['sha256'],
                        'W0G0 provider original member digest mismatch: '+member['name'])
            require(z.read('tested-commit.txt').decode().strip() == a['tested_sha']
                    and 'BFSS_W0G0_W0B0_GREEN_W0B1_R1_R2_STOP_ORIGINAL_EVIDENCE_PREFLIGHT_PASS'
                        in z.read('preflight.log').decode()
                    and 'Build completed successfully (1042 jobs).' in z.read('cold-source.log').decode()
                    and 'error:' not in z.read('cold-source.log').decode()
                    and 'sorryAx' not in z.read('cold-source.log').decode()
                    and a['strict_marker'] in z.read('auditor.log').decode(),
                    'W0G0 original tested commit, cold source, preflight or auditor invalid')
            audit(z.read('source-axioms.log').decode(),
                  ['generic_scalarImage_commutes','generic_algEquiv_scalarImage_commutes'])
            audit(z.read('consumer.log').decode(),
                  ['generic_scalarImage_commutes_consumer','generic_algEquiv_scalarImage_commutes_consumer'])
        job=(root/a['evidence_job_log']).read_text()
        require('Build completed successfully (1042 jobs).' in job
                and a['strict_marker'] in job
                and 'BFSS_W0G0_W0B0_GREEN_W0B1_R1_R2_STOP_ORIGINAL_EVIDENCE_PREFLIGHT_PASS' in job,
                'W0G0 provider-original full GREEN job log incomplete')
        source=(root/a['source']).read_text()
        consumer=(root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\s+',source)) == 2
                and len(re.findall(r'(?m)^theorem\s+',consumer)) == 2
                and len(re.findall(r'(?m)^example\b',consumer)) == 2
                and 'Algebra.commute_algebraMap_right' in source
                and 'AlgEquiv.commutes' in source
                and 'CliffordAlgebra.induction' not in source
                and 'originalComplexCliffordFockAlgEquiv' not in source
                and not re.search(r'(?m)^import .*BFSS',source)
                and consumer.startswith('import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0G0GenericScalarActionAdapter\n'),
                'W0G0 generic mathematical proof boundary changed after qualification')
        red1=s.get('previous_active_W0B1_R1_RED',{})
        red2=s.get('previous_active_W0B1_R2_stopped',{})
        harness=s.get('w0g0_preflight_r1',{})
        require(red1.get('run_id') == 44117272657
                and red1.get('status') == 'RED_UNQUALIFIED'
                and red2.get('run_id') == 44127193329
                and red2.get('stopped') is True
                and red2.get('stop_reason') == 'TWO_ANALOGOUS_ORIGINAL_SCALAR_INDUCTION_SOURCE_REDS_STOP'
                and harness.get('run_id') == 44134589228
                and harness.get('status') == 'PREFLIGHT_ONLY_RED',
                'W0G0 cannot erase frozen native W0B1 REDs or generic harness RED')
        for red in (red1,red2):
            require(blob(root/red['evidence_archive']) == red['evidence_archive_blob']
                    and blob(root/red['evidence_job_log']) == red['evidence_job_log_blob']
                    and blob(root/red['evidence_manifest']) == red['evidence_manifest_blob'],
                    'W0G0 acceptance cannot modify native W0B1 failure archives')
        require(blob(root/harness['original_zip']) == harness['original_zip_blob']
                and blob(root/harness['full_job_log']) == harness['full_job_log_blob']
                and blob(root/harness['manifest']) == harness['manifest_blob'],
                'W0G0 acceptance cannot erase original harness-only preflight RED')
        nxt=s.get('next_planned',{})
        require(nxt.get('gate') == 'P3-M4-W0H0'
                and nxt.get('status') == 'PROSPECTIVE_NOT_STAGED'
                and nxt.get('source_staged') is False
                and nxt.get('consumer_staged') is False
                and nxt.get('workflow_staged') is False,
                'source-exact W0H0 must remain prospective after generic W0G0 acceptance')

    if a['gate'] == 'P3-M4-W0H0' and a['status'] == 'PENDING_STRICT_CI':
        import zipfile
        require(a.get('attempt') == 'R1'
                and a.get('qualification') is False
                and a.get('accepted_predecessor_run') == 44135729729
                and a.get('source_blob') == '7555f5e17d9f465c1e4b7b04ffc450eb1667fc13'
                and a.get('consumer_blob') == '21c02789f62e5e345eff7caf4e10505f6cbe4961'
                and a.get('workflow_blob') == '66ca52d2884c2c6dd25885fc1ccaaf5c8f36d135'
                and a.get('contract_commit') == '22d27cfd0bc281e50cf5b0fc036595e1d312a72f'
                and a.get('expected_source_reports') == a.get('expected_consumer_reports') == 1
                and a.get('independent_controls') == 2
                and a.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound']
                and s['last_qualified']['gate'] == 'P3-M4-W0G0'
                and s['last_qualified']['run_id'] == 44135729729
                and s['last_qualified']['status'] == 'GREEN_QUALIFIED'
                and s['accepted_anchors'][-1] == s['last_qualified'],
                'W0H0 original scalar specialization must use accepted W0G0 exact generic donor')
        generic=s['last_qualified']
        orig=next((x for x in s['accepted_anchors'] if x.get('gate') == 'P3-M4-W0B0'),{})
        last_original=s.get('last_qualified_source_exact_original_BFSS',{})
        require(generic.get('source_blob') == 'ff4f7f2a123e5b554ef08f09bffbcd9eec0c1a32'
                and generic.get('consumer_blob') == 'b1e2d8077f798c4b9526ddb61b9a50b58c093474'
                and generic.get('evidence_archive_blob') == 'ed7e477d931b0822ffb5dfd87f1bee5c9f4163ac'
                and generic.get('evidence_job_log_blob') == '71cbbb0b37e35eb6cf556d699bc64e56beb9af74'
                and generic.get('evidence_manifest_blob') == '973d8bb06c529449306dde077678e9d6875fc878'
                and orig.get('run_id') == 44109519633
                and orig.get('evidence_archive_blob') == 'abbebbf9e7d2eeefeeef901a415030e09551c2d6'
                and last_original.get('gate') == 'P3-M4-W0B0'
                and last_original.get('run_id') == 44109519633,
                'W0H0 generic and original BFSS qualified donor drift')
        require(blob(root/generic['evidence_archive']) == generic['evidence_archive_blob']
                and blob(root/generic['evidence_job_log']) == generic['evidence_job_log_blob']
                and blob(root/generic['evidence_manifest']) == generic['evidence_manifest_blob']
                and hashlib.sha256((root/generic['evidence_archive']).read_bytes()).hexdigest()
                    == '4624751eec2ac6e549e9bf0faeb4a33963ad78eab7bfe383e2dc7302cc3561f4',
                'W0H0 cannot use uncertified generic scalar donor')
        with zipfile.ZipFile(root/generic['evidence_archive']) as z:
            require(z.testzip() is None
                    and set(z.namelist()) == {'auditor.log','cold-source.log','consumer.log',
                         'preflight.log','source-axioms.log','tested-commit.txt'}
                    and 'Build completed successfully (1042 jobs).' in z.read('cold-source.log').decode()
                    and 'BFSS_W0G0_2_GENERIC_SOURCE_2_CONSUMER_2_CONTROLS_SIX_MUTANTS_STRICT_GREEN'
                        in z.read('auditor.log').decode(),
                    'W0H0 original scalar source cannot consume unqualified generic proof')
        r1=s.get('previous_active_W0B1_R1_RED',{})
        r2=s.get('previous_active_W0B1_R2_stopped',{})
        require(r1.get('run_id') == 44117272657 and r1.get('status') == 'RED_UNQUALIFIED'
                and r2.get('run_id') == 44127193329 and r2.get('stopped') is True
                and r2.get('stop_reason') == 'TWO_ANALOGOUS_ORIGINAL_SCALAR_INDUCTION_SOURCE_REDS_STOP',
                'W0H0 cannot reopen stopped W0B1 original induction')
        for red in (r1,r2):
            require(blob(root/red['evidence_archive']) == red['evidence_archive_blob']
                    and blob(root/red['evidence_job_log']) == red['evidence_job_log_blob']
                    and blob(root/red['evidence_manifest']) == red['evidence_manifest_blob'],
                    'W0H0 must preserve original W0B1 native source RED evidence')
        original_eq='lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3IOriginalComplexCliffordFockAlgebraEquivProbe.lean'
        require(blob(root/original_eq) == '754a5f2a13baea90312f6031eb8fa7963dbdf42b',
                'W0H0 must specialize unchanged original M3I equivalence')
        source=(root/a['source']).read_text()
        consumer=(root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\s+',source)) == 1
                and len(re.findall(r'(?m)^theorem\s+',consumer)) == 1
                and len(re.findall(r'(?m)^example\b',consumer)) == 2
                and 'generic_algEquiv_scalarImage_commutes' in source
                and 'originalComplexCliffordFockAlgEquiv' in source
                and 'CliffordAlgebra.induction' not in source
                and 'P3M4W0B1OriginalFullCliffordCommutantInduction' not in source
                and 'sourceNormalizedGamma' not in source
                and 'activeGammaComplexLinear' not in source
                and 'maxHeartbeats' not in source and 'maxRecDepth' not in source
                and consumer.startswith('import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0H0OriginalScalarImageAdapter\n'),
                'W0H0 single source-exact scalar bridge altered')
        nxt=s.get('next_planned',{})
        require(nxt.get('gate') == 'P3-M4-W0H1'
                and nxt.get('status') == 'PROSPECTIVE_NOT_STAGED'
                and nxt.get('source_staged') is False
                and nxt.get('consumer_staged') is False
                and nxt.get('workflow_staged') is False,
                'W0H1 full Clifford-image commutant must remain prospective after W0H0 stage')
    if a['gate'] == 'P3-M4-W0H0' and a['status'] == 'GREEN_QUALIFIED':
        import zipfile
        require(a.get('attempt') == 'R1' and a.get('qualification') is True
                and a.get('verdict') == 'GREEN' and a.get('strict_outcome') == 'success'
                and a.get('run_id') == 44139239821
                and a.get('job_id') == 134237141336
                and a.get('tested_sha') == '8760e7ecb1ac5bd0f8c3eb480d752b3c14716819'
                and a.get('artifact_id') == 14354113791
                and a.get('artifact_sha256') == 'ccb4dea2e4114914c7554a6f6bbb76591de3f4c52be30d0d1bb1a9f4a3c52caa'
                and a.get('source_blob') == '7555f5e17d9f465c1e4b7b04ffc450eb1667fc13'
                and a.get('consumer_blob') == '21c02789f62e5e345eff7caf4e10505f6cbe4961'
                and a.get('workflow_blob') == '66ca52d2884c2c6dd25885fc1ccaaf5c8f36d135'
                and a.get('evidence_archive_blob') == 'ffbd66e56aff83031aece2c3b310ed34678bdd9f'
                and a.get('evidence_job_log_blob') == '8861ab57e0e12df0d5143a014434fa3ecf5503de'
                and a.get('evidence_manifest_blob') == 'e6fe871ebefc67b3c2cde2b5a44345d781ef79a3'
                and a.get('preservation_run') == 44142635149
                and a.get('source_reports') == a.get('consumer_reports') == 1
                and a.get('expected_source_reports') == a.get('expected_consumer_reports') == 1
                and a.get('independent_controls') == 2
                and a.get('auditor_negative_tests') == 6
                and a.get('cold_build_jobs') == 9117
                and a.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound']
                and a.get('strict_marker') == 'BFSS_W0H0_ORIGINAL_SCALAR_1_SOURCE_1_CONSUMER_2_CONTROLS_SIX_MUTANTS_STRICT_GREEN'
                and s['last_qualified'] == a and s['accepted_anchors'][-1] == a,
                'W0H0 original source-exact scalar adapter acceptance drift')
        donor = next((x for x in s['accepted_anchors'] if x.get('gate') == 'P3-M4-W0G0'),{})
        orig = next((x for x in s['accepted_anchors'] if x.get('gate') == 'P3-M4-W0B0'),{})
        last = s.get('last_qualified_source_exact_original_BFSS',{})
        require(donor.get('run_id') == 44135729729
                and donor.get('evidence_archive_blob') == 'ed7e477d931b0822ffb5dfd87f1bee5c9f4163ac'
                and donor.get('source_blob') == 'ff4f7f2a123e5b554ef08f09bffbcd9eec0c1a32'
                and orig.get('run_id') == 44109519633
                and orig.get('evidence_archive_blob') == 'abbebbf9e7d2eeefeeef901a415030e09551c2d6'
                and last.get('gate') == 'P3-M4-W0H0'
                and last.get('run_id') == a['run_id']
                and last.get('qualification') is True
                and last.get('evidence_archive_blob') == a['evidence_archive_blob'],
                'W0H0 must preserve accepted generic W0G0 and original W0B0 donor')
        m=json.loads((root/a['evidence_manifest']).read_text())
        require(m.get('gate') == 'P3-M4-W0H0'
                and m.get('attempt') == 'R1'
                and m.get('status') == 'GREEN_STRICT_PROVIDER_ORIGINAL_UNPROMOTED'
                and m.get('run_id') == a['run_id'] and m.get('job_id') == a['job_id']
                and m.get('tested_sha') == a['tested_sha']
                and m.get('source_blob') == a['source_blob']
                and m.get('consumer_blob') == a['consumer_blob']
                and m.get('workflow_blob') == a['workflow_blob']
                and m.get('artifact_id') == a['artifact_id']
                and m.get('original_zip',{}).get('size') == 13262
                and m['original_zip']['sha256'] == a['artifact_sha256']
                and m.get('cold_build_jobs') == 9117
                and m.get('source_reports') == m.get('consumer_reports') == 1
                and m.get('negative_mutants') == 6
                and m.get('independent_controls') == 2
                and m.get('predecessor_qualified_run') == 44135729729
                and m.get('last_qualified_original_bfss_before_run') == 44109519633
                and m.get('stopped_original_source_red_runs') == [44117272657,44127193329]
                and m.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound'],
                'W0H0 original provider manifest provenance mismatch')
        require(blob(root/a['evidence_archive']) == a['evidence_archive_blob']
                and blob(root/a['evidence_job_log']) == a['evidence_job_log_blob']
                and blob(root/a['evidence_manifest']) == a['evidence_manifest_blob']
                and hashlib.sha256((root/a['evidence_archive']).read_bytes()).hexdigest() == a['artifact_sha256']
                and hashlib.sha256((root/a['evidence_job_log']).read_bytes()).hexdigest()
                    == m['original_job_log']['sha256'],
                'W0H0 original source GREEN ZIP/full job log digest or Git blob mismatch')
        names={'auditor.log','cold-source.log','consumer.log',
               'preflight.log','source-axioms.log','tested-commit.txt'}
        pat=re.compile(r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)")
        allowed={'propext','Classical.choice','Quot.sound'}
        with zipfile.ZipFile(root/a['evidence_archive']) as z:
            require(z.testzip() is None and set(z.namelist()) == names
                    and len(m['original_zip']['members']) == 6,
                    'W0H0 six-member provider-original ZIP CRC or member list mismatch')
            for item in m['original_zip']['members']:
                raw=z.read(item['name'])
                require(len(raw) == item['size']
                        and hashlib.sha256(raw).hexdigest() == item['sha256'],
                        'W0H0 original ZIP member digest mismatch: '+item['name'])
            require(z.read('tested-commit.txt').decode().strip() == a['tested_sha']
                    and 'BFSS_W0H0_W0G0_GENERIC_GREEN_W0B0_ORIGINAL_GREEN_W0B1_STOP_PREFLIGHT_PASS'
                        in z.read('preflight.log').decode()
                    and 'Build completed successfully (9117 jobs).' in z.read('cold-source.log').decode()
                    and a['strict_marker'] in z.read('auditor.log').decode(),
                    'W0H0 source exact original preflight/cold build/negative audit missing')
            for filename,required in [
                ('source-axioms.log',['originalComplexEquiv_scalarImage_commutes']),
                ('consumer.log',['originalComplexEquiv_scalarImage_commutes_consumer'])
            ]:
                report=z.read(filename).decode()
                roots=pat.findall(report)
                require('error:' not in report and 'sorryAx' not in report
                        and len(roots) == 1
                        and [name.rsplit('.',1)[-1] for name,_ in roots] == required
                        and all({x.strip() for x in axioms.split(',') if x.strip()} <= allowed
                                for _,axioms in roots),
                        'W0H0 original source/consumer axiom boundary failed: '+filename)
        full=(root/a['evidence_job_log']).read_text()
        require('Build completed successfully (9117 jobs).' in full
                and a['strict_marker'] in full
                and 'BFSS_W0H0_W0G0_GENERIC_GREEN_W0B0_ORIGINAL_GREEN_W0B1_STOP_PREFLIGHT_PASS' in full,
                'W0H0 original complete strict job provenance missing')
        source=(root/a['source']).read_text()
        consumer=(root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\s+',source)) == 1
                and len(re.findall(r'(?m)^theorem\s+',consumer)) == 1
                and len(re.findall(r'(?m)^example\b',consumer)) == 2
                and 'generic_algEquiv_scalarImage_commutes' in source
                and 'originalComplexCliffordFockAlgEquiv' in source
                and 'CliffordAlgebra.induction' not in source
                and 'P3M4W0B1OriginalFullCliffordCommutantInduction' not in source,
                'W0H0 source-exact proof may not revive stopped W0B1 induction')
        red1=s.get('previous_active_W0B1_R1_RED',{})
        red2=s.get('previous_active_W0B1_R2_stopped',{})
        require(red1.get('run_id') == 44117272657
                and red2.get('run_id') == 44127193329
                and red2.get('stopped') is True
                and red2.get('stop_reason') == 'TWO_ANALOGOUS_ORIGINAL_SCALAR_INDUCTION_SOURCE_REDS_STOP',
                'W0H0 acceptance must retain both original W0B1 source REDs')
        for red in (red1,red2):
            require(blob(root/red['evidence_archive']) == red['evidence_archive_blob']
                    and blob(root/red['evidence_job_log']) == red['evidence_job_log_blob']
                    and blob(root/red['evidence_manifest']) == red['evidence_manifest_blob'],
                    'W0H0 acceptance must retain provider-original stopped W0B1 RED archives')
        nxt=s.get('next_planned',{})
        require(nxt.get('gate') == 'P3-M4-W0H1'
                and nxt.get('status') == 'PROSPECTIVE_NOT_STAGED'
                and nxt.get('source_staged') is False
                and nxt.get('consumer_staged') is False
                and nxt.get('workflow_staged') is False,
                'W0H1 new centralizer/adjoin route must stay prospective after W0H0 acceptance')

    if a['gate'] == 'P3-M4-W0H1A' and a['status'] == 'PENDING_STRICT_CI' and a.get('attempt') == 'R1':
        import zipfile
        require(a.get('attempt') == 'R1' and a.get('qualification') is False
                and a.get('accepted_predecessor_run') == 44139239821
                and a.get('source_blob') == 'a4c6a2d8006cdd151b72995bb35313c5f2299d57'
                and a.get('consumer_blob') == '8e0e457e2d781737f09ef7b7e48a9a142d51a4e0'
                and a.get('workflow_blob') == '95fdaea744514d567bdf4da471adb4c15c5650a0'
                and a.get('contract_commit') == '2cbdc3b895df680476fc8e5b7748ff05220e4100'
                and a.get('expected_source_reports') == a.get('expected_consumer_reports') == 1
                and a.get('independent_controls') == 2
                and a.get('allowed_axioms') == ['propext','Classical.choice','Quot.sound']
                and s['last_qualified']['gate'] == 'P3-M4-W0H0'
                and s['last_qualified']['run_id'] == 44139239821
                and s['last_qualified']['status'] == 'GREEN_QUALIFIED'
                and s['last_qualified'] == s['accepted_anchors'][-1],
                'W0H1A source pullback membership cannot drift from W0H0 strict original donor')
        donor=s['last_qualified']
        w0b0=next((x for x in s['accepted_anchors'] if x.get('gate') == 'P3-M4-W0B0'),{})
        original=s.get('last_qualified_source_exact_original_BFSS',{})
        require(donor.get('source_blob') == '7555f5e17d9f465c1e4b7b04ffc450eb1667fc13'
                and donor.get('evidence_archive_blob') == 'ffbd66e56aff83031aece2c3b310ed34678bdd9f'
                and donor.get('evidence_job_log_blob') == '8861ab57e0e12df0d5143a014434fa3ecf5503de'
                and donor.get('evidence_manifest_blob') == 'e6fe871ebefc67b3c2cde2b5a44345d781ef79a3'
                and w0b0.get('run_id') == 44109519633
                and w0b0.get('source_blob') == 'c67f30bb76a9990e508a8a050a8c3313e694bda7'
                and original.get('gate') == 'P3-M4-W0H0'
                and original.get('run_id') == 44139239821,
                'W0H1A exact original W0H0 scalar or W0B0 Clifford generator donor drift')
        require(blob(root/donor['evidence_archive']) == donor['evidence_archive_blob']
                and blob(root/donor['evidence_job_log']) == donor['evidence_job_log_blob']
                and blob(root/donor['evidence_manifest']) == donor['evidence_manifest_blob']
                and hashlib.sha256((root/donor['evidence_archive']).read_bytes()).hexdigest()
                    == 'ccb4dea2e4114914c7554a6f6bbb76591de3f4c52be30d0d1bb1a9f4a3c52caa',
                'W0H1A original scalar donor six-member provider archive drift')
        with zipfile.ZipFile(root/donor['evidence_archive']) as z:
            require(z.testzip() is None
                    and set(z.namelist()) ==
                      {'auditor.log','cold-source.log','consumer.log','preflight.log',
                       'source-axioms.log','tested-commit.txt'}
                    and z.read('tested-commit.txt').decode().strip() == donor['tested_sha']
                    and 'Build completed successfully (9117 jobs).' in z.read('cold-source.log').decode()
                    and donor['strict_marker'] in z.read('auditor.log').decode(),
                    'W0H1A previous strict original proof was not qualified')
        r1=s.get('previous_active_W0B1_R1_RED',{})
        r2=s.get('previous_active_W0B1_R2_stopped',{})
        require(r1.get('run_id') == 44117272657 and r1.get('status') == 'RED_UNQUALIFIED'
                and r2.get('run_id') == 44127193329 and r2.get('stopped') is True
                and r2.get('stop_reason') == 'TWO_ANALOGOUS_ORIGINAL_SCALAR_INDUCTION_SOURCE_REDS_STOP',
                'W0H1A cannot revive the stopped W0B1 original source')
        for red in (r1,r2):
            require(blob(root/red['evidence_archive']) == red['evidence_archive_blob']
                    and blob(root/red['evidence_job_log']) == red['evidence_job_log_blob']
                    and blob(root/red['evidence_manifest']) == red['evidence_manifest_blob'],
                    'W0H1A cannot erase provider-original W0B1 native RED')
            with zipfile.ZipFile(root/red['evidence_archive']) as z:
                require(z.testzip() is None
                        and z.read('tested-commit.txt').decode().strip() == red['tested_sha'],
                        'W0H1A W0B1 original ZIP invalid')
        eq='lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3IOriginalComplexCliffordFockAlgebraEquivProbe.lean'
        require(blob(root/eq) == '754a5f2a13baea90312f6031eb8fa7963dbdf42b',
                'W0H1A cannot change original M3I equivalence')
        source=(root/a['source']).read_text()
        consumer=(root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\s+',source)) == 1
                and len(re.findall(r'(?m)^theorem\s+',consumer)) == 1
                and len(re.findall(r'(?m)^example\b',consumer)) == 2
                and len(re.findall(r'(?m)^def originalSourceCentralizerPullback\b',source)) == 1
                and 'Subalgebra.comap' in source
                and 'Subalgebra.centralizer' in source
                and 'Subalgebra.mem_centralizer_iff' in source
                and 'originalComplexEquiv_generator_commutes' in source
                and 'CliffordAlgebra.induction' not in source
                and 'CliffordAlgebra.adjoin_range_ι' not in source
                and 'P3M4W0B1OriginalFullCliffordCommutantInduction' not in source
                and 'maxHeartbeats' not in source and 'maxRecDepth' not in source
                and consumer.startswith('import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0H1AOriginalGeneratorCentralizerComap\n'),
                'W0H1A original centralizer generator-only proof boundary drift')
        nxt=s.get('next_planned',{})
        require(nxt.get('gate') == 'P3-M4-W0H1B'
                and nxt.get('status') == 'PROSPECTIVE_NOT_STAGED'
                and nxt.get('source_staged') is False
                and nxt.get('consumer_staged') is False
                and nxt.get('workflow_staged') is False,
                'W0H1B full Clifford algebra-generation closure cannot stage before W0H1A qualified')
    if a['gate']=='P3-M4-W0H1A' and a['status']=='PENDING_STRICT_CI' and a['attempt']=='R2':
        import zipfile
        require(a.get('qualification') is False
            and a.get('accepted_predecessor_run')==44139239821
            and a.get('previous_red_run')==44145848122
            and a.get('source_blob')=='c5c0894d99a01e92e92a58dac7313698a2f69971'
            and a.get('consumer_blob')=='b6e91f79c46724f65f54835623b97d5f909dcf66'
            and a.get('workflow_blob')=='64ec1b82e3ee81243529dc4f883ab510e6e35a7f'
            and a.get('contract_commit')=='884a1897bdecdfa365abd7206ad7411a8dddef15'
            and a.get('expected_source_reports')==a.get('expected_consumer_reports')==1
            and a.get('independent_controls')==2
            and s['last_qualified']['gate']=='P3-M4-W0H0'
            and s['last_qualified']['run_id']==44139239821
            and s['last_qualified']==s['accepted_anchors'][-1],
            'W0H1A R2 native bounded source repair drift')
        h=s.get('w0h1a_r2_preflight_only',{})
        require(h.get('run_id')==44149941739
            and h.get('status')=='PREFLIGHT_ONLY_RED'
            and h.get('artifact_count')==0
            and h.get('source_attempted') is False
            and h.get('consumer_attempted') is False
            and h.get('preservation_run')==44150575833
            and h.get('original_workflow_blob')=='82313868f060241d6a9baf490275125b62a5b475'
            and h.get('source_blob')==a.get('source_blob')
            and h.get('consumer_blob')==a.get('consumer_blob')
            and h.get('original_log_blob')=='f8f7976d1072b2685c6f783c60558b1bc2b514bd'
            and h.get('original_metadata_blob')=='985b6d8aff1a54145c8a7d17aee0322208795c83'
            and h.get('manifest_blob')=='7a3e7c1265fd5b3bab5b2b77908aed9cc6fa03f2',
            'R2 preflight-only no-artifact RED evidence missing or misclassified')
        for kind in ('original_log','original_metadata','manifest'):
            require(blob(root/h[kind])==h[kind+'_blob'],
                    'R2 original harness-only job evidence drift: '+kind)
        m=json.loads((root/h['manifest']).read_text())
        require(m['run_id']==44149941739 and m['artifact_count']==0
            and m['source_attempted'] is False and m['consumer_attempted'] is False
            and m['original_job_log']['sha256']=='728e0f91056dee2487dfd90c5b242b469b7db172c1271305287858d997d275c9'
            and hashlib.sha256((root/h['original_log']).read_bytes()).hexdigest()==m['original_job_log']['sha256'],
            'R2 original no-artifact metadata or job log damaged')
        second=s.get('w0h1a_r2_second_preflight_only',{})
        require(second.get('run_id')==44151092723
            and second.get('status')=='PREFLIGHT_ONLY_RED'
            and second.get('source_attempted') is False
            and second.get('consumer_attempted') is False
            and second.get('artifact_id')==14358602623
            and second.get('artifact_sha256')=='1fa9401343636219ec23b166e490fada123d0394a7106259fbe235217fb674b6'
            and second.get('original_zip_blob')=='eb161bec2356866a90f9cc832f87bae86ffb5a03'
            and second.get('original_log_blob')=='afa76557952cf3c3f650c3596b2cde16bbc80060'
            and second.get('manifest_blob')=='8d8070b79fc6b307f198a32594abfdeaf65712bb'
            and second.get('preservation_run')==44151502381
            and second.get('source_blob')==a['source_blob']
            and second.get('consumer_blob')==a['consumer_blob'],
            'W0H1A R2 second setup-only RED evidence was erased or wrongly classified')
        for kind in ('original_zip','original_log','manifest'):
            require(blob(root/second[kind])==second[kind+'_blob'],
                    'W0H1A R2 second provider original archive drift')
        require(hashlib.sha256((root/second['original_zip']).read_bytes()).hexdigest()
                =='1fa9401343636219ec23b166e490fada123d0394a7106259fbe235217fb674b6',
                'W0H1A R2 second original 471-byte ZIP mismatch')
        with zipfile.ZipFile(root/second['original_zip']) as z:
            require(z.testzip() is None
                and set(z.namelist())=={'preflight.log','tested-commit.txt'}
                and z.read('tested-commit.txt').decode().strip()==second['tested_sha']
                and 'KeyError' in z.read('preflight.log').decode(),
                'W0H1A R2 second preflight-only ZIP evidence invalid')
        r1=s.get('previous_active_W0H1A_R1_RED',{})
        require(r1.get('status')=='RED_UNQUALIFIED'
            and r1.get('run_id')==44145848122
            and r1.get('source_blob')=='a4c6a2d8006cdd151b72995bb35313c5f2299d57'
            and r1.get('consumer_blob')=='8e0e457e2d781737f09ef7b7e48a9a142d51a4e0'
            and r1.get('workflow_blob')=='95fdaea744514d567bdf4da471adb4c15c5650a0'
            and r1.get('evidence_archive_blob')=='0240463e97836e347a5423999e6832dfcf81e2cf'
            and r1.get('evidence_job_log_blob')=='135b2d53ad7e64f4cc6c516c4c80fba002181a7b'
            and r1.get('evidence_manifest_blob')=='33b4c47ba4a0ebec35a408794ce1a96607cc16e2'
            and r1.get('preservation_run')==44148961842,
            'W0H1A original R1 RED evidence lost')
        for kind in ['source','consumer','workflow','evidence_archive','evidence_job_log','evidence_manifest']:
            require(blob(root/r1[kind]) == r1[kind+'_blob'],'R1 frozen byte drift: '+kind)
        require(hashlib.sha256((root/r1['evidence_archive']).read_bytes()).hexdigest()
            =='ef701824430dc78c70d4bd049e013a30a1a09df447e44e6b1a6dc5231fafcd43'
            and (root/r1['evidence_job_log']).stat().st_size==235899,
            'W0H1A R1 original provider ZIP/log corrupt')
        with zipfile.ZipFile(root/r1['evidence_archive']) as z:
            require(z.testzip() is None
                and set(z.namelist())=={'preflight.log','cold-source.log','tested-commit.txt'}
                and z.read('tested-commit.txt').decode().strip()==r1['tested_sha']
                and 'sorryAx' in z.read('cold-source.log').decode(),
                'W0H1A R1 original native source RED diagnostic missing')
        original=(root/r1['source']).read_text()
        repair=(root/a['source']).read_text()
        original=original.replace('P3M4W0H1AOriginalGeneratorCentralizerComap','P3M4W0H1AOriginalGeneratorCentralizerComapR2')
        original=original.replace(
            '  rw [Subalgebra.mem_comap, Subalgebra.mem_centralizer_iff]',
            '  change\n'
            '    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv\n'
            '      (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w) ∈\n'
            '        Subalgebra.centralizer ℂ ({T} : Set Op)\n'
            '  rw [Subalgebra.mem_centralizer_iff]')
        original=original.replace(
            'This is a NEW architecture; stopped W0B1 induction is never imported.',
            'This R2 is the bounded unfold repair of R1; stopped W0B1 induction is never imported.')
        require(repair==original,'R2 source changed more than exact bounded unfold repair')
        originalConsumer=(root/r1['consumer']).read_text()
        originalConsumer=originalConsumer.replace('P3M4W0H1AOriginalGeneratorCentralizerComap','P3M4W0H1AOriginalGeneratorCentralizerComapR2').replace('P3M4W0H1AOriginalGeneratorCentralizerIndependentConsumer','P3M4W0H1AOriginalGeneratorCentralizerIndependentConsumerR2')
        require((root/a['consumer']).read_text()==originalConsumer,'R2 consumer theorem/controls drift')
        require(s['next_planned']['gate']=='P3-M4-W0H1B'
            and s['next_planned']['status']=='PROSPECTIVE_NOT_STAGED'
            and s['next_planned']['source_staged'] is False,
            'W0H1B must remain prospective')
    if a['gate']=='P3-M4-W0H1A' and a['status']=='GREEN_QUALIFIED':
        import zipfile
        require(a.get('attempt')=='R2' and a.get('qualification') is True
                and a.get('verdict')=='GREEN' and a.get('strict_outcome')=='success'
                and a.get('run_id')==44151962609 and a.get('job_id')==134282408570
                and a.get('tested_sha')=='fdc69a364ff32c82ade764940d7b2ec0ec5b2fce'
                and a.get('artifact_id')==14360402424
                and a.get('artifact_sha256')=='15cf911e6c0029b5a7ebed47f735f1d4ae9e21769e90f6b82ab657a7071c8d9f'
                and a.get('source_blob')=='c5c0894d99a01e92e92a58dac7313698a2f69971'
                and a.get('consumer_blob')=='b6e91f79c46724f65f54835623b97d5f909dcf66'
                and a.get('workflow_blob')=='64ec1b82e3ee81243529dc4f883ab510e6e35a7f'
                and a.get('contract_commit')=='884a1897bdecdfa365abd7206ad7411a8dddef15'
                and a.get('evidence_archive_blob')=='4437e182a35763d448b9780d158df926d073d839'
                and a.get('evidence_job_log_blob')=='bf897e7e62cfac76040e15e7aaa4c2f370a84539'
                and a.get('evidence_manifest_blob')=='5a276db3410363592b2b45d34272002f5745adb5'
                and a.get('preservation_run')==a.get('evidence_preservation_run')==44156331349
                and a.get('source_reports')==a.get('consumer_reports')==1
                and a.get('expected_source_reports')==a.get('expected_consumer_reports')==1
                and a.get('independent_controls')==2
                and a.get('auditor_negative_tests')==6
                and a.get('cold_build_jobs')==9131
                and a.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                and a.get('strict_marker')=='BFSS_W0H1A_R2_ORIGINAL_CENTRALIZER_1_SOURCE_1_CONSUMER_2_CONTROLS_SIX_MUTANTS_STRICT_GREEN'
                and s['last_qualified']==a and s['accepted_anchors'][-1]==a,
                'W0H1A original strict R2 source/consumer/evidence acceptance drift')
        prior=next((x for x in s['accepted_anchors'] if x.get('gate')=='P3-M4-W0H0'),{})
        gen=next((x for x in s['accepted_anchors'] if x.get('gate')=='P3-M4-W0B0'),{})
        exact=s.get('last_qualified_source_exact_original_BFSS',{})
        require(prior.get('run_id')==44139239821 and prior.get('qualification') is True
                and prior.get('source_blob')=='7555f5e17d9f465c1e4b7b04ffc450eb1667fc13'
                and prior.get('evidence_archive_blob')=='ffbd66e56aff83031aece2c3b310ed34678bdd9f'
                and gen.get('run_id')==44109519633 and gen.get('qualification') is True
                and gen.get('source_blob')=='c67f30bb76a9990e508a8a050a8c3313e694bda7'
                and exact.get('gate')=='P3-M4-W0H1A'
                and exact.get('run_id')==44151962609
                and exact.get('qualification') is True
                and exact.get('evidence_archive_blob')==a['evidence_archive_blob'],
                'W0H1A original accepted W0H0/W0B0 donors or source-exact index drift')
        m=json.loads((root/a['evidence_manifest']).read_text())
        require(m.get('gate')=='P3-M4-W0H1A' and m.get('attempt')=='R2'
                and m.get('status')=='GREEN_STRICT_PROVIDER_ORIGINAL_UNPROMOTED'
                and m.get('run_id')==a['run_id'] and m.get('job_id')==a['job_id']
                and m.get('tested_sha')==a['tested_sha'] and m.get('artifact_id')==a['artifact_id']
                and m.get('source_blob')==a['source_blob'] and m.get('consumer_blob')==a['consumer_blob']
                and m.get('workflow_blob')==a['workflow_blob']
                and m['original_zip']['size']==14105
                and m['original_zip']['sha256']==a['artifact_sha256']
                and m['original_job_log']['size']==242401
                and m['original_job_log']['sha256']=='469aa35c97931d599d811147781636f83c92e2179dbe3608d4d187b80f62aeb1'
                and m.get('source_reports')==m.get('consumer_reports')==1
                and m.get('independent_controls')==2
                and m.get('negative_mutants')==6
                and m.get('cold_build_jobs')==9131
                and m.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                and m.get('last_qualified_original_bfss_before_run')==44139239821
                and m.get('first_original_R1_native_source_red_run')==44145848122
                and m.get('R2_harness_preflight_red_runs')==[44149941739,44151092723]
                and m.get('prior_W0B1_stopped_native_red_runs')==[44117272657,44127193329],
                'W0H1A provider-original R2 immutable manifest provenance mismatch')
        require(blob(root/a['evidence_archive'])==a['evidence_archive_blob']
                and blob(root/a['evidence_job_log'])==a['evidence_job_log_blob']
                and blob(root/a['evidence_manifest'])==a['evidence_manifest_blob']
                and hashlib.sha256((root/a['evidence_archive']).read_bytes()).hexdigest()==a['artifact_sha256']
                and hashlib.sha256((root/a['evidence_job_log']).read_bytes()).hexdigest()==m['original_job_log']['sha256'],
                'W0H1A provider original ZIP and complete job log drift')
        names={'auditor.log','cold-source.log','consumer.log','preflight.log','source-axioms.log','tested-commit.txt'}
        pat=re.compile(r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)")
        allowed={'propext','Classical.choice','Quot.sound'}
        with zipfile.ZipFile(root/a['evidence_archive']) as z:
            require(z.testzip() is None and set(z.namelist())==names
                    and len(m['original_zip']['members'])==6,
                    'W0H1A original six-member provider archive member list/CRC drift')
            for member in m['original_zip']['members']:
                raw=z.read(member['name'])
                require(len(raw)==member['size']
                        and hashlib.sha256(raw).hexdigest()==member['sha256'],
                        'W0H1A provider-original archive member SHA mismatch '+member['name'])
            require(z.read('tested-commit.txt').decode().strip()==a['tested_sha']
                    and 'Build completed successfully (9131 jobs).' in z.read('cold-source.log').decode()
                    and 'BFSS_W0H1A_R2_ORIGINAL_DONOR_GREEN_R1_SOURCE_RED_ARCHIVED_PREFLIGHT_PASS' in z.read('preflight.log').decode()
                    and a['strict_marker'] in z.read('auditor.log').decode(),
                    'W0H1A R2 original preflight/cold build/negative auditor qualification absent')
            for name,expect in [('source-axioms.log',['originalGenerator_mem_sourceCentralizerPullback']),
                                ('consumer.log',['originalGenerator_mem_sourceCentralizerPullback_consumer'])]:
                report=z.read(name).decode()
                roots=pat.findall(report)
                require('error:' not in report and 'sorryAx' not in report
                        and len(roots)==1 and [x.rsplit('.',1)[-1] for x,_ in roots]==expect
                        and all({v.strip() for v in axioms.split(',') if v.strip()}<=allowed
                                for _,axioms in roots),
                        'W0H1A original source/consumer strict axiom report failed '+name)
        log=(root/a['evidence_job_log']).read_text()
        require('Build completed successfully (9131 jobs).' in log
                and a['strict_marker'] in log
                and 'BFSS_W0H1A_R2_ORIGINAL_DONOR_GREEN_R1_SOURCE_RED_ARCHIVED_PREFLIGHT_PASS' in log,
                'W0H1A R2 provider-original complete job log lacks original strict outcome')
        original=(root/a['source']).read_text()
        consumer=(root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\s+',original))==1
                and len(re.findall(r'(?m)^theorem\s+',consumer))==1
                and len(re.findall(r'(?m)^example\b',consumer))==2
                and len(re.findall(r'(?m)^def originalSourceCentralizerPullback\b',original))==1
                and 'Subalgebra.comap' in original
                and 'Subalgebra.centralizer' in original
                and 'rw [Subalgebra.mem_centralizer_iff]' in original
                and 'originalComplexEquiv_generator_commutes' in original
                and 'CliffordAlgebra.adjoin_range_ι' not in original
                and 'CliffordAlgebra.induction' not in original
                and 'P3M4W0B1OriginalFullCliffordCommutantInduction' not in original,
                'W0H1A source-exact original generator-only theorem changed claims or revived stopped induction')
        red1=s.get('previous_active_W0H1A_R1_RED',{})
        h1=s.get('w0h1a_r2_preflight_only',{})
        h2=s.get('w0h1a_r2_second_preflight_only',{})
        require(red1.get('run_id')==44145848122
                and red1.get('status')=='RED_UNQUALIFIED'
                and red1.get('failure_phase')=='COLD_ORIGINAL_LEAN_SOURCE'
                and red1.get('preservation_run')==44148961842
                and h1.get('run_id')==44149941739
                and h1.get('status')=='PREFLIGHT_ONLY_RED'
                and h1.get('artifact_count')==0
                and h1.get('source_attempted') is False
                and h1.get('consumer_attempted') is False
                and h1.get('preservation_run')==44150575833
                and h2.get('run_id')==44151092723
                and h2.get('status')=='PREFLIGHT_ONLY_RED'
                and h2.get('source_attempted') is False
                and h2.get('consumer_attempted') is False
                and h2.get('preservation_run')==44151502381,
                'W0H1A R2 acceptance must retain original native and harness negative knowledge')
        for item in (red1,h1,h2):
            for name in (('evidence_archive','evidence_job_log','evidence_manifest') if item is red1 else
                         ('original_log','original_metadata','manifest') if item is h1 else
                         ('original_zip','original_log','manifest')):
                require(blob(root/item[name])==item[name+'_blob'],
                        'W0H1A accepted historical original diagnostic drift '+name)
        frozen=s.get('previous_active_W0B1_R2_stopped',{})
        require(frozen.get('stopped') is True and frozen.get('run_id')==44127193329
                and frozen.get('stop_reason')=='TWO_ANALOGOUS_ORIGINAL_SCALAR_INDUCTION_SOURCE_REDS_STOP',
                'W0H1A R2 accepted must preserve original W0B1 two source-RED stop')
        nextgate=s.get('next_planned',{})
        require(nextgate.get('gate')=='P3-M4-W0H1B'
                and nextgate.get('status')=='PROSPECTIVE_NOT_STAGED'
                and nextgate.get('source_staged') is False
                and nextgate.get('consumer_staged') is False
                and nextgate.get('workflow_staged') is False,
                'W0H1B still prospective until separate source-exact gate')
    if a['gate']=='P3-M4-W0H1B' and a['status']=='PENDING_STRICT_CI' and a.get('attempt')=='R1':
        import zipfile
        require(a.get('attempt')=='R1' and a.get('qualification') is False
                and a.get('contract_commit')=='cccc758d74bdddf90c593dfce63f4bbdd7e7298b'
                and a.get('accepted_predecessor_run')==44151962609
                and a.get('source_blob')=='94049ca4a90eeff2cacf423e2fa31250d316b6a1'
                and a.get('consumer_blob')=='3a5d04948ff1adae3fabd6f16da664d4a85725bf'
                and a.get('workflow_blob')=='d05f7de7d7a3acefba34221858cf716f8d8e02a1'
                and a.get('expected_source_reports')==a.get('expected_consumer_reports')==2
                and a.get('independent_controls')==3
                and a.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                and s['last_qualified']['gate']=='P3-M4-W0H1A'
                and s['last_qualified']['attempt']=='R2'
                and s['last_qualified']['run_id']==44151962609
                and s['last_qualified']['status']=='GREEN_QUALIFIED'
                and s['accepted_anchors'][-1]==s['last_qualified'],
                'W0H1B original exact two-theorem centralizer adjoin source/predecessor drift')
        donor=s['last_qualified']
        idx=s.get('last_qualified_source_exact_original_BFSS',{})
        require(donor.get('source_blob')=='c5c0894d99a01e92e92a58dac7313698a2f69971'
                and donor.get('consumer_blob')=='b6e91f79c46724f65f54835623b97d5f909dcf66'
                and donor.get('workflow_blob')=='64ec1b82e3ee81243529dc4f883ab510e6e35a7f'
                and donor.get('evidence_archive_blob')=='4437e182a35763d448b9780d158df926d073d839'
                and donor.get('evidence_job_log_blob')=='bf897e7e62cfac76040e15e7aaa4c2f370a84539'
                and donor.get('evidence_manifest_blob')=='5a276db3410363592b2b45d34272002f5745adb5'
                and idx.get('gate')=='P3-M4-W0H1A'
                and idx.get('run_id')==44151962609
                and idx.get('evidence_archive_blob')==donor['evidence_archive_blob'],
                'W0H1B must retain exact accepted original W0H1A source and original provider GREEN')
        require(blob(root/donor['evidence_archive'])==donor['evidence_archive_blob']
                and blob(root/donor['evidence_job_log'])==donor['evidence_job_log_blob']
                and blob(root/donor['evidence_manifest'])==donor['evidence_manifest_blob']
                and hashlib.sha256((root/donor['evidence_archive']).read_bytes()).hexdigest()
                    =='15cf911e6c0029b5a7ebed47f735f1d4ae9e21769e90f6b82ab657a7071c8d9f',
                'W0H1B previous original generator membership provider ZIP full job log invalid')
        with zipfile.ZipFile(root/donor['evidence_archive']) as z:
            require(z.testzip() is None
                    and set(z.namelist())=={'auditor.log','cold-source.log','consumer.log',
                                           'preflight.log','source-axioms.log','tested-commit.txt'}
                    and z.read('tested-commit.txt').decode().strip()==donor['tested_sha']
                    and 'Build completed successfully (9131 jobs).' in z.read('cold-source.log').decode()
                    and donor['strict_marker'] in z.read('auditor.log').decode(),
                    'W0H1B may only consume native qualified original source W0H1A')
        reds=(s.get('previous_active_W0B1_R1_RED',{}),
              s.get('previous_active_W0B1_R2_stopped',{}),
              s.get('previous_active_W0H1A_R1_RED',{}))
        require([red.get('run_id') for red in reds]==[44117272657,44127193329,44145848122]
                and [red.get('source_blob') for red in reds]
                    == ['6c9cae683665fb6cda2a6e8ff10d388f6a268a05',
                        '93244f15ae511cd4abbac13e216eed6b1988c009',
                        'a4c6a2d8006cdd151b72995bb35313c5f2299d57'],
                'W0H1B stopped historical native source blobs changed in canonical RED ledger')
        for red in reds:
            require(red.get('status')=='RED_UNQUALIFIED'
                    and blob(root/red['evidence_archive'])==red['evidence_archive_blob']
                    and blob(root/red['evidence_job_log'])==red['evidence_job_log_blob']
                    and blob(root/red['evidence_manifest'])==red['evidence_manifest_blob'],
                    'W0H1B must preserve every original native source RED provider ZIP/log/manifest')
        # W0B1 R1 and R2 share a path, which currently holds R2 bytes. Their
        # distinct original source/workflow blobs are retained in canonical Git
        # history and their immutable negative-evidence manifests, not at the
        # same live path. W0H1A R1 has a separate file and remains current.
        h1red=reds[2]
        require(blob(root/h1red['source'])==h1red['source_blob']
                and blob(root/h1red['consumer'])==h1red['consumer_blob']
                and blob(root/h1red['workflow'])==h1red['workflow_blob'],
                'W0H1B must preserve separate frozen native W0H1A R1 source bytes')
        require(s['previous_active_W0B1_R2_stopped'].get('stopped') is True
                and s['previous_active_W0B1_R2_stopped'].get('stop_reason')
                    =='TWO_ANALOGOUS_ORIGINAL_SCALAR_INDUCTION_SOURCE_REDS_STOP',
                'W0H1B must not revive frozen W0B1 native induction')
        r2a=s.get('w0h1a_r2_preflight_only',{})
        r2b=s.get('w0h1a_r2_second_preflight_only',{})
        require(r2a.get('run_id')==44149941739 and r2a.get('artifact_count')==0
                and r2a.get('source_attempted') is False
                and r2b.get('run_id')==44151092723
                and r2b.get('source_attempted') is False,
                'W0H1B may not misclassify setup-only R2 REDs as original Lean failures')
        for item,names in ((r2a,('original_log','original_metadata','manifest')),
                           (r2b,('original_zip','original_log','manifest'))):
            for name in names:
                require(blob(root/item[name])==item[name+'_blob'],
                        'W0H1B predecessor harness RED evidence lost '+name)
        source=(root/a['source']).read_text()
        consumer=(root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\s+',source))==2
                and len(re.findall(r'(?m)^theorem\s+',consumer))==2
                and len(re.findall(r'(?m)^example\b',consumer))==3
                and 'Algebra.adjoin_le' in source
                and 'CliffordAlgebra.adjoin_range_ι' in source
                and 'originalGenerator_mem_sourceCentralizerPullback' in source
                and 'originalComplexCliffordFockAlgEquiv' in source
                and 'Subalgebra.centralizer' in source
                and 'CliffordAlgebra.induction' not in source
                and 'P3M4W0B1OriginalFullCliffordCommutantInduction' not in source
                and 'maxHeartbeats' not in source
                and 'maxRecDepth' not in source,
                'W0H1B original exact source proof closure changed or old stopped induction revived')
        require(s['next_planned']['gate']=='P3-M4-W0B2'
                and s['next_planned']['status']=='PROSPECTIVE_NOT_STAGED'
                and s['next_planned']['source_staged'] is False
                and s['next_planned']['consumer_staged'] is False
                and s['next_planned']['workflow_staged'] is False,
                'W0B2 scalar commutant remains prospective pending source-qualified W0H1B')
    if a['gate']=='P3-M4-W0H1B' and a['status']=='PENDING_STRICT_CI' and a.get('attempt')=='R2':
        import zipfile
        require(a.get('qualification') is False
                and a.get('contract_commit')=='c7ba0b963d904487461203e43d3f1f844a352dde'
                and a.get('accepted_predecessor_run')==44151962609
                and a.get('previous_original_native_red_run')==44160611850
                and a.get('source_blob')=='9139fba785aa31a1e1cde83419f9848ea67fc016'
                and a.get('consumer_blob')=='61964ed693120a6db5f39d034581fc5a5aac9f0a'
                and a.get('workflow_blob')=='c46291c407af0f5e85f23bad2cb20114abd6b03c'
                and a.get('expected_source_reports')==a.get('expected_consumer_reports')==2
                and a.get('independent_controls')==3
                and a.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                and s['last_qualified']['gate']=='P3-M4-W0H1A'
                and s['last_qualified']['attempt']=='R2'
                and s['last_qualified']['run_id']==44151962609
                and s['last_qualified']['status']=='GREEN_QUALIFIED'
                and s['last_qualified']==s['accepted_anchors'][-1],
                'W0H1B R2 original source/consumer strict metadata/predecessor drift')
        r1=s.get('previous_active_W0H1B_R1_RED',{})
        require(r1.get('gate')=='P3-M4-W0H1B'
                and r1.get('attempt')=='R1' and r1.get('status')=='RED_UNQUALIFIED'
                and r1.get('qualification') is False
                and r1.get('run_id')==44160611850
                and r1.get('tested_sha')=='cbbcfc739d68451173c4825e5e656f76eee15afb'
                and r1.get('job_id')==134313075652
                and r1.get('artifact_id')==14364306805
                and r1.get('artifact_sha256')=='58c5e1176099ce9b7764eba910d831b65a4afcb3de74b316f92cc5a996a6e234'
                and r1.get('source_blob')=='94049ca4a90eeff2cacf423e2fa31250d316b6a1'
                and r1.get('consumer_blob')=='3a5d04948ff1adae3fabd6f16da664d4a85725bf'
                and r1.get('workflow_blob')=='d05f7de7d7a3acefba34221858cf716f8d8e02a1'
                and r1.get('evidence_archive_blob')=='3cfab55e2a8a30cb4c63e0a4aa47d224b826636a'
                and r1.get('evidence_job_log_blob')=='51c99b6096bffee493f39713f2b48c8add482440'
                and r1.get('evidence_manifest_blob')=='1487191587142dbd9caa6fc881250a0b3b8e099b'
                and r1.get('preservation_run')==44163946021
                and r1.get('source_reports_clean')==1 and r1.get('source_reports_failed')==1
                and r1.get('consumer_reports')==0,
                'W0H1B R2 must preserve original R1 native source failure and its exact evidence')
        for key in ('source','consumer','workflow','evidence_archive','evidence_job_log','evidence_manifest'):
            require(blob(root/r1[key])==r1[key+'_blob'],'W0H1B R1 immutable original evidence/source drift '+key)
        require(hashlib.sha256((root/r1['evidence_archive']).read_bytes()).hexdigest()
                    =='58c5e1176099ce9b7764eba910d831b65a4afcb3de74b316f92cc5a996a6e234'
                and (root/r1['evidence_archive']).stat().st_size==13841
                and (root/r1['evidence_job_log']).stat().st_size==240572
                and hashlib.sha256((root/r1['evidence_job_log']).read_bytes()).hexdigest()
                    =='cfa66339951e5dc4136f8ca213b006ada987e95f2269ade4dcfdfb9c99f211ec',
                'W0H1B source R1 provider-original ZIP/full original Actions log failed rehash')
        with zipfile.ZipFile(root/r1['evidence_archive']) as z:
            require(z.testzip() is None
                    and set(z.namelist())=={'cold-source.log','preflight.log','tested-commit.txt'}
                    and z.read('tested-commit.txt').decode().strip()==r1['tested_sha'],
                    'W0H1B R1 provider-original three-member ZIP invalid')
            cold=z.read('cold-source.log').decode()
            require('Unknown constant' in cold
                    and 'Subalgebra.mem_centralizer_iff.mp' in cold
                    and 'sorryAx' in cold
                    and 'originalSourceCentralizerPullback_eq_top' in cold,
                    'W0H1B R1 original source failed reason or first theorem evidence changed')
        orig=(root/r1['source']).read_text()
        expected=orig.replace('P3M4W0H1BOriginalAdjoinFullCliffordCommutant',
                              'P3M4W0H1BOriginalAdjoinFullCliffordCommutantR2')
        expected=expected.replace(
            '  have heq := (Subalgebra.mem_centralizer_iff.mp hmem) T (Set.mem_singleton T)\n  exact ⟨heq⟩',
            '  rw [Subalgebra.mem_centralizer_iff] at hmem\n  exact hmem T (Set.mem_singleton T)')
        expected=expected.replace(
            'Does NOT import or retry the stopped W0B1 original induction source.',
            'R2 only repairs final centralizer membership elaboration after R1 native source RED.\n'
            'Does NOT import or retry the stopped W0B1 original induction source.')
        require((root/a['source']).read_text()==expected,'W0H1B R2 original source changed more than bounded final proof')
        oldconsumer=(root/r1['consumer']).read_text().replace(
            'P3M4W0H1BOriginalAdjoinFullCliffordCommutant',
            'P3M4W0H1BOriginalAdjoinFullCliffordCommutantR2').replace(
            'P3M4W0H1BOriginalAdjoinFullCliffordIndependentConsumer',
            'P3M4W0H1BOriginalAdjoinFullCliffordIndependentConsumerR2')
        require((root/a['consumer']).read_text()==oldconsumer,
                'W0H1B R2 original independently importing consumer changed theorem/control math')
        donor=s['last_qualified']
        require(donor['source_blob']=='c5c0894d99a01e92e92a58dac7313698a2f69971'
                and donor['run_id']==44151962609
                and donor['evidence_archive_blob']=='4437e182a35763d448b9780d158df926d073d839'
                and blob(root/donor['evidence_archive'])==donor['evidence_archive_blob'],
                'W0H1B R2 exact accepted original W0H1A donor drift')
        require(s['previous_active_W0B1_R2_stopped']['stopped'] is True
                and s['previous_active_W0B1_R2_stopped']['stop_reason']
                    =='TWO_ANALOGOUS_ORIGINAL_SCALAR_INDUCTION_SOURCE_REDS_STOP',
                'W0H1B R2 must preserve permanent native W0B1 source STOP')
        for red in (s.get('previous_active_W0B1_R1_RED',{}),s.get('previous_active_W0B1_R2_stopped',{})):
            require(red.get('run_id') in {44117272657,44127193329}
                    and blob(root/red['evidence_archive'])==red['evidence_archive_blob']
                    and blob(root/red['evidence_job_log'])==red['evidence_job_log_blob']
                    and blob(root/red['evidence_manifest'])==red['evidence_manifest_blob'],
                    'W0H1B R2 must preserve stopped original W0B1 negative evidence')
        nxt=s.get('next_planned',{})
        require(nxt.get('gate')=='P3-M4-W0B2'
                and nxt.get('status')=='PROSPECTIVE_NOT_STAGED'
                and nxt.get('source_staged') is False
                and nxt.get('consumer_staged') is False
                and nxt.get('workflow_staged') is False,
                'W0B2 Schur scalar bridge must remain prospective until independent W0H1B R2 strict GREEN')
    if a['gate']=='P3-M4-W0H1B' and a['status']=='GREEN_QUALIFIED':
        import zipfile
        require(a.get('attempt')=='R2' and a.get('qualification') is True
                and a.get('verdict')=='GREEN' and a.get('strict_outcome')=='success'
                and a.get('run_id')==44164974919 and a.get('job_id')==134328472568
                and a.get('tested_sha')=='a383fc5bcab5656b3fb67efe4a398c1788b201d1'
                and a.get('artifact_id')==14366581610
                and a.get('artifact_sha256')=='a5dc404d93dd6df74ff97e5a4f498661d467edc75391cb46099147859b8928a3'
                and a.get('source_blob')=='9139fba785aa31a1e1cde83419f9848ea67fc016'
                and a.get('consumer_blob')=='61964ed693120a6db5f39d034581fc5a5aac9f0a'
                and a.get('workflow_blob')=='c46291c407af0f5e85f23bad2cb20114abd6b03c'
                and a.get('contract_commit')=='c7ba0b963d904487461203e43d3f1f844a352dde'
                and a.get('accepted_predecessor_run')==44151962609
                and a.get('previous_red_run')==a.get('previous_original_native_red_run')==44160611850
                and a.get('evidence_archive_blob')=='7e49358ea47500a2b2e8ab0407e7db44c7871cb5'
                and a.get('evidence_job_log_blob')=='7a0996ce15adfc8f9bf5462c350dafaecd6ff906'
                and a.get('evidence_manifest_blob')=='4ef0a86aabdf53da7bf85dd15101f89b592badd3'
                and a.get('evidence_preservation_run')==a.get('preservation_run')==44168840610
                and a.get('source_reports')==a.get('consumer_reports')==2
                and a.get('expected_source_reports')==a.get('expected_consumer_reports')==2
                and a.get('independent_controls')==3
                and a.get('auditor_negative_tests')==6
                and a.get('cold_build_jobs')==9132
                and a.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                and a.get('strict_marker')=='BFSS_W0H1B_R2_ORIGINAL_ADJOIN_FULL_CLIFFORD_2_SOURCE_2_CONSUMER_3_CONTROLS_SIX_MUTANTS_STRICT_GREEN'
                and s['last_qualified']==a and s['accepted_anchors'][-1]==a,
                'W0H1B R2 original source full Clifford GREEN acceptance drift')
        idx=s.get('last_qualified_source_exact_original_BFSS',{})
        donor=next((x for x in s['accepted_anchors'] if x.get('gate')=='P3-M4-W0H1A'),{})
        require(idx.get('gate')=='P3-M4-W0H1B'
                and idx.get('run_id')==44164974919
                and idx.get('qualification') is True
                and idx.get('evidence_archive_blob')==a['evidence_archive_blob']
                and donor.get('attempt')=='R2'
                and donor.get('run_id')==44151962609
                and donor.get('qualification') is True
                and donor.get('source_blob')=='c5c0894d99a01e92e92a58dac7313698a2f69971'
                and donor.get('evidence_archive_blob')=='4437e182a35763d448b9780d158df926d073d839'
                and blob(root/donor['evidence_archive'])==donor['evidence_archive_blob'],
                'W0H1B accepted source exact index or original W0H1A donor drift')
        m=json.loads((root/a['evidence_manifest']).read_text())
        require(m.get('gate')=='P3-M4-W0H1B' and m.get('attempt')=='R2'
                and m.get('status')=='GREEN_STRICT_PROVIDER_ORIGINAL_UNPROMOTED'
                and m.get('run_id')==a['run_id'] and m.get('job_id')==a['job_id']
                and m.get('tested_sha')==a['tested_sha']
                and m.get('artifact_id')==a['artifact_id']
                and m.get('source_blob')==a['source_blob']
                and m.get('consumer_blob')==a['consumer_blob']
                and m.get('workflow_blob')==a['workflow_blob']
                and m['original_zip']['size']==14233
                and m['original_zip']['sha256']==a['artifact_sha256']
                and m['original_job_log']['size']==263992
                and m['original_job_log']['sha256']=='69a02201199eb43b3e60cabc1dd0491fa6de7c61064596fd9eb807410ab762fe'
                and m.get('source_reports')==m.get('consumer_reports')==2
                and m.get('independent_controls')==3
                and m.get('negative_mutants')==6
                and m.get('cold_build_jobs')==9132
                and m.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                and m.get('accepted_predecessor_run')==44151962609
                and m.get('prior_W0H1B_native_source_red_run')==44160611850
                and m.get('prior_W0H1B_native_red_preservation_run')==44163946021
                and m.get('prior_W0B1_stopped_original_native_red_runs')==[44117272657,44127193329],
                'W0H1B source-exact provider-original GREEN manifest mismatch')
        require(blob(root/a['evidence_archive'])==a['evidence_archive_blob']
                and blob(root/a['evidence_job_log'])==a['evidence_job_log_blob']
                and blob(root/a['evidence_manifest'])==a['evidence_manifest_blob']
                and hashlib.sha256((root/a['evidence_archive']).read_bytes()).hexdigest()==a['artifact_sha256']
                and hashlib.sha256((root/a['evidence_job_log']).read_bytes()).hexdigest()==m['original_job_log']['sha256'],
                'W0H1B provider-original strict GREEN evidence ZIP/full log SHA drift')
        names={'auditor.log','cold-source.log','consumer.log','preflight.log','source-axioms.log','tested-commit.txt'}
        pat=re.compile(r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)")
        allowed={'propext','Classical.choice','Quot.sound'}
        with zipfile.ZipFile(root/a['evidence_archive']) as z:
            require(z.testzip() is None
                    and set(z.namelist())==names
                    and len(m['original_zip']['members'])==6,
                    'W0H1B provider-original six-member ZIP CRC/member count drift')
            for member in m['original_zip']['members']:
                original=z.read(member['name'])
                require(len(original)==member['size']
                        and hashlib.sha256(original).hexdigest()==member['sha256'],
                        'W0H1B provider original member digest mismatch '+member['name'])
            require(z.read('tested-commit.txt').decode().strip()==a['tested_sha']
                    and 'Build completed successfully (9132 jobs).' in z.read('cold-source.log').decode()
                    and 'BFSS_W0H1B_R2_W0H1A_GREEN_R1_NATIVE_RED_W0B1_STOP_PREFLIGHT_PASS' in z.read('preflight.log').decode()
                    and a['strict_marker'] in z.read('auditor.log').decode(),
                    'W0H1B original preflight, cold build, strict auditor result missing')
            for name,expected in (('source-axioms.log',['originalSourceCentralizerPullback_eq_top',
                                                        'originalComplexEquiv_fullClifford_commutes']),
                                  ('consumer.log',['originalSourceCentralizerPullback_eq_top_consumer',
                                                   'originalComplexEquiv_fullClifford_commutes_consumer'])):
                report=z.read(name).decode()
                roots=pat.findall(report)
                require('error:' not in report and 'sorryAx' not in report
                        and len(roots)==2 and [n.rsplit('.',1)[-1] for n,_ in roots]==expected
                        and len(set(n for n,_ in roots))==2
                        and all({x.strip() for x in axioms.split(',') if x.strip()}<=allowed for _,axioms in roots),
                        'W0H1B original independent theorem/consumer axiom evidence failed '+name)
        complete=(root/a['evidence_job_log']).read_text()
        require('Build completed successfully (9132 jobs).' in complete
                and a['strict_marker'] in complete
                and 'BFSS_W0H1B_R2_W0H1A_GREEN_R1_NATIVE_RED_W0B1_STOP_PREFLIGHT_PASS' in complete,
                'W0H1B complete provider-original strict CI Actions job log missing strict result')
        source=(root/a['source']).read_text()
        consumer=(root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\s+',source))==2
                and len(re.findall(r'(?m)^theorem\s+',consumer))==2
                and len(re.findall(r'(?m)^example\b',consumer))==3
                and 'Algebra.adjoin_le' in source
                and 'CliffordAlgebra.adjoin_range_ι' in source
                and 'originalGenerator_mem_sourceCentralizerPullback' in source
                and 'rw [Subalgebra.mem_centralizer_iff] at hmem' in source
                and 'exact hmem T (Set.mem_singleton T)' in source
                and 'originalComplexCliffordFockAlgEquiv' in source
                and 'CliffordAlgebra.induction' not in source
                and 'P3M4W0B1OriginalFullCliffordCommutantInduction' not in source,
                'W0H1B original source all-element Clifford claim drift or stopped induction revived')
        red=s.get('previous_active_W0H1B_R1_RED',{})
        require(red.get('gate')=='P3-M4-W0H1B' and red.get('attempt')=='R1'
                and red.get('status')=='RED_UNQUALIFIED'
                and red.get('qualification') is False
                and red.get('run_id')==44160611850
                and red.get('tested_sha')=='cbbcfc739d68451173c4825e5e656f76eee15afb'
                and red.get('source_blob')=='94049ca4a90eeff2cacf423e2fa31250d316b6a1'
                and red.get('consumer_blob')=='3a5d04948ff1adae3fabd6f16da664d4a85725bf'
                and red.get('workflow_blob')=='d05f7de7d7a3acefba34221858cf716f8d8e02a1'
                and red.get('evidence_archive_blob')=='3cfab55e2a8a30cb4c63e0a4aa47d224b826636a'
                and red.get('evidence_job_log_blob')=='51c99b6096bffee493f39713f2b48c8add482440'
                and red.get('evidence_manifest_blob')=='1487191587142dbd9caa6fc881250a0b3b8e099b'
                and red.get('preservation_run')==44163946021,
                'W0H1B R1 original native source RED was erased, overclaimed or reclassified')
        for kind in ('source','consumer','workflow','evidence_archive','evidence_job_log','evidence_manifest'):
            require(blob(root/red[kind])==red[kind+'_blob'],'W0H1B frozen source R1 RED drift '+kind)
        with zipfile.ZipFile(root/red['evidence_archive']) as z:
            require(z.testzip() is None
                    and set(z.namelist())=={'cold-source.log','preflight.log','tested-commit.txt'}
                    and z.read('tested-commit.txt').decode().strip()==red['tested_sha']
                    and 'Unknown constant' in z.read('cold-source.log').decode()
                    and 'Subalgebra.mem_centralizer_iff.mp' in z.read('cold-source.log').decode()
                    and 'sorryAx' in z.read('cold-source.log').decode(),
                    'W0H1B original R1 native source RED provider evidence corrupt')
        require(s['previous_active_W0B1_R2_stopped'].get('stopped') is True
                and s['previous_active_W0B1_R2_stopped'].get('stop_reason')
                    =='TWO_ANALOGOUS_ORIGINAL_SCALAR_INDUCTION_SOURCE_REDS_STOP',
                'W0H1B acceptance cannot revive stopped W0B1 original induction')
        for frozen in (s.get('previous_active_W0B1_R1_RED',{}),
                       s.get('previous_active_W0B1_R2_stopped',{})):
            require(frozen.get('run_id') in {44117272657,44127193329}
                    and blob(root/frozen['evidence_archive'])==frozen['evidence_archive_blob']
                    and blob(root/frozen['evidence_job_log'])==frozen['evidence_job_log_blob']
                    and blob(root/frozen['evidence_manifest'])==frozen['evidence_manifest_blob'],
                    'W0H1B original stopped W0B1 native source RED evidence drift')
        nxt=s.get('next_planned',{})
        require(nxt.get('gate')=='P3-M4-W0B2'
                and nxt.get('status')=='PROSPECTIVE_NOT_STAGED'
                and nxt.get('source_staged') is False
                and nxt.get('consumer_staged') is False
                and nxt.get('workflow_staged') is False,
                'W0B2 scalar Schur bridge remains prospective after W0H1B full commutant')
    if a['gate']=='P3-M4-W0B2A':
        # W0B2A is an ORIGINAL Fermion 2 module endomorphism adapter, not Schur.
        require(a.get('attempt')=='R1' and a.get('status') in {'PENDING_STRICT_CI','GREEN_QUALIFIED'}
                and a.get('qualification') == (a['status']=='GREEN_QUALIFIED')
                and a.get('contract_commit')=='7bda19744b08a71ce85744a2fc2de4a84668a4fe'
                and a.get('first_atom')=='SOURCE_EXACT_ORIGINAL_M3B_FOCK_CLIFFORD_MODULE_END_ADAPTER_FROM_QUALIFIED_W0H1B'
                and a.get('source_blob')=='58d852a27e84288c0b1f33d784940155e2f26d54'
                and a.get('consumer_blob')=='85784957405d4740f7dddc9e04dc72ed4c9d3b7a'
                and a.get('workflow_blob')=='903636c37e0794846146aadd3b175a09553d34e0'
                and a.get('accepted_predecessor_run')==44164974919
                and a.get('expected_source_reports')==a.get('expected_consumer_reports')==3
                and a.get('independent_controls')==3
                and a.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                and ((s['last_qualified']['gate']=='P3-M4-W0H1B'
                      and s['last_qualified']['attempt']=='R2'
                      and s['last_qualified']['run_id']==44164974919
                      and s['last_qualified']['status']=='GREEN_QUALIFIED'
                      and s['accepted_anchors'][-1]==s['last_qualified'])
                     if a['status']=='PENDING_STRICT_CI'
                     else (s['last_qualified']==a and s['accepted_anchors'][-1]==a)),
                'W0B2A original module-end source or accepted W0H1B R2 predecessor drift')
        donor=next((x for x in s['accepted_anchors'] if x.get('gate')=='P3-M4-W0H1B'),{})
        require(donor['source_blob']=='9139fba785aa31a1e1cde83419f9848ea67fc016'
                and donor['consumer_blob']=='61964ed693120a6db5f39d034581fc5a5aac9f0a'
                and donor['workflow_blob']=='c46291c407af0f5e85f23bad2cb20114abd6b03c'
                and donor.get('evidence_archive_blob')=='7e49358ea47500a2b2e8ab0407e7db44c7871cb5'
                and donor.get('evidence_job_log_blob')=='7a0996ce15adfc8f9bf5462c350dafaecd6ff906'
                and donor.get('evidence_manifest_blob')=='4ef0a86aabdf53da7bf85dd15101f89b592badd3'
                and donor.get('preservation_run')==44168840610,
                'W0B2A original W0H1B qualified provider evidence changed')
        for kind in ('source','consumer','workflow','evidence_archive','evidence_job_log','evidence_manifest'):
            require(blob(root/donor[kind])==donor[kind+'_blob'],
                    'W0B2A cannot alter W0H1B R2 original source/evidence '+kind)
        require(s['previous_active_W0H1B_R1_RED']['run_id']==44160611850
                and s['previous_active_W0B1_R2_stopped']['stopped'] is True
                and s['previous_active_W0B1_R2_stopped']['run_id']==44127193329,
                'W0B2A original prior native RED and stopped W0B1 source history lost')
        for red in (s['previous_active_W0H1B_R1_RED'],
                    s['previous_active_W0B1_R1_RED'],
                    s['previous_active_W0B1_R2_stopped']):
            # Historical W0B1 R1 source and workflow were replaced *at the same paths*
            # by the separately archived original R2. Their R1 blobs remain historical
            # Git objects and are named by R1 provider evidence, not current tree paths.
            for kind in ('source','consumer','workflow'):
                if red['run_id']==44117272657 and kind in ('source','workflow'):
                    expected={'source':'6c9cae683665fb6cda2a6e8ff10d388f6a268a05',
                              'workflow':'6565dd372ccb5ba6f553242b3180de8de1ac7e21'}
                    require(red[kind+'_blob']==expected[kind]
                            and blob(root/red[kind])==s['previous_active_W0B1_R2_stopped'][kind+'_blob'],
                            'W0B2A original R1/R2 at-path replacement record drift '+kind)
                else:
                    require(blob(root/red[kind])==red[kind+'_blob'],
                            'W0B2A changed frozen original RED '+kind)
            for kind in ('evidence_archive','evidence_job_log','evidence_manifest'):
                require(blob(root/red[kind])==red[kind+'_blob'],
                        'W0B2A changed frozen original RED evidence '+kind)
        for path,sha in (
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3BOriginalComplexCliffordSimpleModuleProbe.lean','e7de3612d83889d8e08318307b37b15ac6567202'),
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3COriginalCliffordFockSchurAndFiniteProbe.lean','6fefd9ae344df0b7247feb34c9bec5ea0a27aea0'),
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3IOriginalComplexCliffordFockAlgebraEquivProbe.lean','754a5f2a13baea90312f6031eb8fa7963dbdf42b')):
            require(blob(root/path)==sha,'W0B2A exact original M3 donor source drift')
        src=(root/a['source']).read_text()
        cons=(root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\b',src))==2
                and len(re.findall(r'(?m)^noncomputable def\b',src))==1
                and len(re.findall(r'(?m)^theorem\b',cons))==3
                and len(re.findall(r'(?m)^example\b',cons))==3
                and 'originalComplexEquiv_fullClifford_commutes T h a' in src
                and 'Module.End A V' in src
                and 'originalComplexCliffordFock_scalarCommutant' not in src
                and 'CliffordAlgebra.induction' not in src
                and 'maxHeartbeats' not in src and 'maxRecDepth' not in src,
                'W0B2A original module-end atomic scope or strict resources drift')
        require(s['next_planned']['gate']=='P3-M4-W0B2B'
                and s['next_planned']['status']=='PROSPECTIVE_NOT_STAGED'
                and s['next_planned']['source_staged'] is False
                and s['next_planned']['consumer_staged'] is False
                and s['next_planned']['workflow_staged'] is False,
                'W0B2B scalar must not be automatically promoted')
        if a['status']=='GREEN_QUALIFIED':
            import zipfile
            require(a.get('qualification') is True and a.get('verdict')=='GREEN'
                    and a.get('strict_outcome')=='success'
                    and a.get('run_id')==44174996514
                    and a.get('job_id')==134363872763
                    and a.get('tested_sha')=='c0ae4222093f5f922a25569098d420b63fb9e66e'
                    and a.get('artifact_id')==14370212842
                    and a.get('artifact_sha256')=='36f960ad45b38c879929752d90745ee57cd6efe5473b835540e7a7d848e65dd7'
                    and a.get('evidence_archive_blob')=='e4d1fa8d7a87d5ce4fcfc5483c2308648762a62b'
                    and a.get('evidence_job_log_blob')=='bbe132b02b529ee8f43059f649574922404b6e80'
                    and a.get('evidence_manifest_blob')=='65051d4aac0862e7d1d4879dfa1b57e30ba3a55d'
                    and a.get('evidence_preservation_run')==a.get('preservation_run')==44178068165
                    and a.get('source_reports')==a.get('consumer_reports')==3
                    and a.get('auditor_negative_tests')==6
                    and a.get('cold_build_jobs')==9133
                    and a.get('strict_marker')=='BFSS_W0B2A_R1_ORIGINAL_FOCK_CLIFFORD_MODULE_END_3_SOURCE_3_CONSUMER_3_CONTROLS_SIX_MUTANTS_STRICT_GREEN'
                    and a.get('receipt')=='research/quantum-information/BFSS_QIT_SCC_W0B2A_R1_GREEN_44174996514_ACCEPTANCE_2026_11_17.md'
                    and s['last_qualified']==a
                    and s['accepted_anchors'][-1]==a,
                    'W0B2A R1 original source exact strict GREEN canonical acceptance mismatch')
            idx=s.get('last_qualified_source_exact_original_BFSS',{})
            require(idx.get('gate')=='P3-M4-W0B2A'
                    and idx.get('run_id')==44174996514
                    and idx.get('qualification') is True
                    and idx.get('evidence_archive_blob')==a['evidence_archive_blob'],
                    'W0B2A original source exact qualified index mismatch')
            for kind in ('evidence_archive','evidence_job_log','evidence_manifest'):
                require(blob(root/a[kind])==a[kind+'_blob'],
                        'W0B2A original provider ZIP, complete log or manifest Git blob mismatch '+kind)
            raw=(root/a['evidence_archive']).read_bytes()
            complete=(root/a['evidence_job_log']).read_bytes()
            require(len(raw)==14216
                    and hashlib.sha256(raw).hexdigest()==a['artifact_sha256']
                    and len(complete)==235792
                    and hashlib.sha256(complete).hexdigest()=='1ccd70596e82322700c0f3d15d3b3c5e9bc3a52d8f11b5aeac6186d1d1f5ade6',
                    'W0B2A original provider content length or SHA-256 mismatch')
            m=json.loads((root/a['evidence_manifest']).read_text())
            require(m.get('gate')=='P3-M4-W0B2A'
                    and m.get('attempt')=='R1'
                    and m.get('status')=='GREEN_STRICT_PROVIDER_ORIGINAL_UNPROMOTED'
                    and m.get('run_id')==a['run_id']
                    and m.get('job_id')==a['job_id']
                    and m.get('tested_sha')==a['tested_sha']
                    and m.get('artifact_id')==a['artifact_id']
                    and m.get('source_blob')==a['source_blob']
                    and m.get('consumer_blob')==a['consumer_blob']
                    and m.get('workflow_blob')==a['workflow_blob']
                    and m['original_zip']['size']==len(raw)
                    and m['original_zip']['sha256']==a['artifact_sha256']
                    and m['original_job_log']['size']==len(complete)
                    and m['original_job_log']['sha256']=='1ccd70596e82322700c0f3d15d3b3c5e9bc3a52d8f11b5aeac6186d1d1f5ade6'
                    and m.get('source_reports')==m.get('consumer_reports')==3
                    and m.get('independent_controls')==3
                    and m.get('negative_mutants')==6
                    and m.get('cold_build_jobs')==9133
                    and m.get('strict_marker')==a['strict_marker']
                    and m.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                    and m.get('accepted_predecessor_run')==44164974919
                    and m.get('qualified_predecessor_preservation_run')==44168840610
                    and m.get('prior_W0H1B_original_native_red_run')==44160611850
                    and m.get('stopped_original_W0B1_native_red_runs')==[44117272657,44127193329]
                    and m.get('roadmap_staging_green_run')==44175396442,
                    'W0B2A provider-original six-member manifest/qualification metadata drift')
            names={'auditor.log','cold-source.log','consumer.log','preflight.log','source-axioms.log','tested-commit.txt'}
            allowed={'propext','Classical.choice','Quot.sound'}
            pat=re.compile(r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)")
            with zipfile.ZipFile(root/a['evidence_archive']) as z:
                require(z.testzip() is None and set(z.namelist())==names
                        and len(m['original_zip']['members'])==6,
                        'W0B2A original ZIP member list or CRC mismatch')
                for member in m['original_zip']['members']:
                    data=z.read(member['name'])
                    require(len(data)==member['size']
                            and hashlib.sha256(data).hexdigest()==member['sha256'],
                            'W0B2A original ZIP member SHA mismatch '+member['name'])
                require(z.read('tested-commit.txt').decode().strip()==a['tested_sha']
                        and 'Build completed successfully (9133 jobs).' in z.read('cold-source.log').decode()
                        and 'BFSS_W0B2A_R1_W0H1B_GREEN_ORIGINAL_M3B_M3C_M3I_PREFLIGHT_PASS' in z.read('preflight.log').decode()
                        and a['strict_marker'] in z.read('auditor.log').decode(),
                        'W0B2A original source build, preflight or auditor marker missing')
                for name,expected in (
                    ('source-axioms.log',['originalFockClifford_module_smul',
                                         'originalFockClifford_moduleEnd',
                                         'originalFockClifford_moduleEnd_apply']),
                    ('consumer.log',['originalFockClifford_module_smul_consumer',
                                     'originalFockClifford_moduleEnd_apply_consumer',
                                     'originalFockClifford_moduleEnd_smul_consumer'])):
                    report=z.read(name).decode()
                    roots=pat.findall(report)
                    require('error:' not in report and 'sorryAx' not in report
                            and len(roots)==3
                            and [n.rsplit('.',1)[-1] for n,_ in roots]==expected
                            and len(set(n for n,_ in roots))==3
                            and all({x.strip() for x in axioms.split(',') if x.strip()}<=allowed for _,axioms in roots),
                            'W0B2A original source or independent consumer theorem axiom mismatch '+name)
            require(b'Build completed successfully (9133 jobs).' in complete
                    and a['strict_marker'].encode() in complete
                    and b'BFSS_W0B2A_R1_W0H1B_GREEN_ORIGINAL_M3B_M3C_M3I_PREFLIGHT_PASS' in complete,
                    'W0B2A provider-original complete Actions log lacks strict evidence')
    if a['gate']=='P3-M4-W0B2B':
        # Exact original W0B2A -> pinned M3C Schur; do not confuse source with W0C trace.
        require(a.get('attempt')=='R1'
                and a.get('status') in {'PENDING_STRICT_CI','GREEN_QUALIFIED'}
                and a.get('qualification') == (a['status']=='GREEN_QUALIFIED')
                and a.get('contract_commit')=='53cd6311d14d08ea75f9a205c58af0e3b90d3f5b'
                and a.get('first_atom')=='SOURCE_EXACT_M3C_SCHUR_SCALAR_UNIQUENESS_FROM_QUALIFIED_ORIGINAL_W0B2A_MODULE_END'
                and a.get('source_blob')=='6d5fbe98aa8d660c9b7c680efefde02501d8e253'
                and a.get('consumer_blob')=='68e1fe906d2d498f01baf56db7879c2697596c1c'
                and a.get('workflow_blob')=='ce8fd612a8c23ffe5fc86aa61fdc480c3a2e8f8f'
                and a.get('accepted_predecessor_run')==44174996514
                and a.get('expected_source_reports')==a.get('expected_consumer_reports')==3
                and a.get('independent_controls')==3
                and a.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                and ((s['last_qualified']['gate']=='P3-M4-W0B2A'
                      and s['last_qualified']['attempt']=='R1'
                      and s['last_qualified']['run_id']==44174996514
                      and s['last_qualified']['status']=='GREEN_QUALIFIED'
                      and s['accepted_anchors'][-1]==s['last_qualified'])
                     if a['status']=='PENDING_STRICT_CI'
                     else (s['last_qualified']==a and s['accepted_anchors'][-1]==a)),
                'W0B2B original exact source or accepted W0B2A R1 predecessor drift')
        donor=next((x for x in s['accepted_anchors'] if x.get('gate')=='P3-M4-W0B2A'),{})
        require(donor.get('source_blob')=='58d852a27e84288c0b1f33d784940155e2f26d54'
                and donor.get('consumer_blob')=='85784957405d4740f7dddc9e04dc72ed4c9d3b7a'
                and donor.get('workflow_blob')=='903636c37e0794846146aadd3b175a09553d34e0'
                and donor.get('evidence_archive_blob')=='e4d1fa8d7a87d5ce4fcfc5483c2308648762a62b'
                and donor.get('evidence_job_log_blob')=='bbe132b02b529ee8f43059f649574922404b6e80'
                and donor.get('evidence_manifest_blob')=='65051d4aac0862e7d1d4879dfa1b57e30ba3a55d'
                and donor.get('preservation_run')==44178068165,
                'W0B2B cannot bypass qualified W0B2A provider-original evidence')
        for kind in ('source','consumer','workflow','evidence_archive','evidence_job_log','evidence_manifest'):
            require(blob(root/donor[kind])==donor[kind+'_blob'],
                    'W0B2B altered qualified original W0B2A '+kind)
        import zipfile
        old=root/donor['evidence_archive']
        require(old.stat().st_size==14216
                and hashlib.sha256(old.read_bytes()).hexdigest()=='36f960ad45b38c879929752d90745ee57cd6efe5473b835540e7a7d848e65dd7',
                'W0B2B original W0B2A provider ZIP size/digest changed')
        with zipfile.ZipFile(old) as z:
            require(z.testzip() is None
                    and set(z.namelist())=={'auditor.log','cold-source.log','consumer.log','preflight.log','source-axioms.log','tested-commit.txt'}
                    and z.read('tested-commit.txt').decode().strip()=='c0ae4222093f5f922a25569098d420b63fb9e66e'
                    and 'Build completed successfully (9133 jobs).' in z.read('cold-source.log').decode()
                    and 'BFSS_W0B2A_R1_ORIGINAL_FOCK_CLIFFORD_MODULE_END_3_SOURCE_3_CONSUMER_3_CONTROLS_SIX_MUTANTS_STRICT_GREEN' in z.read('auditor.log').decode(),
                    'W0B2B original W0B2A accepted ZIP content mismatch')
        for path,sha in (
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3BOriginalComplexCliffordSimpleModuleProbe.lean','e7de3612d83889d8e08318307b37b15ac6567202'),
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3COriginalCliffordFockSchurAndFiniteProbe.lean','6fefd9ae344df0b7247feb34c9bec5ea0a27aea0'),
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3IOriginalComplexCliffordFockAlgebraEquivProbe.lean','754a5f2a13baea90312f6031eb8fa7963dbdf42b')):
            require(blob(root/path)==sha,'W0B2B pinned original Schur donor drift '+path)
        require(s['previous_active_W0H1B_R1_RED']['run_id']==44160611850
                and s['previous_active_W0B1_R2_stopped']['run_id']==44127193329
                and s['previous_active_W0B1_R2_stopped']['stopped'] is True,
                'W0B2B cannot erase earlier original native failures')
        for key in ('previous_active_W0H1B_R1_RED','previous_active_W0B1_R1_RED',
                    'previous_active_W0B1_R2_stopped'):
            oldred=s[key]
            for kind in ('evidence_archive','evidence_job_log','evidence_manifest'):
                require(blob(root/oldred[kind])==oldred[kind+'_blob'],
                        'W0B2B historical provider-original RED evidence drift '+kind)
        src=(root/a['source']).read_text()
        cons=(root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\b',src))==3
                and len(re.findall(r'(?m)^theorem\b',cons))==3
                and len(re.findall(r'(?m)^example\b',cons))==3
                and 'originalComplexCliffordFock_scalarCommutant.2' in src
                and 'originalComplexCliffordFock_scalarCommutant.1' in src
                and 'Module.algebraMap_end_apply' in src
                and 'ContinuousLinearMap.ext' in src
                and 'CliffordAlgebra.induction' not in src
                and 'originalFockTrace' not in src
                and 'maxHeartbeats' not in src and 'maxRecDepth' not in src,
                'W0B2B source/consumer original Schur 3-root scope changed')
        require(s['next_planned']['gate']=='P3-M4-W0C'
                and s['next_planned']['status']=='PROSPECTIVE_NOT_STAGED'
                and s['next_planned']['source_staged'] is False
                and s['next_planned']['consumer_staged'] is False
                and s['next_planned']['workflow_staged'] is False,
                'W0C original trace cannot be prequalified')
        if a['status']=='GREEN_QUALIFIED':
            import zipfile
            require(a.get('qualification') is True
                    and a.get('verdict')=='GREEN'
                    and a.get('strict_outcome')=='success'
                    and a.get('run_id')==44180157170
                    and a.get('job_id')==134382025356
                    and a.get('tested_sha')=='e5b93b53ba9917374e39b79dac4e808f44ad615c'
                    and a.get('artifact_id')==14373575683
                    and a.get('artifact_sha256')=='90049da54aee06c9cc649b1577059f10c440c037de3689e25b5da9314b7623a6'
                    and a.get('evidence_archive_blob')=='f8133dba86db582f5d302885c7c134b3e2ff043a'
                    and a.get('evidence_job_log_blob')=='76e06a033b2e3dacc6dbf9ae7c7c6280b1d4a07b'
                    and a.get('evidence_manifest_blob')=='8770fa58b313985267fb710abb58fd3a282d7712'
                    and a.get('evidence_preservation_run')==a.get('preservation_run')==44182808147
                    and a.get('source_reports')==a.get('consumer_reports')==3
                    and a.get('auditor_negative_tests')==6
                    and a.get('cold_build_jobs')==9134
                    and a.get('strict_marker')=='BFSS_W0B2B_R1_ORIGINAL_SCHUR_SCALAR_3_SOURCE_3_CONSUMER_3_CONTROLS_SIX_MUTANTS_STRICT_GREEN'
                    and a.get('receipt')=='research/quantum-information/BFSS_QIT_SCC_W0B2B_R1_GREEN_44180157170_ACCEPTANCE_2026_11_17.md'
                    and s['last_qualified']==a and s['accepted_anchors'][-1]==a,
                    'W0B2B R1 original scalar Schur GREEN canonical acceptance mismatch')
            idx=s.get('last_qualified_source_exact_original_BFSS',{})
            require(idx.get('gate')=='P3-M4-W0B2B' and idx.get('run_id')==44180157170
                    and idx.get('qualification') is True
                    and idx.get('evidence_archive_blob')==a['evidence_archive_blob'],
                    'W0B2B original source exact qualification index mismatch')
            for kind in ('evidence_archive','evidence_job_log','evidence_manifest'):
                require(blob(root/a[kind])==a[kind+'_blob'],
                        'W0B2B provider original complete evidence Git blob mismatch '+kind)
            raw=(root/a['evidence_archive']).read_bytes()
            complete=(root/a['evidence_job_log']).read_bytes()
            require(len(raw)==14293
                    and hashlib.sha256(raw).hexdigest()==a['artifact_sha256']
                    and len(complete)==239585
                    and hashlib.sha256(complete).hexdigest()=='358b48eee5f34dd3c618bf66f06cb8107fcca9c5dc0be7ee09b47ce51a574341',
                    'W0B2B original ZIP or complete Actions log length or SHA-256 mismatch')
            m=json.loads((root/a['evidence_manifest']).read_text())
            require(m.get('gate')=='P3-M4-W0B2B' and m.get('attempt')=='R1'
                    and m.get('status')=='GREEN_STRICT_PROVIDER_ORIGINAL_UNPROMOTED'
                    and m.get('run_id')==a['run_id'] and m.get('job_id')==a['job_id']
                    and m.get('tested_sha')==a['tested_sha'] and m.get('artifact_id')==a['artifact_id']
                    and m.get('source_blob')==a['source_blob']
                    and m.get('consumer_blob')==a['consumer_blob']
                    and m.get('workflow_blob')==a['workflow_blob']
                    and m['original_zip']['size']==len(raw)
                    and m['original_zip']['sha256']==a['artifact_sha256']
                    and m['original_job_log']['size']==len(complete)
                    and m['original_job_log']['sha256']=='358b48eee5f34dd3c618bf66f06cb8107fcca9c5dc0be7ee09b47ce51a574341'
                    and m.get('source_reports')==m.get('consumer_reports')==3
                    and m.get('independent_controls')==3 and m.get('negative_mutants')==6
                    and m.get('cold_build_jobs')==9134 and m.get('strict_marker')==a['strict_marker']
                    and m.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                    and m.get('accepted_predecessor_run')==44174996514
                    and m.get('qualified_predecessor_preservation_run')==44178068165
                    and m.get('prior_W0H1B_original_native_red_run')==44160611850
                    and m.get('stopped_original_W0B1_native_red_runs')==[44117272657,44127193329]
                    and m.get('roadmap_staging_green_run')==44180156995,
                    'W0B2B source exact original CI provider manifest drift')
            names={'auditor.log','cold-source.log','consumer.log','preflight.log','source-axioms.log','tested-commit.txt'}
            allowed={'propext','Classical.choice','Quot.sound'}
            pat=re.compile(r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)")
            with zipfile.ZipFile(root/a['evidence_archive']) as z:
                require(z.testzip() is None and set(z.namelist())==names
                        and len(m['original_zip']['members'])==6,
                        'W0B2B original ZIP member list or CRC mismatch')
                for member in m['original_zip']['members']:
                    data=z.read(member['name'])
                    require(len(data)==member['size']
                            and hashlib.sha256(data).hexdigest()==member['sha256'],
                            'W0B2B original ZIP member SHA mismatch '+member['name'])
                require(z.read('tested-commit.txt').decode().strip()==a['tested_sha']
                        and 'Build completed successfully (9134 jobs).' in z.read('cold-source.log').decode()
                        and 'BFSS_W0B2B_R1_W0B2A_ACCEPTED_GREEN_M3C_SCHUR_AND_REDS_PREFLIGHT_PASS' in z.read('preflight.log').decode()
                        and a['strict_marker'] in z.read('auditor.log').decode(),
                        'W0B2B original cold build/preflight/strict marker corrupt')
                for name,expected in (
                    ('source-axioms.log',['originalFockClifford_scalar_moduleEnd_unique',
                                         'originalFockClifford_scalar_pointwise_unique',
                                         'originalFockClifford_scalar_operator_unique']),
                    ('consumer.log',['originalFockClifford_scalar_moduleEnd_unique_consumer',
                                     'originalFockClifford_scalar_pointwise_unique_consumer',
                                     'originalFockClifford_scalar_operator_unique_consumer'])):
                    report=z.read(name).decode()
                    roots=pat.findall(report)
                    require('error:' not in report and 'sorryAx' not in report
                            and len(roots)==3
                            and [n.rsplit('.',1)[-1] for n,_ in roots]==expected
                            and len(set(n for n,_ in roots))==3
                            and all({x.strip() for x in axioms.split(',') if x.strip()}<=allowed for _,axioms in roots),
                            'W0B2B provider-original source/consumer theorem axioms mismatch '+name)
            require(b'Build completed successfully (9134 jobs).' in complete
                    and a['strict_marker'].encode() in complete
                    and b'BFSS_W0B2B_R1_W0B2A_ACCEPTED_GREEN_M3C_SCHUR_AND_REDS_PREFLIGHT_PASS' in complete,
                    'W0B2B provider-original full Actions log required evidence absent')
    if a['gate']=='P3-M4-W0C0':
        # W0C0 separates original complex scalars by T1 ordinary Fock trace.
        require(a.get('attempt') in {'R1','R2'}
                and a.get('status') in {'PENDING_STRICT_CI','GREEN_QUALIFIED'}
                and a.get('qualification') == (a['status']=='GREEN_QUALIFIED')
                and a.get('first_atom')=='ORIGINAL_FOCK_T1_TRACE_ONE_NONZERO_AND_COMPLEX_SCALAR_TRACE_SEPARATION'
                and a.get('accepted_predecessor_run')==44180157170
                and a.get('expected_source_reports')==a.get('expected_consumer_reports')==3
                and a.get('independent_controls')==3
                and a.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                and ((s['last_qualified']['gate']=='P3-M4-W0B2B'
                      and s['last_qualified']['attempt']=='R1'
                      and s['last_qualified']['status']=='GREEN_QUALIFIED'
                      and s['last_qualified']['run_id']==44180157170
                      and s['accepted_anchors'][-1]==s['last_qualified'])
                     if a['status']=='PENDING_STRICT_CI'
                     else (s['last_qualified']==a and s['accepted_anchors'][-1]==a)),
                'W0C0 accepted W0B2B predecessor or status drift')
        if a['attempt']=='R1':
            require(a.get('contract_commit')=='ab8ad007fdd670ffff387fac6758222ab1e7be34'
                    and a.get('source_blob')=='42ee591cbd6c9d7d98e736076c2a4b6cb321ae0e'
                    and a.get('consumer_blob')=='63ce6ff9ee136bf3b02a845dc1c8dea4cbaf9054'
                    and a.get('workflow_blob')=='43736998ba3bd7d2bb51b54b03afd56af17776b2',
                    'W0C0 R1 original immutable pins changed')
        else:
            require(a.get('contract_commit')=='2ece5242c232a2e77a8e5ecbf6ed634c5529a3a6'
                    and a.get('source_blob')=='96d3b63d08413f880d1adf0cef8b8e291f7b9453'
                    and a.get('consumer_blob')=='fe9136065179d706c60871ae16e02b8f60e1b189'
                    and a.get('workflow_blob')=='b36fb1ae5b76a3b611292ac9ac4c11ca59509bde'
                    and a.get('previous_red_run')==44184526501
                    and a.get('previous_red_preservation_run')==44189939903
                    and a.get('previous_red_artifact_sha256')=='a1c300789de7b8e97e88efa894841670ab92bf7e98d489373c54dff285b9eb73',
                    'W0C0 R2 original one-line repair contract/pin mismatch')
            r=s.get('previous_active_W0C0_R1_RED',{})
            require(r.get('attempt')=='R1' and r.get('run_id')==44184526501
                    and r.get('tested_sha')=='deaf6f7cc314f3b18ff231945112b6478cae25e3'
                    and r.get('status')=='RED_UNQUALIFIED' and r.get('qualification') is False
                    and r.get('evidence_archive_blob')=='54f84642bc280e61ce9fe59b77bfd9caf7bc7c61'
                    and r.get('evidence_job_log_blob')=='8cd529bae1b3b138597403f82dc16e610e981d91'
                    and r.get('evidence_manifest_blob')=='3adae59c5e1705bf7a8ec27d5835af9ebf253335',
                    'W0C0 R1 native RED historical checkpoint lost')
            for kind in ('source','consumer','workflow','evidence_archive','evidence_job_log','evidence_manifest'):
                require(blob(root/r[kind])==r[kind+'_blob'], 'W0C0 R1 original source/RED evidence drift '+kind)
            first=s.get('w0c0_r2_first_preflight_red',{})
            require(first.get('run_id')==44190799433
                    and first.get('status')=='PREFLIGHT_RED_UNQUALIFIED'
                    and first.get('failure_phase')=='PRE_LEAN_PIN_PATH_MISMATCH'
                    and first.get('preservation_run')==44191210547
                    and first.get('source_blob')==a.get('source_blob')
                    and first.get('consumer_blob')==a.get('consumer_blob')
                    and first.get('workflow_blob')=='3bf1f0dbb2cdcdcb4b28cbfa8c0eb6950764721c'
                    and first.get('evidence_archive_blob')=='56e470ba2dbea58c9a05cdfcea91f64e06b568e8'
                    and first.get('evidence_job_log_blob')=='74fa47be27ace746009b5dca6919cb3132383395'
                    and first.get('evidence_manifest_blob')=='0589342a9fda8875ea0e8cd079246b467e726dd8',
                    'W0C0 R2 historical preflight-only RED and exact artifacts lost')
            for kind in ('evidence_archive','evidence_job_log','evidence_manifest'):
                require(blob(root/first[kind])==first[kind+'_blob'], 'W0C0 R2 first-preflight original evidence drift '+kind)
            require((root/first['evidence_archive']).stat().st_size==754
                    and hashlib.sha256((root/first['evidence_archive']).read_bytes()).hexdigest()==first['artifact_sha256'],
                    'W0C0 R2 original setup-RED ZIP digest or size drift')
            second=s.get('w0c0_r2_second_preflight_red',{})
            require(second.get('run_id')==44191695033
                    and second.get('status')=='PREFLIGHT_RED_UNQUALIFIED'
                    and second.get('failure_phase')=='PRE_LEAN_PYTHON_SYNTAX_ERROR'
                    and second.get('preservation_run')==44192086295
                    and second.get('source_blob')==a.get('source_blob')
                    and second.get('consumer_blob')==a.get('consumer_blob')
                    and second.get('workflow_blob')=='5df8bb9123ee0bd47bccfa6f566d0c28cd339080'
                    and second.get('evidence_archive_blob')=='5655f0d212cc75319ad45d8f8ec1a0fb143c8dba'
                    and second.get('evidence_job_log_blob')=='60cb9f3a92c411448b15165588b8a686d9e18d0e'
                    and second.get('evidence_manifest_blob')=='f2bb56bead71167e4b4409de43f47a587609c4b3',
                    'W0C0 R2 second preflight-only syntax RED provenance lost')
            for kind in ('evidence_archive','evidence_job_log','evidence_manifest'):
                require(blob(root/second[kind])==second[kind+'_blob'],
                        'W0C0 R2 second setup-only RED original evidence drift '+kind)
            require((root/second['evidence_archive']).stat().st_size==514
                    and hashlib.sha256((root/second['evidence_archive']).read_bytes()).hexdigest()==second['artifact_sha256']
                    and 'SyntaxError' in (root/second['evidence_job_log']).read_text(),
                    'W0C0 R2 second setup-RED original provider ZIP or failure log invalid')
            # Distinct from a Lean theorem check: require both embedded Python
            # heredocs in strict YAML to be syntactically valid before launch.
            import textwrap
            pyblocks=re.findall(r"(?m)^          python3 - <<'PY'[^\n]*\n(.*?)\n          PY$", workflow, re.S)
            require(len(pyblocks)==2, 'W0C0 R2 strict workflow must contain two exact Python heredocs')
            for block in pyblocks:
                try:
                    ast.parse(textwrap.dedent(block))
                except SyntaxError as exc:
                    raise AssertionError('W0C0 R2 strict workflow Python syntax failure') from exc
            import zipfile
            original=root/r['evidence_archive']
            require(original.stat().st_size==18813
                    and hashlib.sha256(original.read_bytes()).hexdigest()==r['artifact_sha256'],
                    'W0C0 R1 original provider ZIP integrity failed')
            with zipfile.ZipFile(original) as z:
                require(z.testzip() is None and set(z.namelist())=={'preflight.log','cold-source.log','source-axioms.log','tested-commit.txt'}
                        and z.read('tested-commit.txt').decode().strip()==r['tested_sha']
                        and 'Build completed successfully (9218 jobs).' in z.read('cold-source.log').decode()
                        and 'The goal is a proposition' in z.read('source-axioms.log').decode(),
                        'W0C0 R1 provider-original cause or four members drifted')
            require('The goal is a proposition' in (root/r['evidence_job_log']).read_text()
                    and '  let : Nontrivial V :=' in (root/a['source']).read_text()
                    and '  letI : Nontrivial V :=' not in (root/a['source']).read_text(),
                    'W0C0 R2 proof diff or original failure log invalid')
        donor=next((x for x in s['accepted_anchors'] if x.get('gate')=='P3-M4-W0B2B'),{})
        require(donor.get('source_blob')=='6d5fbe98aa8d660c9b7c680efefde02501d8e253'
                and donor.get('consumer_blob')=='68e1fe906d2d498f01baf56db7879c2697596c1c'
                and donor.get('workflow_blob')=='ce8fd612a8c23ffe5fc86aa61fdc480c3a2e8f8f'
                and donor.get('evidence_archive_blob')=='f8133dba86db582f5d302885c7c134b3e2ff043a'
                and donor.get('evidence_job_log_blob')=='76e06a033b2e3dacc6dbf9ae7c7c6280b1d4a07b'
                and donor.get('evidence_manifest_blob')=='8770fa58b313985267fb710abb58fd3a282d7712'
                and donor.get('preservation_run')==44182808147,
                'W0C0 original predecessor source-exact Schur qualification lost')
        for kind in ('source','consumer','workflow','evidence_archive','evidence_job_log','evidence_manifest'):
            require(blob(root/donor[kind])==donor[kind+'_blob'],
                    'W0C0 changed original W0B2B qualified provider evidence '+kind)
        for path,sha in (
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/T1OriginalFockTraceInvariance.lean','3be6c9a6f2898484df66690f94fdfa1877660897'),
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2cNonzeroOriginalGaugeVacuum.lean','a16d3573b737bb4453e42b0b543d63cbbac1cd1b'),
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4BFermionLinearTransportProbe.lean','e55fcbb58ce4d3776bddefdd6d11ad83560bb75c')):
            require(blob(root/path)==sha,'W0C0 exact original trace/vacuum donor drift '+path)
        require(s['previous_active_W0H1B_R1_RED']['run_id']==44160611850
                and s['previous_active_W0B1_R2_stopped']['run_id']==44127193329
                and s['previous_active_W0B1_R2_stopped']['stopped'] is True,
                'W0C0 original historical failures lost')
        for key in ('previous_active_W0H1B_R1_RED','previous_active_W0B1_R1_RED','previous_active_W0B1_R2_stopped'):
            red=s[key]
            for kind in ('evidence_archive','evidence_job_log','evidence_manifest'):
                require(blob(root/red[kind])==red[kind+'_blob'],
                        'W0C0 changed historical native RED evidence '+kind)
        src=(root/a['source']).read_text()
        cons=(root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\b',src))==3
                and len(re.findall(r'(?m)^theorem\b',cons))==3
                and len(re.findall(r'(?m)^example\b',cons))==3
                and 'originalFockTrace_apply' in src
                and 'LinearMap.trace_one' in src
                and 'originalFermionVacuum_ne_zero' in src
                and 'Module.finrank_pos' in src
                and 'map_smul' in src
                and 'originalFockClifford_scalar_operator_unique' not in src
                and 'maxRecDepth' not in src and 'maxHeartbeats' not in src,
                'W0C0 original scalar trace 3-root atomic proof scope changed')
        require(s['next_planned']['gate']=='P3-M4-W0C1'
                and s['next_planned']['status']=='PROSPECTIVE_NOT_STAGED'
                and s['next_planned']['source_staged'] is False
                and s['next_planned']['consumer_staged'] is False
                and s['next_planned']['workflow_staged'] is False,
                'W0C1 original algebraic witness cannot be prequalified')

        if a['status']=='GREEN_QUALIFIED':
            import zipfile
            require(a.get('attempt')=='R2' and a.get('verdict')=='GREEN'
                    and a.get('strict_outcome')=='success'
                    and a.get('run_id')==44192981282
                    and a.get('job_id')==134426946419
                    and a.get('tested_sha')=='d193649342bb543faa91bf559db0b953c6ec2dcd'
                    and a.get('artifact_id')==14378238828
                    and a.get('artifact_sha256')=='37cd7da40243fff8833524789de91314a5bf21bf273a086f96cb81669679c8e1'
                    and a.get('evidence_archive_blob')=='4992a5444441022a998afc26324551a273b747c9'
                    and a.get('evidence_job_log_blob')=='d269402e6bb231c58f49eacc68a76c50ffe1aa5d'
                    and a.get('evidence_manifest_blob')=='0243686ca56af184824568a38c3a646141c19a1d'
                    and a.get('preservation_run')==a.get('evidence_preservation_run')==44197140876
                    and a.get('source_reports')==a.get('consumer_reports')==3
                    and a.get('auditor_negative_tests')==6 and a.get('cold_build_jobs')==9218
                    and a.get('receipt')=='research/quantum-information/BFSS_QIT_SCC_W0C0_R2_GREEN_44192981282_ACCEPTANCE_2026_11_17.md'
                    and a.get('strict_marker')=='BFSS_W0C0_R2_ORIGINAL_FOCK_SCALAR_TRACE_3_SOURCE_3_CONSUMER_3_CONTROLS_SIX_MUTANTS_STRICT_GREEN'
                    and s['last_qualified']==a and s['accepted_anchors'][-1]==a,
                    'W0C0 R2 original scalar-trace source exact GREEN acceptance mismatch')
            previous=s.get('previous_active_W0C0_R2_pending',{})
            require(previous.get('status')=='PENDING_STRICT_CI'
                    and previous.get('source_blob')==a['source_blob']
                    and previous.get('consumer_blob')==a['consumer_blob']
                    and previous.get('workflow_blob')==a['workflow_blob']
                    and previous.get('qualification') is False,
                    'W0C0 R2 preceding PENDING checkpoint lost')
            idx=s.get('last_qualified_source_exact_original_BFSS',{})
            require(idx.get('gate')=='P3-M4-W0C0' and idx.get('run_id')==44192981282
                    and idx.get('qualification') is True
                    and idx.get('evidence_archive_blob')==a['evidence_archive_blob'],
                    'W0C0 source exact qualification index mismatch')
            failed=s.get('w0c0_r2_green_preservation_harness_red',{})
            require(failed.get('run_id')==44196763215
                    and failed.get('status')=='PRESERVATION_HARNESS_RED'
                    and failed.get('corrected_preservation_run')==44197140876
                    and failed.get('qualification') is False
                    and failed.get('evidence_job_log_blob')=='f13d4be76d3df0de02efeee9ca0ef23a6afda30e'
                    and failed.get('diagnostic_receipt_blob')=='ddab8338d5b1fa80041fc3defcd5458c32a3a437',
                    'W0C0 R2 first archiver negative knowledge lost')
            require(blob(root/failed['evidence_job_log'])==failed['evidence_job_log_blob']
                    and blob(root/failed['diagnostic_receipt'])==failed['diagnostic_receipt_blob']
                    and 'AssertionError' in (root/failed['evidence_job_log']).read_text(),
                    'W0C0 R2 first GREEN evidence archiver diagnostic log drift')
            for kind in ('evidence_archive','evidence_job_log','evidence_manifest'):
                require(blob(root/a[kind])==a[kind+'_blob'], 'W0C0 R2 original provider GREEN evidence Git blob mismatch '+kind)
            raw=(root/a['evidence_archive']).read_bytes()
            complete=(root/a['evidence_job_log']).read_bytes()
            require(len(raw)==19089 and hashlib.sha256(raw).hexdigest()==a['artifact_sha256']
                    and len(complete)==312141
                    and hashlib.sha256(complete).hexdigest()=='96b254415cd09a7daa743561c907f2aa13ca2e51ef701b1b78b31f69340022c6',
                    'W0C0 R2 original six-member ZIP or full Actions log SHA-256 mismatch')
            manifest=json.loads((root/a['evidence_manifest']).read_text())
            require(manifest.get('gate')=='P3-M4-W0C0' and manifest.get('attempt')=='R2'
                    and manifest.get('status')=='GREEN_STRICT_PROVIDER_ORIGINAL_UNPROMOTED'
                    and manifest.get('run_id')==a['run_id']
                    and manifest.get('job_id')==a['job_id']
                    and manifest.get('tested_sha')==a['tested_sha']
                    and manifest.get('artifact_id')==a['artifact_id']
                    and manifest.get('source_blob')==a['source_blob']
                    and manifest.get('consumer_blob')==a['consumer_blob']
                    and manifest.get('workflow_blob')==a['workflow_blob']
                    and manifest['original_zip']['size']==len(raw)
                    and manifest['original_zip']['sha256']==a['artifact_sha256']
                    and manifest['original_job_log']['size']==len(complete)
                    and manifest['original_job_log']['sha256']=='96b254415cd09a7daa743561c907f2aa13ca2e51ef701b1b78b31f69340022c6'
                    and manifest.get('source_reports')==manifest.get('consumer_reports')==3
                    and manifest.get('independent_controls')==3
                    and manifest.get('negative_mutants')==6 and manifest.get('cold_build_jobs')==9218
                    and manifest.get('strict_marker')==a['strict_marker']
                    and manifest.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                    and manifest.get('accepted_predecessor_run')==44180157170
                    and manifest.get('prior_W0C0_R1_native_red_run')==44184526501
                    and manifest.get('prior_W0C0_R2_setup_red_runs')==[44190799433,44191695033],
                    'W0C0 R2 source-exact provider original evidence manifest drift')
            names={'auditor.log','cold-source.log','consumer.log','preflight.log','source-axioms.log','tested-commit.txt'}
            allowed={'propext','Classical.choice','Quot.sound'}
            pat=re.compile(r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)")
            with zipfile.ZipFile(root/a['evidence_archive']) as z:
                require(z.testzip() is None and set(z.namelist())==names
                        and len(manifest['original_zip']['members'])==6,
                        'W0C0 original ZIP member list or integrity failure')
                for item in manifest['original_zip']['members']:
                    data=z.read(item['name'])
                    require(len(data)==item['size']
                            and hashlib.sha256(data).hexdigest()==item['sha256']
                            and format(z.getinfo(item['name']).CRC,'08x')==item['crc32'],
                            'W0C0 original ZIP member SHA/CRC mismatch '+item['name'])
                require(z.read('tested-commit.txt').decode().strip()==a['tested_sha']
                        and 'Build completed successfully (9218 jobs).' in z.read('cold-source.log').decode()
                        and 'BFSS_W0C0_R2_W0B2B_ACCEPTED_ORIGINAL_TRACE_VACUUM_PREFLIGHT_PASS' in z.read('preflight.log').decode()
                        and a['strict_marker'] in z.read('auditor.log').decode(),
                        'W0C0 original cold source/preflight/auditor marker mismatch')
                for name,expected in (
                    ('source-axioms.log',['originalFockTrace_one_eq_finrank',
                                         'originalFockTrace_one_ne_zero',
                                         'originalFockTrace_scalar_one_eq_zero_iff']),
                    ('consumer.log',['originalFockTrace_one_eq_finrank_consumer',
                                     'originalFockTrace_one_ne_zero_consumer',
                                     'originalFockTrace_scalar_one_eq_zero_iff_consumer'])):
                    report=z.read(name).decode()
                    roots=pat.findall(report)
                    require('error:' not in report and 'sorryAx' not in report
                            and len(roots)==3
                            and [n.rsplit('.',1)[-1] for n,_ in roots]==expected
                            and len({n for n,_ in roots})==3
                            and all({x.strip() for x in axioms.split(',') if x.strip()}<=allowed for _,axioms in roots),
                            'W0C0 original source/consumer allowed axiom reports mismatch '+name)
            require(b'Build completed successfully (9218 jobs).' in complete
                    and a['strict_marker'].encode() in complete
                    and b'BFSS_W0C0_R2_W0B2B_ACCEPTED_ORIGINAL_TRACE_VACUUM_PREFLIGHT_PASS' in complete,
                    'W0C0 original complete Actions log missing tested build or auditor success')
    if a['gate']=='P3-M4-W0C1':
        # W0C1 is source-exact original algebraic trace plus all 48 gamma
        # commutators; physical witness admissibility is a later gate.
        require(a.get('attempt')=='R2'
                and a.get('status') in {'PENDING_STRICT_CI','GREEN_QUALIFIED'}
                and a.get('qualification') == (a['status']=='GREEN_QUALIFIED')
                and a.get('first_atom')=='ORIGINAL_48_GAMMA_AND_ZERO_TRACE_TRIVIAL_KERNEL_THEN_COMMUTATOR_TRACE_SIGNATURE_INJECTIVITY'
                and a.get('contract_commit')=='1b1b10b4cfdcf62716822ba1244ab2c469d33af2'
                and a.get('prospective_receipt')=='research/quantum-information/BFSS_QIT_SCC_W0C1_R2_ORIGINAL_ZERO_SMUL_PROOF_REPAIR_PRE_GATE_2026_11_17.md'
                and a.get('source_blob')=='5fafaa3d73d3761719ea160466b40d94b85d74db'
                and a.get('consumer_blob')=='85e8067c892bc52533f6a3ecc1f099010efac4ae'
                and a.get('workflow_blob')=='c9db16b6c55239f3c8235a70f623ca9f929dcee1'
                and a.get('accepted_predecessor_run')==44192981282
                and a.get('qualified_W0B2B_run')==44180157170
                and a.get('qualified_W0C0_run')==44192981282
                and a.get('expected_source_reports')==a.get('expected_consumer_reports')==2
                and a.get('independent_controls')==3
                and a.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                and ((s['last_qualified']['gate']=='P3-M4-W0C0'
                      and s['last_qualified']['attempt']=='R2'
                      and s['last_qualified']['run_id']==44192981282
                      and s['last_qualified']['qualification'] is True
                      and s['accepted_anchors'][-1]==s['last_qualified'])
                     if a['status']=='PENDING_STRICT_CI'
                     else (s['last_qualified']==a and s['accepted_anchors'][-1]==a)),
                'W0C1 R1 exact source/consumer contract or accepted predecessor drift')
        require(a['original_frozen_contract']=='research/quantum-information/BFSS_QIT_SCC_W0C1_R1_ORIGINAL_COMMUTATOR_TRACE_WITNESS_PRE_GATE_2026_11_17.md'
                and blob(root/a['original_frozen_contract'])=='800b6defbf23ef4dfcba3d5e345d186aff3c3208'
                and blob(root/a['prospective_receipt'])=='7d585894a12e92b4295f5e3ed99bda0131176aa9',
                'W0C1 original pre-gate plan or final Source48 namespace addendum changed')
        red=s.get('previous_active_W0C1_R1_RED',{})
        require(red.get('gate')=='P3-M4-W0C1' and red.get('attempt')=='R1'
                and red.get('run_id')==44204390734 and red.get('status')=='NATIVE_SOURCE_RED_UNQUALIFIED'
                and red.get('qualification') is False
                and red.get('native_red_count')==1
                and red.get('tested_sha')=='38898e1198d5f0d1ad7f10b43e9e58830e007d19'
                and red.get('source_blob')=='bdcef8cd83feda4fda905092649c7411a2456f9e'
                and red.get('consumer_blob')=='9563e06c058771fec4be3b322be48799f38be231'
                and red.get('workflow_blob')=='61341d74095497e43f69c05234f129c21868ed65'
                and red.get('evidence_archive_blob')=='b9c846a1ef7abdecc8d5e627c5a9921a903bbf14'
                and red.get('evidence_job_log_blob')=='f60230b28a2f3bf76711ad81dc6e25d4f66a9f0d'
                and red.get('evidence_manifest_blob')=='e2a4c11096067471c6a8a2ebb7e2160d66e21b9f'
                and red.get('preservation_run')==44207291646
                and a.get('previous_red_run')==44204390734
                and a.get('previous_red_preservation_run')==44207291646
                and a.get('previous_red_artifact_sha256')=='006cbbca5679d7891d800851aabe160df014ab0f089500f059ef1999f688d884',
                'W0C1 R1 original native RED preserved evidence/STOP count drift')
        for kind in ('source','consumer','workflow','evidence_archive','evidence_job_log','evidence_manifest'):
            require(blob(root/red[kind])==red[kind+'_blob'],'W0C1 original R1 RED evidence drift '+kind)
        import zipfile
        raw=(root/red['evidence_archive']).read_bytes()
        require(len(raw)==19367
                and hashlib.sha256(raw).hexdigest()==red['artifact_sha256'],
                'W0C1 R1 native RED ZIP SHA/size drift')
        with zipfile.ZipFile(root/red['evidence_archive']) as z:
            require(z.testzip() is None
                    and set(z.namelist())=={'preflight.log','cold-source.log','tested-commit.txt'}
                    and z.read('tested-commit.txt').decode().strip()==red['tested_sha']
                    and 'unsolved goals' in z.read('cold-source.log').decode()
                    and '⊢ 0 • 1 = 0' in z.read('cold-source.log').decode(),
                    'W0C1 R1 native RED witness/error or provider archive corrupt')
        require('unsolved goals' in (root/red['evidence_job_log']).read_text()
                and 'exact zero_smul ℂ (1 : Op)' in (root/a['source']).read_text()
                and 'by simp [hz0]' not in (root/a['source']).read_text(),
                'W0C1 R2 one-line zero-smul typed proof repair or prior RED lost')
        require(blob(root/'research/quantum-information/BFSS_QIT_SCC_W0C1_R1_SOURCE48_SCOPE_PRE_STAGE_ADDENDUM_2026_11_17.md')=='1fe248e35d18fafbee557a78f79bf1fee3dd5e42',
                'W0C1 original R1 namespace addendum not preserved')
        predecessor=next((x for x in s['accepted_anchors'] if x.get('gate')=='P3-M4-W0C0' and x.get('run_id')==44192981282),{})
        schur=next((x for x in s['accepted_anchors'] if x.get('gate')=='P3-M4-W0B2B'),{})
        require(schur.get('run_id')==44180157170
                and schur.get('status')=='GREEN_QUALIFIED'
                and schur.get('source_blob')=='6d5fbe98aa8d660c9b7c680efefde02501d8e253'
                and schur.get('consumer_blob')=='68e1fe906d2d498f01baf56db7879c2697596c1c'
                and schur.get('workflow_blob')=='ce8fd612a8c23ffe5fc86aa61fdc480c3a2e8f8f'
                and schur.get('evidence_archive_blob')=='f8133dba86db582f5d302885c7c134b3e2ff043a'
                and schur.get('evidence_job_log_blob')=='76e06a033b2e3dacc6dbf9ae7c7c6280b1d4a07b'
                and schur.get('evidence_manifest_blob')=='8770fa58b313985267fb710abb58fd3a282d7712'
                and schur.get('preservation_run')==44182808147,
                'W0C1 original W0B2B Schur commutant donor unqualified or altered')
        require(predecessor.get('source_blob')=='96d3b63d08413f880d1adf0cef8b8e291f7b9453'
                and predecessor.get('consumer_blob')=='fe9136065179d706c60871ae16e02b8f60e1b189'
                and predecessor.get('workflow_blob')=='b36fb1ae5b76a3b611292ac9ac4c11ca59509bde'
                and predecessor.get('evidence_archive_blob')=='4992a5444441022a998afc26324551a273b747c9'
                and predecessor.get('evidence_job_log_blob')=='d269402e6bb231c58f49eacc68a76c50ffe1aa5d'
                and predecessor.get('evidence_manifest_blob')=='0243686ca56af184824568a38c3a646141c19a1d'
                and predecessor.get('preservation_run')==44197140876,
                'W0C1 original W0C0 trace donor not independently preserved')
        for donor in (schur,predecessor):
            for kind in ('source','consumer','workflow','evidence_archive','evidence_job_log','evidence_manifest'):
                require(blob(root/donor[kind])==donor[kind+'_blob'],
                        'W0C1 original accepted donor source/evidence altered '+kind)
        for path,expected in (
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/T1OriginalFockTraceInvariance.lean','3be6c9a6f2898484df66690f94fdfa1877660897'),
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2cNonzeroOriginalGaugeVacuum.lean','a16d3573b737bb4453e42b0b543d63cbbac1cd1b'),
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4BFermionLinearTransportProbe.lean','e55fcbb58ce4d3776bddefdd6d11ad83560bb75c')):
            require(blob(root/path)==expected,'W0C1 original T1/OP2c vacuum donor changed '+path)
        import zipfile
        for donor,size,digest,tested,cold in (
            (schur,14293,'90049da54aee06c9cc649b1577059f10c440c037de3689e25b5da9314b7623a6','e5b93b53ba9917374e39b79dac4e808f44ad615c','Build completed successfully (9134 jobs).'),
            (predecessor,19089,'37cd7da40243fff8833524789de91314a5bf21bf273a086f96cb81669679c8e1','d193649342bb543faa91bf559db0b953c6ec2dcd','Build completed successfully (9218 jobs).')):
            raw=(root/donor['evidence_archive']).read_bytes()
            require(len(raw)==size and hashlib.sha256(raw).hexdigest()==digest,
                    'W0C1 original qualified provider ZIP changed')
            with zipfile.ZipFile(root/donor['evidence_archive']) as z:
                require(z.testzip() is None
                        and set(z.namelist())=={'auditor.log','cold-source.log','consumer.log','preflight.log','source-axioms.log','tested-commit.txt'}
                        and z.read('tested-commit.txt').decode().strip()==tested
                        and cold in z.read('cold-source.log').decode(),
                        'W0C1 original donor ZIP CRC/member/cold source mismatch')
        require(s.get('previous_active_W0C0_R1_RED',{}).get('run_id')==44184526501
                and s.get('w0c0_r2_first_preflight_red',{}).get('run_id')==44190799433
                and s.get('w0c0_r2_second_preflight_red',{}).get('run_id')==44191695033
                and s.get('w0c0_r2_green_preservation_harness_red',{}).get('run_id')==44196763215
                and s.get('previous_active_W0B1_R2_stopped',{}).get('stopped') is True,
                'W0C1 erased historical original negative evidence')
        for key in ('previous_active_W0C0_R1_RED','w0c0_r2_first_preflight_red','w0c0_r2_second_preflight_red'):
            red=s[key]
            for kind in ('evidence_archive','evidence_job_log','evidence_manifest'):
                require(blob(root/red[kind])==red[kind+'_blob'],
                        'W0C1 original historical RED evidence drift '+kind)
        src=(root/a['source']).read_text()
        cons=(root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\b',src))==2
                and len(re.findall(r'(?m)^theorem\b',cons))==2
                and len(re.findall(r'(?m)^example\b',cons))==3
                and 'open FCP.BFSSS1V0' in src
                and 'open FCP.BFSSS1V0' in cons
                and 'originalFockClifford_scalar_operator_unique' in src
                and 'originalFockTrace_scalar_one_eq_zero_iff' in src
                and 'noncomputable def originalFockWitnessSignature' in src
                and 'sourceNormalizedGamma' in src
                and 'map_sub' in src and 'sub_mul' in src and 'mul_sub' in src
                and 'abel' in src and 'CliffordAlgebra.induction' not in src
                and 'maxRecDepth' not in src and 'maxHeartbeats' not in src
                and 'sorry' not in src and 'admit' not in src,
                'W0C1 original 2-root kernel plus injectivity scope drift')
        require(s['next_planned']['gate']=='P3-M4-W0C2'
                and s['next_planned']['status']=='PROSPECTIVE_NOT_STAGED'
                and s['next_planned']['source_staged'] is False
                and s['next_planned']['consumer_staged'] is False
                and s['next_planned']['workflow_staged'] is False,
                'W0C2 cannot be prematurely staged or qualified')

        if a['status']=='GREEN_QUALIFIED':
            require(a.get('attempt')=='R2'
                    and a.get('verdict')=='GREEN' and a.get('strict_outcome')=='success'
                    and a.get('run_id')==44208084307 and a.get('job_id')==134479111962
                    and a.get('tested_sha')=='3f45d2df6c4200086ba2a8ee404d2f4e37524672'
                    and a.get('artifact_id')==14384678894
                    and a.get('artifact_sha256')=='94b561a285577bbe61cf780ecfbf8843415f5b5f11889ae67632c2c29fa51ac1'
                    and a.get('evidence_archive_blob')=='49e33bdd397f1a803b4818044549bbc6d33c3fe3'
                    and a.get('evidence_job_log_blob')=='8f0acb0cc2ddbc1cf525e5ea5973cbed375b09e4'
                    and a.get('evidence_manifest_blob')=='bc464292d81b0d9772436e9859f637b2e1d21db7'
                    and a.get('evidence_preservation_run')==a.get('preservation_run')==44210764881
                    and a.get('source_reports')==a.get('consumer_reports')==2
                    and a.get('independent_controls')==3 and a.get('auditor_negative_tests')==6
                    and a.get('cold_build_jobs')==9230
                    and a.get('strict_marker')=='BFSS_W0C1_R2_ORIGINAL_FOCK_WITNESS_2_SOURCE_2_CONSUMER_3_CONTROLS_SIX_MUTANTS_STRICT_GREEN'
                    and a.get('receipt')=='research/quantum-information/BFSS_QIT_SCC_W0C1_R2_GREEN_44208084307_ACCEPTANCE_2026_11_17.md'
                    and s['last_qualified']==a and s['accepted_anchors'][-1]==a,
                    'W0C1 R2 strict original-source witness canonical acceptance drift')
            previous=s.get('previous_active_W0C1_R2_pending',{})
            require(previous.get('gate')=='P3-M4-W0C1'
                    and previous.get('attempt')=='R2'
                    and previous.get('status')=='PENDING_STRICT_CI'
                    and previous.get('qualification') is False
                    and previous.get('source_blob')==a['source_blob']
                    and previous.get('consumer_blob')==a['consumer_blob']
                    and previous.get('workflow_blob')==a['workflow_blob'],
                    'W0C1 R2 original pending checkpoint lost')
            idx=s.get('last_qualified_source_exact_original_BFSS',{})
            require(idx.get('gate')=='P3-M4-W0C1'
                    and idx.get('run_id')==44208084307
                    and idx.get('qualification') is True
                    and idx.get('evidence_archive_blob')==a['evidence_archive_blob'],
                    'W0C1 source-exact original qualification index drift')
            require(blob(root/a['receipt'])=='8ff22b9a55fd86e9732679cac596d895a30c5565',
                    'W0C1 original qualified receipt not pinned')
            for kind in ('source','consumer','workflow','evidence_archive','evidence_job_log','evidence_manifest'):
                require(blob(root/a[kind])==a[kind+'_blob'],
                        'W0C1 R2 original qualified source/consumer/evidence Git hash drift '+kind)
            raw=(root/a['evidence_archive']).read_bytes()
            full=(root/a['evidence_job_log']).read_bytes()
            require(len(raw)==19649
                    and hashlib.sha256(raw).hexdigest()==a['artifact_sha256']
                    and len(full)==322152
                    and hashlib.sha256(full).hexdigest()=='090effde9440dc0f227833a0039b0ec4efec2651e3d8b6327c9c41479f1c9371',
                    'W0C1 original provider ZIP or full Actions transcript SHA-256 mismatch')
            manifest=json.loads((root/a['evidence_manifest']).read_text())
            require(manifest.get('gate')=='P3-M4-W0C1'
                    and manifest.get('attempt')=='R2'
                    and manifest.get('status')=='GREEN_STRICT_PROVIDER_ORIGINAL_UNPROMOTED'
                    and manifest.get('run_id')==a['run_id']
                    and manifest.get('job_id')==a['job_id']
                    and manifest.get('tested_sha')==a['tested_sha']
                    and manifest.get('artifact_id')==a['artifact_id']
                    and manifest.get('source_blob')==a['source_blob']
                    and manifest.get('consumer_blob')==a['consumer_blob']
                    and manifest.get('workflow_blob')==a['workflow_blob']
                    and manifest['original_zip']['size']==len(raw)
                    and manifest['original_zip']['sha256']==a['artifact_sha256']
                    and manifest['original_job_log']['size']==len(full)
                    and manifest['original_job_log']['sha256']=='090effde9440dc0f227833a0039b0ec4efec2651e3d8b6327c9c41479f1c9371'
                    and manifest.get('source_reports')==manifest.get('consumer_reports')==2
                    and manifest.get('independent_controls')==3
                    and manifest.get('negative_mutants')==6
                    and manifest.get('cold_build_jobs')==9230
                    and manifest.get('strict_marker')==a['strict_marker']
                    and manifest.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                    and manifest.get('accepted_predecessor_run')==44192981282
                    and manifest.get('qualified_W0B2B_run')==44180157170
                    and manifest.get('prior_W0C1_R1_native_red_run')==44204390734
                    and manifest.get('prior_W0C1_R1_preservation_run')==44207291646,
                    'W0C1 original six-member evidence manifest drift')
            import zipfile
            allowed={'propext','Classical.choice','Quot.sound'}
            pat=re.compile(r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)")
            names={'auditor.log','cold-source.log','consumer.log','preflight.log','source-axioms.log','tested-commit.txt'}
            with zipfile.ZipFile(root/a['evidence_archive']) as z:
                require(z.testzip() is None and set(z.namelist())==names
                        and len(manifest['original_zip']['members'])==6,
                        'W0C1 original provider ZIP membership/CRC failure')
                for item in manifest['original_zip']['members']:
                    data=z.read(item['name'])
                    require(len(data)==item['size']
                            and hashlib.sha256(data).hexdigest()==item['sha256']
                            and format(z.getinfo(item['name']).CRC,'08x')==item['crc32'],
                            'W0C1 original provider ZIP member SHA/CRC mismatch '+item['name'])
                require(z.read('tested-commit.txt').decode().strip()==a['tested_sha']
                        and 'Build completed successfully (9230 jobs).' in z.read('cold-source.log').decode()
                        and 'BFSS_W0C1_R2_W0B2B_W0C0_ORIGINAL_SOURCE_EXACT_GREEN_AND_REDS_PREFLIGHT_PASS' in z.read('preflight.log').decode()
                        and a['strict_marker'] in z.read('auditor.log').decode(),
                        'W0C1 original full cold source, preflight or auditor result mismatch')
                for name,expected in (
                    ('source-axioms.log',['originalFockWitness_kernel_zero',
                                         'originalFockWitnessSignature_injective']),
                    ('consumer.log',['originalFockWitness_kernel_zero_consumer',
                                     'originalFockWitnessSignature_injective_consumer'])):
                    report=z.read(name).decode()
                    roots=pat.findall(report)
                    require('error:' not in report and 'sorryAx' not in report
                            and len(roots)==2
                            and [n.rsplit('.',1)[-1] for n,_ in roots]==expected
                            and len({n for n,_ in roots})==2
                            and all({x.strip() for x in axioms.split(',') if x.strip()}<=allowed for _,axioms in roots),
                            'W0C1 original source/independent consumer 4 axiom roots invalid '+name)
            # The complete Actions transcript echoes deliberate auditor mutations. Its
            # literal sorryAx occurrence is NOT the original theorem axiom report.
            require(b'Build completed successfully (9230 jobs).' in full
                    and a['strict_marker'].encode() in full
                    and b'BFSS_W0C1_R2_W0B2B_W0C0_ORIGINAL_SOURCE_EXACT_GREEN_AND_REDS_PREFLIGHT_PASS' in full,
                    'W0C1 original complete Actions log missing source success markers')
    if a['gate']=='P3-M4-W0C2A':
        # Only source-exact conditional Lie-defect trace and centralizer
        # reduction; NOT the original K Lie bracket or physical Spin9.
        require(a.get('attempt')=='R1'
                and a.get('status') in {'PENDING_STRICT_CI','GREEN_QUALIFIED'}
                and a.get('qualification') == (a['status']=='GREEN_QUALIFIED')
                and a.get('first_atom')=='ORIGINAL_REAL_SKEW_MATRIX_COMMUTATOR_SKEW_TRACeless_K_LIE_DEFECT_AND_CONDITIONAL_W0C1_ZERO_KERNEL'
                and a.get('contract_commit')=='3084f8598e1722420786d0d5249a56ac7710cd5b'
                and a.get('source_blob')=='51c4b4ab238bcc0f897822a7da4d9fc74dfd55fb'
                and a.get('consumer_blob')=='4ddacfbe1ee1d7d55b321f4cb9c0d6d462261aec'
                and a.get('workflow_blob')=='c1a18092b61cb05c08e08231ce10daadce99de45'
                and a.get('prospective_receipt')=='research/quantum-information/BFSS_QIT_SCC_W0C2A_ORIGINAL_BIVECTOR_DEFECT_REDUCTION_PRE_GATE_2026_11_17.md'
                and blob(root/a['prospective_receipt'])=='8f8994200d1321053feaea80f307d72f5b2e901e'
                and a.get('accepted_predecessor_run')==44208084307
                and a.get('qualified_CT0_run')==43983772199
                and a.get('qualified_W0C1_run')==44208084307
                and a.get('expected_source_reports')==a.get('expected_consumer_reports')==3
                and a.get('independent_controls')==3
                and a.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                and ((s['last_qualified']['gate']=='P3-M4-W0C1'
                      and s['last_qualified']['attempt']=='R2'
                      and s['last_qualified']['run_id']==44208084307
                      and s['last_qualified']['qualification'] is True
                      and s['accepted_anchors'][-1]==s['last_qualified'])
                     if a['status']=='PENDING_STRICT_CI'
                     else (s['last_qualified']==a and s['accepted_anchors'][-1]==a)),
                'W0C2A original source exact conditional-defect contract or accepted predecessor drift')
        w0c1=next((x for x in s['accepted_anchors'] if x.get('gate')=='P3-M4-W0C1' and x.get('run_id')==44208084307),{})
        ct0=next((x for x in s['accepted_anchors'] if x.get('gate')=='P3-M4-CT0'),{})
        require(w0c1.get('source_blob')=='5fafaa3d73d3761719ea160466b40d94b85d74db'
                and w0c1.get('consumer_blob')=='85e8067c892bc52533f6a3ecc1f099010efac4ae'
                and w0c1.get('workflow_blob')=='c9db16b6c55239f3c8235a70f623ca9f929dcee1'
                and w0c1.get('evidence_archive_blob')=='49e33bdd397f1a803b4818044549bbc6d33c3fe3'
                and w0c1.get('evidence_job_log_blob')=='8f0acb0cc2ddbc1cf525e5ea5973cbed375b09e4'
                and w0c1.get('evidence_manifest_blob')=='bc464292d81b0d9772436e9859f637b2e1d21db7'
                and w0c1.get('preservation_run')==44210764881
                and ct0.get('run_id')==43983772199
                and ct0.get('status')=='GREEN_QUALIFIED'
                and ct0.get('qualification') is True
                and ct0.get('source_blob')=='a6f93c62c83bf51a0b89691196f875399d2896fa'
                and ct0.get('consumer_blob')=='f2ddadc880c62632dd91547526ee97bc92a0d504'
                and ct0.get('workflow_blob')=='ff7a9b5c612ee9a6050cc3622b7004150b03f46c'
                and ct0.get('evidence_archive_blob')=='e0e0f0da963b7895eae425f4392b3b12866a2116'
                and ct0.get('evidence_job_log_blob')=='a8f63cfafe8a914b9b155f43d213b7e3fd218ac1'
                and ct0.get('evidence_manifest_blob')=='83db728c5e087968086ed58bae492952315c03cd',
                'W0C2A original W0C1 or CT0 evidence unqualified or missing')
        for donor in (w0c1,ct0):
            for kind in ('source','consumer','workflow','evidence_archive','evidence_job_log','evidence_manifest'):
                require(blob(root/donor[kind])==donor[kind+'_blob'],
                        'W0C2A accepted original trace/witness donor Git byte drift '+kind)
        require(blob(root/'lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean')=='c2e7a7c665121283cde13ae5dabc183362b6b420'
                and s.get('previous_active_W0C1_R1_RED',{}).get('run_id')==44204390734
                and s.get('previous_active_W0C1_R1_RED',{}).get('preservation_run')==44207291646
                and blob(root/'research/quantum-information/diagnostics/BFSS_M4_W0C1_R1_44204390734_NATIVE_RED_evidence.zip')=='b9c846a1ef7abdecc8d5e627c5a9921a903bbf14',
                'W0C2A source covariance donor or original R1 native RED changed')
        import zipfile
        original=root/w0c1['evidence_archive']
        raw=original.read_bytes()
        require(len(raw)==19649
                and hashlib.sha256(raw).hexdigest()=='94b561a285577bbe61cf780ecfbf8843415f5b5f11889ae67632c2c29fa51ac1',
                'W0C2A accepted W0C1 original CI ZIP hash mismatch')
        with zipfile.ZipFile(original) as z:
            require(z.testzip() is None
                    and set(z.namelist())=={'auditor.log','cold-source.log','consumer.log','preflight.log','source-axioms.log','tested-commit.txt'}
                    and z.read('tested-commit.txt').decode().strip()=='3f45d2df6c4200086ba2a8ee404d2f4e37524672'
                    and 'Build completed successfully (9230 jobs).' in z.read('cold-source.log').decode(),
                    'W0C2A accepted source-exact witness ZIP content drift')
        src=(root/a['source']).read_text()
        con=(root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\b',src))==3
                and len(re.findall(r'(?m)^theorem\b',con))==3
                and len(re.findall(r'(?m)^example\b',con))==3
                and 'noncomputable def originalSource48K_lieDefect' in src
                and 'hcentral : ∀ k : Source48Label' in src
                and 'originalFockWitness_kernel_zero' in src
                and 'originalSource48BivectorK_skew_trace_zero' in src
                and 'originalFockTrace_mul_comm' in src
                and 'Matrix.transpose_mul' in src
                and 'P3M4QTC1OriginalSourceRealComplexQuarterBridge' not in src
                and 'P3M4CT1G0OriginalFockJacobiSource48Adapter' not in src
                and 'maxRecDepth' not in src and 'maxHeartbeats' not in src
                and 'sorry' not in src and 'admit' not in src,
                'W0C2A scoped conditional-source-defect theorem declarations changed')
        require(s['next_planned']['gate']=='P3-M4-W0C2B'
                and s['next_planned']['status']=='PROSPECTIVE_NOT_STAGED'
                and s['next_planned']['source_staged'] is False
                and s['next_planned']['consumer_staged'] is False
                and s['next_planned']['workflow_staged'] is False
                and s['strategic_focus']['full_bivector_bracket_qualified'] is False,
                'W0C2A conditional reduction must not promote original Lie bracket or W0C2B')

        if a['status']=='GREEN_QUALIFIED':
            require(a.get('attempt')=='R1'
                    and a.get('verdict')=='GREEN' and a.get('strict_outcome')=='success'
                    and a.get('run_id')==44213315719 and a.get('job_id')==134496828078
                    and a.get('tested_sha')=='48e7e58b23c19643c905d16fe69e46d0a7c0a73e'
                    and a.get('artifact_id')==14388057344
                    and a.get('artifact_sha256')=='09bdc60577e56a767738cc85d94c11eafbd9f06a2521f6637b08a09ddd4e9453'
                    and a.get('evidence_archive_blob')=='cb5591ab7ae5762150ea1d10dc093788f812d929'
                    and a.get('evidence_job_log_blob')=='47d03e99bf3e9f4319200ecc02bfb7dc3db69175'
                    and a.get('evidence_manifest_blob')=='6d348101dd6b9feffcf479802248445313973698'
                    and a.get('evidence_preservation_run')==a.get('preservation_run')==44216554946
                    and a.get('source_reports')==a.get('consumer_reports')==3
                    and a.get('independent_controls')==3 and a.get('auditor_negative_tests')==6
                    and a.get('cold_build_jobs')==9239
                    and a.get('strict_marker')=='BFSS_W0C2A_R1_ORIGINAL_FOCK_DEFECT_3_SOURCE_3_CONSUMER_3_CONTROLS_SIX_MUTANTS_STRICT_GREEN'
                    and a.get('receipt')=='research/quantum-information/BFSS_QIT_SCC_W0C2A_R1_GREEN_44213315719_ACCEPTANCE_2026_11_17.md'
                    and s['last_qualified']==a and s['accepted_anchors'][-1]==a,
                    'W0C2A exact original conditional-source-defect acceptance drift')
            previous=s.get('previous_active_W0C2A_R1_pending',{})
            require(previous.get('gate')=='P3-M4-W0C2A' and previous.get('attempt')=='R1'
                    and previous.get('status')=='PENDING_STRICT_CI'
                    and previous.get('qualification') is False
                    and previous.get('source_blob')==a['source_blob']
                    and previous.get('consumer_blob')==a['consumer_blob']
                    and previous.get('workflow_blob')==a['workflow_blob'],
                    'W0C2A original preceding pending checkpoint lost')
            idx=s.get('last_qualified_source_exact_original_BFSS',{})
            require(idx.get('gate')=='P3-M4-W0C2A' and idx.get('run_id')==44213315719
                    and idx.get('qualification') is True
                    and idx.get('evidence_archive_blob')==a['evidence_archive_blob'],
                    'W0C2A source-exact qualification index mismatch')
            require(blob(root/a['receipt'])=='59ee35ff70dffe3520b442f5096a86ec7b7b9207',
                    'W0C2A original qualified acceptance receipt drift')
            for kind in ('source','consumer','workflow','evidence_archive','evidence_job_log','evidence_manifest'):
                require(blob(root/a[kind])==a[kind+'_blob'],
                        'W0C2A accepted source/consumer original provider Git blob changed '+kind)
            original=(root/a['evidence_archive']).read_bytes()
            full=(root/a['evidence_job_log']).read_bytes()
            require(len(original)==20465
                    and hashlib.sha256(original).hexdigest()==a['artifact_sha256']
                    and len(full)==328913
                    and hashlib.sha256(full).hexdigest()=='ace8c7835cf6bae50e67154b6cedbc1928a36ab2666f5267385e436ba644d76f',
                    'W0C2A original provider ZIP or complete Actions transcript SHA-256 mismatch')
            manifest=json.loads((root/a['evidence_manifest']).read_text())
            require(manifest.get('gate')=='P3-M4-W0C2A'
                    and manifest.get('attempt')=='R1'
                    and manifest.get('status')=='GREEN_STRICT_PROVIDER_ORIGINAL_UNPROMOTED'
                    and manifest.get('run_id')==a['run_id']
                    and manifest.get('job_id')==a['job_id']
                    and manifest.get('tested_sha')==a['tested_sha']
                    and manifest.get('artifact_id')==a['artifact_id']
                    and manifest.get('source_blob')==a['source_blob']
                    and manifest.get('consumer_blob')==a['consumer_blob']
                    and manifest.get('workflow_blob')==a['workflow_blob']
                    and manifest['original_zip']['size']==len(original)
                    and manifest['original_zip']['sha256']==a['artifact_sha256']
                    and manifest['original_job_log']['size']==len(full)
                    and manifest['original_job_log']['sha256']=='ace8c7835cf6bae50e67154b6cedbc1928a36ab2666f5267385e436ba644d76f'
                    and manifest.get('source_reports')==manifest.get('consumer_reports')==3
                    and manifest.get('independent_controls')==3
                    and manifest.get('negative_mutants')==6 and manifest.get('cold_build_jobs')==9239
                    and manifest.get('strict_marker')==a['strict_marker']
                    and manifest.get('preflight_marker')=='BFSS_W0C2A_R1_ORIGINAL_W0C1_CT0_SOURCE_EXACT_AND_EVIDENCE_PREFLIGHT_PASS'
                    and manifest.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                    and manifest.get('accepted_predecessor_run')==44208084307
                    and manifest.get('qualified_CT0_run')==43983772199
                    and manifest.get('prior_W0C1_R1_native_red_run')==44204390734
                    and 'unconditional original K Lie bracket NOT PROVED' in manifest.get('claim_ceiling',''),
                    'W0C2A original six-member provider manifest or conditional claim drift')
            import zipfile
            allowed={'propext','Classical.choice','Quot.sound'}
            pat=re.compile(r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)")
            names={'auditor.log','cold-source.log','consumer.log','preflight.log','source-axioms.log','tested-commit.txt'}
            with zipfile.ZipFile(root/a['evidence_archive']) as z:
                require(z.testzip() is None and set(z.namelist())==names
                        and len(manifest['original_zip']['members'])==6,
                        'W0C2A original provider ZIP membership or CRC failure')
                for item in manifest['original_zip']['members']:
                    data=z.read(item['name'])
                    require(len(data)==item['size']
                            and hashlib.sha256(data).hexdigest()==item['sha256']
                            and format(z.getinfo(item['name']).CRC,'08x')==item['crc32'],
                            'W0C2A original provider ZIP member SHA/CRC mismatch '+item['name'])
                require(z.read('tested-commit.txt').decode().strip()==a['tested_sha']
                        and 'Build completed successfully (9239 jobs).' in z.read('cold-source.log').decode()
                        and manifest['preflight_marker'] in z.read('preflight.log').decode()
                        and a['strict_marker'] in z.read('auditor.log').decode(),
                        'W0C2A original cold source/preflight/auditor evidence mismatch')
                for name,expected in (
                    ('source-axioms.log',['originalSource48_matrix_commutator_skew',
                                         'originalSource48K_lieDefect_trace_zero',
                                         'originalSource48K_lieBracket_of_defect_central']),
                    ('consumer.log',['originalSource48_matrix_commutator_skew_consumer',
                                     'originalSource48K_lieDefect_trace_zero_consumer',
                                     'originalSource48K_lieBracket_of_defect_central_consumer'])):
                    report=z.read(name).decode()
                    roots=pat.findall(report)
                    require('error:' not in report and 'sorryAx' not in report
                            and len(roots)==3
                            and [n.rsplit('.',1)[-1] for n,_ in roots]==expected
                            and len({n for n,_ in roots})==3
                            and all({x.strip() for x in axioms.split(',') if x.strip()}<=allowed for _,axioms in roots),
                            'W0C2A source/consumer original allowed axioms or independent roots invalid '+name)
            # Complete Actions logs echo deliberately failing auditor mutations.
            # No full-log sorryAx substring test; only the six genuine report roots count.
            require(b'Build completed successfully (9239 jobs).' in full
                    and a['strict_marker'].encode() in full
                    and manifest['preflight_marker'].encode() in full,
                    'W0C2A original complete Actions log lacks source or audit success')
    if a['gate']=='P3-M4-W0C2B0':
        # Real-source coefficient contraction on exact original Fermion 2
        # does not discharge nested K(A),K(B) Jacobi or full Lie bracket.
        require(a.get('attempt')=='R2'
                and a.get('status')=='BLOCKED'
                and a.get('qualification') is False
                and a.get('stopped') is True
                and a.get('native_red_count')==2
                and a.get('verdict')=='STOPPED_AFTER_TWO_NATIVE_REDS'
                and a.get('stop_rule')=='STOP_CURRENT_COEFFICIENT_LAYOUT_AFTER_TWO_ANALOGOUS_NATIVE_REDS'
                and a.get('first_atom')=='ORIGINAL_FOCK_REAL_SMUL_COMMUTATOR_PLUS_FINITE_REAL_MATRIX_COEFFICIENT_CONTRACTION_AND_EXACT_SOURCE48_GAMMAS'
                and a.get('contract_commit')=='67a31cf3adca9dc8bda755e94c75c24582b0efb9'
                and a.get('source_blob')=='0a75a24387c2a50f14ed5698575cf2c670a864c1'
                and a.get('consumer_blob')=='cc03e80af0573315f07a5d079c177a8ad279c559'
                and a.get('workflow_blob')=='0d68b23bc98aef28870d050397e02d02af26e6bb'
                and a.get('prospective_receipt')=='research/quantum-information/BFSS_QIT_SCC_W0C2B0_R2_REAL_SUM_SMUL_SOURCE_REPAIR_PRE_GATE_2026_11_17.md'
                and blob(root/a['prospective_receipt'])=='18b55118c74bf613efaaad2953d990b1a83c3372'
                and a.get('accepted_predecessor_run')==44213315719
                and a.get('qualified_W0C2A_run')==44213315719
                and a.get('qualified_LB1C1_run')==43901524171
                and a.get('qualified_QTC0A_run')==44001621836
                and a.get('expected_source_reports')==a.get('expected_consumer_reports')==3
                and a.get('independent_controls')==3
                and a.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                and s['last_qualified']['gate']=='P3-M4-W0C2A'
                and s['last_qualified']['attempt']=='R1'
                and s['last_qualified']['run_id']==44213315719
                and s['last_qualified']['qualification'] is True
                and s['accepted_anchors'][-1]==s['last_qualified'],
                'W0C2B0 real coefficient source-exact pending donor/checkpoint drift')
        red=s.get('previous_active_W0C2B0_R1_RED',{})
        require(red.get('gate')=='P3-M4-W0C2B0' and red.get('attempt')=='R1'
                and red.get('run_id')==44218523669
                and red.get('status')=='NATIVE_SOURCE_RED_UNQUALIFIED'
                and red.get('qualification') is False
                and red.get('native_red_count')==1
                and red.get('tested_sha')=='f52bef1a52636bf51945d431c164f0f7ad28c6ce'
                and red.get('source_blob')=='4846915b6d6f99e765a1ec28f9286295d7db2571'
                and red.get('consumer_blob')=='ee6224071561e675d276e9d3a8d2bd865e87d7d6'
                and red.get('workflow_blob')=='341b3ad5ae1b381db1ca6e297110cfd5783472a6'
                and red.get('evidence_archive_blob')=='4117bd19a0a8d1614df176e72d69a9b628de19da'
                and red.get('evidence_job_log_blob')=='6736a0b404bc31eaa4b7bae58ff78d0bd0b232f7'
                and red.get('evidence_manifest_blob')=='ba36b8a4862ca4d0931d9dac86761a893a3e48ac'
                and red.get('preservation_run')==44221612711
                and a.get('previous_red_run')==44218523669
                and a.get('previous_red_preservation_run')==44221612711
                and a.get('previous_red_zip_sha256')=='02722db3e4d82c68bed20f980bc2f1b3400b7ed47604cc6f6463b0761d0b5ddb',
                'W0C2B0 original R1 native RED / stop count evidence drift')
        for kind in ('source','consumer','workflow','evidence_archive','evidence_job_log','evidence_manifest'):
            require(blob(root/red[kind])==red[kind+'_blob'],
                    'W0C2B0 R1 original RED evidence bytes changed '+kind)
        import zipfile
        raw=(root/red['evidence_archive']).read_bytes()
        require(len(raw)==20778
                and hashlib.sha256(raw).hexdigest()==red['artifact_sha256'],
                'W0C2B0 original R1 provider ZIP SHA size changed')
        with zipfile.ZipFile(root/red['evidence_archive']) as z:
            require(z.testzip() is None
                    and set(z.namelist())=={'preflight.log','cold-source.log','tested-commit.txt'}
                    and z.read('tested-commit.txt').decode().strip()==red['tested_sha']
                    and 'unsolved goals' in z.read('cold-source.log').decode()
                    and 'maximum recursion depth has been reached' in z.read('cold-source.log').decode(),
                    'W0C2B0 R1 native RED provider member error content mismatch')
        full=(root/red['evidence_job_log']).read_bytes()
        require(len(full)==333680
                and hashlib.sha256(full).hexdigest()=='45b35f48b127d04d0d28e81b3b2aa03466ae589288b35223fba8f33b67797616',
                'W0C2B0 original R1 complete Actions log checksum drift')
        require(blob(root/'research/quantum-information/BFSS_QIT_SCC_W0C2B0_ORIGINAL_REAL_COEFFICIENT_CONTRACTION_PRE_GATE_2026_11_17.md')=='78dc5e410203b0a8b35b462764ba94c5c6c21498',
                'W0C2B0 original R1 frozen contract was altered')
        r2=s.get('previous_active_W0C2B0_R2_RED',{})
        require(r2.get('gate')=='P3-M4-W0C2B0'
                and r2.get('attempt')=='R2'
                and r2.get('status')=='NATIVE_SOURCE_RED_UNQUALIFIED'
                and r2.get('qualification') is False
                and r2.get('run_id')==a.get('run_id')==44222678258
                and r2.get('job_id')==a.get('job_id')==134528155435
                and r2.get('tested_sha')==a.get('tested_sha')=='105086fe87d17f79f75641878a6b9218db05167d'
                and r2.get('artifact_id')==a.get('artifact_id')==14391499234
                and r2.get('artifact_sha256')==a.get('artifact_sha256')=='9f7c56be541406843d1b5556c687f0500a4bb8112fc65867559f16fc70fff266'
                and r2.get('source_blob')==a['source_blob']
                and r2.get('consumer_blob')==a['consumer_blob']
                and r2.get('workflow_blob')==a['workflow_blob']
                and r2.get('evidence_archive_blob')==a.get('evidence_archive_blob')=='3f15c1c8bcf0e057e3de2055abc6ec00e8b931ec'
                and r2.get('evidence_job_log_blob')==a.get('evidence_job_log_blob')=='d20cb3c7e2239fd63922a1afb70b86e2e8734088'
                and r2.get('evidence_manifest_blob')==a.get('evidence_manifest_blob')=='850033634128dc24705404a5b086c3fbda3725e1'
                and r2.get('preservation_run')==a.get('preservation_run')==44224922749
                and r2.get('native_red_count')==2
                and r2.get('consumer_executed') is False
                and r2.get('stop_rule')=='STOP_CURRENT_COEFFICIENT_LAYOUT_AFTER_TWO_ANALOGOUS_NATIVE_REDS',
                'W0C2B0 second original native RED or STOP evidence drift')
        require(a.get('stop_receipt')=='research/quantum-information/BFSS_QIT_SCC_W0C2B0_R1_R2_TWO_NATIVE_REDS_STOP_AND_COMPLEX_CARRIER_ROUTE_2026_11_17.md'
                and blob(root/a['stop_receipt'])=='f501b81ab0305ba821a4ac72b041c2e11e353dea'
                and a.get('previous_red_run')==44218523669
                and a.get('previous_red_preservation_run')==44221612711,
                'W0C2B0 R1/R2 decision receipt or source history changed')
        for kind in ('source','consumer','workflow','evidence_archive','evidence_job_log','evidence_manifest'):
            require(blob(root/r2[kind])==r2[kind+'_blob'],
                    'W0C2B0 original R2 native RED frozen file changed '+kind)
        raw2=(root/r2['evidence_archive']).read_bytes()
        log2=(root/r2['evidence_job_log']).read_bytes()
        require(len(raw2)==20434
                and hashlib.sha256(raw2).hexdigest()==r2['artifact_sha256']
                and len(log2)==333135
                and hashlib.sha256(log2).hexdigest()=='bffab9a103f67d8c3080be2a39124c5e68bc2a65502ab9ddb1e04daaa301ed46',
                'W0C2B0 original R2 ZIP or full Actions job log SHA-256 changed')
        r2manifest=json.loads((root/r2['evidence_manifest']).read_text())
        require(r2manifest.get('run_id')==44222678258
                and r2manifest.get('tested_sha')==r2['tested_sha']
                and r2manifest.get('status')=='NATIVE_SOURCE_RED_UNQUALIFIED'
                and r2manifest.get('native_mathematical_red_count')==2
                and r2manifest.get('stop_rule')==r2['stop_rule']
                and r2manifest['original_zip']['sha256']==r2['artifact_sha256']
                and r2manifest['original_job_log']['sha256']=='bffab9a103f67d8c3080be2a39124c5e68bc2a65502ab9ddb1e04daaa301ed46'
                and len(r2manifest['original_zip']['members'])==3,
                'W0C2B0 original R2 native RED member digest or stop manifest changed')
        import zipfile
        with zipfile.ZipFile(root/r2['evidence_archive']) as z:
            require(z.testzip() is None
                    and set(z.namelist())=={'preflight.log','cold-source.log','tested-commit.txt'}
                    and z.read('tested-commit.txt').decode().strip()==r2['tested_sha'],
                    'W0C2B0 R2 provider ZIP missing original test evidence')
            for member in r2manifest['original_zip']['members']:
                data=z.read(member['name'])
                require(len(data)==member['size']
                        and hashlib.sha256(data).hexdigest()==member['sha256']
                        and format(z.getinfo(member['name']).CRC,'08x')==member['crc32'],
                        'W0C2B0 R2 original ZIP member hash/CRC changed '+member['name'])
            source_log=z.read('cold-source.log').decode()
            require(all(x in source_log for x in (
                    'OriginalRealFockCoefficientContractionR2.lean:56:',
                    'OriginalRealFockCoefficientContractionR2.lean:58:',
                    'OriginalRealFockCoefficientContractionR2.lean:74:',
                    'maximum recursion depth has been reached','sorryAx')),
                    'W0C2B0 R2 verified native source diagnostics drift')
        require(s['last_qualified']['gate']=='P3-M4-W0C2A'
                and s['last_qualified']['run_id']==44213315719
                and s['last_qualified']['status']=='GREEN_QUALIFIED'
                and len(s['accepted_anchors'])==24,
                'W0C2B0 STOP must preserve 24 accepted anchors')
        donor=s['last_qualified']
        require(donor.get('source_blob')=='51c4b4ab238bcc0f897822a7da4d9fc74dfd55fb'
                and donor.get('consumer_blob')=='4ddacfbe1ee1d7d55b321f4cb9c0d6d462261aec'
                and donor.get('workflow_blob')=='c1a18092b61cb05c08e08231ce10daadce99de45'
                and donor.get('evidence_archive_blob')=='cb5591ab7ae5762150ea1d10dc093788f812d929'
                and donor.get('evidence_job_log_blob')=='47d03e99bf3e9f4319200ecc02bfb7dc3db69175'
                and donor.get('evidence_manifest_blob')=='6d348101dd6b9feffcf479802248445313973698'
                and donor.get('preservation_run')==44216554946
                and donor.get('cold_build_jobs')==9239,
                'W0C2B0 exact W0C2A original provider evidence missing')
        for kind in ('source','consumer','workflow','evidence_archive','evidence_job_log','evidence_manifest'):
            require(blob(root/donor[kind])==donor[kind+'_blob'],
                    'W0C2B0 original accepted W0C2A donor altered '+kind)
        for path,expected in (
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4QTC0AOriginalFockWeightedQuadraticCovariance.lean','b0b519e46566856e100bf6aa882f9fcdf37d397e'),
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean','c2e7a7c665121283cde13ae5dabc183362b6b420'),
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4QTC0CAbstractCoefficientContraction.lean','9448c9a47c605cb6aba2cfc798ae28a0213c9411'),
            ('research/quantum-information/diagnostics/BFSS_M4_W0C1_R1_44204390734_NATIVE_RED_evidence.zip','b9c846a1ef7abdecc8d5e627c5a9921a903bbf14')):
            require(blob(root/path)==expected,'W0C2B0 original qualified or native RED history changed '+path)
        import zipfile
        original=root/donor['evidence_archive']
        raw=original.read_bytes()
        require(len(raw)==20465
                and hashlib.sha256(raw).hexdigest()=='09bdc60577e56a767738cc85d94c11eafbd9f06a2521f6637b08a09ddd4e9453',
                'W0C2B0 qualified W0C2A original ZIP hash mismatch')
        with zipfile.ZipFile(original) as z:
            require(z.testzip() is None
                    and set(z.namelist())=={'auditor.log','cold-source.log','consumer.log','preflight.log','source-axioms.log','tested-commit.txt'}
                    and z.read('tested-commit.txt').decode().strip()=='48e7e58b23c19643c905d16fe69e46d0a7c0a73e'
                    and 'Build completed successfully (9239 jobs).' in z.read('cold-source.log').decode(),
                    'W0C2B0 previously qualified original ZIP member integrity drift')
        src=(root/a['source']).read_text()
        con=(root/a['consumer']).read_text()
        require(len(re.findall(r'(?m)^theorem\b',src))==3
                and len(re.findall(r'(?m)^theorem\b',con))==3
                and len(re.findall(r'(?m)^example\b',con))==3
                and 'originalFockOperator_real_smul_eq_complex_smul' in src
                and 'originalFock_commutator_complex_smul' in src
                and 'originalFock_real_left_matrix_contraction' in src
                and 'originalFock_real_sum_smul' in src
                and 'originalFock_real_sub_smul' in src
                and 'exact (originalFock_real_sum_smul' in src
                and 'exact (originalFock_real_sub_smul' in src
                and 'Finset.sum_comm' in src
                and 'Matrix.mul_apply' in src
                and 'originalSource48_gamma_real_bracket_contraction' in src
                and 'sourceNormalizedGamma' in src
                and 'P3M4QTC1OriginalSourceRealComplexQuarterBridge' not in src
                and 'P3M4CT1G0OriginalFockJacobiSource48Adapter' not in src
                and 'CliffordAlgebra.induction' not in src
                and 'maxRecDepth' not in src and 'maxHeartbeats' not in src
                and 'sorry' not in src and 'admit' not in src,
                'W0C2B0 exact real Fock coefficient contraction scope drift')
        require(s['next_planned']['gate']=='P3-M4-W0C2B0M'
                and s['next_planned']['status']=='PROSPECTIVE_NOT_STAGED'
                and s['next_planned']['source_staged'] is False
                and s['next_planned']['consumer_staged'] is False
                and s['next_planned']['workflow_staged'] is False
                and s['strategic_focus']['full_bivector_bracket_qualified'] is False,
                'W0C2B0 must not claim centrality, full bracket or stage B1 prematurely')
    if a['gate']=='P3-M4-W0C2B0M':
        # New complex-only W0C2B0M R2: bounded explicit lemma repair after exact native R1 RED.
        require(a.get('attempt')=='R2'
                and a.get('status') in {'PENDING_STRICT_CI','GREEN_QUALIFIED'}
                and a.get('qualification') == (a['status']=='GREEN_QUALIFIED')
                and a.get('contract_commit')=='58f7401d804bbd8e8b926263996895438a379430'
                and a.get('prospective_receipt')=='research/quantum-information/BFSS_QIT_SCC_W0C2B0M_R2_EXPLICIT_COMPLEX_MODULE_REPAIR_PRE_GATE_2026_11_17.md'
                and blob(root/a['prospective_receipt'])=='090bfa986cfce97351d891979328fd81ebe77fb8'
                and a.get('source_blob')=='b98cc05a012c98da8016496492d77135fc58ebc8'
                and a.get('consumer_blob')=='dcbba93f72feb4f60912521f666d748bcf2e1687'
                and a.get('workflow_blob')=='61f2cc992208fb31dfad2740e76425fe4d3c9962'
                and a.get('first_atom')=='ORIGINAL_FOCK_COMPLEX_NESTED_SINGLE_INDEX_COEFFICIENT_ACTION'
                and a.get('expected_source_reports')==a.get('expected_consumer_reports')==2
                and a.get('independent_controls')==2
                and a.get('accepted_predecessor_run')==44213315719
                and a.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                and ((s['last_qualified']['gate']=='P3-M4-W0C2A'
                       and s['last_qualified']['run_id']==44213315719
                       and len(s['accepted_anchors'])==24
                       and s['accepted_anchors'][-1]==s['last_qualified'])
                      if a['status']=='PENDING_STRICT_CI'
                      else (s['last_qualified']==a
                            and s['accepted_anchors'][-1]==a
                            and len(s['accepted_anchors'])==25
                            and s['accepted_anchors'][-2]['gate']=='P3-M4-W0C2A'
                            and s['accepted_anchors'][-2]['run_id']==44213315719)),
                'W0C2B0M original complex carrier contract drift')
        old=s.get('previous_active_W0C2B0_R2_stopped',{})
        require(old.get('gate')=='P3-M4-W0C2B0'
                and old.get('status')=='BLOCKED'
                and old.get('native_red_count')==2
                and old.get('stopped') is True
                and old.get('run_id')==44222678258
                and old.get('preservation_run')==44224922749
                and s['previous_active_W0C2B0_R1_RED']['run_id']==44218523669,
                'stopped two-RED source history lost')
        for path,expected in (
            ('research/quantum-information/diagnostics/BFSS_M4_W0C2B0_R1_44218523669_NATIVE_RED_evidence.zip','4117bd19a0a8d1614df176e72d69a9b628de19da'),
            ('research/quantum-information/diagnostics/BFSS_M4_W0C2B0_R2_44222678258_NATIVE_RED_evidence.zip','3f15c1c8bcf0e057e3de2055abc6ec00e8b931ec'),
            ('research/quantum-information/diagnostics/BFSS_M4_W0C2A_R1_44213315719_GREEN_evidence.zip','cb5591ab7ae5762150ea1d10dc093788f812d929'),
        ):
            require(blob(root/path)==expected,'accepted or stopped original evidence drift '+path)
        preflight=s.get('w0c2b0m_r1_first_preflight_red',{})
        require(preflight.get('gate')=='P3-M4-W0C2B0M'
                and preflight.get('run_id')==44251761371
                and preflight.get('tested_sha')=='55175988156ac97e075d091ddfd1cc4cfac1a54e'
                and preflight.get('failure_phase')=='PREFLIGHT_BEFORE_LEAN'
                and preflight.get('native_source_executed') is False
                and preflight.get('consumer_executed') is False
                and preflight.get('preservation_run')==44252181709
                and preflight.get('preservation_commit')=='32c118701944b6beaafdac83695abbcfb052e3b4'
                and preflight.get('failed_workflow_blob')=='c730b0a7294e41d4edcb1145d2958c01061a4135'
                and preflight.get('artifact_sha256')=='176992321525e4ce947ef720e8e5c7c91bef09a41ada9d9fad9866d1e2e069a3',
                'first original W0C2B0M harness RED incorrectly classified or lost')
        for kind, expected in (
            ('evidence_archive','c1874bd132ee5962454a85c6380e2be204b4596d'),
            ('evidence_job_log','a8532cd1ca1c3bc29e1c9a547f8f98e26769abb2'),
            ('evidence_manifest','30fb623f207fcfc3d521a9522435dac80050d15b'),
            ('receipt','814fad537f4fbe9f3c1ccf2347c07731430dd3ee'),
        ):
            require(blob(root/preflight[kind])==expected,'unqualified W0C2B0M preflight RED evidence drift '+kind)
        native=s.get('previous_active_W0C2B0M_R1_NATIVE_RED',{})
        require(native.get('gate')=='P3-M4-W0C2B0M'
                and native.get('attempt')=='R1'
                and native.get('status')=='NATIVE_SOURCE_RED_UNQUALIFIED'
                and native.get('qualification') is False
                and native.get('native_red_count')==1
                and native.get('run_id')==44252646318
                and native.get('job_id')==134626770690
                and native.get('tested_sha')=='113b4dbc7850152442b2303be70c82858504848c'
                and native.get('source_blob')=='19e20ca4138c0303c28e3ab46d4b2fcf3a496bb0'
                and native.get('consumer_blob')=='14f366562c5986f58fd282a09e28720e7ea171b5'
                and native.get('workflow_blob')=='90492c571e555267d560aba6c910fef43ae52faf'
                and native.get('artifact_sha256')=='e9242ef864e6f7bdacb76386f94595b1c67b5eb471f0c485de795bd2970d1529'
                and native.get('failure_phase')=='ORIGINAL_SOURCE_LEAN'
                and native.get('source_error_lines')==[47,59]
                and native.get('preservation_run')==44253870183
                and native.get('preservation_commit')=='f01760a1f278e278a2afdbb86fe9941a11cee503'
                and native.get('consumer_executed') is False
                and a.get('previous_red_run')==44252646318
                and a.get('previous_red_preservation_run')==44253870183,
                'first complex original native RED or bounded R2 repair history missing')
        for path, sha in (
            (native['source'],'19e20ca4138c0303c28e3ab46d4b2fcf3a496bb0'),
            (native['consumer'],'14f366562c5986f58fd282a09e28720e7ea171b5'),
            (native['workflow'],'90492c571e555267d560aba6c910fef43ae52faf'),
            (native['evidence_archive'],'277b934810e6a999c974917d23a199ccd0be3ddd'),
            (native['evidence_job_log'],'043fb4d1cffaca05166825fcd5923e0278fb8b36'),
            (native['evidence_manifest'],'32def22a3c715395de8950be6001a0549d00920b'),
        ):
            require(blob(root/path)==sha,'original first native RED evidence changed '+path)
        r2_preflight=s.get('w0c2b0m_r2_first_preflight_red',{})
        require(r2_preflight.get('gate')=='P3-M4-W0C2B0M'
                and r2_preflight.get('attempt')=='R2'
                and r2_preflight.get('status')=='PREFLIGHT_BEFORE_LEAN_UNQUALIFIED'
                and r2_preflight.get('failure_phase')=='PREFLIGHT_BEFORE_LEAN'
                and r2_preflight.get('run_id')==44254608894
                and r2_preflight.get('job_id')==134633170487
                and r2_preflight.get('tested_sha')=='56d383e85e19928d395858c1f1e5582e9cf3e298'
                and r2_preflight.get('artifact_sha256')=='9f75266ae0f91f388918ddda14ffac47a55b1d926cb6dea92d0c7d87fca4e55f'
                and r2_preflight.get('failed_workflow_blob')=='fa1ab7c0242f06e2e6a3e393d82774ec94f6b825'
                and r2_preflight.get('source_blob')=='b98cc05a012c98da8016496492d77135fc58ebc8'
                and r2_preflight.get('consumer_blob')=='dcbba93f72feb4f60912521f666d748bcf2e1687'
                and r2_preflight.get('original_math_compiled') is False
                and r2_preflight.get('independent_consumer_executed') is False
                and r2_preflight.get('native_complex_coefficient_red_count')==1
                and r2_preflight.get('preservation_run')==44254864256
                and r2_preflight.get('preservation_commit')=='6b34f961bd7d9562c72462eca8667d6b043d02bf',
                'R2 original preflight RED source/execution classification or provenance drift')
        for kind, expected in (
            ('evidence_archive','3e7266878a5eb46fffb753dc852032fc1a196581'),
            ('evidence_job_log','68cee08a05f5dc083c2737038423462104099ef2'),
            ('evidence_manifest','6b257e84491140a6caac941a6329bb7c74cb86e1'),
            ('receipt','15503ec6be1773f2609d98ead902c7860d4fb18a'),
        ):
            require(blob(root/r2_preflight[kind])==expected,
                    'R2 preserved original first preflight RED modified '+kind)
        src=(root/a['source']).read_text()
        con=(root/a['consumer']).read_text()
        expected=['originalFock_complex_nested_coefficient_compose',
                  'originalFock_complex_nested_coefficient_bracket']
        source_roots=[line.split()[-1] for line in src.splitlines() if line.startswith('#print axioms ')]
        consumer_roots=[line.split()[-1] for line in con.splitlines() if line.startswith('#print axioms ')]
        require(sum(line.startswith('theorem ') for line in src.splitlines())==2
                and sum(line.startswith('theorem ') for line in con.splitlines())==2
                and sum(line.startswith('example ') for line in con.splitlines())==2
                and source_roots==expected
                and consumer_roots==[name+'_consumer' for name in expected]
                and src.count('Fermion 2 →L[ℂ] Fermion 2')==1
                and con.count('Fermion 2 →L[ℂ] Fermion 2')==1
                and 'Matrix ι ι ℂ' in src and 'Matrix ι ι ℂ' in con
                and 'Matrix ι ι ℝ' not in src and 'sourceNormalizedGamma' not in src
                and 'exact (Finset.sum_smul).symm' in src
                and 'exact (sub_smul _ _ _).symm' in src
                and 'maxRecDepth' not in src and 'maxHeartbeats' not in src,
                'new original complex-only proof scope drift')
        if a['status']=='GREEN_QUALIFIED':
            import zipfile
            require(a.get('run_id')==44255202048
                    and a.get('job_id')==134635125149
                    and a.get('tested_sha')=='ec27f66e865af66bca6064a2fd219038e359364c'
                    and a.get('artifact_id')==14405953184
                    and a.get('artifact_sha256')=='fb4cfc3b3b098941576ebdb42650ae0e2abd3dc7996538bf79201ebbc91bf7cd'
                    and a.get('strict_outcome')=='success'
                    and a.get('verdict')=='GREEN'
                    and a.get('source_reports')==a.get('consumer_reports')==2
                    and a.get('auditor_negative_tests')==6
                    and a.get('cold_build_jobs')==8964
                    and a.get('preservation_run')==a.get('evidence_preservation_run')==44257915520
                    and a.get('preservation_commit')=='d3862231cb534fe2e1d5b0676417e8c369ac30cc'
                    and a.get('receipt')=='research/quantum-information/BFSS_QIT_SCC_W0C2B0M_R2_GREEN_44255202048_ACCEPTANCE_2026_11_17.md'
                    and blob(root/a['receipt'])=='8aebfec7cce46c4929cb1138a9331fa35e826521'
                    and a.get('strict_marker')=='BFSS_W0C2B0M_R2_ORIGINAL_COMPLEX_NESTED_2_SOURCE_2_CONSUMER_2_CONTROLS_SIX_MUTANTS_STRICT_GREEN',
                    'W0C2B0M R2 source-exact original strict result or acceptance artifact drift')
            for kind, sha in (
                ('evidence_archive','547432c9bf3fb0778d6bc060daa6f9a6e9afc004'),
                ('evidence_job_log','0e9a64e791cb343cf9b51576a06b328b3d2133cc'),
                ('evidence_manifest','e602e910a5c3ed5158eb810d8ac5822a13ea9e18'),
            ):
                require(blob(root/a[kind])==sha,'original W0C2B0M R2 GREEN evidence changed '+kind)
            raw=(root/a['evidence_archive']).read_bytes()
            require(len(raw)==4080
                    and hashlib.sha256(raw).hexdigest()==a['artifact_sha256'],
                    'W0C2B0M R2 original provider ZIP SHA-256/size drift')
            manifest=json.loads((root/a['evidence_manifest']).read_text())
            require(manifest['strict_run']==44255202048
                    and manifest['job_id']==134635125149
                    and manifest['tested_sha']==a['tested_sha']
                    and manifest['artifact_id']==14405953184
                    and manifest['original_zip']['sha256']==a['artifact_sha256']
                    and manifest['original_zip']['size']==4080
                    and manifest['source_reports']==manifest['consumer_reports']==2
                    and manifest['negative_auditor_mutants']==6
                    and manifest['cold_build_jobs']==8964
                    and manifest['source_blob']==a['source_blob']
                    and manifest['consumer_blob']==a['consumer_blob']
                    and manifest['workflow_blob']==a['workflow_blob']
                    and manifest['strict_marker']==a['strict_marker'],
                    'original W0C2B0M R2 strict manifest metadata drift')
            with zipfile.ZipFile(root/a['evidence_archive']) as z:
                names={'auditor.log','cold-source.log','consumer.log','preflight.log',
                       'source-axioms.log','tested-commit.txt'}
                require(z.testzip() is None and set(z.namelist())==names
                        and z.read('tested-commit.txt').decode().strip()==a['tested_sha']
                        and 'Build completed successfully (8964 jobs)' in z.read('cold-source.log').decode()
                        and a['strict_marker'] in z.read('auditor.log').decode(),
                        'original W0C2B0M R2 source evidence member mismatch')
                members=manifest['original_zip']['members']
                require(len(members)==6 and {m['name'] for m in members}==names,
                        'W0C2B0M original artifact member manifest count mismatch')
                for m in members:
                    payload=z.read(m['name'])
                    require(len(payload)==m['size']
                            and hashlib.sha256(payload).hexdigest()==m['sha256']
                            and format(z.getinfo(m['name']).CRC,'08x')==m['crc32'],
                            'W0C2B0M original ZIP member hash/CRC drift '+m['name'])
                for name in ('source-axioms.log','consumer.log'):
                    data=z.read(name).decode()
                    require('sorryAx' not in data and 'error:' not in data,
                            'accepted W0C2B0M original source or consumer reports contain sorry/error')
            require(s.get('w0c2b0m_r2_qualified',{}).get('strict_run')==44255202048
                    and s['w0c2b0m_r2_qualified']['preservation_run']==44257915520
                    and s['w0c2b0m_r2_qualified']['accepted_anchors_after']==25
                    and s['strategic_focus']['full_bivector_bracket_qualified'] is False,
                    'W0C2B0M original complex coefficient accepted anchor or claim ceiling drift')
        require(s['next_planned']['gate']=='P3-M4-W0C2B0N'
                and s['next_planned']['status']=='PROSPECTIVE_NOT_STAGED'
                and s['next_planned']['source_staged'] is False
                and s['next_planned']['consumer_staged'] is False
                and s['next_planned']['workflow_staged'] is False
                and s['strategic_focus']['full_bivector_bracket_qualified'] is False,
                'real adapter or original Lie bracket prematurely promoted')
    if a['gate']=='P3-M4-W0C2B0N':
        # Exact original Source48 complexification adapter; no Jacobi or
        # original K(A) Lie-bracket centrality is claimed at this gate.
        require(a.get('attempt')=='R1'
                and a.get('status') in {'PENDING_STRICT_CI','GREEN_QUALIFIED'}
                and a.get('qualification') == (a['status']=='GREEN_QUALIFIED')
                and a.get('source')=='lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4W0C2B0NOriginalSource48RealComplexCoefficientAdapter.lean'
                and a.get('consumer')=='lean/diagnostics/BFSSP3M4W0C2B0NOriginalSource48RealComplexCoefficientIndependentConsumer.lean'
                and a.get('workflow')=='.github/workflows/bfss-m4-w0c2b0n-r1-original-source48-real-complex-strict.yml'
                and a.get('source_blob')=='c5841055363a6eef713f35e568409dd2fa2b6c9e'
                and a.get('consumer_blob')=='3773f069d3da87c7c899596817f02efec639fbfa'
                and a.get('workflow_blob')=='d431d74251ba5826baf312534fd6578424306643'
                and a.get('contract_commit')=='46500f85fe6e1befad711aeac090ca25238fd0a0'
                and a.get('prospective_receipt')=='research/quantum-information/BFSS_QIT_SCC_W0C2B0N_R1_ORIGINAL_SOURCE48_REAL_COMPLEX_COLUMN_ADAPTER_PRE_GATE_2026_11_17.md'
                and blob(root/a['prospective_receipt'])=='9c0edd937706c8b06be120e341fabacea57946c6'
                and a.get('first_atom')=='ORIGINAL_SOURCE48_REAL_COEFFICIENT_SUM_COMPLEXIFIED_MATRIX_COMMUTATOR_COLUMN'
                and a.get('expected_source_reports')==a.get('expected_consumer_reports')==3
                and a.get('independent_controls')==3
                and a.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                and a.get('accepted_predecessor_run')==44255202048
                and ((s['last_qualified']['gate']=='P3-M4-W0C2B0M'
                       and s['last_qualified']['attempt']=='R2'
                       and s['last_qualified']['run_id']==44255202048
                       and s['last_qualified']['status']=='GREEN_QUALIFIED'
                       and s['accepted_anchors'][-1]==s['last_qualified']
                       and len(s['accepted_anchors'])==25)
                     if a['status']=='PENDING_STRICT_CI'
                     else (s['last_qualified']==a
                           and s['accepted_anchors'][-1]==a
                           and len(s['accepted_anchors'])==26
                           and s['accepted_anchors'][-2]['gate']=='P3-M4-W0C2B0M'
                           and s['accepted_anchors'][-2]['run_id']==44255202048)),
                'W0C2B0N original real complex coefficient adapter pre-gate contract/accepted ancestry drift')
        m=(s['last_qualified'] if a['status']=='PENDING_STRICT_CI'
           else s['accepted_anchors'][-2])
        require(m.get('source_blob')=='b98cc05a012c98da8016496492d77135fc58ebc8'
                and m.get('consumer_blob')=='dcbba93f72feb4f60912521f666d748bcf2e1687'
                and m.get('workflow_blob')=='61f2cc992208fb31dfad2740e76425fe4d3c9962'
                and m.get('tested_sha')=='ec27f66e865af66bca6064a2fd219038e359364c'
                and m.get('artifact_sha256')=='fb4cfc3b3b098941576ebdb42650ae0e2abd3dc7996538bf79201ebbc91bf7cd'
                and m.get('preservation_run')==44257915520
                and m.get('evidence_archive_blob')=='547432c9bf3fb0778d6bc060daa6f9a6e9afc004'
                and m.get('evidence_job_log_blob')=='0e9a64e791cb343cf9b51576a06b328b3d2133cc'
                and m.get('evidence_manifest_blob')=='e602e910a5c3ed5158eb810d8ac5822a13ea9e18',
                'W0C2B0N accepted W0C2B0M R2 original strict/preservation drift')
        for kind in ('source','consumer','workflow','evidence_archive','evidence_job_log','evidence_manifest'):
            require(blob(root/m[kind])==m[kind+'_blob'],
                    'W0C2B0N original accepted complex donor byte drift '+kind)
        require(s.get('previous_active_W0C2B0_R2_stopped',{}).get('native_red_count')==2
                and s['previous_active_W0C2B0_R2_stopped']['status']=='BLOCKED'
                and s.get('previous_active_W0C2B0M_R1_NATIVE_RED',{}).get('run_id')==44252646318
                and s.get('w0c2b0m_r2_first_preflight_red',{}).get('run_id')==44254608894
                and a.get('original_W0C2B0M_R1_native_RED_run')==44252646318
                and a.get('original_W0C2B0M_R2_preflight_RED_run')==44254608894,
                'original native/preflight RED negative knowledge drift')
        for path,sha in (
            ('research/quantum-information/diagnostics/BFSS_M4_W0C2B0_R1_44218523669_NATIVE_RED_evidence.zip','4117bd19a0a8d1614df176e72d69a9b628de19da'),
            ('research/quantum-information/diagnostics/BFSS_M4_W0C2B0_R2_44222678258_NATIVE_RED_evidence.zip','3f15c1c8bcf0e057e3de2055abc6ec00e8b931ec'),
            ('research/quantum-information/diagnostics/BFSS_M4_W0C2B0M_R1_44252646318_NATIVE_RED_evidence.zip','277b934810e6a999c974917d23a199ccd0be3ddd'),
            ('research/quantum-information/diagnostics/BFSS_M4_W0C2B0M_R2_44254608894_PREFLIGHT_RED_evidence.zip','3e7266878a5eb46fffb753dc852032fc1a196581'),
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52L9E5B0OriginalFockRealComplexOperatorScalarBridgeProbe.lean','a02f767ebf1f569302e27676b8d426850db37af1'),
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean','c2e7a7c665121283cde13ae5dabc183362b6b420'),
        ):
            require(blob(root/path)==sha,'W0C2B0N historical original source/RED evidence drift '+path)
        src=(root/a['source']).read_text()
        con=(root/a['consumer']).read_text()
        expected=['originalSource48Fock_real_column_to_complex',
                  'originalSource48_complexify_commutator',
                  'originalSource48Fock_real_commutator_column_to_complex']
        roots=[line.split()[-1] for line in src.splitlines() if line.startswith('#print axioms ')]
        consumers=[line.split()[-1] for line in con.splitlines() if line.startswith('#print axioms ')]
        require(sum(l.startswith('theorem ') for l in src.splitlines())==3
                and sum(l.startswith('theorem ') for l in con.splitlines())==3
                and sum(l.startswith('example ') for l in con.splitlines())==3
                and roots==expected and consumers==[x+'_consumer' for x in expected]
                and src.count('Fermion 2 →L[ℂ] Fermion 2')==1
                and con.count('Fermion 2 →L[ℂ] Fermion 2')==1
                and 'RingHom.mapMatrix Complex.ofRealHom' in src
                and 'originalFockOperator_real_smul_eq_complex_smul' in src
                and 'Source48Label' in src
                and 'sourceNormalizedGamma' not in src
                and 'maxRecDepth' not in src
                and 'maxHeartbeats' not in src
                and 'originalSource48BivectorK' not in src,
                'new original Source48 real complex matrix module scope drift')
        if a['status']=='GREEN_QUALIFIED':
            import zipfile
            require(a.get('run_id')==44260119108
                    and a.get('job_id')==134651124869
                    and a.get('tested_sha')=='d66a948cfd9741fd4f9428471d9e7f559228276f'
                    and a.get('artifact_id')==14407892726
                    and a.get('artifact_sha256')=='e68c0260726275649427ee7d4e02c8c954504fd5fd228cd86a7f9a58e0f12761'
                    and a.get('strict_outcome')=='success'
                    and a.get('verdict')=='GREEN'
                    and a.get('source_reports')==a.get('consumer_reports')==3
                    and a.get('auditor_negative_tests')==6
                    and a.get('cold_build_jobs')==8962
                    and a.get('preservation_run')==a.get('evidence_preservation_run')==44261708018
                    and a.get('preservation_commit')=='38e34ea48cceb8cca2a17925220827d9252c52b3'
                    and a.get('receipt')=='research/quantum-information/BFSS_QIT_SCC_W0C2B0N_R1_GREEN_44260119108_ACCEPTANCE_2026_11_17.md'
                    and blob(root/a['receipt'])=='bbc8c0e2b7e9564e2fa6f9cc68815cb492b1c79c'
                    and a.get('strict_marker')=='BFSS_W0C2B0N_R1_ORIGINAL_SOURCE48_3_SOURCE_3_CONSUMER_3_CONTROLS_SIX_MUTANTS_STRICT_GREEN',
                    'W0C2B0N original source-exact GREEN identity, proof report or acceptance receipt drift')
            for kind,sha in (
                ('evidence_archive','3e57a0e7205dc6f34c6f3da90ff3056fa63943ea'),
                ('evidence_job_log','43186ecee898599b9f21e02b2484543e24e79790'),
                ('evidence_manifest','4a2e00c318f0b202ebafda249bc6be81e3f0532c'),
            ):
                require(blob(root/a[kind])==sha,
                        'W0C2B0N original provider GREEN evidence Git bytes drift '+kind)
            raw=(root/a['evidence_archive']).read_bytes()
            require(len(raw)==3975
                    and hashlib.sha256(raw).hexdigest()==a['artifact_sha256'],
                    'W0C2B0N original provider ZIP SHA-256 or length drift')
            manifest=json.loads((root/a['evidence_manifest']).read_text())
            require(manifest['strict_run']==44260119108
                    and manifest['job_id']==134651124869
                    and manifest['tested_sha']==a['tested_sha']
                    and manifest['artifact_id']==14407892726
                    and manifest['original_zip']['sha256']==a['artifact_sha256']
                    and manifest['original_zip']['size']==3975
                    and manifest['source_reports']==manifest['consumer_reports']==3
                    and manifest['negative_auditor_mutants']==6
                    and manifest['original_fock_controls']==3
                    and manifest['cold_build_jobs']==8962
                    and manifest['source_blob']==a['source_blob']
                    and manifest['consumer_blob']==a['consumer_blob']
                    and manifest['workflow_blob']==a['workflow_blob']
                    and manifest['accepted_predecessor_run']==44255202048
                    and manifest['strict_marker']==a['strict_marker'],
                    'W0C2B0N exact original provider integrity manifest drift')
            with zipfile.ZipFile(root/a['evidence_archive']) as z:
                names={'auditor.log','cold-source.log','consumer.log','preflight.log',
                       'source-axioms.log','tested-commit.txt'}
                require(z.testzip() is None and set(z.namelist())==names
                        and z.read('tested-commit.txt').decode().strip()==a['tested_sha']
                        and 'Build completed successfully (8962 jobs)' in z.read('cold-source.log').decode()
                        and a['strict_marker'] in z.read('auditor.log').decode(),
                        'W0C2B0N original evidence ZIP members failed independent tests')
                members=manifest['original_zip']['members']
                require(len(members)==6 and {m['name'] for m in members}==names,
                        'W0C2B0N original member manifest mismatch')
                for m in members:
                    data=z.read(m['name'])
                    require(len(data)==m['size']
                            and hashlib.sha256(data).hexdigest()==m['sha256']
                            and format(z.getinfo(m['name']).CRC,'08x')==m['crc32'],
                            'W0C2B0N original ZIP member SHA/CRC drift '+m['name'])
                for name in ('source-axioms.log','consumer.log'):
                    content=z.read(name).decode()
                    require('sorryAx' not in content and 'error:' not in content,
                            'W0C2B0N accepted original axiom reports contain sorry or error')
            accepted=s.get('w0c2b0n_r1_qualified',{})
            require(accepted.get('strict_run')==44260119108
                    and accepted.get('preservation_run')==44261708018
                    and accepted.get('accepted_anchors_after')==26
                    and accepted.get('source_blob')==a['source_blob']
                    and accepted.get('evidence_archive_blob')==a['evidence_archive_blob']
                    and s['strategic_focus']['full_bivector_bracket_qualified'] is False,
                    'W0C2B0N accepted original scalar adapter false promotion or claim ceiling')
        require(s['next_planned']['gate']=='P3-M4-W0C2B1'
                and s['next_planned']['status']=='PROSPECTIVE_NOT_STAGED'
                and s['next_planned']['source_staged'] is False
                and s['next_planned']['consumer_staged'] is False
                and s['next_planned']['workflow_staged'] is False
                and s['strategic_focus']['full_bivector_bracket_qualified'] is False,
                'future Jacobi or original K Lie bracket prematurely promoted')
    if a['gate']=='P3-M4-W0C2B1':
        # First source-exact original Fock noncommutative Jacobi/covariance
        # microgate, under explicit generic generator covariance hypotheses.
        require(a.get('attempt')=='R1' and a.get('status')=='PENDING_STRICT_CI'
                and a.get('qualification') is False
                and a.get('first_atom')=='ORIGINAL_FOCK_NONCOMMUTATIVE_JACOBI_AND_CONDITIONAL_COMPLEX_COEFFICIENT_COVARIANCE_CLOSURE'
                and a.get('source')=='lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4W0C2B1OriginalFockJacobiCovarianceAction.lean'
                and a.get('consumer')=='lean/diagnostics/BFSSP3M4W0C2B1OriginalFockJacobiCovarianceIndependentConsumer.lean'
                and a.get('workflow')=='.github/workflows/bfss-m4-w0c2b1-r1-original-fock-jacobi-covariance-strict.yml'
                and a.get('source_blob')=='db15340dfb46eea78c20549bb6d1616dd99f302b'
                and a.get('consumer_blob')=='76f5071b847245fe4173b0dde8205c8b69173b5d'
                and a.get('workflow_blob')=='a7e7b89896f5f447ec88f0c548d222be54a5fdee'
                and a.get('contract_commit')=='4e950fcb597f1ac56aecd93fb70ec100e9ebad63'
                and a.get('prospective_receipt')=='research/quantum-information/BFSS_QIT_SCC_W0C2B1_R1_ORIGINAL_FOCK_JACOBI_COVARIANCE_PRE_GATE_2026_11_17.md'
                and blob(root/a['prospective_receipt'])=='8309ef707b0cd0776d2a2bf4c019b208ed4765f4'
                and a.get('expected_source_reports')==a.get('expected_consumer_reports')==4
                and a.get('independent_controls')==4
                and a.get('allowed_axioms')==['propext','Classical.choice','Quot.sound']
                and a.get('accepted_predecessor_run')==44260119108
                and s['last_qualified']['gate']=='P3-M4-W0C2B0N'
                and s['last_qualified']['attempt']=='R1'
                and s['last_qualified']['run_id']==44260119108
                and s['last_qualified']['status']=='GREEN_QUALIFIED'
                and len(s['accepted_anchors'])==26
                and s['accepted_anchors'][-1]==s['last_qualified'],
                'new B1 original Fock Jacobi covariance pre-gate contract or 26 accepted anchors drift')
        n=s['last_qualified']
        require(n.get('source_blob')=='c5841055363a6eef713f35e568409dd2fa2b6c9e'
                and n.get('consumer_blob')=='3773f069d3da87c7c899596817f02efec639fbfa'
                and n.get('workflow_blob')=='d431d74251ba5826baf312534fd6578424306643'
                and n.get('tested_sha')=='d66a948cfd9741fd4f9428471d9e7f559228276f'
                and n.get('artifact_sha256')=='e68c0260726275649427ee7d4e02c8c954504fd5fd228cd86a7f9a58e0f12761'
                and n.get('preservation_run')==44261708018
                and n.get('evidence_archive_blob')=='3e57a0e7205dc6f34c6f3da90ff3056fa63943ea'
                and n.get('evidence_job_log_blob')=='43186ecee898599b9f21e02b2484543e24e79790'
                and n.get('evidence_manifest_blob')=='4a2e00c318f0b202ebafda249bc6be81e3f0532c',
                'accepted original N donor strict SHA and independent archive identity drift')
        for kind in ('source','consumer','workflow','evidence_archive','evidence_job_log','evidence_manifest'):
            require(blob(root/n[kind])==n[kind+'_blob'],
                    'original 26th accepted anchor source/evidence drift '+kind)
        for path,sha in (
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4QTC0AOriginalFockWeightedQuadraticCovariance.lean','b0b519e46566856e100bf6aa882f9fcdf37d397e'),
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4W0C2B0MOriginalFockComplexNestedCoefficientR2.lean','b98cc05a012c98da8016496492d77135fc58ebc8'),
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean','c2e7a7c665121283cde13ae5dabc183362b6b420'),
            ('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4W0C2AOriginalBivectorLieDefectTraceBridge.lean','51c4b4ab238bcc0f897822a7da4d9fc74dfd55fb'),
            ('research/quantum-information/diagnostics/BFSS_M4_W0C2B0M_R2_44255202048_GREEN_evidence.zip','547432c9bf3fb0778d6bc060daa6f9a6e9afc004'),
            ('research/quantum-information/diagnostics/BFSS_M4_W0C2B0_R1_44218523669_NATIVE_RED_evidence.zip','4117bd19a0a8d1614df176e72d69a9b628de19da'),
            ('research/quantum-information/diagnostics/BFSS_M4_W0C2B0_R2_44222678258_NATIVE_RED_evidence.zip','3f15c1c8bcf0e057e3de2055abc6ec00e8b931ec'),
            ('research/quantum-information/diagnostics/BFSS_M4_W0C2B0M_R1_44252646318_NATIVE_RED_evidence.zip','277b934810e6a999c974917d23a199ccd0be3ddd'),
            ('research/quantum-information/diagnostics/BFSS_M4_W0C2B0M_R2_44254608894_PREFLIGHT_RED_evidence.zip','3e7266878a5eb46fffb753dc852032fc1a196581'),
        ):
            require(blob(root/path)==sha,'original Fock Jacobi accepted donor/negative history drift '+path)
        require(s['previous_active_W0C2B0_R2_stopped']['native_red_count']==2
                and s['previous_active_W0C2B0_R2_stopped']['status']=='BLOCKED'
                and s['previous_active_W0C2B0M_R1_NATIVE_RED']['run_id']==44252646318
                and s['w0c2b0m_r2_first_preflight_red']['run_id']==44254608894
                and a['original_W0C2B0M_R1_native_red_run']==44252646318,
                'stopped real and complex-source native RED evidence lost or misclassified')
        src=(root/a['source']).read_text()
        con=(root/a['consumer']).read_text()
        expected=['originalFock_commutator_sum','originalFock_commutator_weighted_sum',
                  'originalFock_commutator_jacobi','originalFock_commutator_covariance_bracket']
        roots=[line.split()[-1] for line in src.splitlines() if line.startswith('#print axioms ')]
        consumers=[line.split()[-1] for line in con.splitlines() if line.startswith('#print axioms ')]
        require(sum(line.startswith('theorem ') for line in src.splitlines())==4
                and sum(line.startswith('theorem ') for line in con.splitlines())==4
                and sum(line.startswith('example ') for line in con.splitlines())==4
                and roots==expected
                and consumers==[name+'_consumer' for name in expected]
                and src.count('Fermion 2 →L[ℂ] Fermion 2')==1
                and con.count('Fermion 2 →L[ℂ] Fermion 2')==1
                and 'noncomm_ring' in src
                and 'originalFock_commutator_complex_smul' in src
                and 'originalFock_complex_nested_coefficient_bracket' in src
                and 'sourceNormalizedGamma' not in src
                and 'originalSource48K_lieDefect' not in src
                and 'maxRecDepth' not in src and 'maxHeartbeats' not in src,
                'W0C2B1 changed original operator carrier Jacobi or conditional closure contract')
        require(s['next_planned']['gate']=='P3-M4-W0C2B2'
                and s['next_planned']['status']=='PROSPECTIVE_NOT_STAGED'
                and s['next_planned']['source_staged'] is False
                and s['next_planned']['consumer_staged'] is False
                and s['next_planned']['workflow_staged'] is False
                and s['strategic_focus']['full_bivector_bracket_qualified'] is False,
                'future all-48 gamma defect centrality/full K bracket prematurely promoted')
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
