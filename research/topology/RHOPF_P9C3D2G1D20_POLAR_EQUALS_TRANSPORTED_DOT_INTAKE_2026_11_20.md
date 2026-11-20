# RHOPF-P9C3D2G1D20 — original Gamma9 polarized source Q equals native dot product

**Date:** 2026-11-20 Pacific. **Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED pending strict native + independent Lean GREEN and original ZIP verification.

D19 [run #44822101317](https://github.com/etblink/math/actions/runs/44822101317) at exact tested SHA `4c8291ece66b8a7b3b964465e347fe74e3e6116d` strictly qualified the original transported quadratic polarization `B_Q(x,y) := (Q(x+y)-Q(x)-Q(y))/2` and its original source J4 invariance. Its independently recalculated original evidence ZIP SHA-256 is `7e505ff14408e054d06de75fbf0beb999c816c9adc5d07e7d48a0d2b014a282f`, accepted in `5c4b8677d3e870e9d59718b2a0574af4c582e42d`.

## D20 exact-source microgate

Define
```lean
noncomputable def relationalSourceTransportedDot
    (x y : Fin 4 → ℝ) : ℝ :=
  (relationalRangeContinuousLinearEquivFinFour.symm x).1 ⬝ᵥ
    (relationalRangeContinuousLinearEquivFinFour.symm y).1
```
and prove `relationalSourcePolarQuadratic_eq_transported_dot x y` from exact accepted G1C0 original range E, original G1C1 source quadratic Q, D19 polarization, and finite real spinor dot-product algebra. This is a specific algebraic identification, not yet a bundled inner product and not an assertion of Euclidean isometry for E.

Native and imported independent consumers must type-check both declarations and return only `propext`, `Classical.choice`, `Quot.sound` in both `#print axioms` reports (2+2), with no `sorryAx`. Frozen source exact original Gamma9/P/J/Circle, D19 and G1C0/C1 SHA pins, original independent integer source fixture, Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, warning-as-error, original RED/GREEN CI archive and exact tested SHA.

**Not yet proved by D20:** complete real bilinearity/positive definiteness of pulled-back dot as a Lean inner product, source-compatible complex Hilbert structure and a Q-orthonormal complex basis, classical scalar Hopf equivariance and quotient/Chern number, physical original 48-Majorana BFSS Fock/Gauss/Hamiltonian or stable soliton.
