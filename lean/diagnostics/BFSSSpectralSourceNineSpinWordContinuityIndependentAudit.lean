import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineSpinWordContinuity

set_option autoImplicit false

noncomputable section
open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineEightInputSpinMap
open FCP.BFSSSourceNineSpinWordContinuity

attribute [local instance] source9PBWNormedAddCommGroup source9PBWNormedSpace

example : Continuous (CliffordAlgebra.ι source9Quadratic) :=
  source9VectorEmbedding_continuous_pbw

example (i : Fin 8) :
    Continuous (fun w : Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1} =>
      CliffordAlgebra.ι source9Quadratic (w i).val) :=
  source9EightUnitCoordinateClifford_continuous_pbw i

example : Continuous
    (fun w : Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1} =>
      (source9EightUnitSpinWord w : CliffordAlgebra source9Quadratic)) :=
  source9EightUnitSpinWord_coe_continuous_pbw

example : Continuous source9EightUnitSpinWord := source9EightUnitSpinWord_continuous_pbw

example {X : Type*} [TopologicalSpace X]
    (f : X → (Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1}))
    (hf : Continuous f) : Continuous (fun x => source9EightUnitSpinWord (f x)) :=
  source9EightUnitSpinWord_continuous_pbw.comp hf

example (w : Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1}) :
    ContinuousAt source9EightUnitSpinWord w :=
  source9EightUnitSpinWord_continuous_pbw.continuousAt

-- Conditional compact-image transport does not assert compactness of the parameter space.
example (K : Set (Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1}))
    (hK : IsCompact K) : IsCompact (source9EightUnitSpinWord '' K) :=
  hK.image source9EightUnitSpinWord_continuous_pbw

example : Continuous source9EightUnitSpinWord ∧ Function.Surjective source9EightUnitSpinWord :=
  ⟨source9EightUnitSpinWord_continuous_pbw, source9EightUnitSpinWord_surjective⟩

#print axioms FCP.BFSSSourceNineSpinWordContinuity.source9VectorEmbedding_continuous_pbw
#print axioms FCP.BFSSSourceNineSpinWordContinuity.source9EightUnitCoordinateClifford_continuous_pbw
#print axioms FCP.BFSSSourceNineSpinWordContinuity.source9EightUnitSpinWord_coe_continuous_pbw
#print axioms FCP.BFSSSourceNineSpinWordContinuity.source9EightUnitSpinWord_continuous_pbw
#eval IO.println "SPECTRAL_SOURCE_NINE_SPIN_WORD_CONTINUITY_CONSUMER_COMPLETE"

end
