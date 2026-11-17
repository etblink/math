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
        expected_reports = (1 if a['gate'] in {'P3-M4-QTC1G0','P3-M4-W0A0','P3-M4-W0A2','P3-M4-W0A3'} else
                            3 if a['gate'] in {'P3-M4-CT0','P3-M4-QTC0C'} else 2)
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
    if a['gate'] == 'P3-M4-W0B0' and a.get('attempt') == 'R2':
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
