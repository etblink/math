import Mathlib.Topology.Instances.Matrix
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2F2OriginalGammaRelationalUnitCircleFreeAction

/-!
# RHOPF-P9C3D2F3 — source-original Circle vector action joint continuity

The accepted original Gamma9 Circle matrix map is continuous and
acts on the exact real 16-spinor vector carrier by matrix-vector
multiplication. This small independent source-typed gate proves
joint continuity in the circle phase and the spinor vector.

It does not yet prove continuity of the restricted unit-sphere
subtype action, identify that sphere with S³, construct the Hopf
quotient, or establish a physical BFSS Fock-space implementation.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2F3
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C3D0
open FCP.RHOPFP9C3D1
open FCP.RHOPFP9C3D2A

/-- The native original Gamma9 Circle vector action is jointly
continuous on Circle × (SpinIndex → ℝ). -/
theorem relationalCircleVector_joint_continuous :
    Continuous (fun p : Circle × (SpinIndex → ℝ) =>
      relationalCircleVector p.1 p.2) := by
  change Continuous (fun p : Circle × (SpinIndex → ℝ) =>
    (relationalCircleMatrix p.1).mulVec p.2)
  exact (relationalCircleMatrix_continuous.comp continuous_fst).matrix_mulVec
    continuous_snd

#print axioms relationalCircleVector_joint_continuous

end
end FCP.RHOPFP9C3D2F3
