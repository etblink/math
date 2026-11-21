import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D37OriginalGammaComplexInnerProductCore

/-! Independent import proves the source-Q compatible Mathlib
complex inner-product Core exists on the ISOLATED source carrier.
No norm or ambient coordinate-space instance is installed. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D37Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D32
open FCP.RHOPFP9C3D2G1D37

example : InnerProductSpace.Core ℂ RelationalSourceComplexFour :=
  relationalSourceComplexFourInnerProductCore

example :
    relationalSourceComplexFourHermitian
      (0 : RelationalSourceComplexFour) 0 = 0 :=
  relationalSourceComplexFourHermitian_zero_self

example (x : RelationalSourceComplexFour) :
    0 ≤ (relationalSourceComplexFourHermitian x x).re :=
  relationalSourceComplexFourHermitian_self_re_nonneg x

example (x y : RelationalSourceComplexFour) :
    relationalSourceComplexFourInnerProductCore.inner x y =
      relationalSourceComplexFourHermitian y x :=
  relationalSourceComplexFourInnerProductCore_inner x y

example (x : RelationalSourceComplexFour) :
    (relationalSourceComplexFourInnerProductCore.inner x x).re =
      relationalRangeCoordinateDotSelf x.coordinates :=
  relationalSourceComplexFourInnerProductCore_self_re_quadratic x

#print axioms FCP.RHOPFP9C3D2G1D37.relationalSourceComplexFourHermitian_zero_self
#print axioms FCP.RHOPFP9C3D2G1D37.relationalSourceComplexFourHermitian_self_re_nonneg
#print axioms FCP.RHOPFP9C3D2G1D37.relationalSourceComplexFourInnerProductCore
#print axioms FCP.RHOPFP9C3D2G1D37.relationalSourceComplexFourInnerProductCore_inner
#print axioms FCP.RHOPFP9C3D2G1D37.relationalSourceComplexFourInnerProductCore_self_re_quadratic

end
end FCP.RHOPFP9C3D2G1D37Independent
