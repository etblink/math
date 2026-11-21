import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D34OriginalGammaHermitianRightRealLaws

/-! Independent original-source Gamma9 consumer for the exact Q-Hermitian
second-variable real-linearity and isolated complex-module additivity. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D34Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D26
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D32
open FCP.RHOPFP9C3D2G1D34

example (x y z : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate x (y + z) =
      relationalSourceHermitianCandidate x y +
        relationalSourceHermitianCandidate x z :=
  relationalSourceHermitianCandidate_add_right x y z

example (a : ℝ) (x y : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate x (a • y) =
      (a : ℂ) * relationalSourceHermitianCandidate x y :=
  relationalSourceHermitianCandidate_real_smul_right a x y

example (x y z : RelationalSourceComplexFour) :
    relationalSourceComplexFourHermitian x (y + z) =
      relationalSourceComplexFourHermitian x y +
        relationalSourceComplexFourHermitian x z :=
  relationalSourceComplexFourHermitian_add_right x y z

#print axioms FCP.RHOPFP9C3D2G1D34.relationalSourceHermitianCandidate_add_right
#print axioms FCP.RHOPFP9C3D2G1D34.relationalSourceHermitianCandidate_real_smul_right
#print axioms FCP.RHOPFP9C3D2G1D34.relationalSourceComplexFourHermitian_add_right

end
end FCP.RHOPFP9C3D2G1D34Independent
