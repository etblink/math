import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D25OriginalGammaSourceInnerCoreJ4Orthogonal

/-! Independent source-typed imported audit: original Gamma9 J4 orthogonality
and skew-adjointness under the exact source-derived inner product. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D25Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D24
open FCP.RHOPFP9C3D2G1D25

example (x y : Fin 4 → ℝ) :
    relationalSourceInnerCore.inner
      (relationalPhaseJFourLinear x)
      (relationalPhaseJFourLinear y) =
    relationalSourceInnerCore.inner x y :=
  relationalSourceInnerCore_J4_invariant x y

example (x y : Fin 4 → ℝ) :
    relationalSourceInnerCore.inner
      (relationalPhaseJFourLinear x) y =
    - relationalSourceInnerCore.inner
      x (relationalPhaseJFourLinear y) :=
  relationalSourceInnerCore_J4_skew x y

#print axioms FCP.RHOPFP9C3D2G1D25.relationalSourceInnerCore_J4_invariant
#print axioms FCP.RHOPFP9C3D2G1D25.relationalSourceInnerCore_J4_skew

end
end FCP.RHOPFP9C3D2G1D25Independent
