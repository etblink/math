import Mathlib.Topology.Instances.Matrix
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C1OriginalGammaCoordinateQuadraticPositivity

/-!
# RHOPF-P9C3D2G1C2 — source-exact transported quadratic continuity

C1 certified positive definiteness of the Euclidean dot-self scalar
transported via the inverse of the original-source continuous linear
Fin-four model. Its continuity uses only the native continuous
linear inverse, the inherited actual Gamma9 projector-range topology,
and the pinned Continuous.dotProduct interface.

This is not a radial sphere homeomorphism, a norm-isometry, a
Hopf quotient, Circle-equivariance or a physical Fock implementation.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C2
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2G1C0
open FCP.RHOPFP9C3D2G1C1

/-- The exact original Gamma9 real dot-self scalar transported
into the accepted real-four coordinate model is continuous. -/
theorem relationalRangeCoordinateDotSelf_continuous :
    Continuous relationalRangeCoordinateDotSelf := by
  have hVal : Continuous (fun x : Fin 4 → ℝ =>
      (relationalRangeContinuousLinearEquivFinFour.symm x :
        LinearMap.range (Matrix.toLin' relationalProjector)).1) :=
    continuous_subtype_val.comp
      relationalRangeContinuousLinearEquivFinFour.symm.continuous
  change Continuous (fun x : Fin 4 → ℝ =>
      (relationalRangeContinuousLinearEquivFinFour.symm x :
        LinearMap.range (Matrix.toLin' relationalProjector)).1 ⬝ᵥ
      (relationalRangeContinuousLinearEquivFinFour.symm x :
        LinearMap.range (Matrix.toLin' relationalProjector)).1)
  exact hVal.dotProduct hVal

#print axioms relationalRangeCoordinateDotSelf_continuous

end
end FCP.RHOPFP9C3D2G1C2
