"""Check the internal edition's source structure and optional final LaTeX log."""

import argparse
from fractions import Fraction
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent


def require(condition, message):
    if not condition:
        raise SystemExit(message)


def audit_sources():
    main = (ROOT / "main.tex").read_text(encoding="utf-8")
    includes = re.findall(r"\\input\{([^}]+)\}", main)
    require(len(includes) == len(set(includes)) == 14, "Expected 14 unique includes")
    chapters = sorted(
        f"chapters/{path.stem}" for path in (ROOT / "chapters").glob("*.tex")
    )
    require(len(chapters) == 12, "Expected exactly 12 chapter files")
    require(includes == [*chapters, "appendices", "references"], "Include order or coverage")

    texts = [(ROOT / f"{name}.tex").read_text(encoding="utf-8") for name in includes]
    source = "\n".join([main, *texts])
    require(sum(text.count(r"\chapter{") for text in texts[:-2]) == 12, "Chapter count")
    require(texts[-2].count(r"\chapter{") == 4, "Appendix count")
    require(source.count(r"\part{") == 4, "Part count")

    labels = re.findall(r"\\label\{([^}]+)\}", source)
    references = set(re.findall(r"\\(?:eqref|ref)\{([^}]+)\}", source))
    require(len(labels) == len(set(labels)), "Duplicate cross-reference labels")
    require(references <= set(labels), f"Unresolved cross-references {references - set(labels)}")

    cited = set(re.findall(r"\\cite\{([^}]+)\}", source))
    entries = set(re.findall(r"\\bibitem\{([^}]+)\}", source))
    require(cited == entries, f"Bibliography mismatch {cited ^ entries}")

    statuses = {
        "PE-CSQF0": "Strict",
        "PE-SQUARE": "Analytical",
        "PE-FINITE-LINEAGE": "Finite audit",
        "PE-RAW": "Open",
        "PE-EXIST": "Open",
    }
    evidence_rows = re.findall(
        r"\\texttt\{(PE-[A-Z0-9-]+)\} & [^&]+ & ([A-Za-z ]+)", texts[-2]
    )
    actual = {key: status.strip() for key, status in evidence_rows}
    require(len(actual) == len(evidence_rows) == 22, "Expected 22 unique evidence rows")
    for key, status in statuses.items():
        require(actual.get(key) == status, f"Inaccurate evidence status for {key}")

    margin = 1 - Fraction(66, 25) * (Fraction(327658, 10**6) + Fraction(36704, 4 * 10**6))
    require(margin == Fraction(2768956, 25000000), "Fixed-regulator endpoint mismatch")
    require(3 * 104 * 105 // 2 == 16380, "Symmetric-matrix comparison count")

    print(
        f"12 chapters, 4 appendices, {len(labels)} labels, "
        f"{len(entries)} bibliography entries, and 22 evidence records checked."
    )


def audit_log(path):
    log = path.read_text(encoding="utf-8")
    require("Output written on " in log, "Final LaTeX log lacks output")
    problems = re.findall(
        r"^.*(?:Warning:|warning:|Overfull|Underfull|undefined|Fatal error).*$",
        log,
        flags=re.MULTILINE,
    )
    require(not problems, "Final LaTeX diagnostics:\n" + "\n".join(problems))
    print("Final LaTeX log has no warnings, unresolved references or box diagnostics.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--log", type=Path, help="Final main.log from the PDF compilation")
    args = parser.parse_args()
    audit_sources()
    if args.log:
        audit_log(args.log)
