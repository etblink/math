# RHOPF-P9C3D2C — original Gamma9 relational phase J kernel microgate intake

**Date:** 2026-11-19
**Canonical branch:** `integration/bfss-unified-research-20261108`
**Status:** PENDING STRICT NATIVE + INDEPENDENT QUALIFICATION.
**Last accepted prerequisite:** P9C3D2B R2 [#44631824647](https://github.com/etblink/math/actions/runs/44631824647), exact tested SHA `21f0aba2b117352006bb171f312f0557ce43a985`, acceptance commit `cc044cdb3ce72fadb5de082a7ef67f005fbfde7f`.

## Why this gate is necessary

From source-original Gamma9 accepted P9C2A algebra `J² = -P`, we can establish that J acts invertibly *on the image of the rank-four projector P*, without relying on a private gamma table, coordinates or a convenient alternate representation.

The only new source theorem is:

```lean
theorem relationalPhaseJ_kernel_zero_on_projector_image
    (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v)
    (hJ : relationalPhaseJ.mulVec v = 0) :
    v = 0
```

The proof applies J twice, uses the exact native `relationalPhaseJ_square_neg_projector`, evaluates `(-P).mulVec v=-P.mulVec v`, and uses `P.mulVec v = v` to conclude `-v=0`. This is a single small algebraic lemma that can later contribute to the freeness proof. It does NOT, on its own, establish freeness for every nontrivial complex phase.

## Proof contract and strict workflow

The source imports only the accepted P9C3D2B original source and uses original matrix/SpinIndex aliases. The independent consumer separately imports and typechecks the exact theorem. Strict preflight checks all accepted Gamma9/Core/P9 predecessor file hashes, exact new source and consumer blobs, exact imports and theorem declarations, balanced sections/namespaces, explicit `autoImplicit false`, and bans `sorry`, new `axiom` and resource-option escalation. Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, source-independent signed-permutation integer fixture, native and imported independent source consumer warnings-as-errors, and both axiom reports with only `propext`, `Classical.choice`, `Quot.sound` are mandatory. Archive original tested commit, ZIP and native/consumer RED or GREEN transcripts.

No branch other than unified integration and no source-original gamma, Fock, physical or Core file is changed.

## Subsequent tests / physical boundary

A later free-action gate on the **unit sphere of P-image** will still need to show `rho(z)v=v` for `v ≠ 0`, `Pv=v` forces `z=1`; the source-verified `J²=-P` is a useful ingredient, not a completed freeness proof. The ambient 16-real-spinor sphere cannot support a free full action since the complementary 12-dimensional sector is fixed. Joint continuity of the vector action, a certified identification of the rank-four unit sphere with `S³`, Hopf quotient (S^3/S^1 cong S^2), Spin(9) equivariance, original physical 24-mode Fock implementation, SU(2) gauge/Hamiltonian covariance, and Standard Model observables remain separately unproved.
