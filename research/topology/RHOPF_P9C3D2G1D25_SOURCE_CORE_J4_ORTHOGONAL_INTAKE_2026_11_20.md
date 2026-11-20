# RHOPF-P9C3D2G1D25 — original Gamma9 J4 orthogonal/skew under original-source core intake

**Pacific date:** 2026-11-20. **Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED until original native and independently imported strict GREEN + original artifact SHA verification.

D24 R2 [run #44836782767](https://github.com/etblink/math/actions/runs/44836782767) at exact tested SHA `1b94c378c66a782668420929285c23b91e027b25` strictly qualified `InnerProductSpace.Core ℝ (Fin 4 → ℝ)` from the source-original 16-real-spinor dot transported by accepted E⁻¹, without installing a global normed instance. Independently recalculated original archive SHA256 `64aafe028b66b22d82d821b7ce674c0bd7a3dc73ed9c26469b04deec8ba040d2` and verified original native/independent axioms. Accepted in `0edf7f292b2e4aeeb987fab56a72903336d77f8d`. Rejected D24 R1 run #44834708777 is preserved with original RED diagnosis and archive.

## Original-source next bridge, no substitute Euclidean metric

D19 proves original transported quadratic polarization `relationalSourcePolarQuadratic (J4 x) (J4 y)=relationalSourcePolarQuadratic x y`, D20 proves this polar form equals original E-inverse transported 16-spinor dot, D23 packages that exact function as a bilinear form, and D24 builds the source real inner-product core. D10 proves the original Gamma9 J4 is source-linear and `J4 (J4 x)=-x`.

This bounded gate proves:
```lean
relationalSourceInnerCore_J4_invariant
  (x y : Fin 4 → ℝ) :
  relationalSourceInnerCore.inner (relationalPhaseJFourLinear x)
    (relationalPhaseJFourLinear y) =
    relationalSourceInnerCore.inner x y

relationalSourceInnerCore_J4_skew
  (x y : Fin 4 → ℝ) :
  relationalSourceInnerCore.inner (relationalPhaseJFourLinear x) y =
    - relationalSourceInnerCore.inner x (relationalPhaseJFourLinear y)
```
Skew follows by applying core J4-invariance to `J4 x, y`, using D10 `J4²=-I` and D22 linearity. Proves actual source J4 is compatible with actual source Q. Does NOT build a complex Hilbert space or a complex orthonormal isometric identification with ℂ², nor classical scalar Circle conjugacy or Hopf quotient/Chern class or BFSS physical Fock/gauge/Hamiltonian or stable soliton.

Strict original-source CI must pin original Gamma9/P/J/Circle and accepted source D10,D19,D20–D24, signed-permutation original integer fixture, Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; no global instance change, theorem signature changes, proof-budget overrides or new axioms. Native and separately imported consumer compile with warnings-as-error, 2+2 axiom reports restricted to `propext`, `Classical.choice`, `Quot.sound` and no `sorryAx`. Independently verify original ZIP and exact tested commit. Preserve all failed diagnostics if RED.
