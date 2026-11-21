import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D35OriginalGammaHermitianComplexScalarLeft

/-! Independently import original-source arbitrary complex scalar H
left linearity and the isolated Module ℂ carrier consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D35Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D26
open FCP.RHOPFP9C3D2G1D29
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D32
open FCP.RHOPFP9C3D2G1D35

example (z : ℂ) (x y : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate
        (relationalSourceComplexScalarAction z x) y =
      z * relationalSourceHermitianCandidate x y :=
  relationalSourceHermitianCandidate_complex_smul_left z x y

example (z : ℂ) (x y : RelationalSourceComplexFour) :
    relationalSourceComplexFourHermitian (z • x) y =
      z * relationalSourceComplexFourHermitian x y :=
  relationalSourceComplexFourHermitian_smul_left z x y

#print axioms FCP.RHOPFP9C3D2G1D35.relationalSourceHermitianCandidate_complex_smul_left
#print axioms FCP.RHOPFP9C3D2G1D35.relationalSourceComplexFourHermitian_smul_left

end
end FCP.RHOPFP9C3D2G1D35Independent
