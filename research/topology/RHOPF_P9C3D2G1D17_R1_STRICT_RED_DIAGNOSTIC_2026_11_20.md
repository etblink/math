# RHOPF-P9C3D2G1D17 R1 — native strict RED, diagnostic and negative knowledge preserved

**Pacific date:** 2026-11-20. **Disposition:** REJECTED_NATIVE_RED.  
**Original run:** [#44813710526](https://github.com/etblink/math/actions/runs/44813710526), attempt 1 FAILED, job `136556512498`.  
**Exact tested commit:** `4815654c159585509dc76efc0c15d6e2bd827a8d`.  
**Original RED artifact:** [#14670385186](https://github.com/etblink/math/actions/runs/44813710526/artifacts/14670385186); independently recomputed ZIP SHA-256 `099407c411c38e02fc2c0872070a44ea232562782494fcf90e68d448b8e7b847`, matches GitHub upload digest. `exact-tested-commit.txt` matches `4815654c159585509dc76efc0c15d6e2bd827a8d`. Five members present: original native failed compilation log, original accepted dependency build, independent original integer fixture consumer, exact commit and toolchain evidence.

## Observed

Frozen original Gamma9 hashes and proof-contract preflight PASS; pinned Lean 4.34.1 and Mathlib restoration PASS; accepted dependency build **9,064 jobs** PASS. Original native Lean RED in `RHOPFP9C3D2G1D17OriginalGammaCircleQUnitFreeness.lean`:

1. Line 54: `linter.unnecessarySimpa`: “Try `simp at hwUnit` instead of `simpa using hwUnit`”. Do not globally disable linter or warnings-as-error.
2. Line 61: `hfixFour : relationalCircleFourAction z v.1 = v.1` supplied where expected `E (relationalCircleRangeAction z (E.symm v.1)) = E w`; `w:=E.symm v.1`. The right side is provably `v.1` by `E.apply_symm_apply`, but is not definitionally identical.

Original `#print axioms` contains `sorryAx`, so the theorem is **not qualified**; independent imported consumer was SKIPPED.

## Bounded recovery

Reuse earlier accepted F2 native nonzero-unit proof pattern `simp [hz] at hwUnit`. Replace the failed exact equality by an explicit three-step `calc` that unfolds the accepted real-four action, invokes `hfixFour` and finally `(E.apply_symm_apply v.1).symm` to obtain `E w`. Only edit the D17 proof source and update its exact blob hash in the D17 strict workflow; no theorem statement change, new axiom, trust escape, source Gamma9 edit, alternate matrices, proof-budget override, or `main` write. Strict R2 must compile native and independently imported consumer and prove its original artifact SHA integrity before promotion.
