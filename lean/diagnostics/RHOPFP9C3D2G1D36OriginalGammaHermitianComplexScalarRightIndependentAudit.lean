import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D36OriginalGammaHermitianComplexScalarRight

/-! Independent original-source imported consumer of the second-
variable complex conjugate-linear law; full sesquilinearity uses
D35 independently accepted left laws and D36 right laws. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D36Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D26
open FCP.RHOPFP9C3D2G1D29
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D32
open FCP.RHOPFP9C3D2G1D35
open FCP.RHOPFP9C3D2G1D36

example (z : ℂ) (x y : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate x
        (relationalSourceComplexScalarAction z y) =
      star z * relationalSourceHermitianCandidate x y :=
  relationalSourceHermitianCandidate_complex_smul_right z x y

example (z : ℂ) (x y : RelationalSourceComplexFour) :
    relationalSourceComplexFourHermitian x (z • y) =
      star z * relationalSourceComplexFourHermitian x y :=
  relationalSourceComplexFourHermitian_smul_right z x y

example (z w : ℂ) (x y : RelationalSourceComplexFour) :
    relationalSourceComplexFourHermitian (z • x) (w • y) =
      z * star w * relationalSourceComplexFourHermitian x y := by
  rw [relationalSourceComplexFourHermitian_smul_left,
      relationalSourceComplexFourHermitian_smul_right]
  ring

#print axioms FCP.RHOPFP9C3D2G1D36.relationalSourceHermitianCandidate_complex_smul_right
#print axioms FCP.RHOPFP9C3D2G1D36.relationalSourceComplexFourHermitian_smul_right

end
end FCP.RHOPFP9C3D2G1D36Independent
