#!/usr/bin/env python3
"""Regenerate the scoped FCP import crosswalk from immutable Git objects."""
import argparse
import json
import pathlib
import re
import subprocess
from collections import defaultdict

SOURCE_SHA = 'cc608e2282e1b32bb11bbb64424e4775b28138e2'
SOURCE_BRANCH = 'research/openai-math-su2-s1v52-global-lift-scoping-20261019'
PARENT = 'd931f88731e5acb07ccd431d2edabfaa6c7b1734'
CONTRIB = pathlib.Path('lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler')
BASE_MODULE = 'OAI.MathematicalPhysics.BFSS.Contrib.Kotler.'
MANIFEST = pathlib.Path('contributions/bfss-kotler/FCP_SYNC_MANIFEST_2026_10_27.json')
EVIDENCE = pathlib.Path('contributions/bfss-kotler/evidence/k1d2-pbw-2026-10-27')


def git(repo, *args):
    out = subprocess.check_output(['git', '-C', str(repo), *args], text=True)
    return out if args[0] == 'cat-file' else out.strip()


def imports(text):
    return re.findall(r'^import\s+(\S+)', text, re.M)


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--fcp-root', type=pathlib.Path, required=True)
    ap.add_argument('--check', action='store_true')
    args = ap.parse_args()
    repo = pathlib.Path(__file__).resolve().parents[3]
    fcp = args.fcp_root.resolve()
    assert git(fcp, 'rev-parse', SOURCE_SHA) == SOURCE_SHA
    records = json.loads((repo / EVIDENCE / 'fcp-source-qualification.json').read_text())
    runs = {row['source_path']: row for row in records}
    tree = git(fcp, 'ls-tree', '-r', SOURCE_SHA).splitlines()
    source = {}
    modules = defaultdict(list)
    for line in tree:
        meta, path = line.split('\t')
        if path.endswith('.lean'):
            blob = meta.split()[2]
            body = git(fcp, 'cat-file', 'blob', blob)
            source[path] = {'path': path, 'git_blob': blob,
                            'module': pathlib.Path(path).stem, 'imports': imports(body)}
            modules[pathlib.Path(path).stem].append(path)
    selected_paths = []
    for p in sorted((repo / CONTRIB).glob('*.lean')):
        if re.search(r'S1V(?:0Standalone|29All|30Real|31Canonical|37Original|38Original|52K1[ACD]|52L9E5F20B)', p.stem):
            selected_paths.append(p)
    assert len(selected_paths) == 22
    selected_names = {p.stem for p in selected_paths}
    selected = []
    for p in selected_paths:
        candidates = modules[p.stem]
        assert len(candidates) == 1, (p.name, candidates)
        sp = candidates[0]
        original = git(fcp, 'cat-file', 'blob', source[sp]['git_blob'])
        actual = p.read_text()
        ns = re.search(r'^namespace\s+(\S+)', actual, re.M).group(1)
        roots = [ns + '.' + name for name in re.findall(r'^#print axioms (\S+)', actual, re.M)]
        proof = actual[actual.index('set_option autoImplicit'):]
        original_proof = original[original.index('set_option autoImplicit'):]
        exact = proof == original_proof
        is_base = 'S1V0Standalone' in p.stem
        is_e5 = 'K1D2E5' in p.stem
        assert exact or is_base or is_e5, p.name
        if is_base:
            start, end = 'abbrev Source48Label', 'private abbrev Q'
            assert original[original.index(start):original.index(end)] == actual[actual.index(start):actual.index(end)]
        if is_e5:
            statement = r'theorem originalExteriorScalar_of_no_occupiedPBWLabels[\s\S]*?:= by'
            assert re.search(statement, original).group() == re.search(statement, actual).group()
        receipt = runs.get(sp)
        if receipt:
            assert receipt['source_unchanged']
            assert receipt['tested_blob'] == source[sp]['git_blob']
            reported = [r['name'] for job in receipt['jobs'] for r in job['reports']]
            assert reported == roots, (p.name, reported, roots)
        owner_imports = imports(actual)
        deps = [i[len(BASE_MODULE):] for i in owner_imports if i.startswith(BASE_MODULE)]
        assert set(deps) <= selected_names, (p.name, deps)
        selected.append({
            'stage': 'S1V0' if is_base else 'PBW' if ('K1D2' in p.stem or 'F20B' in p.stem) else 'ANCESTRY',
            'source_path': sp, 'source_module': p.stem,
            'source_blob': source[sp]['git_blob'], 'source_imports': source[sp]['imports'],
            'source_gate_run_id': receipt['run_id'] if receipt else None,
            'source_gate_tested_sha': receipt['head_sha'] if receipt else None,
            'source_gate_status': 'strict_success' if receipt else 'unqualified_staged' if is_e5 else 'prior_owner_port_accepted',
            'destination_path': str(p.relative_to(repo)),
            'destination_module': str(p.relative_to(repo / 'lean').with_suffix('')).replace('/', '.'),
            'destination_blob': git(repo, 'hash-object', str(p)),
            'destination_imports': owner_imports, 'destination_dependencies': deps,
            'classification': 'ACCEPTED_PRESENT' if is_base else 'CANDIDATE_STAGED',
            'required_for_selected_port': True,
            'mathematical_body_exact': exact,
            'adaptation': 'imports_and_provenance_only' if exact else 'existing_owner_warning_cleanup' if is_base else 'E5_statement_preserving_proof_repair',
            'declaration_roots': roots,
            'owner_independent_qualification': 'previously_accepted_parent' if is_base else 'blocked_before_push',
        })
    selected_by_name = {p['source_module']: p for p in selected}

    def port_closure(name, stack=()):
        assert name not in stack, ('cycle', stack, name)
        out = set()
        for dep in selected_by_name[name]['destination_dependencies']:
            out.add(dep)
            out.update(port_closure(dep, (*stack, name)))
        return out

    def historical_closure(path):
        seen = set()
        todo = [path]
        while todo:
            current = todo.pop()
            for dep in source[current]['imports']:
                for candidate in modules.get(dep, []):
                    if candidate not in seen and candidate != path:
                        seen.add(candidate)
                        todo.append(candidate)
        return seen

    historical_union = set()
    for row in selected:
        row['destination_transitive_dependencies'] = sorted(port_closure(row['source_module']))
        historical = historical_closure(row['source_path'])
        row['original_import_syntax_closure'] = sorted(historical)
        historical_union.update(historical)
        historical_union.add(row['source_path'])
    historical = []
    for path in sorted(historical_union):
        node = dict(source[path])
        node['import_resolution'] = {dep: sorted(modules[dep]) for dep in node['imports'] if dep in modules}
        node['required_for_selected_port'] = node['module'] in selected_names
        node['classification'] = selected_by_name[node['module']]['classification'] if node['module'] in selected_names else 'EXCLUDED'
        if not node['required_for_selected_port']:
            node['reason'] = 'historical import ancestry not needed by the freshly compiled selected owner closure; no inference about source theorem validity'
        historical.append(node)
    # This is a syntax graph, not a guessed resolution of recovery modules.
    ambiguities = {k: sorted(v) for k, v in modules.items() if len(v) > 1 and any(p in historical_union for p in v)}
    parent_sources = json.loads((repo / EVIDENCE / 'preserved-parent-28.json').read_text())
    for row in parent_sources:
        assert git(repo, 'hash-object', str(repo / row['path'])) == row['git_blob']
        row['classification'] = 'ACCEPTED_PRESENT'
        row['acceptance_boundary'] = 'preserved prior individually gated owner contribution; not a new full 28-module rebuild'
    ordered = []
    remaining = set(selected_by_name)
    while remaining:
        ready = sorted(n for n in remaining if set(selected_by_name[n]['destination_dependencies']) <= set(ordered))
        assert ready, 'cycle or missing port dependency'
        ordered.extend(ready)
        remaining.difference_update(ready)
    data = {
        'schema_version': 1,
        'scope': 'Selected original 48-coordinate PBW and Spin/Clifford contraction frontier. Not a claim to mirror every accepted FCP theorem.',
        'source_repository': 'etblink/Foundational-Convergence-Program',
        'source_branch': SOURCE_BRANCH, 'source_sha': SOURCE_SHA,
        'source_tree': git(fcp, 'rev-parse', SOURCE_SHA + '^{tree}'),
        'owner_repository': 'etblink/math', 'owner_branch': 'integration/fcp-k1d2-pbw-20261027',
        'preserved_accepted_parent': PARENT,
        'owner_remote_checkpoint': '25bf4ff87dcb31f6a490f3b42d00385e677ffe60',
        'lean_toolchain': 'leanprover/lean4:v4.34.1',
        'mathlib_sha': 'd13f23b723b8a846827a245b89c10fc7d3f11612',
        'allowed_axioms': ['propext', 'Classical.choice', 'Quot.sound'],
        'classification_definitions': {
            'ACCEPTED_PRESENT': 'Independently qualified owner mathematics present at its recorded source blob.',
            'ACCEPTED_MISSING': 'Required qualified FCP mathematics with no owner candidate present.',
            'CANDIDATE_STAGED': 'Source or adaptation present; independent owner gate not accepted.',
            'SUPERSEDED': 'A historical source version replaced by a later documented version, not a theorem refutation.',
            'EXCLUDED': 'Outside the selected dependency closure; source acceptance status is not inferred.',
        },
        'counts': {'prior_accepted_owner_modules': 28, 'new_accepted_owner_modules': 0,
                   'new_staged_owner_modules': 21, 'selected_owner_modules': 22,
                   'selected_declaration_roots': sum(len(r['declaration_roots']) for r in selected),
                   'new_candidate_declaration_roots': sum(len(r['declaration_roots']) for r in selected if r['stage'] != 'S1V0'),
                   'fcp_lean_source_files': len(source), 'original_syntax_closure_files': len(historical),
                   'original_syntax_closure_ambiguous_module_names': len(ambiguities)},
        'selected_modules': selected, 'topological_build_order': ordered,
        'preserved_owner_modules': parent_sources,
        'original_import_syntax_graph': historical,
        'original_ambiguous_module_names': ambiguities,
        'historical_resolution_boundary': 'All possible matching source paths retained. A duplicate recovery filename is not assumed equivalent or resolved by directory order. The selected owner closure has no ambiguous imports.',
        'outside_original_syntax_closure': [dict(source[p], classification='EXCLUDED', required_for_selected_port=False,
                                                reason='outside selected original import syntax graph; not audited for theorem acceptance')
                                            for p in sorted(set(source) - historical_union)],
        'superseded_source_versions': [{
            'destination_path': str(CONTRIB / 'SU2BFSSPhysicalDomainS1V52K1D2E5OriginalPBWEmptySupportScalarProbe.lean'),
            'git_blob': 'e5daad4d957b9518dbc000b5e88b49e7070e69d9', 'classification': 'SUPERSEDED',
            'reason': 'Failed owner run 40602151982; replaced by locally clean statement-preserving E5 repair. Original FCP candidate remains unqualified.'}],
        'unresolved_obligations': [
            'Independent owner strict qualification of twelve repaired PBW candidates.',
            'Independent owner strict qualification of nine source-exact ancestry candidates.',
            'Scalar-common-kernel composition after prerequisite qualification.',
            'Full Spin(48) and two-sign kernel classification, covering, global Spin(9) lift/invariance, BFSS spectral existence remain separate.',
        ],
    }
    result = json.dumps(data, indent=2) + '\n'
    target = repo / MANIFEST
    if args.check:
        assert target.read_text() == result, 'manifest differs from immutable source audit'
    else:
        target.write_text(result)
    print(json.dumps(data['counts'], sort_keys=True))


if __name__ == '__main__':
    main()
