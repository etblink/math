import Mathlib.Tactic
import Mathlib.Topology.Constructions
import Mathlib.Topology.Algebra.GroupWithZero
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D68ANonzeroUnitNormalization

/-!
# RHOPF-P9C3D2G1D68B — original nonzero-to-unit normalization is continuous

This is a bounded continuity gate for the EXACT accepted D68A map.
It uses the topology inherited by the two actual subtypes, rather
than transporting topology along an algebraic equivalence.
The independent D66 canonical projectivization topology is unchanged.

No claim here that the inverse of D65's exact Equiv is continuous,
nor any Homeomorph, Hopf/Chern invariant, or physical BFSS soliton.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D68B
noncomputable section

open FCP.RHOPFP9C3D2G1D68A

/-- Continuity of the already-accepted D68A normalized representative
from the nonzero complex Euclidean two-vectors to the actual norm-one
complex Euclidean unit sphere. -/
theorem relationalCanonicalNonzeroUnitNormalization_continuous :
    Continuous relationalCanonicalNonzeroUnitNormalization := by
  have hnorm : Continuous (fun v :
      {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0} => ‖v.val‖) :=
    continuous_norm.comp continuous_subtype_val
  have hn : ∀ v : {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0}, ‖v.val‖ ≠ 0 :=
    fun v => norm_ne_zero_iff.mpr v.property
  have hinv : Continuous (fun v :
      {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0} => (‖v.val‖ : ℝ)⁻¹) :=
    hnorm.inv₀ hn
  have hcast : Continuous (fun v :
      {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0} =>
        ((‖v.val‖⁻¹ : ℝ) : ℂ)) :=
    Complex.continuous_ofReal.comp hinv
  have hscaled : Continuous (fun v :
      {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0} =>
        (((‖v.val‖⁻¹ : ℝ) : ℂ) • v.val)) :=
    hcast.smul continuous_subtype_val
  have hval : Continuous (fun v :
      {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0} =>
        (relationalCanonicalNonzeroUnitNormalization v).val) := by
    change Continuous (fun v :
      {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0} =>
        (((‖v.val‖⁻¹ : ℝ) : ℂ) • v.val))
    exact hscaled
  exact hval.subtype_mk
    (fun v => (relationalCanonicalNonzeroUnitNormalization v).property)

#print axioms relationalCanonicalNonzeroUnitNormalization_continuous

end
end FCP.RHOPFP9C3D2G1D68B
