# RHOPF-P9C3D2E3 — source-original intrinsic nonzero relational Circle action intake

**Date:** November 19, 2026.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Status:** UNQUALIFIED strict source-original proof candidate.
**Accepted predecessor:** P9C3D2E2 R1 original [#44646838489](https://github.com/etblink/math/actions/runs/44646838489), exact tested `b77f446400ffddf03fedc5072150424b331d6a33`, accepted `e5c8b92a7369eef8d5549ccb9e281edb7ac78bc5`.

## Mathematical scope and source exactness

The original BFSS Gamma9 real 16-spinor carrier, its original rank-four projector P, Mathlib Circle-to-real-matrix representation, and induced vector map `relationalCircleVector` already have strictly accepted algebraic identity/composition, matrix-valued continuity, orthogonality, P-image invariance, nonzero preservation and nonidentity-phase fixed-point exclusion on the nonzero P-image.

Define the intrinsic exact original-source subtype:
```lean
abbrev RelationalNonzeroSpinor : Type :=
  {v : SpinIndex → ℝ // relationalProjector.mulVec v = v ∧ v ≠ 0}
```
Define `relationalNonzeroCircleAction z v` by original `relationalCircleVector z v.1`, with its subtype proof supplied by the qualified `relationalCircleVector_preserves_nonzero_projector_image`. There is no invented basis, copied private gamma-entry table, alternative projector, fresh axiom or physical lifting.

Verify exactly three source theorems with three separately imported typed consumer examples:
1. `relationalNonzeroCircleAction_one`: `act(1,v)=v`.
2. `relationalNonzeroCircleAction_mul`: `act(z*w,v)=act(z,act(w,v))`.
3. `relationalNonzeroCircleAction_fixed_point_implies_one`: `act(z,v)=v → z=1`.

The original `relationalCircleVector_one`, `relationalCircleVector_mul` and `relationalCircleVector_fixed_point_implies_one` proofs discharge these by `Subtype.ext` and `congrArg Subtype.val`. Avoid introducing a global `MulAction Circle RelationalNonzeroSpinor` instance, which could have unintended typeclass effects in other code. A bundled typeclass and continuous action may be a future independent bounded gate.

## Exact strict gate

Pin all original accepted BFSS Core/Gamma9 source and predecessor phase/projector action modules, accepted P9C3D2E2, new source and independent consumer hashes, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, signed-permutation integer fixture derived independently from the original source, exact import and declaration-contract checks including one `abbrev`, one `noncomputable def`, three theorems and balanced noncomputable section/namespace. The original compiled source and separately imported exact-type consumer must pass warnings-as-errors, all six native/consumer root axiom reports must use only `propext`, `Classical.choice`, `Quot.sound`, with no `sorryAx`, compiler errors, increased proof resources or new axioms. Retain full original artifact including original ZIP SHA-256 and exact tested commit; any RED is permanently preserved and requires diagnosis before repair.

## Stop boundary and scientific interpretation

This gate is algebraic and does not certify a topological `MulAction`, joint continuity on the intrinsic nonzero subtype, a norm-preserving circle action on the **unit sphere** of the rank-four P-image, nonemptiness/homeomorphism to `S³`, or a topological Hopf orbit quotient `S³/S¹ ≅ S²`. The full ambient 16-real-spinor representation is not free because its 12-dimensional complementary subspace is fixed. No source-exact physical BFSS 48-Majorana/24-complex-mode Fock implementer, global Spin(9) equivariance, Gauss-law/Hamiltonian covariance, stable hopfion/vortex, or Standard Model observation is inferred. Maintain SCC counterfactual and experimental discrimination as long-term truth-seeking aims rather than interpreting this algebraic advance as physical validation.
