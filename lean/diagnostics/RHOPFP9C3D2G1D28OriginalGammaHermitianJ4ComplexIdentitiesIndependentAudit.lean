import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D28OriginalGammaHermitianJ4ComplexIdentities

/-! Independent imported original-source audit of exact full complex
H(J4x,y)=iH(x,y) and H(x,J4y)=-iH(x,y) equalities. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D28Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D26
open FCP.RHOPFP9C3D2G1D28

example (x y : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate (relationalPhaseJFourLinear x) y =
      Complex.I * relationalSourceHermitianCandidate x y :=
  relationalSourceHermitianCandidate_J4_left_mul_I x y

example (x y : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate x (relationalPhaseJFourLinear y) =
      -(Complex.I * relationalSourceHermitianCandidate x y) :=
  relationalSourceHermitianCandidate_J4_right_neg_mul_I x y

#print axioms FCP.RHOPFP9C3D2G1D28.relationalSourceHermitianCandidate_J4_left_mul_I
#print axioms FCP.RHOPFP9C3D2G1D28.relationalSourceHermitianCandidate_J4_right_neg_mul_I

end
end FCP.RHOPFP9C3D2G1D28Independent
