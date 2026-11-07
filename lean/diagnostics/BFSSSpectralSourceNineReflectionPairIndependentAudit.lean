import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineReflectionPair

set_option autoImplicit false

noncomputable section
open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineReflection
open Submodule

example (u : SpaceIndex → ℝ) :
    source9ToEuclidean u = (WithLp.toLp 2 u : EuclideanSpace ℝ SpaceIndex) := rfl

example (u : SpaceIndex → ℝ) (hu : source9Quadratic u = 1) :
    ‖(WithLp.toLp 2 u : EuclideanSpace ℝ SpaceIndex)‖ = 1 :=
  source9Unit_euclidean_norm_one u hu

example (u z : SpaceIndex → ℝ) (hu : source9Quadratic u = 1) :
    (CliffordAlgebra.ι source9Quadratic u * CliffordAlgebra.ι source9Quadratic z) *
      CliffordAlgebra.ι source9Quadratic u =
    CliffordAlgebra.ι source9Quadratic
      ((QuadraticMap.polar source9Quadratic u z) • u - z) :=
  source9Unit_clifford_conjugation u z hu

example (u v : SpaceIndex → ℝ)
    (hu : source9Quadratic u = 1) (hv : source9Quadratic v = 1) :
    (((source9UnitVectorPairSpin u v hu hv)⁻¹ : spinGroup source9Quadratic) :
      CliffordAlgebra source9Quadratic) =
    CliffordAlgebra.ι source9Quadratic v * CliffordAlgebra.ι source9Quadratic u :=
  source9UnitVectorPairSpin_inverse u v hu hv

example (u z : SpaceIndex → ℝ) (hu : source9Quadratic u = 1) :
    source9ToEuclidean ((QuadraticMap.polar source9Quadratic u z) • u - z) =
      -((ℝ ∙ source9ToEuclidean u)ᗮ.reflection (source9ToEuclidean z)) :=
  source9Unit_polar_action_eq_negative_hyperplane u z hu

example (u v z : SpaceIndex → ℝ)
    (hu : source9Quadratic u = 1) (hv : source9Quadratic v = 1) :
    source9ToEuclidean
      (source9SpinVectorRepresentation (source9UnitVectorPairSpin u v hu hv) z) =
    (ℝ ∙ source9ToEuclidean u)ᗮ.reflection
      ((ℝ ∙ source9ToEuclidean v)ᗮ.reflection (source9ToEuclidean z)) :=
  source9UnitVectorPairSpin_eq_native_hyperplane_pair u v z hu hv

example (u v : SpaceIndex → ℝ)
    (hu : source9Quadratic u = 1) (hv : source9Quadratic v = 1) :
    (fun z : SpaceIndex → ℝ => source9ToEuclidean
      (source9SpinVectorRepresentation (source9UnitVectorPairSpin u v hu hv) z)) =
    (fun z : SpaceIndex → ℝ => (ℝ ∙ source9ToEuclidean u)ᗮ.reflection
      ((ℝ ∙ source9ToEuclidean v)ᗮ.reflection (source9ToEuclidean z))) := by
  funext z
  exact source9UnitVectorPairSpin_eq_native_hyperplane_pair u v z hu hv

example (u v z : SpaceIndex → ℝ)
    (hu : source9Quadratic u = 1) (hv : source9Quadratic v = 1) :
    source9ToEuclidean
      (source9SpinVectorConjugation (source9UnitVectorPairSpin u v hu hv) z) =
    (ℝ ∙ source9ToEuclidean u)ᗮ.reflection
      ((ℝ ∙ source9ToEuclidean v)ᗮ.reflection (source9ToEuclidean z)) :=
  source9UnitVectorPairSpin_eq_native_hyperplane_pair u v z hu hv

#print axioms FCP.BFSSSourceNineReflection.source9ToEuclidean
#print axioms FCP.BFSSSourceNineReflection.source9Quadratic_eq_euclidean_norm_sq
#print axioms FCP.BFSSSourceNineReflection.source9Polar_eq_two_euclidean_inner
#print axioms FCP.BFSSSourceNineReflection.source9Unit_euclidean_norm_one
#print axioms FCP.BFSSSourceNineReflection.source9Unit_clifford_conjugation
#print axioms FCP.BFSSSourceNineReflection.source9UnitVectorPairSpin_inverse
#print axioms FCP.BFSSSourceNineReflection.source9UnitVectorPairSpin_polar_action
#print axioms FCP.BFSSSourceNineReflection.source9Unit_polar_action_eq_negative_hyperplane
#print axioms FCP.BFSSSourceNineReflection.source9UnitVectorPairSpin_eq_native_hyperplane_pair
#eval IO.println "SPECTRAL_SOURCE_NINE_REFLECTION_PAIR_CONSUMER_COMPLETE"

end
