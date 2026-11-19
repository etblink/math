import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2COriginalGammaRelationalPhaseKernelOnProjectorImage

/-! Independent source-exact type consumer for the J kernel on P-image. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2CIndependent

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C3D2C

example (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v)
    (hJ : relationalPhaseJ.mulVec v = 0) :
    v = 0 :=
  relationalPhaseJ_kernel_zero_on_projector_image v hv hJ

#print axioms FCP.RHOPFP9C3D2C.relationalPhaseJ_kernel_zero_on_projector_image

end FCP.RHOPFP9C3D2CIndependent
