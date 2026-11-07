import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineCompactness

set_option autoImplicit false

noncomputable section
open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineReflection
open FCP.BFSSSourceNineEightInputSpinMap FCP.BFSSSourceNineSpinWordContinuity
open FCP.BFSSSourceNineCompactness

attribute [local instance] source9PBWNormedAddCommGroup source9PBWNormedSpace

example : {u : SpaceIndex → ℝ | source9Quadratic u = 1} =
    source9ToEuclidean ⁻¹' Metric.sphere (0 : EuclideanSpace ℝ SpaceIndex) 1 :=
  source9QUnit_eq_euclidean_sphere_preimage

example : IsCompact {u : SpaceIndex → ℝ | source9Quadratic u = 1} := source9QUnit_isCompact

example : IsCompact
    (Set.univ : Set (Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1})) :=
  source9EightUnitParameters_isCompact

example : Set.range source9EightUnitSpinWord =
    (Set.univ : Set (spinGroup source9Quadratic)) := source9EightUnitSpinWord_range_eq_univ

example : IsCompact (Set.univ : Set (spinGroup source9Quadratic)) :=
  source9Spin_univ_isCompact_pbw

example : CompactSpace (spinGroup source9Quadratic) := source9Spin_compactSpace_pbw

example : IsCompact (spinGroup source9Quadratic : Set (CliffordAlgebra source9Quadratic)) :=
  source9Spin_isCompact_pbw

example : IsClosed (spinGroup source9Quadratic : Set (CliffordAlgebra source9Quadratic)) :=
  source9Spin_isClosed_pbw

-- Continuous images of the whole actual source group are compact under an explicit map premise.
example {X : Type*} [TopologicalSpace X] (f : spinGroup source9Quadratic → X)
    (hf : Continuous f) : IsCompact (Set.range f) := by
  have h := source9Spin_univ_isCompact_pbw.image hf
  simpa only [Set.image_univ] using h

-- The fixed source word map has compact full image, with its ORIGINAL target topology.
example : IsCompact (Set.range source9EightUnitSpinWord) := by
  rw [source9EightUnitSpinWord_range_eq_univ]
  exact source9Spin_univ_isCompact_pbw

#print axioms FCP.BFSSSourceNineCompactness.source9QUnit_eq_euclidean_sphere_preimage
#print axioms FCP.BFSSSourceNineCompactness.source9QUnit_isCompact
#print axioms FCP.BFSSSourceNineCompactness.source9EightUnitParameters_isCompact
#print axioms FCP.BFSSSourceNineCompactness.source9EightUnitSpinWord_range_eq_univ
#print axioms FCP.BFSSSourceNineCompactness.source9Spin_univ_isCompact_pbw
#print axioms FCP.BFSSSourceNineCompactness.source9Spin_compactSpace_pbw
#print axioms FCP.BFSSSourceNineCompactness.source9Spin_isCompact_pbw
#print axioms FCP.BFSSSourceNineCompactness.source9Spin_isClosed_pbw
#eval IO.println "SPECTRAL_SOURCE_NINE_COMPACTNESS_CONSUMER_COMPLETE"

end
