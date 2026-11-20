# RHOPF-P9C3D2E2 — nonzero original relational spinor sector invariance intake

**Date:** 2026-11-19
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Status:** New candidate — UNQUALIFIED until exact source and independent strict GREEN.
**Accepted predecessor:** P9C3D2E1 R2 [#44643285782](https://github.com/etblink/math/actions/runs/44643285782), exact tested SHA `0586c905a34ead5a35c34d5e2b8aa9ebd4e6cafd`, acceptance commit `78fdb14d1004af44651c63b9c95c949bbe742f24`.

## Narrow source-exact target

The accepted source-real 16-spinor action `relationalCircleVector z v = rho(z).mulVec v` is a Mathlib `Circle` action at the level of identity and multiplication laws, and `rho(z)` is orthogonal, continuous and preserves the rank-four original `P` image. The previous gate showed its fixed-point stabilizer is trivial on any `P`-supported nonzero v.

Before packaging an intrinsic free action on the nonzero `P`-image, prove two smaller original-source lemmas:

```lean
theorem relationalCircleVector_ne_zero
    (z : Circle) (v : SpinIndex → ℝ) (hne : v ≠ 0) :
    relationalCircleVector z v ≠ 0

theorem relationalCircleVector_preserves_nonzero_projector_image
    (z : Circle) (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v) (hne : v ≠ 0) :
    relationalProjector.mulVec (relationalCircleVector z v) =
      relationalCircleVector z v ∧
      relationalCircleVector z v ≠ 0
```

The first applies the qualified composition law with `z⁻¹*z=1`: if `rho(z)v=0`, then `v=rho(z⁻¹)rho(z)v=rho(z⁻¹)0=0`, contradicting nonzero v. The second simply combines this with previously strict-qualified projector-image invariance. No original gamma-coordinate or Fock operator is touched.

## Strict workflow and artifact criteria

The strict workflow pins original Core and original Gamma9 source and all accepted source adapters, new source and independent consumer blobs, Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, original signed-permutation integer fixture, exact declaration/import contract, namespace and noncomputable scope closure, and forbids axioms/sorries/resource overrides. Require both native original Lean and independently imported consumer warning-as-error compilation, both source and consumer `#print axioms` for both theorems allowing only `propext`, `Classical.choice`, `Quot.sound`, zero `sorryAx`, and original artifact ZIP SHA-256/embedded exact tested commit. Preserve original RED evidence even if this gate fails and limit any correction to diagnosed errors; don't change `main`.

## Remaining scientific boundary

Once qualified these two statements will certify nonzero support invariance, **not** a packaged intrinsic `MulAction` subtype or a joint-continuous action. Subsequent source-exact proof gates must define the intrinsic nonzero `P`-image and its free algebraic action, then identify the unit sphere of the rank-four image and prove norm preservation, continuity and an actual Hopf quotient. The full 16-real-spinor space contains a fixed complement and is not free. The original 48-Majorana/24-complex-mode BFSS Fock representation, full Spin(9) compatibility, SU(2) Gauss-law/Hamiltonian covariance, stable vortex or soliton geometry and Standard Model observables remain separate physical/empirical obligations.
