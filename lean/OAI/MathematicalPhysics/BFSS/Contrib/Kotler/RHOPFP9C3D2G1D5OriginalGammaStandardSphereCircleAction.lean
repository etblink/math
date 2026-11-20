import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D4OriginalGammaRelationalStandardSphereHomeomorph

/-!
# RHOPF-P9C3D2G1D5 — transport original Gamma9 circle action to standard S³

Given the strict-qualified G1D4 Homeomorph h from original Gamma9 relational
unit spinors to standard real-four Euclidean dot-one coordinates, transport
the original F1 Circle action by h (z · h⁻¹ u).

This gate proves ONLY the resulting well-typed action and its identity and
composition laws. Freeness and joint continuity are accepted on the original
source sphere (F2/F4), but their transport is a separate proof gate.
The induced standard-coordinate action is not assumed equal to the ordinary
complex scalar Hopf circle action.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D5
noncomputable section

open FCP.RHOPFP9C3D2F1
open FCP.RHOPFP9C3D2G1D0
open FCP.RHOPFP9C3D2G1D4

/-- The original source-Gamma9 action conjugated through the qualified
homeomorphism onto the standard Euclidean dot-one real-four sphere. -/
noncomputable def relationalStandardCircleAction
    (z : Circle) (u : StandardUnitCoordinates) : StandardUnitCoordinates :=
  relationalUnitSpinorHomeomorphStandardUnit
    (relationalUnitCircleAction z (relationalUnitSpinorHomeomorphStandardUnit.symm u))

/-- The transported original source action fixes every u at phase one. -/
theorem relationalStandardCircleAction_one (u : StandardUnitCoordinates) :
    relationalStandardCircleAction 1 u = u := by
  change relationalUnitSpinorHomeomorphStandardUnit
      (relationalUnitCircleAction 1
        (relationalUnitSpinorHomeomorphStandardUnit.symm u)) = u
  rw [relationalUnitCircleAction_one]
  exact relationalUnitSpinorHomeomorphStandardUnit.apply_symm_apply u

/-- Original Circle multiplication acts by composition on standard S³,
without identifying the action with the standard Hopf action. -/
theorem relationalStandardCircleAction_mul
    (z w : Circle) (u : StandardUnitCoordinates) :
    relationalStandardCircleAction (z * w) u =
      relationalStandardCircleAction z (relationalStandardCircleAction w u) := by
  let e := relationalUnitSpinorHomeomorphStandardUnit
  change e (relationalUnitCircleAction (z * w) (e.symm u)) =
    e (relationalUnitCircleAction z
      (e.symm (e (relationalUnitCircleAction w (e.symm u)))))
  rw [relationalUnitCircleAction_mul, e.symm_apply_apply]

#print axioms relationalStandardCircleAction
#print axioms relationalStandardCircleAction_one
#print axioms relationalStandardCircleAction_mul

end
end FCP.RHOPFP9C3D2G1D5
