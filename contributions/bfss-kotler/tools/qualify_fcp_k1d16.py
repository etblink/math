#!/usr/bin/env python3
"""Fresh strict verification of source-defined K1D16 original Spin48 quadratic isometry package.

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

NAME = "SU2BFSSPhysicalDomainS1V52K1D16OriginalSpin48QuadraticIsometryProbe"
REL = pathlib.Path("OAI/MathematicalPhysics/BFSS/Contrib/Kotler") / (NAME + ".lean")
BLOB = "0efd0562bbb22ac1b137b104a4de186b8433fd7f"
NS = "FCP.BFSSS1V52K1D16"
ROOTS = [
    NS + ".originalSourceSpin48QuadraticIsometry",
    NS + ".originalSourceSpin48QuadraticIsometry_underlyingLinearEquiv",
    NS + ".originalSourceSpin48QuadraticIsometry_apply",
]
SOURCE_PINS = {
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D15OriginalSpin48QuadraticPreservationProbe.lean":
        "43d0e626fb4180b78cda93744fd94ca8343189a6",
    "contributions/bfss-kotler/tools/qualify_fcp_k1d15.py":
        "b214934433b196dcab632fbb8becd02c8f61e111",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D14OriginalSpin48LinearRepresentationKernelProbe.lean":
        "3bdca4594e8a00d6597aadad61997af68209f46f",
    "contributions/bfss-kotler/tools/qualify_fcp_k1d14.py":
        "9a2ab70de5359e0364d72bc3cb16c291de7fbb81",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D13OriginalSpin48LinearRepresentationProbe.lean":
        "ea7b39f86a3ee3da6e69ecde3e84a3e04252567d",
    "contributions/bfss-kotler/tools/qualify_fcp_k1d13.py":
        "b051603f6962dbad1ec87586109305bf6134cc3d",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D12OriginalSpin48VectorActionLawsProbe.lean":
        "f86c202f3a727d5f931c068656662e550de240c9",
    "contributions/bfss-kotler/tools/qualify_fcp_k1d12.py":
        "1cf3727c6292352d392e4d8a38c37b6933613577",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D11OriginalSpin48ExactTwoSignKernel.lean":
        "d954d2afe6fbf751314d6a36c84b1d4c9783d1d1",
    "contributions/bfss-kotler/tools/qualify_fcp_k1d11.py":
        "c0167a1f0a2bd1d2ff45249108a4ef12f5f377e6",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D10OriginalSpin48NegativeCentralTrivialActionProbe.lean":
        "659edfc3998fc078085ec376f61481164f61edf0",
    "contributions/bfss-kotler/tools/qualify_fcp_k1d10.py":
        "2e92a944eab4680d092e531978760bd572315013",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D9OriginalSpin48NegativeCentralMembershipProbe.lean":
        "d3f25e766279f1452c69608d420ed3689508d8ba",
    "contributions/bfss-kotler/tools/qualify_fcp_k1d9.py":
        "339115c21cdf28881e942c77bfe5b604f04c826d",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D8OriginalSpin48TwoSignUpperBoundProbe.lean":
        "5625c0d7d90dab6fd87230791520b6fe2bbb9cb6",
    "contributions/bfss-kotler/tools/qualify_fcp_k1d8.py":
        "7f8c4e6a2a893dc3ba85048f873b3df8021aaa47",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D7OriginalCliffordScalarCoefficientNormProbe.lean":
        "bf67d82af7a45bf875fca7a97d0e549e4c4a58a9",
    "contributions/bfss-kotler/tools/qualify_fcp_k1d7.py":
        "8dfdffebd68832bb068adbe9c42fb241f77201e0",
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D6OriginalSpin48ScalarStarNormProbe.lean":
        "bf9e72fc088fe3254e5a4c81a2d398379ba15fd0",
    "contributions/bfss-kotler/tools/qualify_fcp_k1d6.py":
        "5e86a6aaefcb4202c021adde49d64a20217b6ad0",
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

    check = logs / 'K1D16RootTypes.lean'
    check.write_text('import ' + str(REL.with_suffix('')).replace('/', '.') + '\n'
                     + '\n'.join('#check @' + n for n in ROOTS) + '\n')
    checked = subprocess.run(
        ['lake', 'env', 'lean', '-DwarningAsError=true', str(check)],
        cwd=LEAN, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=900
    )
    (logs / 'root-types.log').write_text(checked.stdout)
    assert checked.returncode == 0, checked.stdout
    assert not re.search(r'\.lean:\d+:\d+:\s*(?:warning|error):', checked.stdout)
    print('FCP_K1D16_SOURCE_SPIN48_QUADRATIC_ISOMETRY_STRICT_PASS modules=1 roots=3')
    return 0


if __name__ == '__main__':
    sys.exit(main())
