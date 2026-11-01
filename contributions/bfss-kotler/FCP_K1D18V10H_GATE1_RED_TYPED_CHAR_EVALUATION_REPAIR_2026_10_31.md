# BFSS K1D18V10H Gate 1 — red causal record and exact typed proof repair

Date: 2026-10-31 PDT. **Gate 1 RED, not accepted.** [Run #41257058496](https://github.com/etblink/math/actions/runs/41257058496), attempt 1, job `124702348480`; exact tested HEAD `20e37c939a4f04909c99607680ba96f1aec371f7`.

**Retained artifact:** [#13063922758](https://github.com/etblink/math/actions/runs/41257058496/artifacts/13063922758), SHA256 `a06dafe1ee31cad1ec4daae27581415e91df6aeaeafca842e9f86712774d2cff`. Pinned Lean v4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 preflight PASS, accepted original paired 48 determinant V10G ancestor rebuild PASS, fresh V10H compile FAIL, independent four-type axiom audit SKIPPED.

## Three exact diagnostics
1. Source line 49: `Unknown constant Matrix.mem_orthogonalGroup_iff.mp`. The earlier source had treated `.mp` as part of an identifier, not as the `Iff.mp` projection. Correct by `(Matrix.mem_orthogonalGroup_iff).mp`, exactly matching the pinned lemma.
2. Source line 54: `maximum recursion depth has been reached` at a `change` that attempted to elaborate the whole determinant character composite definition as a matrix determinant power. This is an elaboration resource failure, not an orientation mathematical failure.
3. Source line 68: the same `maximum recursion depth` issue at a second `change` over the full original 48 determinant equality, again attempting broad definitional normalization where an explicit typed identity was available.
The determinant character definition `source9SpinGammaDetHom` compiled and reported only allowed axioms. The three dependent proofs failed (had `sorryAx`); no promoted claims from this run.

## Gate 2 corrective bounded candidate — UNQUALIFIED

Preserve the exact source `spinGroup source9Quadratic`, original gamma16, source G1A paired48 and determinant theorem. Add typed `source9SpinGammaDetHom_apply` evaluating the determinant character through the established `Matrix.detMonoidHom` and orthogonal subtype. Correct the `Iff.mp` expression with parentheses. Derive det-square by applying `Matrix.det` to the already proved orthogonal product and rewriting `det_mul`, `det_transpose`, `det_one`, followed by the typed character evaluation and `pow_two`. Derive det48=det16 by a short explicit `calc` chain from accepted V10G cubic equality and the new square identity. Parenthesize `Matrix.mem_specialOrthogonalGroup_iff` in the exact membership equivalence.

**No compiler limit changes, no new assumptions, sorry, admit or axioms, and no modification of accepted ancestors.** New strict gate requires 5 fresh independent exact declaration types, 5 source-level axiom reports and the original whitelist before any V10H acceptance. If red repeats, isolate the exact `MonoidHom.comp` / subtype evaluation in a minimal typed fixture before further full-module iterations.

Mathematically OPEN even if Gate 2 passes: `∀g, det gamma16(g)=+1`, unconditional `Spin9 → SO(original paired48)`, source topology/continuity, Spin48 lift/cover and original BFSS Fock/physical claims. Preserve previous two V10E red records and all accepted V10E-V10G declarations.
