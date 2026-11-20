import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D11OriginalGammaPhasePreservesTransportedQuadratic

/-! Independent consumer of original Gamma9 metric-preserving phase on exact P-image/R4. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D11Independent
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D11

example (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v) :
    (relationalPhaseJ.mulVec v) ⬝ᵥ (relationalPhaseJ.mulVec v) = v ⬝ᵥ v :=
  relationalPhaseJ_mulVec_dot_self_on_projector_image v hv

example (x : Fin 4 → ℝ) :
    relationalRangeCoordinateDotSelf (relationalPhaseJFourLinear x) =
      relationalRangeCoordinateDotSelf x :=
  relationalPhaseJFourLinear_preserves_original_quadratic x

#print axioms FCP.RHOPFP9C3D2G1D11.relationalPhaseJ_mulVec_dot_self_on_projector_image
#print axioms FCP.RHOPFP9C3D2G1D11.relationalPhaseJFourLinear_preserves_original_quadratic

end
end FCP.RHOPFP9C3D2G1D11Independent
