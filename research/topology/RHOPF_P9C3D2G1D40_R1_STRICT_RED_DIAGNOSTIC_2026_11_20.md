# RHOPF-P9C3D2G1D40 R1 — strict RED preserved

**Branch:** `integration/bfss-unified-research-20261108`. **Disposition:** RED, not qualified. **Exact tested commit:** `e98b3add651f7b32802149cea59ae316a6427105`.

- [Original strict run #44874693459](https://github.com/etblink/math/actions/runs/44874693459): completed FAILURE, attempt 1, job 136756696302.
- [Original archived RED artifact #14695564565](https://github.com/etblink/math/actions/runs/44874693459/artifacts/14695564565): GitHub-reported SHA-256 `0afc7e749406b991fef3f8a9cfe6b700d53ff45128f02aa182cd6dbac7000439` (not independently recalculated here).
- Frozen Gamma9 preflight and independent signed-permutation fixture PASS; pinned Lean 4.34.1/Mathlib restored; D39 dependency built.
- Original native file `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/RHOPFP9C3D2G1D40OriginalGammaSourceQComplexNormedSpace.lean` failed with `-DwarningAsError=true` at lines 51 and 53 due to Mathlib `linter.style.haveILetI`: inside a proposition proof, ordinary `let` is preferred to `letI`.
- The three native axiom reports printed only `propext`, `Classical.choice`, and `Quot.sound`. However, native compilation returned exit code 1, and the independent consumer was SKIPPED; no qualification.
- Strict R2 recovery changes **only two theorem-local `letI` tactical binders to `let`**, keeps all statement signatures, original Gamma9/D37–D39 dependencies and pinned toolchain unchanged, and updates the exact source hash in the CI preflight. Mathlib Lean 4 linter documentation confirms ordinary `let` still registers local instances.
- Preserve all historical RED evidence and previously accepted D39 GREEN. Do not promote D40 until native plus independent strict compilation and original artifact integrity both pass.
