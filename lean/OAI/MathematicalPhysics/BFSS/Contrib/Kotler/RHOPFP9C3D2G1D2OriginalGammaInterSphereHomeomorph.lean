import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D1BOriginalGammaInterSphereInverseIdentities

/-!
# RHOPF-P9C3D2G1D2 — original Gamma9 inter-sphere Homeomorph

G1D0 strictly qualified both continuous radial maps between the
actual original Gamma9 Q-unit sphere and the standard Euclidean
real-four dot-one sphere. G1D1B qualified their two-sided inverse
identities. This gate bundles exactly those established maps and
proofs into a Lean Homeomorph; no preferred source Gamma9 coordinate
plane or Euclidean isometry is postulated.

This does not prove a homeomorphism from all punctured real-four
coordinates to a sphere. Original Circle-equivariance, the Hopf
quotient, a physical Fock implementation, and a stable hopfion are
separate unproved obligations.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D2
noncomputable section

open FCP.RHOPFP9C3D2G1C7
open FCP.RHOPFP9C3D2G1D0
open FCP.RHOPFP9C3D2G1D1B

/-- Actual Gamma9 Q-unit sphere homeomorphic to the explicit
standard Euclidean dot-one real-four unit sphere. -/
noncomputable def relationalQUnitHomeomorphStandardUnit :
    RelationalQUnitCoordinates ≃ₜ StandardUnitCoordinates where
  toFun := relationalQUnitToStandardUnit
  invFun := standardUnitToRelationalQUnit
  left_inv := standardUnitToRelationalQUnit_comp_relationalQUnitToStandardUnit
  right_inv := relationalQUnitToStandardUnit_comp_standardUnitToRelationalQUnit
  continuous_toFun := relationalQUnitToStandardUnit_continuous
  continuous_invFun := standardUnitToRelationalQUnit_continuous

/-- The bundled forward map is exactly the accepted source map. -/
theorem relationalQUnitHomeomorphStandardUnit_apply
    (v : RelationalQUnitCoordinates) :
    relationalQUnitHomeomorphStandardUnit v =
      relationalQUnitToStandardUnit v := by
  rfl

/-- The bundled inverse is exactly the accepted reverse map. -/
theorem relationalQUnitHomeomorphStandardUnit_symm_apply
    (v : StandardUnitCoordinates) :
    relationalQUnitHomeomorphStandardUnit.symm v =
      standardUnitToRelationalQUnit v := by
  rfl

#print axioms relationalQUnitHomeomorphStandardUnit
#print axioms relationalQUnitHomeomorphStandardUnit_apply
#print axioms relationalQUnitHomeomorphStandardUnit_symm_apply

end
end FCP.RHOPFP9C3D2G1D2
