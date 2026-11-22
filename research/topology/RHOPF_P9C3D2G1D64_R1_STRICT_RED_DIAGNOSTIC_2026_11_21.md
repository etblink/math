# RHOPF-P9C3D2G1D64 R1 — original strict RED at norm-normalization rewrite

**Pacific date:** 2026-11-21. **Disposition: R1 STRICT RED; D64 UNQUALIFIED.**

Original [run #44985767327](https://github.com/etblink/math/actions/runs/44985767327), job `137095862153`, attempt 1, exact tested SHA `8c30dc501e0cd513a075330fe6ccfe83b98a35d3`.

## Independently preserved original diagnostic artifact
Original [artifact #14740500882](https://github.com/etblink/math/actions/runs/44985767327/artifacts/14740500882) downloaded and checked from original ZIP bytes. ZIP SHA-256 independently recalculated: `4bc6fb779635180e570dbd2ec21c80987fd5689bf122a88b7f912a033aa02ff9`, identical to the original GitHub digest. ZIP `testzip() == None`, exactly FIVE intact original members, embedded `exact-tested-commit.txt` matches `8c30dc501e0cd513a075330fe6ccfe83b98a35d3`. Original native file compiled with a failing proof, and original native log inspected. Independent imported consumer was **SKIPPED**, not qualified.

## Exact scope and error
Frozen original Gamma9 source SHA/contract preflight PASS and independent original signed-permutation integer fixture PASS. Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` and 9,111 accepted dependency jobs PASS.

Original native D64 source `RHOPFP9C3D2G1D64StandardCircleOrbitProjectivizationSurjective.lean`, line 39 col 21:
```
error: Tactic `rewrite` failed: Did not find an occurrence of the pattern
  ‖↑?r‖
in the target expression
  ‖‖v‖⁻¹‖ * ‖v‖ = 1
```
The first `norm_smul` rewrite had succeeded, but subsequent `Complex.norm_real` was not a syntactic match: the goal was already reduced to a real norm. Both D64 native reports include `sorryAx` due hard compilation error; D64 **not accepted**. This is a proof rewrite mismatch, not a mathematical counterexample.

## Bounded R2 correction
Replace only the two-line `rw [norm_smul, Complex.norm_real, Real.norm_eq_abs, abs_inv, abs_of_nonneg (norm_nonneg v)]` and subsequent `exact inv_mul_cancel₀ hn` with
```lean
simpa only [norm_smul, norm_inv, norm_norm] using
  (inv_mul_cancel₀ hn)
```
at the local `hw : ‖w‖ = 1` proof. `norm_inv` and `norm_norm` are pinned Mathlib lemmas covering the already-real norm and the positive vector norm; `simpa only` avoids rewrite failure from normal-form differences. Retain all theorem statements, `w`, `hn`, pinned exact imports, D63 quotient map, later surjectivity proof, and independent imported consumer **byte-identical**. Update only D64 source blob SHA pin in the strict workflow. No global options, no linter relaxation, no resource increases, no `sorry` or new axioms, no changes to accepted D45–D63 mathematics, original Gamma9 source, or `main`.

R2 must independently pass native source and separate imported consumer, two plus two `#print axioms` reports with only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`/compiler errors, Gamma9 source contract and integer fixture, pinned toolchain, exact tested SHA and original ZIP hash/CRC, before promoting D64. Preserve this R1 RED as negative knowledge.

## Scientific boundary
Even if D64 R2 qualifies, it gives only norm-one representatives and surjectivity of D63. D65 must separately package the algebraic bijection into `Equiv`; projectivization topology under the pinned Mathlib, any `CP¹ ≃ₜ S²`, Hopf/Chern invariant or physical BFSS Fock/Gauss/Hamiltonian/stable hopfion remain unproved.
