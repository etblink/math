# RHOPF-P9C3D2G1D18 — source-exact range/Q-unit Circle equivariance intake

**Pacific date:** 2026-11-20. **Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED until strict native/imported consumer and original CI artifact verification.

**Previous accepted gate:** G1D17 R2 run [#44816607544](https://github.com/etblink/math/actions/runs/44816607544) strict GREEN exact tested `d648e35b229cfa2794f37b906c99f9afb13e913f`. Original ZIP SHA256 `264df28a58b63acf3ec6818db6ded9fa4261f460e33297f381a423a0eab2c7e5` independently computed and original embedded tested commit checked. Accepted at `057e42dcc61cc7221655f9acafbe447768aa27db`. R1 RED run #44813710526 with both exact Lean errors is preserved at `2dab0857e91c4c359a67ec8f00acee82e3e4828a` and never qualified.

## Scope / rigorous need

G1D3 strictly accepted `relationalRangeUnitHomeomorphQUnit : RelationalRangeUnitSphere ≃ₜ RelationalQUnitCoordinates`, a restriction of source-original continuous linear coordinate equivalence `E`. G1D13 defines `relationalCircleRangeAction` from the ACTUAL original Gamma9 matrix action, and D14's `relationalCircleQUnitAction` is its E-transport; D15–D17 qualify group laws, continuity, and freeness for that Q-unit action.

D18 defines the actual original range unit sphere action by source matrix and D2F0 dot-self preservation, then proves **explicit equivariance of the existing G1D3 homeomorphism**, without identifying a standard complex scalar action:

```lean
noncomputable def relationalRangeUnitCircleAction
    (z : Circle) (v : RelationalRangeUnitSphere) :
    RelationalRangeUnitSphere

theorem relationalRangeUnitHomeomorphQUnit_circle_equivariant
    (z : Circle) (v : RelationalRangeUnitSphere) :
    relationalRangeUnitHomeomorphQUnit
      (relationalRangeUnitCircleAction z v) =
      relationalCircleQUnitAction z
        (relationalRangeUnitHomeomorphQUnit v)
```

This must use original G1D3 `E` via `E.symm (E v)=v`, D13 original range action and D14 original Q-unit action, NOT an invented action defined to be standard complex multiplication. Freeze original Gamma9/P/J, G1D3, D2F0, D13–D17 and independent signed-permutation fixture hashes. Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, warnings-as-error. Original RED/GREEN ZIP archiving, exact commit manifest, independent imported consumer, native and independent axiom lists restricted to `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`.

**Open after this gate:** construct a Q-compatible orthonormal complex basis / complex linear equivalence from `J₄²=-I` and Q-orthogonality; intertwine source action with standard scalar S¹ on ℂ²; establish equivariance for Euclidean S³, then Hopf quotient, first Chern class/topological charge. Physical original 48-Majorana Fock/Gauss/Hamiltonian implementer and physical stable hopfion remain distinct.
