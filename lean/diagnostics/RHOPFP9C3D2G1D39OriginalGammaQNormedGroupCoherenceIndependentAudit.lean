import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D39OriginalGammaQNormedGroupCoherence

/-! Independent imported audit for the actual D38 detached norm
and original Gamma9-Q squared-norm, not a synthetic norm. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D39Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D38
open FCP.RHOPFP9C3D2G1D39

example (x : RelationalSourceComplexFour) :
    relationalSourceComplexFourGroupNorm x =
      relationalSourceComplexFourQNorm x :=
  relationalSourceComplexFourGroupNorm_eq_QNorm x

example (x : RelationalSourceComplexFour) :
    (relationalSourceComplexFourGroupNorm x) ^ 2 =
      relationalRangeCoordinateDotSelf x.coordinates :=
  relationalSourceComplexFourGroupNorm_sq x

example (x : RelationalSourceComplexFour) (hx : x ≠ 0) :
    0 < relationalSourceComplexFourGroupNorm x :=
  relationalSourceComplexFourGroupNorm_pos_of_ne_zero x hx

#print axioms FCP.RHOPFP9C3D2G1D39.relationalSourceComplexFourGroupNorm
#print axioms FCP.RHOPFP9C3D2G1D39.relationalSourceComplexFourGroupNorm_eq_QNorm
#print axioms FCP.RHOPFP9C3D2G1D39.relationalSourceComplexFourGroupNorm_sq
#print axioms FCP.RHOPFP9C3D2G1D39.relationalSourceComplexFourGroupNorm_pos_of_ne_zero

end
end FCP.RHOPFP9C3D2G1D39Independent
