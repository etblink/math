import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D12OriginalGammaCirclePhaseProjectorRange

/-! Independent imported original-source Gamma9 Circle/J phase consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D12Independent
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C3D2A
open FCP.RHOPFP9C3D2G1D9
open FCP.RHOPFP9C3D2G1D12

example (z : Circle) (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v) :
    relationalCircleVector z v =
      (z : ℂ).re • v + (z : ℂ).im • relationalPhaseJ.mulVec v :=
  relationalCircleVector_phase_on_projector_image z v hv

example (z : Circle)
    (v : LinearMap.range (Matrix.toLin' relationalProjector)) :
    relationalCircleVector z v.1 =
      (z : ℂ).re • v.1 +
        (z : ℂ).im • (relationalPhaseJRangeLinear v).1 :=
  relationalCircleVector_phase_on_projector_range z v

#print axioms FCP.RHOPFP9C3D2G1D12.relationalCircleVector_phase_on_projector_image
#print axioms FCP.RHOPFP9C3D2G1D12.relationalCircleVector_phase_on_projector_range

end
end FCP.RHOPFP9C3D2G1D12Independent
