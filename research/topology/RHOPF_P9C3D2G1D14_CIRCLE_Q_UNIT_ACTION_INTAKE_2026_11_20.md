# RHOPF-P9C3D2G1D14 — original Circle action preserves original transported Q-unit sphere

**Pacific date:** 2026-11-20. **Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED until native and independent strict GREEN with independently inspected exact original artifact.

D13 original strict run [#44801618228](https://github.com/etblink/math/actions/runs/44801618228), exact tested `0a4d237ed0888f70a484e4e639212f8ad2219eda`, qualified the **genuine source-original Gamma9** Circle action on `im(P)` and transported `Fin 4 → ℝ` as `ρ₄(z)x = Re(z) • x + Im(z) • J₄ x`. Original evidence SHA256 `d6ec3c53cc0f02aed67a4bce209627afe2428c06b94ee454e935672783ffd533` independently verified. Accepted in commit `0c6a6f0e7b7740bdd4f43eddfd98157dbf8a43d7`.

## D14 bounded target

The original D2F0 has already qualified `relationalCircleVector_dot_self`: for **all** native `SpinIndex → ℝ` vectors, the original Gamma9 Circle matrix preserves the source Euclidean dot-self. The D13 genuine action is literally its restriction to the source original rank-four range followed by conjugation using `E`.

Prove
```lean
theorem relationalCircleFourAction_preserves_original_quadratic
    (z : Circle) (x : Fin 4 → ℝ) :
    relationalRangeCoordinateDotSelf (relationalCircleFourAction z x) =
      relationalRangeCoordinateDotSelf x

noncomputable def relationalCircleQUnitAction
    (z : Circle) (v : RelationalQUnitCoordinates) :
    RelationalQUnitCoordinates
```
where `Q(x)=dot(E.symm x,E.symm x)`, and `RelationalQUnitCoordinates` is the exact accepted `Q(x)=1` subtype from G1C7. No assumed Euclidean isometry of E; the source exact `relationalCircleRangeAction` is retained.

The independent imported consumer must check both statement types and the native/independent `#print axioms` reports (2+2) must include only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`.

Frozen source original Gamma9, original D2F0, accepted G1C7/G1C0, G1D13 and all earlier source Git blob SHA pins, independent original integer fixture, Lean 4.34.1/Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, warnings-as-errors, original artifact ZIP regardless of GREEN/RED. No original source edits or `main` writes.

**Limitations:** The source Q-unit sphere is homeomorphic to Euclidean S³ by earlier G1D4, and source G1D7 action was proved free and continuous. D14 does NOT imply that the G1D4 homeomorphism is Hopf-equivariant, nor that E is a Euclidean isometry. Subsequent gates must explicitly construct a compatible orthonormal complex basis for `Q,J₄` and an actual equivariant standard-sphere map before asserting `S³/S¹≃S²`, a Chern class/charge, original physical Fock/Gauss/Hamiltonian symmetry, or a stable hopfion.
