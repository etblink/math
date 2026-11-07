import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineEightInputSpinMap

set_option autoImplicit false

noncomputable section
open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineEvenListLift
open FCP.BFSSSourceNineEightInputSpinMap

example (w : Fin 8 → (SpaceIndex → ℝ)) :
    source9CliffordWord (List.ofFn w) =
      (CliffordAlgebra.ι source9Quadratic (w 0) * CliffordAlgebra.ι source9Quadratic (w 1)) *
      (CliffordAlgebra.ι source9Quadratic (w 2) * CliffordAlgebra.ι source9Quadratic (w 3)) *
      (CliffordAlgebra.ι source9Quadratic (w 4) * CliffordAlgebra.ι source9Quadratic (w 5)) *
      (CliffordAlgebra.ι source9Quadratic (w 6) * CliffordAlgebra.ι source9Quadratic (w 7)) :=
  source9CliffordWord_ofFn_eight w

example (w : Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1}) :
    spinGroup source9Quadratic := source9EightUnitSpinWord w

example (w : Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1}) :
    (source9EightUnitSpinWord w : CliffordAlgebra source9Quadratic) =
      source9CliffordWord (List.ofFn (fun i => (w i).val)) := source9EightUnitSpinWord_coe w

example : Function.Surjective source9EightUnitSpinWord := source9EightUnitSpinWord_surjective

example (g : spinGroup source9Quadratic) :
    ∃ w : Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1},
      source9EightUnitSpinWord w = g ∧
      (g : CliffordAlgebra source9Quadratic) =
        source9CliffordWord (List.ofFn (fun i => (w i).val)) := by
  obtain ⟨w, hw⟩ := source9EightUnitSpinWord_surjective g
  refine ⟨w, hw, ?_⟩
  exact (congrArg (fun k : spinGroup source9Quadratic =>
    (k : CliffordAlgebra source9Quadratic)) hw).symm.trans (source9EightUnitSpinWord_coe w)

example : ∃ w : Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1},
    source9EightUnitSpinWord w = (1 : spinGroup source9Quadratic) :=
  source9EightUnitSpinWord_surjective 1

example : ∃ w : Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1},
    source9EightUnitSpinWord w = source9NegativeCentral ∧
      (source9EightUnitSpinWord w : CliffordAlgebra source9Quadratic) = -1 := by
  obtain ⟨w, hw⟩ := source9EightUnitSpinWord_surjective source9NegativeCentral
  refine ⟨w, hw, ?_⟩
  exact (congrArg (fun k : spinGroup source9Quadratic =>
    (k : CliffordAlgebra source9Quadratic)) hw).trans source9NegativeCentral_coe

example (w v : Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1})
    (hword : source9CliffordWord (List.ofFn (fun i => (w i).val)) =
      source9CliffordWord (List.ofFn (fun i => (v i).val))) :
    source9EightUnitSpinWord w = source9EightUnitSpinWord v := by
  apply Subtype.ext
  exact (source9EightUnitSpinWord_coe w).trans
    (hword.trans (source9EightUnitSpinWord_coe v).symm)

#print axioms FCP.BFSSSourceNineEightInputSpinMap.source9CliffordWord_ofFn_eight
#print axioms FCP.BFSSSourceNineEightInputSpinMap.source9EightUnitSpinWord
#print axioms FCP.BFSSSourceNineEightInputSpinMap.source9EightUnitSpinWord_coe
#print axioms FCP.BFSSSourceNineEightInputSpinMap.source9EightUnitSpinWord_surjective
#eval IO.println "SPECTRAL_SOURCE_NINE_EIGHT_INPUT_SPIN_MAP_CONSUMER_COMPLETE"

end
