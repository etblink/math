import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CPauliTrace

/-!
# IBI-G0C-PAULI-TRACE — independent original BFSS source consumer

Checks arbitrary original gauge input and both coefficient- and matrix-level
identification, with an exact source identity control. These tests are not
theorem statements for an independent generic textbook SU(2) representation.
-/ 

set_option autoImplicit false

namespace BFSSIBIG0CPauliTraceIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSIBIG0CPauliTrace

/-- Arbitrary source SU(2) input, output color, and input color. -/
example (g : GaugeGroup 2) (B A : ColorIndex 2) :
    (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) B A =
      (Matrix.trace (FCP.BFSSSU2.pauli B *
        ((g : ColorMatrix 2) * FCP.BFSSSU2.pauli A *
          (g : ColorMatrix 2).conjTranspose))).re / 2 :=
  originalAdjointColorMatrix_pauliTrace g B A

/-- Extensional equality of the genuine source 3x3 matrix for arbitrary g. -/
example (g : GaugeGroup 2) :
    FCP.BFSSSU2GaugeG3A.adjointColorMatrix g =
      fun B A => (Matrix.trace (FCP.BFSSSU2.pauli B *
        ((g : ColorMatrix 2) * FCP.BFSSSU2.pauli A *
          (g : ColorMatrix 2).conjTranspose))).re / 2 := by
  ext B A
  exact originalAdjointColorMatrix_pauliTrace g B A

/-- The exact source identity maps to the Pauli-trace Kronecker delta. -/
example (B A : ColorIndex 2) :
    (Matrix.trace (FCP.BFSSSU2.pauli B *
      (((1 : GaugeGroup 2) : ColorMatrix 2) *
        FCP.BFSSSU2.pauli A *
        ((1 : GaugeGroup 2) : ColorMatrix 2)ᴴ))).re / 2 =
        (if B = A then 1 else 0 : ℝ) := by
  have h := originalAdjointColorMatrix_pauliTrace
    (1 : GaugeGroup 2) B A
  rw [FCP.BFSSSU2GaugeG3A.adjointColorMatrix_one] at h
  simpa only [Matrix.one_apply] using h.symm

end
end BFSSIBIG0CPauliTraceIndependentConsumer
