import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D32OriginalGammaComplexModuleHermitianBinding

/-! Independent imported consumer of original Gamma9 source H bound
to its isolated Module ℂ carrier, tested with exact typed interfaces. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D32Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D32

example (x y : RelationalSourceComplexFour) : ℂ :=
  relationalSourceComplexFourHermitian x y

example (x y : RelationalSourceComplexFour) :
    star (relationalSourceComplexFourHermitian y x) =
      relationalSourceComplexFourHermitian x y :=
  relationalSourceComplexFourHermitian_conj_symm x y

example (x : RelationalSourceComplexFour) :
    (relationalSourceComplexFourHermitian x x).im = 0 :=
  relationalSourceComplexFourHermitian_self_im_zero x

example (x : RelationalSourceComplexFour) :
    (relationalSourceComplexFourHermitian x x).re =
      relationalRangeCoordinateDotSelf x.coordinates :=
  relationalSourceComplexFourHermitian_self_re_quadratic x

example (x : RelationalSourceComplexFour) (hx : x ≠ 0) :
    0 < (relationalSourceComplexFourHermitian x x).re :=
  relationalSourceComplexFourHermitian_self_re_pos_of_ne_zero x hx

example (x y : RelationalSourceComplexFour) :
    relationalSourceComplexFourHermitian (Complex.I • x) y =
      Complex.I * relationalSourceComplexFourHermitian x y :=
  relationalSourceComplexFourHermitian_I_left x y

example (x y : RelationalSourceComplexFour) :
    relationalSourceComplexFourHermitian x (Complex.I • y) =
      -(Complex.I * relationalSourceComplexFourHermitian x y) :=
  relationalSourceComplexFourHermitian_I_right x y

#print axioms FCP.RHOPFP9C3D2G1D32.relationalSourceComplexFourHermitian
#print axioms FCP.RHOPFP9C3D2G1D32.relationalSourceComplexFourHermitian_conj_symm
#print axioms FCP.RHOPFP9C3D2G1D32.relationalSourceComplexFourHermitian_self_im_zero
#print axioms FCP.RHOPFP9C3D2G1D32.relationalSourceComplexFourHermitian_self_re_quadratic
#print axioms FCP.RHOPFP9C3D2G1D32.relationalSourceComplexFourHermitian_self_re_pos_of_ne_zero
#print axioms FCP.RHOPFP9C3D2G1D32.relationalSourceComplexFourHermitian_I_left
#print axioms FCP.RHOPFP9C3D2G1D32.relationalSourceComplexFourHermitian_I_right

end
end FCP.RHOPFP9C3D2G1D32Independent
