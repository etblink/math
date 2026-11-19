import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2AOriginalGammaCircleVectorAction

/-! Independent exact original-source Circle action on real spinor vectors. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2AIndependent

open OAI.BFSSQuantum
open FCP.RHOPFP9C3D2A

example (v : SpinIndex → ℝ) :
    relationalCircleVector 1 v = v :=
  relationalCircleVector_one v

example (z w : Circle) (v : SpinIndex → ℝ) :
    relationalCircleVector (z * w) v =
      relationalCircleVector z (relationalCircleVector w v) :=
  relationalCircleVector_mul z w v

#print axioms FCP.RHOPFP9C3D2A.relationalCircleVector_one
#print axioms FCP.RHOPFP9C3D2A.relationalCircleVector_mul

end FCP.RHOPFP9C3D2AIndependent
