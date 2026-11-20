import Mathlib.Topology.Instances.Matrix
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C7OriginalGammaContinuousQuadraticRetraction

/-!
# RHOPF-P9C3D2G1C8 — standard real-four Euclidean radius

The source-original Gamma9 Q-unit sphere has an accepted continuous
radial retraction from nonzero coordinates (G1C7). Construct the
*other* radius needed to compare that Q-unit sphere with the standard
Euclidean real-four dot-one sphere. The underlying Fin-four Pi space
has a product norm; its standard Euclidean sphere is explicitly
specified here by the original finite dot-self, NOT that Pi norm.

Prove continuity and positivity of s(x) = sqrt (x dot x) for x≠0.
No inter-sphere homeomorphism or Circle-equivariant Hopf quotient
or physical Fock realization is claimed by this small gate.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1C8
noncomputable section

/-- Standard Euclidean real-four radius, expressed using dot-self
rather than the default Pi/sup norm on Fin 4 → ℝ. -/
noncomputable def standardCoordinateRadius (x : Fin 4 → ℝ) : ℝ :=
  Real.sqrt (x ⬝ᵥ x)

/-- The standard real-four dot-self radius is continuous. -/
theorem standardCoordinateRadius_continuous :
    Continuous standardCoordinateRadius := by
  have hdot : Continuous (fun x : Fin 4 → ℝ => x ⬝ᵥ x) :=
    continuous_id.dotProduct continuous_id
  exact Real.continuous_sqrt.comp hdot

/-- The standard real-four Euclidean radius is positive on
every nonzero vector (without using the Pi/sup norm). -/
theorem standardCoordinateRadius_pos_of_ne_zero
    (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    0 < standardCoordinateRadius x := by
  have hnonneg : 0 ≤ x ⬝ᵥ x := by
    change 0 ≤ ∑ i, x i * x i
    exact Finset.sum_nonneg (fun i _ => mul_self_nonneg (x i))
  have hnonzero : x ⬝ᵥ x ≠ 0 := by
    intro hzero
    exact hx (dotProduct_self_eq_zero.mp hzero)
  exact Real.sqrt_pos.mpr (lt_of_le_of_ne hnonneg (Ne.symm hnonzero))

#print axioms standardCoordinateRadius_continuous
#print axioms standardCoordinateRadius_pos_of_ne_zero

end
end FCP.RHOPFP9C3D2G1C8
