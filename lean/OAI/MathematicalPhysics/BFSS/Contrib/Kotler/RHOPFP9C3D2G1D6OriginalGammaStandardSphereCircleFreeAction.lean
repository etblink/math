import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D5OriginalGammaStandardSphereCircleAction
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2F2OriginalGammaRelationalUnitCircleFreeAction

/-!
# RHOPF-P9C3D2G1D6 — transported original Gamma9 Circle action is free on S³

The original Gamma9 relational unit-spinor action is free (accepted F2).
The accepted G1D4 homeomorphism, and its G1D5-conjugated circle action,
transport trivial point stabilizers to standard Euclidean dot-one S³.

Do not introduce a replacement Gamma9 matrix, preferred complex basis or
classical Hopf identification. Joint continuity and physical Fock action
remain independent proof obligations.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D6
noncomputable section

open FCP.RHOPFP9C3D2F1
open FCP.RHOPFP9C3D2F2
open FCP.RHOPFP9C3D2G1D0
open FCP.RHOPFP9C3D2G1D4
open FCP.RHOPFP9C3D2G1D5

/-- A phase fixing a point on standard S³ under the transported
source-exact Gamma9 circle action must be the identity. -/
theorem relationalStandardCircleAction_fixed_point_implies_one
    (z : Circle) (u : StandardUnitCoordinates)
    (hfix : relationalStandardCircleAction z u = u) : z = 1 := by
  let e := relationalUnitSpinorHomeomorphStandardUnit
  have hsource :
      relationalUnitCircleAction z (e.symm u) = e.symm u := by
    apply e.injective
    calc
      e (relationalUnitCircleAction z (e.symm u)) =
          relationalStandardCircleAction z u := by rfl
      _ = u := hfix
      _ = e (e.symm u) := (e.apply_symm_apply u).symm
  exact relationalUnitCircleAction_fixed_point_implies_one z (e.symm u) hsource

/-- Every nonidentity original Circle phase acts without fixed
points on the transported standard S³ sphere. -/
theorem relationalStandardCircleAction_ne_fixed_of_ne_one
    (z : Circle) (u : StandardUnitCoordinates) (hz : z ≠ 1) :
    relationalStandardCircleAction z u ≠ u := by
  intro hfix
  exact hz (relationalStandardCircleAction_fixed_point_implies_one z u hfix)

#print axioms relationalStandardCircleAction_fixed_point_implies_one
#print axioms relationalStandardCircleAction_ne_fixed_of_ne_one

end
end FCP.RHOPFP9C3D2G1D6
