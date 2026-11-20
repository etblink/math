import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D24OriginalGammaSourceInnerCore

/-! Imported independent consumer of the original Gamma9 source
real inner-product core, without installing a duplicate global norm. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D24Independent
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D23
open FCP.RHOPFP9C3D2G1D24

example : InnerProductSpace.Core ℝ (Fin 4 → ℝ) :=
  relationalSourceInnerCore

example (x y : Fin 4 → ℝ) :
    relationalSourceInnerCore.inner x y =
      relationalSourceBilinForm x y :=
  relationalSourceInnerCore_inner_apply x y

example (x : Fin 4 → ℝ) :
    relationalSourceInnerCore.inner x x =
      relationalRangeCoordinateDotSelf x :=
  relationalSourceInnerCore_self_eq_quadratic x

#print axioms FCP.RHOPFP9C3D2G1D24.relationalSourceInnerCore
#print axioms FCP.RHOPFP9C3D2G1D24.relationalSourceInnerCore_inner_apply
#print axioms FCP.RHOPFP9C3D2G1D24.relationalSourceInnerCore_self_eq_quadratic

end
end FCP.RHOPFP9C3D2G1D24Independent
