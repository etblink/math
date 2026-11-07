import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineEightInputSpinMap
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BUAmbientVectorActionSmoothness

/-!
C0-A5b candidate: continuity of the fixed source Spin word formula for
the EXISTING named PBW structures. Enable exactly those accepted values
locally, as required by F10BE; no global instance or replacement topology.
Use the accepted original vector embedding and Clifford multiplication.
Parameter compactness, source compactness and spectral claims remain separate.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineSpinWordContinuity
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineEightInputSpinMap

attribute [local instance] source9PBWNormedAddCommGroup source9PBWNormedSpace

private abbrev C := CliffordAlgebra source9Quadratic
private abbrev P := Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1}

/-- Original source-vector embedding, continuous in exactly the accepted PBW topology. -/
theorem source9VectorEmbedding_continuous_pbw :
    Continuous (CliffordAlgebra.ι source9Quadratic) :=
  source9VectorEmbeddingCLM.continuous

/-- Each original Q-unit input coordinate embeds continuously into the same Clifford algebra. -/
theorem source9EightUnitCoordinateClifford_continuous_pbw (i : Fin 8) :
    Continuous (fun w : P => CliffordAlgebra.ι source9Quadratic (w i).val) := by
  exact source9VectorEmbedding_continuous_pbw.comp
    (continuous_subtype_val.comp (continuous_apply i))

/-- The original Clifford value of the fixed source formula is continuous in the PBW topology. -/
theorem source9EightUnitSpinWord_coe_continuous_pbw :
    Continuous (fun w : P => (source9EightUnitSpinWord w : C)) := by
  have hmul : ∀ f g : P → C, Continuous f → Continuous g →
      Continuous (fun w => f w * g w) := by
    intro f g hf hg
    exact source9Clifford_mul_continuous_pbw.comp (hf.prodMk hg)
  have h01 := hmul _ _ (source9EightUnitCoordinateClifford_continuous_pbw 0)
    (source9EightUnitCoordinateClifford_continuous_pbw 1)
  have h23 := hmul _ _ (source9EightUnitCoordinateClifford_continuous_pbw 2)
    (source9EightUnitCoordinateClifford_continuous_pbw 3)
  have h45 := hmul _ _ (source9EightUnitCoordinateClifford_continuous_pbw 4)
    (source9EightUnitCoordinateClifford_continuous_pbw 5)
  have h67 := hmul _ _ (source9EightUnitCoordinateClifford_continuous_pbw 6)
    (source9EightUnitCoordinateClifford_continuous_pbw 7)
  change Continuous (fun w : P =>
    (CliffordAlgebra.ι source9Quadratic (w 0).val * CliffordAlgebra.ι source9Quadratic (w 1).val) *
    (CliffordAlgebra.ι source9Quadratic (w 2).val * CliffordAlgebra.ι source9Quadratic (w 3).val) *
    (CliffordAlgebra.ι source9Quadratic (w 4).val * CliffordAlgebra.ι source9Quadratic (w 5).val) *
    (CliffordAlgebra.ι source9Quadratic (w 6).val * CliffordAlgebra.ι source9Quadratic (w 7).val))
  exact hmul _ _ (hmul _ _ (hmul _ _ h01 h23) h45) h67

/-- The fixed map into the literal original source Spin subtype is PBW-continuous. -/
theorem source9EightUnitSpinWord_continuous_pbw :
    Continuous source9EightUnitSpinWord :=
  continuous_induced_rng.2 source9EightUnitSpinWord_coe_continuous_pbw

#print axioms FCP.BFSSSourceNineSpinWordContinuity.source9VectorEmbedding_continuous_pbw
#print axioms FCP.BFSSSourceNineSpinWordContinuity.source9EightUnitCoordinateClifford_continuous_pbw
#print axioms FCP.BFSSSourceNineSpinWordContinuity.source9EightUnitSpinWord_coe_continuous_pbw
#print axioms FCP.BFSSSourceNineSpinWordContinuity.source9EightUnitSpinWord_continuous_pbw
#eval IO.println "SPECTRAL_SOURCE_NINE_SPIN_WORD_CONTINUITY_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineSpinWordContinuity
