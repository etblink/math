import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineExactEightWord

/-!
C0-A5a candidate: a fixed eight-input map into the ACTUAL source Spin group.
Use four original F10BH pairs in the original order, with Q-unit subtype
inputs. Identify its literal Clifford word and prove actual source
surjectivity from the qualified exact-eight existence theorem.
There is no continuous witness selection or replacement Spin carrier.
Continuity, parameter compactness and source compactness remain separate.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineEightInputSpinMap
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineEvenListLift
open FCP.BFSSSourceNineExactEightWord

/-- The natural Fin 8 word is the same ordered product of four consecutive pairs. -/
theorem source9CliffordWord_ofFn_eight (w : Fin 8 → (SpaceIndex → ℝ)) :
    source9CliffordWord (List.ofFn w) =
      (CliffordAlgebra.ι source9Quadratic (w 0) * CliffordAlgebra.ι source9Quadratic (w 1)) *
      (CliffordAlgebra.ι source9Quadratic (w 2) * CliffordAlgebra.ι source9Quadratic (w 3)) *
      (CliffordAlgebra.ι source9Quadratic (w 4) * CliffordAlgebra.ι source9Quadratic (w 5)) *
      (CliffordAlgebra.ι source9Quadratic (w 6) * CliffordAlgebra.ι source9Quadratic (w 7)) := by
  change CliffordAlgebra.ι source9Quadratic (w 0) *
    (CliffordAlgebra.ι source9Quadratic (w 1) *
    (CliffordAlgebra.ι source9Quadratic (w 2) *
    (CliffordAlgebra.ι source9Quadratic (w 3) *
    (CliffordAlgebra.ι source9Quadratic (w 4) *
    (CliffordAlgebra.ι source9Quadratic (w 5) *
    (CliffordAlgebra.ι source9Quadratic (w 6) *
    (CliffordAlgebra.ι source9Quadratic (w 7) * 1))))))) = _
  simp only [mul_one, mul_assoc]

/-- Fixed original-coordinate input formula: four ACTUAL source Spin pairs, no chosen lift. -/
noncomputable def source9EightUnitSpinWord
    (w : Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1}) :
    spinGroup source9Quadratic :=
  source9UnitVectorPairSpin (w 0).val (w 1).val (w 0).property (w 1).property *
  source9UnitVectorPairSpin (w 2).val (w 3).val (w 2).property (w 3).property *
  source9UnitVectorPairSpin (w 4).val (w 5).val (w 4).property (w 5).property *
  source9UnitVectorPairSpin (w 6).val (w 7).val (w 6).property (w 7).property

/-- The fixed source-group formula has EXACTLY the original ordered eight-vector Clifford value. -/
theorem source9EightUnitSpinWord_coe
    (w : Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1}) :
    (source9EightUnitSpinWord w : CliffordAlgebra source9Quadratic) =
      source9CliffordWord (List.ofFn (fun i => (w i).val)) := by
  change
    (CliffordAlgebra.ι source9Quadratic (w 0).val * CliffordAlgebra.ι source9Quadratic (w 1).val) *
    (CliffordAlgebra.ι source9Quadratic (w 2).val * CliffordAlgebra.ι source9Quadratic (w 3).val) *
    (CliffordAlgebra.ι source9Quadratic (w 4).val * CliffordAlgebra.ι source9Quadratic (w 5).val) *
    (CliffordAlgebra.ι source9Quadratic (w 6).val * CliffordAlgebra.ι source9Quadratic (w 7).val) = _
  exact (source9CliffordWord_ofFn_eight (fun i => (w i).val)).symm

/-- Every literal original source Spin element is attained by this fixed eight-input map. -/
theorem source9EightUnitSpinWord_surjective :
    Function.Surjective source9EightUnitSpinWord := by
  intro g
  obtain ⟨w, hall, hword⟩ := source9Spin_exact_eight_word g
  let p : Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1} :=
    fun i => ⟨w i, hall i⟩
  refine ⟨p, ?_⟩
  apply Subtype.ext
  change (source9EightUnitSpinWord p : CliffordAlgebra source9Quadratic) =
    (g : CliffordAlgebra source9Quadratic)
  exact (source9EightUnitSpinWord_coe p).trans hword.symm

#print axioms FCP.BFSSSourceNineEightInputSpinMap.source9CliffordWord_ofFn_eight
#print axioms FCP.BFSSSourceNineEightInputSpinMap.source9EightUnitSpinWord
#print axioms FCP.BFSSSourceNineEightInputSpinMap.source9EightUnitSpinWord_coe
#print axioms FCP.BFSSSourceNineEightInputSpinMap.source9EightUnitSpinWord_surjective
#eval IO.println "SPECTRAL_SOURCE_NINE_EIGHT_INPUT_SPIN_MAP_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineEightInputSpinMap
