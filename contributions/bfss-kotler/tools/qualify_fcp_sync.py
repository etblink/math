#!/usr/bin/env python3
"""Fresh, pinned local/Lake compilation of the scoped FCP owner import closure.

This reports compiler evidence only. It never promotes owner acceptance status.
"""
import argparse
import hashlib
import json
import os
import pathlib
import re
import subprocess
import sys
import time

HERE = pathlib.Path(__file__).resolve()
REPO = HERE.parents[3]
MANIFEST = REPO / 'contributions/bfss-kotler/FCP_SYNC_MANIFEST_2026_10_27.json'


def git_blob(path):
    return subprocess.check_output(['git', '-C', str(REPO), 'hash-object', str(path)], text=True).strip()


def code_only(src):
    """Strip nested Lean comments and strings before checking forbidden tokens."""
    out, i, depth = [], 0, 0
    while i < len(src):
        if src.startswith('/-', i):
            depth += 1
            i += 2
        elif depth and src.startswith('-/', i):
            depth -= 1
            i += 2
        elif depth:
            i += 1
        elif src.startswith('--', i):
            end = src.find('\n', i)
            i = len(src) if end < 0 else end
        elif src[i] == '"':
            i += 1
            while i < len(src) and src[i] != '"':
                i += 2 if src[i] == '\\' else 1
            i += 1
            out.append(' ')
        else:
            out.append(src[i])
            i += 1
    assert depth == 0, 'unclosed Lean block comment'
    return ''.join(out)


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--group', choices=['pbw', 'ancestry'], required=True)
    ap.add_argument('--mode', choices=['direct', 'lake'], default='lake')
    ap.add_argument('--lean-bin', type=pathlib.Path)
    ap.add_argument('--mathlib-root', type=pathlib.Path)
    ap.add_argument('--preload', type=pathlib.Path)
    ap.add_argument('--log-dir', type=pathlib.Path, required=True)
    ap.add_argument('--timeout', type=int, default=900)
    args = ap.parse_args()
    data = json.loads(MANIFEST.read_text())
    lean_root = REPO / 'lean'
    ml = (args.mathlib_root or lean_root / '.lake/packages/mathlib').resolve()
    env = os.environ.copy()
    if args.preload:
        env['LD_PRELOAD'] = str(args.preload.resolve())
    out = lean_root / '.lake/build/lib/lean'
    if args.mode == 'direct':
        assert args.lean_bin, '--lean-bin is required in direct mode'
        compiler = [str(args.lean_bin.resolve())]
        env['LEAN_PATH'] = ':'.join(map(str, [out, ml / '.lake/build/lib/lean',
            *sorted((ml / '.lake/packages').glob('*/.lake/build/lib/lean'))]))
    else:
        compiler = ['lake', 'env', 'lean']
    log_dir = args.log_dir.resolve()
    log_dir.mkdir(parents=True, exist_ok=True)
    assert (lean_root / 'lean-toolchain').read_text().strip() == data['lean_toolchain']
    owner_lock = json.loads((lean_root / 'lake-manifest.json').read_text())
    assert next(p['rev'] for p in owner_lock['packages'] if p['name'] == 'mathlib') == data['mathlib_sha']
    assert subprocess.check_output(['git', '-C', str(ml), 'rev-parse', 'HEAD'], text=True).strip() == data['mathlib_sha']
    assert subprocess.check_output(['git', '-C', str(ml), 'status', '--porcelain'], text=True).strip() == ''
    dependency_revisions = []
    # Lake resolves transitive dependencies in the root workspace's package
    # directory; a standalone Mathlib checkout owns its own package directory.
    package_dir = ml / '.lake/packages' if args.mode == 'direct' else lean_root / owner_lock['packagesDir']
    for pkg in json.loads((ml / 'lake-manifest.json').read_text())['packages']:
        dependency = package_dir / pkg['name']
        assert dependency.is_dir(), str(dependency)
        rev = subprocess.check_output(['git', '-C', str(dependency), 'rev-parse', 'HEAD'], text=True).strip()
        assert rev == pkg['rev'], (pkg['name'], rev, pkg['rev'])
        dependency_revisions.append({'name': pkg['name'], 'git_sha': rev})
    for row in data['preserved_owner_modules']:
        assert git_blob(REPO / row['path']) == row['git_blob'], row['path']
    selected = {r['source_module']: r for r in data['selected_modules']
                if args.group == 'ancestry' or r['stage'] in {'PBW', 'S1V0'}}
    order = [name for name in data['topological_build_order'] if name in selected]
    # Preflight every direct import before any compilation; avoid cascading cache failures.
    for row in selected.values():
        src = REPO / row['destination_path']
        text = src.read_text()
        assert git_blob(src) == row['destination_blob'], str(src)
        assert not re.search(r'\b(?:sorry|admit|sorryAx|axiom)\b', code_only(text)), str(src)
        ns = re.search(r'^namespace\s+(\S+)', text, re.M).group(1)
        declared = [ns + '.' + n for n in re.findall(r'^#print axioms (\S+)', text, re.M)]
        assert declared == row['declaration_roots'], (src, declared)
        for imp in row['destination_imports']:
            if imp.startswith('Mathlib.'):
                obj = ml / '.lake/build/lib/lean' / (imp.replace('.', '/') + '.olean')
                assert obj.is_file() and obj.stat().st_size > 0, ('missing Mathlib artifact', str(obj))
        assert set(row['destination_dependencies']) <= set(selected), row['source_module']
    version = subprocess.check_output([*compiler, '--version'], cwd=lean_root, env=env, text=True)
    assert 'version 4.34.1,' in version, version
    environment = {'compiler': version.strip(), 'mode': args.mode, 'mathlib_sha': data['mathlib_sha'],
                   'dependency_revisions': dependency_revisions, 'manifest_blob': git_blob(MANIFEST),
                   'verifier_blob': git_blob(HERE),
                   'source_sha': data['source_sha'], 'group': args.group,
                   'expected_modules': len(order),
                   'expected_roots': sum(len(r['declaration_roots']) for r in selected.values()),
                   'acceptance_status': 'local_compiler_evidence_only',
                   'readlink_compatibility_shim': bool(args.preload)}
    (log_dir / 'environment.json').write_text(json.dumps(environment, indent=2) + '\n')
    results = []
    for name in order:
        row = selected[name]
        rel = pathlib.Path(row['destination_path']).relative_to('lean')
        obj = (out / rel).with_suffix('.olean')
        obj.parent.mkdir(parents=True, exist_ok=True)
        obj.unlink(missing_ok=True)
        started = time.monotonic()
        result = subprocess.run([*compiler, '-DwarningAsError=true', '-o', str(obj), str(rel)],
            cwd=lean_root, env=env, text=True, stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT, timeout=args.timeout)
        (log_dir / (name + '.log')).write_text(result.stdout)
        reports = re.findall(r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^]]*)\]|does not depend on any axioms)", result.stdout)
        valid = result.returncode == 0 and obj.exists() and obj.stat().st_size > 0
        valid = valid and [n for n, _ in reports] == row['declaration_roots']
        valid = valid and 'sorryAx' not in result.stdout and not re.search(r'\.lean:\d+:\d+: (?:warning|error)', result.stdout)
        valid = valid and all({a.strip() for a in ax.split(',') if a.strip()} <= set(data['allowed_axioms']) for _, ax in reports)
        receipt = {'module': row['destination_module'], 'git_blob': row['destination_blob'],
                   'exit_code': result.returncode, 'strict_pass': bool(valid),
                   'seconds': round(time.monotonic() - started, 3),
                   'reports': [{'name': n, 'axioms': [a.strip() for a in ax.split(',') if a.strip()]} for n, ax in reports],
                   'olean_sha256': hashlib.file_digest(obj.open('rb'), 'sha256').hexdigest() if valid else None}
        results.append(receipt)
        (log_dir / 'results.json').write_text(json.dumps(results, indent=2) + '\n')
        print(('PASS ' if valid else 'FAIL ') + name, flush=True)
        if not valid:
            print(result.stdout)
            return 1
    # Record actual explicit root types, including hypotheses, separately from proof terms.
    types = log_dir / 'RootTypes.lean'
    types.write_text('\n'.join('import ' + selected[n]['destination_module'] for n in order) +
        '\n\n' + '\n'.join('#check @' + root for n in order for root in selected[n]['declaration_roots']) + '\n')
    checked = subprocess.run([*compiler, '-DwarningAsError=true', str(types)], cwd=lean_root,
        env=env, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=args.timeout)
    (log_dir / 'root-types.log').write_text(checked.stdout)
    assert checked.returncode == 0, checked.stdout
    print(f'FCP_OWNER_{args.group.upper()}_STRICT_PASS modules={len(order)} roots={environment["expected_roots"]}')
    return 0


if __name__ == '__main__':
    sys.exit(main())
