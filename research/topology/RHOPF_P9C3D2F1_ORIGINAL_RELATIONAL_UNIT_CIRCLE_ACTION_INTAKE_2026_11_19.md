# RHOPF-P9C3D2F1 — source original relational norm-one unit Circle action intake

**Date:** 2026-11-19 (local).
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Status:** UNQUALIFIED source-native and independent Lean strict candidate.
**Accepted predecessor:** P9C3D2F0 R2 [#44653085974](https://github.com/etblink/math/actions/runs/44653085974), exact tested `5fb0e1dbc51f804f1a79527d0acb40ea80b327ad`, accepted `e45af288b94681639a2153dc50b078c65ec74f01`.

## Exact mathematical scope

The source-original real BFSS Gamma9 carrier `SpinIndex → ℝ`, rank-four original relational projector `P`, original Mathlib Circle-to-matrix representation `rho(z)`, and induced vector action are all unchanged. Qualified prior results: `P(rho(z)v)=rho(z)v` when `Pv=v`, `rho(1)v=v`, `rho(z*w)v=rho(z)(rho(w)v)`, and `(rho(z)v) ⬝ᵥ (rho(z)v)=v ⬝ᵥ v` on the original real 16-spinor carrier.

Define the subtype intrinsically with exact original projector and dot product, not a new basis:
```lean
abbrev RelationalUnitSpinor : Type :=
  {v : SpinIndex → ℝ //
    relationalProjector.mulVec v = v ∧ v ⬝ᵥ v = 1}
```
Define `relationalUnitCircleAction z v` by the original `relationalCircleVector z v.1`, providing subtype closure using only qualified P-image and dot-self preservation. The native source and independent consumer each verify exactly:
- `relationalUnitCircleAction_one : relationalUnitCircleAction 1 v = v`
- `relationalUnitCircleAction_mul : relationalUnitCircleAction (z*w) v = relationalUnitCircleAction z (relationalUnitCircleAction w v)`.

Do not introduce a global `MulAction` instance, source-original Gamma9 entry substitution, alternative projector, new axiom, unproved unit-sphere homeomorphism, or Fock-space physics.

## Qualification requirements

Strict preflight pins original BFSS Core/Gamma9 and accepted P-J/Q-phase and Circle source bytes, source independently computed signed-permutation integer Gamma9 fixture, exact new source/consumer Git blobs and imports, exactly one `abbrev`, one `noncomputable def`, and two named theorems plus the expected native/independent axiom reports. Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Compile original source with warning-as-error, then separately imported original-source consumer with warning-as-error, and require both source and consumer `#print axioms` to contain only `propext`, `Classical.choice`, `Quot.sound` with no `sorryAx` or compiler error. Preserve exact original CI artifact ZIP digest and embedded tested commit, even when RED; strict failure never counts as theorem qualification.

## Next mathematical and scientific boundary

The gate establishes only a well-defined algebraic Circle action on the explicitly source-defined norm-one P-image if it passes. It **does not yet** prove intrinsic sphere nonemptiness, stabilizer freeness, joint continuity, dimension/homeomorphism to `S³`, or a topological Hopf quotient `S³/S¹ ≅ S²`. The next separate freeness microgate may derive `v≠0` from `v ⬝ᵥ v=1` using a verified zero-vector dot-product theorem, then apply accepted `relationalCircleVector_fixed_point_implies_one`. Actual topology and source-exact circle action continuity remain separate. Original full 16-dimensional carrier has fixed complementary 12-dimensional space and is not free. BFSS physical 48-Majorana/24-complex-mode Fock implementer, global Spin(9), SU(2) Gauss/Hamiltonian covariance, stable solitons and Standard Model observables remain open.

Preserve negative knowledge from P9C3D2F0 R1 native matrix subscript error, P9C3D2E1 R1 namespace error, P9C3D2B R1 duplicate rewrite, earlier P9C3D0 and original Gamma9 unsuccessful gates, without altering `main`.
