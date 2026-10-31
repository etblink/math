# K1D18V9S — strict acceptance of canonical skew-adjoint carrier and generator bridge

Date: 2026-10-31 UTC
Qualified research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`
Qualified commit: `9b57761f5d55ac9907474f1267cd6ffc028a8410`
Qualified source blob: `ee038db09af741bdd1af4b811d8daf79bb70ed37`
Pinned Mathlib revision: `d13f23b723b8a846827a245b89c10fc7d3f11612`
Pinned Lean toolchain: `leanprover/lean4:v4.34.1`
Strict verification: [Run #41226559863](https://github.com/etblink/math/actions/runs/41226559863) — **PASS**.

## Qualified declarations (three)

1. `coordinateSkewLieSubalgebra_eq_mathlib` — V9R native skew-9 Lie subalgebra equals `skewAdjointMatricesLieSubalgebra 1` on literal `SpaceIndex`.
2. `pairedSkewLieSubalgebra_eq_mathlib` — V9R original 48-label paired-Fock skew Lie subalgebra equals the standard unit-form skew-adjoint Lie subalgebra on literal `Source48Label`.
3. `coordinateToPairedSkewLieHom_coordinatePlane` — V9R's genuine `LieHom` maps actual coordinate-plane subtype generators to original normalized paired-plane subtype generators for all indices.

The completed run checked original source pins and V9R ancestry, freshly compiled with warnings as errors, independently elaborated exact declarations and a nontrivial bracket specialization, and checked `#print axioms` separately for all three. All reported axioms lie in `{propext, Classical.choice, Quot.sound}`; no `sorryAx`. The compiler/audit artifact is named `bfss-v9s-original-mathlib-skew-typed-generator-9b57761f5d55ac9907474f1267cd6ffc028a8410-1` (artifact id `13051429510`).

## Preserved negative knowledge

- [#41224354992](https://github.com/etblink/math/actions/runs/41224354992): V9S red due to absent compiled V9R `.olean`, not a mathematical counterexample.
- [#41225406569](https://github.com/etblink/math/actions/runs/41225406569): V9R ancestry compiled; the V9S source used wrong `Matrix.` namespace prefixes for globally declared pinned Mathlib skew-adjoint definitions/lemmas, leading to compiler errors and `sorryAx` in two attempted declarations.
- [#41226535683](https://github.com/etblink/math/actions/runs/41226535683): intermediate source-correction workflow had a malformed Python validator indentation; the final independently verified run corrected this. Its outcome must be read from its own recorded run, not inferred from the later success.

Do not retroactively mark red runs green or erase their evidence.

## Boundaries and next decision

V9S is a verified Lie algebra interface, **not** the integration of that Lie algebra representation to a continuous group homomorphism or a Spin(48) lift. In particular `GroupLieAlgebra I G` is a tangent Lie algebra requiring a selected smooth Lie group, not definitionally equal to the canonical matrix skew-adjoint subalgebra. Neither a real `LieHom` nor equality with Mathlib's standard skew algebra provides a Spin(9) group action by itself.

Next bounded interface V9T (experimental until a separate strict PASS): expose the existing V9R `LieHom` directly with exact Mathlib canonical skew-adjoint source and target types via V9S equalities, and validate the commutator law on these exact carriers. This is intentionally packaging, not a new physical or topological theorem.

Subsequent global questions remain open: identify the **specific source Spin(9) group** and its differential; construct/verify continuous integration into original 48-representation and source-exact Spin(48) lift; keep topology, Fock implementation, gauge/color invariance, and BFSS spectral claims separate. No main/FCP/upstream modifications.
