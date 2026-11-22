import Mathlib.Tactic
import Mathlib.Topology.Constructions
import Mathlib.LinearAlgebra.Projectivization.Basic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D65StandardCircleOrbitQuotientProjectivizationEquiv

/-!
# RHOPF-P9C3D2G1D66 — independently canonical complex projective quotient topology

At the pinned Mathlib SHA the algebraic `Projectivization` quotient
exists, but the newer `Mathlib.Topology.Algebra.Projectivization`
module is absent. Construct the canonical quotient topology DIRECTLY
from nonzero complex Euclidean vectors and the algebraic
`projectivizationSetoid`, not by transporting the D65 Equiv.

Qualify that the actual pinned `Projectivization.mk'` is a quotient
map and that continuity from projectivization is tested against
nonzero vectors. Keep the topology LOCAL: no global instance or
change to the original Gamma9 Q topology.

This gate does NOT show that the D65 Equiv is a Homeomorph, identify
CP¹ with S², prove Hopf/Chern invariants or physical BFSS claims.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D66
noncomputable section

/-- Canonical topology on algebraic complex projectivization,
quotient topology from nonzero Euclidean complex two-vectors.
Defined independently of the D65 Circle orbit quotient Equiv. -/
noncomputable def relationalCanonicalComplexProjectivizationTopology :
    TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
  inferInstanceAs (TopologicalSpace
    (Quotient (projectivizationSetoid ℂ (EuclideanSpace ℂ (Fin 2)))))

/-- The canonical projectivization map from nonzero vectors is
a genuine quotient map under the direct projective quotient topology.
This is NOT proved by transporting the Circle-orbit quotient topology. -/
theorem relationalCanonicalProjectivizationMk_isQuotientMap :
    letI : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
      relationalCanonicalComplexProjectivizationTopology
    Topology.IsQuotientMap
      (Projectivization.mk' ℂ :
        {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0} →
        Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) := by
  letI : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
    relationalCanonicalComplexProjectivizationTopology
  exact isQuotientMap_quotient_mk'

/-- Characterize the canonical projective quotient topology by the
continuity of maps on nonzero vector representatives. -/
theorem relationalCanonicalProjectivization_continuous_iff
    {Y : Type*} [TopologicalSpace Y]
    (f : Projectivization ℂ (EuclideanSpace ℂ (Fin 2)) → Y) :
    letI : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
      relationalCanonicalComplexProjectivizationTopology
    Continuous f ↔ Continuous (f ∘ Projectivization.mk' ℂ) := by
  letI : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
    relationalCanonicalComplexProjectivizationTopology
  exact relationalCanonicalProjectivizationMk_isQuotientMap.continuous_iff

#print axioms relationalCanonicalComplexProjectivizationTopology
#print axioms relationalCanonicalProjectivizationMk_isQuotientMap
#print axioms relationalCanonicalProjectivization_continuous_iff

end
end FCP.RHOPFP9C3D2G1D66
