import Mathlib.Topology.Algebra.Module.FiniteDimension
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1BOriginalGammaRelationalRangeSphereHomeomorph

/-!
# RHOPF-P9C3D2G1C0 — original Gamma9 range continuous R4 model

The accepted Gamma9 relational projector has exact image finrank four.
A finite-dimensional continuous linear equivalence to Fin 4 → ℝ
exists without choosing the conditional coordinate plane.

The map is not claimed to be an isometry or Circle-equivariant.
It need not preserve dot-one spheres, and this theorem does not
yet prove an S³ identification or Hopf quotient.
-/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C0
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C1B1

/-- A noncanonical continuous real-linear R4 model of the exact
source-original rank-four projector range. -/
noncomputable def relationalRangeContinuousLinearEquivFinFour :
    (LinearMap.range (Matrix.toLin' relationalProjector)) ≃L[ℝ]
      (Fin 4 → ℝ) := by
  have hdim :
      Module.finrank ℝ (LinearMap.range (Matrix.toLin' relationalProjector)) =
        Module.finrank ℝ (Fin 4 → ℝ) := by
    rw [Module.finrank_fin_fun]
    exact relationalProjector_range_finrank_four
  exact ContinuousLinearEquiv.ofFinrankEq hdim

#print axioms relationalRangeContinuousLinearEquivFinFour

end
end FCP.RHOPFP9C3D2G1C0
