#!/usr/bin/env python3
"""Source-pinned original stabilizer projection, exact two-sign fibers and kernel; cold source and independent consumer."""
import argparse
import importlib.util
import json
from pathlib import Path
import re
import shutil
import subprocess
import time

SPEC = importlib.util.spec_from_file_location(
    "spectral_environment", Path(__file__).with_name("qualify_spectral_linear_moment.py"))
base = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(base)
REPO, LEAN, BUILD = base.REPO, base.LEAN, base.BUILD
require, git, digest, uncomment, imports = (base.require, base.git, base.digest,
                                         base.uncomment, base.imports)
MANIFEST = REPO / "contributions/bfss-kotler/BFSS_SPECTRAL_SOURCE_NINE_AXIS_PROJECTION_MANIFEST_V1.json"
SOURCE = "OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisProjection"
ROOTS = ['FCP.BFSSSourceNineAxisProjection.source9Axis8SpinStabilizer', 'FCP.BFSSSourceNineAxisProjection.source9Axis8MatrixStabilizer', 'FCP.BFSSSourceNineAxisProjection.source9Axis8SpinStabilizer_mem_iff', 'FCP.BFSSSourceNineAxisProjection.source9Axis8MatrixStabilizer_mem_iff', 'FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom', 'FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_coe', 'FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_mulVec', 'FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_surjective', 'FCP.BFSSSourceNineAxisProjection.source9Axis8NegativeCentral', 'FCP.BFSSSourceNineAxisProjection.source9Axis8NegativeCentral_coe', 'FCP.BFSSSourceNineAxisProjection.source9Axis8NegativeCentral_ne_one', 'FCP.BFSSSourceNineAxisProjection.source9Axis8NegativeCentral_image', 'FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_eq_iff_two_sign_fiber', 'FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_mem_ker_iff', 'FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_ker_eq', 'FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_fiber_signs_distinct', 'FCP.BFSSSourceNineAxisProjection.source9Axis8ProjectionHom_fiber_exact_pair']
ACCEPTED_ROOTS_BY_MODULE = {'OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineLipschitzRepresentation': ['FCP.BFSSSourceNineLipschitz.source9LipschitzVectorLinearMap', 'FCP.BFSSSourceNineLipschitz.source9LipschitzVectorLinearMap_ι', 'FCP.BFSSSourceNineLipschitz.source9LipschitzVectorRepresentation', 'FCP.BFSSSourceNineLipschitz.source9LipschitzVectorLinearEquiv', 'FCP.BFSSSourceNineLipschitz.source9LipschitzVectorLinearRepresentation', 'FCP.BFSSSourceNineLipschitz.source9LipschitzDeterminantCharacter', 'FCP.BFSSSourceNineLipschitz.source9SpinToLipschitz', 'FCP.BFSSSourceNineLipschitz.source9SpinToLipschitz_toUnits', 'FCP.BFSSSourceNineLipschitz.source9LipschitzVectorRepresentation_restrict_spin', 'FCP.BFSSSourceNineLipschitz.source9LipschitzVectorRepresentation_restrict_spin_hom'], 'OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineOrientation': ['FCP.BFSSSourceNineOrientation.source9Quadratic_polar_dot', 'FCP.BFSSSourceNineOrientation.source9NormalizedPolarRow', 'FCP.BFSSSourceNineOrientation.source9NormalizedPolarRow_dot', 'FCP.BFSSSourceNineOrientation.source9NormalizedPolarRow_dot_self', 'FCP.BFSSSourceNineOrientation.source9RankOneConjugationMatrix', 'FCP.BFSSSourceNineOrientation.source9RankOneConjugationMatrix_mulVec', 'FCP.BFSSSourceNineOrientation.source9RankOneConjugationMatrix_det_one', 'FCP.BFSSSourceNineOrientation.source9GeneratorUnit_mem_lipschitz', 'FCP.BFSSSourceNineOrientation.source9GeneratorLipschitzUnit', 'FCP.BFSSSourceNineOrientation.source9GeneratorLinearMap_eq_rankOne', 'FCP.BFSSSourceNineOrientation.source9GeneratorDeterminantCharacter_one', 'FCP.BFSSSourceNineOrientation.source9LipschitzDeterminantCharacter_eq_one', 'FCP.BFSSSourceNineOrientation.source9SpinVectorRepresentation_det_one', 'FCP.BFSSSourceNineOrientation.source9SpinVectorMatrixHom_det_one', 'FCP.BFSSSourceNineOrientation.source9SpinVectorSpecialOrthogonalHom', 'FCP.BFSSSourceNineOrientation.source9SpinVectorSpecialOrthogonalHom_mulVec'], 'OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineReflectionPair': ['FCP.BFSSSourceNineReflection.source9ToEuclidean', 'FCP.BFSSSourceNineReflection.source9Quadratic_eq_euclidean_norm_sq', 'FCP.BFSSSourceNineReflection.source9Polar_eq_two_euclidean_inner', 'FCP.BFSSSourceNineReflection.source9Unit_euclidean_norm_one', 'FCP.BFSSSourceNineReflection.source9Unit_clifford_conjugation', 'FCP.BFSSSourceNineReflection.source9UnitVectorPairSpin_inverse', 'FCP.BFSSSourceNineReflection.source9UnitVectorPairSpin_polar_action', 'FCP.BFSSSourceNineReflection.source9Unit_polar_action_eq_negative_hyperplane', 'FCP.BFSSSourceNineReflection.source9UnitVectorPairSpin_eq_native_hyperplane_pair'], 'OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineUnitCartan': ['FCP.BFSSSourceNineCartan.source9SpinEuclideanLinearEquiv', 'FCP.BFSSSourceNineCartan.source9SpinEuclideanLinearEquiv_norm_map', 'FCP.BFSSSourceNineCartan.source9SpinEuclideanIsometry', 'FCP.BFSSSourceNineCartan.source9SpinEuclideanIsometry_apply_source', 'FCP.BFSSSourceNineCartan.source9SpinEuclideanIsometry_det_one', 'FCP.BFSSSourceNineCartan.source9EuclideanUnitNormal', 'FCP.BFSSSourceNineCartan.source9EuclideanUnitNormal_norm_one', 'FCP.BFSSSourceNineCartan.source9EuclideanUnitNormal_span_eq', 'FCP.BFSSSourceNineCartan.source9EuclideanUnitNormal_reflection_eq', 'FCP.BFSSSourceNineCartan.source9EuclideanHyperplaneReflection_zero', 'FCP.BFSSSourceNineCartan.source9EuclideanUnitNormals', 'FCP.BFSSSourceNineCartan.source9EuclideanUnitNormals_all_unit', 'FCP.BFSSSourceNineCartan.source9EuclideanUnitNormals_length_le', 'FCP.BFSSSourceNineCartan.source9EuclideanUnitNormals_reflectionProduct_eq', 'FCP.BFSSSourceNineCartan.source9EuclideanUnitHyperplane_det_neg_one', 'FCP.BFSSSourceNineCartan.source9EuclideanIsometry_mul_det', 'FCP.BFSSSourceNineCartan.source9EuclideanUnitReflectionList_det', 'FCP.BFSSSourceNineCartan.source9EuclideanUnitReflectionList_even_of_det_one', 'FCP.BFSSSourceNineCartan.source9SpinEuclidean_unitCartan_le_eight', 'FCP.BFSSSourceNineCartan.source9Spin_sourceUnitCartan_le_eight'], 'OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineEvenListLift': ['FCP.BFSSSourceNineEvenListLift.source9CliffordWord', 'FCP.BFSSSourceNineEvenListLift.source9NativeReflectionWord', 'FCP.BFSSSourceNineEvenListLift.source9EvenUnitList_lift', 'FCP.BFSSSourceNineEvenListLift.source9Spin_sourceUnitCartan_lift'], 'OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineSignedWord': ['FCP.BFSSSourceNineSignedWord.source9NaturalMatrix_eq_of_action_eq', 'FCP.BFSSSourceNineSignedWord.source9Action_eq_iff_two_sign_fiber', 'FCP.BFSSSourceNineSignedWord.source9Spin_sourceUnitCartan_two_sign_lift', 'FCP.BFSSSourceNineSignedWord.source9Spin_sourceUnitCartan_signed_word'], 'OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineTargetEuclideanBridge': ['FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetVectorLinearEquiv', 'FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetVectorLinearEquiv_apply', 'FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetVectorLinearEquiv_preserves_quadratic', 'FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetEuclideanLinearEquiv', 'FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetEuclideanLinearEquiv_norm_map', 'FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetEuclideanIsometry', 'FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetEuclideanIsometry_apply_source', 'FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetEuclideanIsometry_det_one', 'FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetEuclideanIsometry_fixesAxis_iff'], 'OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisTargetPreimage': ['FCP.BFSSSourceNineAxisTargetPreimage.source9TargetEuclidean_unitCartan_le_eight', 'FCP.BFSSSourceNineAxisTargetPreimage.source9Target_sourceUnitCartan_le_eight', 'FCP.BFSSSourceNineAxisTargetPreimage.source9Axis8Target_hasOriginalSourceWordPreimage', 'FCP.BFSSSourceNineAxisTargetPreimage.source9Axis8Target_hasOriginalSourcePreimage']}


def check_reports(text, roots, marker):
    require("sorryAx" not in text, "recovery axiom")
    require(not re.search(r"(?i)\b(?:warning|error)(?:\([^)]*\))?:", text), "Lean diagnostic")
    reports = re.findall(r"(?:^|: )'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|"
                         r"does not depend on any axioms)", text, re.M)
    require([name for name, _ in reports] == roots, "missing/duplicate/foreign axiom reports")
    actual = {name: sorted(a.strip() for a in axioms.split(",") if a.strip())
              for name, axioms in reports}
    require(all(set(a) <= base.ALLOWED for a in actual.values()), "unexpected axioms")
    require(text.splitlines().count(marker) == 1, "completion marker missing/duplicate")
    return actual


def preflight():
    m = json.loads(MANIFEST.read_text())
    require(m["schema"] == "bfss-spectral-source-nine-axis-projection-v1", "schema")
    require(len(m["originals"]) == 125 and len(m["accepted"]) == 8 and len(m["candidates"]) == 2, "compilation inventory")
    builds = m["originals"] + m["accepted"] + m["candidates"]
    entries = builds + m["controls"]
    require(len({e["path"] for e in entries}) == len(entries), "duplicate input")
    for e in entries:
        p = REPO / e["path"]
        require(git("hash-object", str(p)) == e["blob"] and digest(p) == e["sha256"],
                "changed input pin: " + e["path"])
    seen = set()
    for e in builds:
        require(e["path"] == "lean/" + e["module"].replace(".", "/") + ".lean", "source path")
        require(e["module"] not in seen, "duplicate module")
        for parent in imports(REPO / e["path"]):
            require(parent == "Mathlib" or parent.startswith("Mathlib.") or parent in seen,
                    "unbuilt dependency: " + parent)
        seen.add(e["module"])
        code = uncomment((REPO / e["path"]).read_text())
        require(not re.search(r"\b(?:sorry|admit|axiom|native_decide|unsafe)\b", code),
                "forbidden proof token: " + e["path"])
    reachable = set()

    def visit(module):
        if module == "Mathlib" or module.startswith("Mathlib.") or module in reachable:
            return
        require(module in seen, "unlisted dependency")
        reachable.add(module)
        for parent in imports(LEAN / (module.replace(".", "/") + ".lean")):
            visit(parent)

    visit(SOURCE)
    require(reachable == {e["module"] for e in m["originals"] + m["accepted"] + m["candidates"][:1]},
            "exact imported closure mismatch")
    require({e["module"] for e in m["accepted"]} == set(ACCEPTED_ROOTS_BY_MODULE),
            "accepted source identities")
    require(imports(REPO / m["candidates"][0]["path"]) == [
        "OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisTargetPreimage",
        "OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineSignedWord"], "source imports")
    require(imports(REPO / m["candidates"][1]["path"]) == [SOURCE], "consumer imports")
    for e in m["accepted"] + m["candidates"]:
        code = uncomment((REPO / e["path"]).read_text())
        expected = ACCEPTED_ROOTS_BY_MODULE[e["module"]] if e in m["accepted"] else ROOTS
        require(e["roots"] == expected and
                re.findall(r"(?m)^#print axioms (\S+)$", code) == expected, "root inventory")
        require(re.findall(r"(?m)^set_option (\S+) (\S+)$", code) ==
                [("autoImplicit", "false")], "strict source options")
        require(not re.search(r"(?m)^\s*(?:local\s+)?instance\b|attribute\s+\[instance\]|"
                              r"\bSource48Label\b|\blinter\.", code), "carrier/instance change")
    source = uncomment((REPO / m["candidates"][0]["path"]).read_text())
    require(re.findall(r"(?m)^(?:noncomputable def|theorem) (\S+)\s", source) ==
            [n.rsplit(".", 1)[1] for n in ROOTS], "declaration inventory")
    audit = uncomment((REPO / m["candidates"][1]["path"]).read_text())
    require(len(re.findall(r"(?m)^example\b", audit)) == 22, "consumer inventory")
    require((LEAN / "lean-toolchain").read_text().strip() == "leanprover/lean4:v4.34.1",
            "toolchain pin")
    return m


def run(m, evidence):
    evidence.mkdir(parents=True, exist_ok=True)
    receipt = {"tested_sha": git("rev-parse", "HEAD"), "status": "INCOMPLETE", "builds": []}
    (evidence / "tested-sha.txt").write_text(receipt["tested_sha"] + "\n")
    builds = m["originals"] + m["accepted"] + m["candidates"]
    for e in builds + m["controls"]:
        dest = evidence / "inputs" / e["path"]
        dest.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(REPO / e["path"], dest)
    shutil.copyfile(MANIFEST, evidence / MANIFEST.name)
    try:
        receipt["packages"] = base.environment()
        compiler, env, receipt["compiler_environment"] = base.compiler_environment(evidence)
        for e in builds:
            stem = BUILD / e["module"].replace(".", "/")
            for ext in (".olean", ".ilean", ".olean.private", ".olean.server"):
                Path(str(stem) + ext).unlink(missing_ok=True)
        for index, e in enumerate(builds):
            candidate = e in m["accepted"] + m["candidates"]
            obj = BUILD / (e["module"].replace(".", "/") + ".olean")
            obj.parent.mkdir(parents=True, exist_ok=True)
            logfile = evidence / (f"{index:02d}-" + e["module"].rsplit(".", 1)[-1] + ".log")
            command = [compiler]
            if candidate:
                command += ["-DautoImplicit=false", "-DwarningAsError=true"]
            command += ["-o", str(obj), str(REPO / e["path"])]
            print("Compiling " + e["module"], flush=True)
            start = time.monotonic()
            with logfile.open("w") as out:
                result = subprocess.run(command, cwd=LEAN, env=env, stdout=out,
                                        stderr=subprocess.STDOUT, timeout=600)
            text = logfile.read_text()
            entry = {"module": e["module"], "returncode": result.returncode,
                     "seconds": round(time.monotonic() - start, 3), "log": logfile.name,
                     "log_sha256": digest(logfile)}
            receipt["builds"].append(entry)
            if candidate or result.returncode != 0:
                print(text, flush=True)
            require(result.returncode == 0 and obj.is_file(), "compilation failed: " + e["module"])
            require("sorryAx" not in text and not re.search(r"(?i)\b(?:sorry|error):", text),
                    "recovery/error output")
            entry["object_sha256"] = digest(obj)
            if candidate:
                entry["axioms"] = check_reports(text, e["roots"], e["marker"])
            else:
                entry["warnings"] = [line for line in text.splitlines() if "warning" in line.lower()]
        preflight()
        receipt["status"] = "PASS"
    finally:
        (evidence / "receipt.json").write_text(json.dumps(receipt, indent=2) + "\n")
    print("SPECTRAL_SOURCE_NINE_AXIS_PROJECTION_GATE_PASS", flush=True)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=["preflight", "run"])
    parser.add_argument("--evidence", type=Path)
    args = parser.parse_args()
    manifest = preflight()
    if args.command == "run":
        require(args.evidence is not None, "evidence path required")
        run(manifest, args.evidence.resolve())
    else:
        print("SPECTRAL_SOURCE_NINE_AXIS_PROJECTION_PREFLIGHT_PASS")
