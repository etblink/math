import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D66CanonicalComplexProjectiveTopology

/-! Independent imported consumer: canonical projective quotient topology. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D66Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D66

example : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
  relationalCanonicalComplexProjectivizationTopology

example :
    letI : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
      relationalCanonicalComplexProjectivizationTopology
    Topology.IsQuotientMap
      (Projectivization.mk' ℂ :
        {v : EuclideanSpace ℂ (Fin 2) // v ≠ 0} →
        Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
  relationalCanonicalProjectivizationMk_isQuotientMap

example {Y : Type*} [TopologicalSpace Y]
    (f : Projectivization ℂ (EuclideanSpace ℂ (Fin 2)) → Y) :
    letI : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
      relationalCanonicalComplexProjectivizationTopology
    Continuous f ↔ Continuous (f ∘ Projectivization.mk' ℂ) :=
  relationalCanonicalProjectivization_continuous_iff f

#print axioms FCP.RHOPFP9C3D2G1D66.relationalCanonicalComplexProjectivizationTopology
#print axioms FCP.RHOPFP9C3D2G1D66.relationalCanonicalProjectivizationMk_isQuotientMap
#print axioms FCP.RHOPFP9C3D2G1D66.relationalCanonicalProjectivization_continuous_iff

end
end FCP.RHOPFP9C3D2G1D66Independent
