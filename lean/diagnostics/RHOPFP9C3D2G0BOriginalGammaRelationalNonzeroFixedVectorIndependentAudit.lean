import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G0BOriginalGammaRelationalNonzeroFixedVector

/-! Independent original-source nonzero relational projector fixed-vector consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G0BIndependent

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2G0B

example :
    ∃ v : SpinIndex → ℝ,
      (Matrix.toLin' relationalProjector) v = v ∧ v ≠ 0 :=
  relationalProjector_exists_nonzero_fixed

#print axioms FCP.RHOPFP9C3D2G0B.relationalProjector_exists_nonzero_fixed

end FCP.RHOPFP9C3D2G0BIndependent
