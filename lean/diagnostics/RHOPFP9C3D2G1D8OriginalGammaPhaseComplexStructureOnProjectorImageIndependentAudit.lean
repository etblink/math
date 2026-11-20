import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D8OriginalGammaPhaseComplexStructureOnProjectorImage

/-! Independent imported original Gamma9 real-rank-four phase source consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D8Independent
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C3D2G1D8

example (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v) :
    relationalProjector.mulVec (relationalPhaseJ.mulVec v) =
      relationalPhaseJ.mulVec v :=
  relationalPhaseJ_mulVec_preserves_projector_image v hv

example (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v) :
    relationalPhaseJ.mulVec (relationalPhaseJ.mulVec v) = -v :=
  relationalPhaseJ_mulVec_square_on_projector_image v hv

#print axioms FCP.RHOPFP9C3D2G1D8.relationalPhaseJ_mulVec_preserves_projector_image
#print axioms FCP.RHOPFP9C3D2G1D8.relationalPhaseJ_mulVec_square_on_projector_image

end
end FCP.RHOPFP9C3D2G1D8Independent
