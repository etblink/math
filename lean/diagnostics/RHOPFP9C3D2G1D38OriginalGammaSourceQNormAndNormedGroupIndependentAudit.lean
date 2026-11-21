import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D38OriginalGammaSourceQNormAndNormedGroup

/-! Independent imported consumer: original Gamma9 Q square-root
length and standalone Mathlib normed group, no ambient instance. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D38Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D37
open FCP.RHOPFP9C3D2G1D38

example (x : RelationalSourceComplexFour) :
    0 ≤ relationalSourceComplexFourQNorm x :=
  relationalSourceComplexFourQNorm_nonneg x

example (x : RelationalSourceComplexFour) :
    (relationalSourceComplexFourQNorm x) ^ 2 =
      relationalRangeCoordinateDotSelf x.coordinates :=
  relationalSourceComplexFourQNorm_sq x

example (x : RelationalSourceComplexFour) :
    relationalSourceComplexFourQNorm x =
      Real.sqrt ((relationalSourceComplexFourInnerProductCore.inner x x).re) :=
  relationalSourceComplexFourQNorm_eq_core_sqrt x

example (x : RelationalSourceComplexFour) (hx : x ≠ 0) :
    0 < relationalSourceComplexFourQNorm x :=
  relationalSourceComplexFourQNorm_pos_of_ne_zero x hx

example : NormedAddCommGroup RelationalSourceComplexFour :=
  relationalSourceComplexFourNormedAddCommGroup

#print axioms FCP.RHOPFP9C3D2G1D38.relationalSourceComplexFourQNorm
#print axioms FCP.RHOPFP9C3D2G1D38.relationalSourceComplexFourQNorm_nonneg
#print axioms FCP.RHOPFP9C3D2G1D38.relationalSourceComplexFourQNorm_sq
#print axioms FCP.RHOPFP9C3D2G1D38.relationalSourceComplexFourQNorm_eq_core_sqrt
#print axioms FCP.RHOPFP9C3D2G1D38.relationalSourceComplexFourQNorm_pos_of_ne_zero
#print axioms FCP.RHOPFP9C3D2G1D38.relationalSourceComplexFourNormedAddCommGroup

end
end FCP.RHOPFP9C3D2G1D38Independent
