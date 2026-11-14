#!/usr/bin/env python3
"""Audit one focused R4 stage immediately; this never accepts TD-C1A."""
import argparse
from pathlib import Path
import re
import sys

ROOTS = {
    "generic": ["FCP.BFSSTDC1AR4OperatorBasisExtensionInterface.operator_covariance_of_basis"],
    "evaluation": ["FCP.BFSSTDC1AR4FockOperatorEvaluationInterface." + n
                   for n in ["operator_of_pointwise", "pointwise_of_operator"]],
    "native": ["FCP.BFSSTDC1AR4NativeOperatorInterfaceProbe." + n
               for n in ["original_axis_operator", "original_allVector_operator",
                         "original_allVector_pointwise"]],
}
ALLOWED = {"propext", "Classical.choice", "Quot.sound"}
DEPENDENCY_WARNING = re.compile(
    r"^warning: [a-zA-Z0-9_-]+: repository '[^']*/lean/\.lake/packages/[a-zA-Z0-9_-]+' has local changes$")

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("stage", choices=ROOTS)
    parser.add_argument("log", type=Path)
    args = parser.parse_args()
    text = args.log.read_text()
    assert "error:" not in text and "sorryAx" not in text, "compiler failure or unqualified root"
    warnings = [line for line in text.splitlines()
                if "warning:" in line and not DEPENDENCY_WARNING.fullmatch(line)]
    assert not warnings, "unapproved warning: " + repr(warnings)
    reports = re.findall(
        r"(?m)^'([^'\n]+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)",
        text)
    assert [root for root, _ in reports] == ROOTS[args.stage], ("root mismatch", reports)
    for root, axioms in reports:
        assert {a.strip() for a in axioms.split(",") if a.strip()} <= ALLOWED, (root, axioms)
    print("BFSS_TD_C1A_R4_STAGE_AUDIT_PASS", args.stage)

if __name__ == "__main__":
    try:
        main()
    except (AssertionError, OSError) as exc:
        print("BFSS_TD_C1A_R4_STAGE_AUDIT_FAIL:", exc, file=sys.stderr)
        sys.exit(1)
