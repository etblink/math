import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D33OriginalGammaHermitianRealLinearAdditive

/-! Independent original-source imported audit of Q-Hermitian
real additivity, homogeneity and wrapper complex-module additivity. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D33Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D26
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D32
open FCP.RHOPFP9C3D2G1D33

example (x y z : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate (x + y) z =
      relationalSourceHermitianCandidate x z +
        relationalSourceHermitianCandidate y z :=
  relationalSourceHermitianCandidate_add_left x y z

example (a : ℝ) (x y : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate (a • x) y =
      (a : ℂ) * relationalSourceHermitianCandidate x y :=
  relationalSourceHermitianCandidate_real_smul_left a x y

example (x y z : RelationalSourceComplexFour) :
    relationalSourceComplexFourHermitian (x + y) z =
      relationalSourceComplexFourHermitian x z +
        relationalSourceComplexFourHermitian y z :=
  relationalSourceComplexFourHermitian_add_left x y z

#print axioms FCP.RHOPFP9C3D2G1D33.relationalSourceHermitianCandidate_add_left
#print axioms FCP.RHOPFP9C3D2G1D33.relationalSourceHermitianCandidate_real_smul_left
#print axioms FCP.RHOPFP9C3D2G1D33.relationalSourceComplexFourHermitian_add_left

end
end FCP.RHOPFP9C3D2G1D33Independent
