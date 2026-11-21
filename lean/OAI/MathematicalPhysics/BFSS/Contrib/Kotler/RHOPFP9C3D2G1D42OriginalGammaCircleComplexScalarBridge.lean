import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D41OriginalGammaSourceQComplexInnerProductSpace

/-!
# RHOPF-P9C3D2G1D42 — source-original Gamma9 Circle to complex scalar bridge

The D13 Circle action is the original Gamma9 matrix action transported to
the source-four-real coordinates. D29/D31 construct the complex scalar
action from the same J4. Compare the actions on the isolated complex
carrier, then prove source-Q and original induced norm preservation.

No global instances, complex orthonormal frame, classical Hopf quotient,
Chern class or physical BFSS dynamics is inferred.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D42
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D13
open FCP.RHOPFP9C3D2G1D14
open FCP.RHOPFP9C3D2G1D29
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D39

/-- Genuine original Gamma9 Circle matrix action transported to the
isolated complex carrier, with no postulated alternate action. -/
noncomputable def relationalSourceComplexFourCircleAction
    (z : Circle) (x : RelationalSourceComplexFour) :
    RelationalSourceComplexFour :=
  ⟨relationalCircleFourAction z x.coordinates⟩

/-- The genuine original Gamma9 Circle action agrees with the
source-defined complex scalar action by the unit complex number. -/
theorem relationalSourceComplexFourCircleAction_eq_smul
    (z : Circle) (x : RelationalSourceComplexFour) :
    relationalSourceComplexFourCircleAction z x = (z : ℂ) • x := by
  apply RelationalSourceComplexFour.ext
  change relationalCircleFourAction z x.coordinates =
    relationalSourceComplexScalarAction (z : ℂ) x.coordinates
  rw [relationalCircleFourAction_phase]
  rfl

/-- The actual original Gamma9 Circle action preserves the original
transported quadratic form Q, without replacing its metric. -/
theorem relationalSourceComplexFourCircleAction_preserves_Q
    (z : Circle) (x : RelationalSourceComplexFour) :
    relationalRangeCoordinateDotSelf
      (relationalSourceComplexFourCircleAction z x).coordinates =
        relationalRangeCoordinateDotSelf x.coordinates := by
  change relationalRangeCoordinateDotSelf
      (relationalCircleFourAction z x.coordinates) =
        relationalRangeCoordinateDotSelf x.coordinates
  exact relationalCircleFourAction_preserves_original_quadratic z x.coordinates

/-- The actual source Circle action preserves the norm of the
locally constructed source-Q D38 normed additive group. -/
theorem relationalSourceComplexFourCircleAction_preserves_groupNorm
    (z : Circle) (x : RelationalSourceComplexFour) :
    relationalSourceComplexFourGroupNorm
      (relationalSourceComplexFourCircleAction z x) =
        relationalSourceComplexFourGroupNorm x := by
  calc
    relationalSourceComplexFourGroupNorm
        (relationalSourceComplexFourCircleAction z x) =
      relationalSourceComplexFourQNorm
        (relationalSourceComplexFourCircleAction z x) :=
        relationalSourceComplexFourGroupNorm_eq_QNorm _
    _ = relationalSourceComplexFourQNorm x := by
      unfold relationalSourceComplexFourQNorm
      rw [relationalSourceComplexFourCircleAction_preserves_Q]
    _ = relationalSourceComplexFourGroupNorm x :=
      (relationalSourceComplexFourGroupNorm_eq_QNorm x).symm

#print axioms relationalSourceComplexFourCircleAction
#print axioms relationalSourceComplexFourCircleAction_eq_smul
#print axioms relationalSourceComplexFourCircleAction_preserves_Q
#print axioms relationalSourceComplexFourCircleAction_preserves_groupNorm

end
end FCP.RHOPFP9C3D2G1D42
