import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2DOriginalGammaRelationalPhaseOnProjectorImage

/-! Independent exact original-source phase-on-projector-image consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2DIndependent

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C3A
open FCP.RHOPFP9C3D2D

example (a b : ℝ) (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v) :
    (relationalCirclePhase a b).mulVec v =
      a • v + b • relationalPhaseJ.mulVec v :=
  relationalCirclePhase_mulVec_on_projector_image a b v hv

#print axioms FCP.RHOPFP9C3D2D.relationalCirclePhase_mulVec_on_projector_image

end FCP.RHOPFP9C3D2DIndependent
