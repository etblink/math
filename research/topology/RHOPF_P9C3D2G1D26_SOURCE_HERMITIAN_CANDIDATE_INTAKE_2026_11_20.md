# RHOPF-P9C3D2G1D26 — exact source Gamma9 complex Hermitian candidate intake

**Pacific date:** 2026-11-20. **Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Disposition:** UNQUALIFIED until original native and independently imported strict GREEN and independently verified original evidence ZIP.

D25 [run #44839389468](https://github.com/etblink/math/actions/runs/44839389468) strictly qualified the exact source Gamma9 J4 to be orthogonal and skew-adjoint relative to original `InnerProductSpace.Core` derived from original transported Q. Exact tested SHA `ebf12fd54ec97e090d978f6661367a25c02fc99e`; verified original archive SHA-256 `166477419a60c11a3668fac24b64d91c96ae79032719c15af23d470e4f7220eb`; accepted at `7e4e8ce9d3b570849fb1b394eee840c1c0fb1f60`.

## Narrow source-exact D26 scope

Use already accepted original Gamma9/J4, original transported positive real inner-product core, and D25 skew/orthogonal theorems to introduce *a complex-valued Hermitian candidate only*:

```lean
noncomputable def relationalSourceHermitianCandidate
    (x y : Fin 4 → ℝ) : ℂ :=
  ⟨relationalSourceInnerCore.inner x y,
    -relationalSourceInnerCore.inner (relationalPhaseJFourLinear x) y⟩
```

This selects the convention of complex linearity in its *first* argument and conjugate linearity in its second (to be formally proved only after a compatible complex scalar action is defined).

Test exact real and imaginary parts, conjugate symmetry, zero imaginary diagonal, original Q as real diagonal, and positive real diagonal away from zero; independent consumer imports all seven declarations. Do not assert a `Module ℂ` or a full `InnerProductSpace ℂ` yet. The original Gamma9-derived source form B_Q is not ordinary coordinate Euclidean dot. No new gamma data, global norm, Hopf quotient/Chern charge, physical BFSS Fock, gauge, Hamiltonian, or soliton claim.

Strict native/independent CI pins original source Gamma9/P/J/Circle, accepted D24/D25 files and original independent integer fixture, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; warnings as errors, 7+7 allowed axiom reports restricted to `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx` or theorem-budget override. Original GREEN/RED ZIP with exact tested commit and SHA-256. If RED, preserve original diagnostics and make no unsupported mathematical claims.

**Next only after qualification:** formally prove the complex scalar action built from J4, first-variable complex linearity and second-variable conjugate linearity of H, then a norm-compatible complex two-dimensional coordinate frame, standard scalar S¹ equivariance, Hopf quotient/Chern class; original physical Fock remains open.
