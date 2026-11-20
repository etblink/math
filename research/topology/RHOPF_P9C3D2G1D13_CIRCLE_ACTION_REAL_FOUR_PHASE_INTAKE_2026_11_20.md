# RHOPF-P9C3D2G1D13 — source exact real-four Circle phase transport intake

**Pacific date:** 2026-11-20. **Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED pending source-native and independent consumer strict GREEN plus independently downloaded original ZIP verification.

D12 R2 [#44796429102](https://github.com/etblink/math/actions/runs/44796429102), tested `f9c002508fc95d3b9ac4f084d9be7b82c24b300a`, qualified source-original original Gamma9 native Circle action on the rank-four projector image as `re(z) • v+im(z) • Jv`, original artifact ZIP SHA256 `383801b8e7137f40ffc9e4692276aeca532181b110fb73d581c5ce2f02ecc341` independently checked and accepted at [`a517549e`](https://github.com/etblink/math/commit/a517549e9b627be8d2167cdd8dfd39be7a5fd279). R1 RED preserved in `49122dfb`, not accepted.

## D13 actual-action source bridge

Reuse original D2B `relationalCircleVector_preserves_projector_image`, and qualified G1A `LinearMap.IsProj`, to define a literal original Gamma9 circle action `relationalCircleRangeAction` on the projector range, using the **source `relationalCircleVector`**, not the desired complex formula.

Transport its output through the accepted `E : im(P) ≃L[ℝ] (Fin 4 → ℝ)` to define `relationalCircleFourAction z x := E (relationalCircleRangeAction z (E.symm x))`. Prove two source exact formulas:
```lean
theorem relationalCircleRangeAction_phase
    (z : Circle) (v : LinearMap.range (Matrix.toLin' relationalProjector)) :
    relationalCircleRangeAction z v =
      (z : ℂ).re • v + (z : ℂ).im • relationalPhaseJRangeLinear v

theorem relationalCircleFourAction_phase
    (z : Circle) (x : Fin 4 → ℝ) :
    relationalCircleFourAction z x =
      (z : ℂ).re • x + (z : ℂ).im • relationalPhaseJFourLinear x
```
The second formula must follow by algebraic real-linear conjugacy, not an assumed coordinate basis. Independently import all source definitions and results. Four native + four independent axiom reports must only use `propext`, `Classical.choice`, `Quot.sound`, with no `sorryAx`.

Freeze accepted original source Gamma9 P/J, D2B, G1C0, D10-D12 blobs and independent integer fixture. Pin Lean 4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612. Native and independent consumers run warning-as-error and preserve original RED/GREEN CI archive with hashes.

**Not proved:** classical complex scalar Hopf circle on the ordinary Euclidean dot-one S³, source-compatible orthonormal complex basis, quotient `S³/S¹≃S²`, Chern class, physical BFSS Fock/gauge/Hamiltonian or stable soliton. Subsequent work must explicitly connect transported four-coordinate action to G1D4 normalized Euclidean S³, and prove compatible orthonormal complex basis and actual equivariant conjugacy.

No `main` writes, original Gamma9 edits, new axioms or proof-budget changes.
