import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2BOriginalGammaCircleProjectorImageInvariance

/-! Independent source exact real-spinor sector invariance consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2BIndependent

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D0
open FCP.RHOPFP9C3D2A
open FCP.RHOPFP9C3D2B

example (z : Circle) :
    relationalProjector * relationalCircleMatrix z =
      relationalCircleMatrix z * relationalProjector :=
  relationalProjector_commutes_circleMatrix z

example (z : Circle) (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v) :
    relationalProjector.mulVec (relationalCircleVector z v) =
      relationalCircleVector z v :=
  relationalCircleVector_preserves_projector_image z v hv

#print axioms FCP.RHOPFP9C3D2B.relationalProjector_commutes_circleMatrix
#print axioms FCP.RHOPFP9C3D2B.relationalCircleVector_preserves_projector_image

end FCP.RHOPFP9C3D2BIndependent
