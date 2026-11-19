# RHOPF-P9C3C R1 — strict RED source-contract comment literal; R2 bounded recovery

**Date:** 2026-11-19
**Canonical branch:** `integration/bfss-unified-research-20261108`
**Original R1 run:** [#44610674835](https://github.com/etblink/math/actions/runs/44610674835), attempt 1, conclusion FAILURE.
**Exact tested commit:** `35d48dff540f7bbfa19c08fb9c62b7109ecaecdf`.
**Original artifact:** [#14571853471](https://github.com/etblink/math/actions/runs/44610674835/artifacts/14571853471), ZIP SHA-256 `78b424124428600931362d8d7782a4b5f338e34d94f5a5e7065bf8dc2863b0d0`, matching GitHub's original digest; archived `exact-tested-commit.txt` verified byte-for-byte against exact source SHA. Original artifact contains only exact commit and toolchain SHA-256 manifests because preflight failed before any Lean restoration.

## Diagnostic finding

Source hash and toolchain manifest checks passed. The original workflow `Exact original-source hashes and bounded proof-contract preflight` step failed with a Python `AssertionError`, line 48 in the preflight script:

`assert 'import all' not in s`

The originally submitted new Lean source contained this exact phrase **only inside a top-level documentation comment**, as a description of forbidden proof methods. It was not a Lean import statement. The consumer did not contain it. The preflight scans the raw text, so a literal documentation phrase triggered the frozen source contract. No Lean compiler, theorem, axiom, dependent source or independent consumer ran. This is therefore a contract/documentation mismatch and NOT evidence against the proposed orthogonality theorem.

## Strictly bounded R2 repair

Replace just the comment phrase `import all, or proof resource changes.` with `unbounded aggregate imports, or proof resource changes.` in `RHOPFP9C3COriginalGammaRelationalUnitCircleOrthogonality.lean`. Update only the exact new source Git blob hash pinned by the workflow, not the established predecessor hashes. No actual import, theorem statement, tactic, independent consumer, original Gamma9 implementation, CI validation rule, warning policy or resource limit changes.

The unit-circle orthogonality theorem remains unqualified until a new original-source native and independent Lean strict GREEN provides the original ZIP and embedded tested commit, both allowed-only root axiom reports and zero `sorryAx`.

## Knowledge preservation and limits

R1 artifact, transcript and exact original SHA are retained; never reclassify a preflight failure as a mathematical proof failure or hide it. Prior P9C3B1 original R1/R2 REDs and later R3 GREEN remain intact. Separate source-selected coordinates, continuous circle action, Hopf quotient and original BFSS Fock/gauge/Hamiltonian implementability remain open regardless of this bounded comment repair.
