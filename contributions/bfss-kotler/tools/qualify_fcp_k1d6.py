#!/usr/bin/env python3
"""Fresh strict verification of source-defined K1D6 Spin48 scalar star/norm.

Precondition: the pinned K1D3/K1D4 and 22-module ancestor closure were
independently freshly recompiled in this job. Does not promote acceptance.
"""
import hashlib
import json
import pathlib
import re
import subprocess
import sys
import time
import argparse

HERE = pathlib.Path(__file__).resolve()
ROOT = HERE.parents[3]
LEAN = ROOT / 'lean'
sys.path.insert(0, str(HERE.parent))
from qualify_fcp_sync import code_only

NAME = "SU2BFSSPhysicalDomainS1V52K1D6OriginalSpin48ScalarStarNormProbe"
REL = pathlib.Path("OAI/MathematicalPhysics/BFSS/Contrib/Kotler") / (NAME + ".lean")
BLOB = "bf9e72fc088fe3254e5a4c81a2d398379ba15fd0"
NS = "FCP.BFSSS1V52K1D6"
ROOTS = [
    NS + ".originalSourceSpin48_trivialAction_clifford_star_fixed",
    NS + ".originalSourceSpin48_trivialAction_clifford_square_eq_one",
]
SOURCE_PINS = {
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D5OriginalCliffordScalarTransportProbe.lean":
        "afea20ff18e9ea7d03fc5dba5aa3c32fa0b830e5",
    "contributions/bfss-kotler/tools/qualify_fcp_k1d5.py":
        "a41f6aaf497eeb2c3cebb2382592fa4ecb50effd",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D4OriginalSpin48ExteriorScalarKernel.lean":
        "271865855ec72fc428fe29aa005392273fad165f",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D3OriginalExteriorScalarCommonCoordinateKernel.lean":
        "04c477227d2a535e01abe0e01ea1ae57ff116321",
    "contributions/bfss-kotler/tools/qualify_fcp_k1d3.py":
        "281a07aeb0a4137a9106930da18f4c6f4cd84035",
    "contributions/bfss-kotler/tools/qualify_fcp_sync.py":
        "f0986e5748c383e4f4f6c5993114d195269326f9",
    "contributions/bfss-kotler/FCP_SYNC_MANIFEST_2026_10_27.json":
        "601e77f885683eabff4fec3b5dc78a043c62f21e",
}
ALLOWED = {'propext', 'Classical.choice', 'Quot.sound'}


def git_blob(path):
    return subprocess.check_output(
        ['git', '-C', str(ROOT), 'hash-object', str(ROOT / path)], text=True
    ).strip()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--log-dir', required=True, type=pathlib.Path)
    args = ap.parse_args()
    logs = args.log_dir.resolve()
    logs.mkdir(parents=True, exist_ok=True)

    assert (LEAN / 'lean-toolchain').read_text().strip() == 'leanprover/lean4:v4.34.1'
    lock = json.loads((LEAN / 'lake-manifest.json').read_text())
    expected = 'd13f23b723b8a846827a245b89c10fc7d3f11612'
    assert next(p['rev'] for p in lock['packages'] if p['name'] == 'mathlib') == expected
    mathlib = LEAN / '.lake/packages/mathlib'
    assert subprocess.check_output(
        ['git', '-C', str(mathlib), 'rev-parse', 'HEAD'], text=True
    ).strip() == expected
    assert 'version 4.34.1,' in subprocess.check_output(
        ['lake', 'env', 'lean', '--version'], cwd=LEAN, text=True
    )

    for path, sha in SOURCE_PINS.items():
        assert git_blob(path) == sha, ('modified accepted ancestor', path)
    assert git_blob('lean/' + str(REL)) == BLOB, 'candidate source changed'
    src = (LEAN / REL).read_text()
    code = code_only(src)
    assert not re.search(r'\b(?:sorry|admit|sorryAx|axiom)\b', code), 'unproved declaration'
    assert re.search(r'(?m)^namespace ' + re.escape(NS) + r'\s*$', src)
    declared = [NS + '.' + x for x in re.findall(r'(?m)^#print axioms (\S+)', src)]
    assert declared == ROOTS, ('wrong axiom roots', declared)

    obj = LEAN / '.lake/build/lib/lean' / REL.with_suffix('.olean')
    obj.parent.mkdir(parents=True, exist_ok=True)
    obj.unlink(missing_ok=True)
    started = time.monotonic()
    compile_result = subprocess.run(
        ['lake', 'env', 'lean', '-DwarningAsError=true', '-o', str(obj), str(REL)],
        cwd=LEAN, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=900
    )
    (logs / (NAME + '.log')).write_text(compile_result.stdout)
    reports = re.findall(
        r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^]]*)\]|does not depend on any axioms)",
        compile_result.stdout
    )
    valid = (compile_result.returncode == 0 and obj.is_file() and obj.stat().st_size > 0
             and [name for name, _ in reports] == ROOTS
             and 'sorryAx' not in compile_result.stdout
             and not re.search(r'\.lean:\d+:\d+:\s*(?:warning|error):',
                               compile_result.stdout)
             and all({a.strip() for a in ax.split(',') if a.strip()} <= ALLOWED
                     for _, ax in reports))
    receipt = {
        'module': NAME, 'git_blob': BLOB, 'exit_code': compile_result.returncode,
        'strict_pass': bool(valid), 'roots': [
            {'declaration': name,
             'axioms': [a.strip() for a in ax.split(',') if a.strip()]}
            for name, ax in reports],
        'olean_sha256': hashlib.file_digest(obj.open('rb'), 'sha256').hexdigest()
            if valid else None,
        'seconds': round(time.monotonic() - started, 3),
    }
    (logs / 'results.json').write_text(json.dumps(receipt, indent=2) + '\n')
    if not valid:
        print(compile_result.stdout, flush=True)
        return 1

    check = logs / 'K1D6RootTypes.lean'
    check.write_text('import ' + str(REL.with_suffix('')).replace('/', '.') + '\n'
                     + '\n'.join('#check @' + n for n in ROOTS) + '\n')
    checked = subprocess.run(
        ['lake', 'env', 'lean', '-DwarningAsError=true', str(check)],
        cwd=LEAN, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=900
    )
    (logs / 'root-types.log').write_text(checked.stdout)
    assert checked.returncode == 0, checked.stdout
    assert not re.search(r'\.lean:\d+:\d+:\s*(?:warning|error):', checked.stdout)
    print('FCP_K1D6_SPIN48_SCALAR_NORM_STRICT_PASS modules=1 roots=2')
    return 0


if __name__ == '__main__':
    sys.exit(main())
