# F10AU Gate 1 RED — unused dependent-if proof binders

Date: 2026-11-01 Pacific local. Branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## Immutable failure evidence
[GitHub Actions Run #41370068416](https://github.com/etblink/math/actions/runs/41370068416), attempt 1, exact tested SHA `7fd39457f7fb436f50a83259e11d85b1cfcfe0f8`, completed FAILURE. [Artifact #13109246760](https://github.com/etblink/math/actions/runs/41370068416/artifacts/13109246760), ZIP SHA256 `323838b3a38805168b90b83e0de529ffd442ae1a3294b198aa41af8b1be1fd62`.

Original gamma and F10E/F10AJ–F10AT immutable source pins PASSED; Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration PASSED; accepted F10AT ancestry rebuild PASSED. The fresh F10AU theorem elaborated and emitted the permitted root-axiom report, but `-DwarningAsError=true` rejected TWO unused-variable linter diagnostics:
* candidate source line 72: `hbd` is a dependent-if binder in a branch whose result does not use the equality proof.
* candidate source line 74: `had` is a dependent-if binder in a branch whose result does not use the equality proof.

This is not a mathematical proof failure. It is a strict lint failure. The independent complete theorem type/root-axiom audit was SKIPPED because strict compilation failed. F10AU remains UNQUALIFIED.

## Gate 2 bounded repair
Rename ONLY those two unused dependent-if binders to `_hbd` and `_had`, respectively, following Lean's explicit compiler recommendation. Keep all five cases, both dependent-if branch conditions, exact right-hand sides, all hypotheses, and the proof unchanged. Update only the F10AU source hash in its strict workflow. No linter suppression, no weakened compiler, no changes to theorem statement or accepted F10AT/F10AS ancestry. Re-run source pin checks, frozen toolchain, F10AT ancestry build, warnings-as-errors candidate compile, and independent exact complete theorem type/axiom audit. Preserve this RED record regardless of next result.
