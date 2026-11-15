import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0B1NativeDetOne

/-!
# IBI-G0B1 original native det+1 — independent source consumer

Checks genuine source G3A at arbitrary SU(2), its already-qualified
orthogonality and the exclusion of an improper det=-1 reflection.
No surrogate SO(3) action, connectedness assumption or physical leap.
-/

set_option autoImplicit false

namespace BFSSIBIG0B1NativeDetOneIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSIBIG0B1FinDet3
open FCP.BFSSIBIG0B1NativeDetOne

/-- Actual original SU(2) gauge elements have det +1 on color. -/
example (g : GaugeGroup 2) :
    (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g).det = 1 :=
  originalAdjointColorMatrix_det_one g

/-- Pair orientation with upstream qualified orthogonal columns. -/
example (g : GaugeGroup 2) :
    (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g).det = 1 ∧
      (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g)ᵀ *
        FCP.BFSSSU2GaugeG3A.adjointColorMatrix g = 1 := by
  exact ⟨originalAdjointColorMatrix_det_one g,
    FCP.BFSSSU2GaugeG3A.adjointColorMatrix_orthogonal g⟩

/-- A non-symmetric orientation-reversing matrix is a negative control:
its det=-1 cannot equal any source SU(2) gauge-adjoint matrix. -/
private def improperReflection : Matrix (Fin 3) (Fin 3) ℝ :=
  !![0, 1, 0; 0, 0, 1; -1, 0, 0]

example (g : GaugeGroup 2) :
    improperReflection ≠ FCP.BFSSSU2GaugeG3A.adjointColorMatrix g := by
  intro h
  have hbad : originalColumnTriple improperReflection = -1 := by
    norm_num [originalColumnTriple, improperReflection,
      FCP.BFSSSU2.colorCross, Fin.sum_univ_three]
  have hgood : originalColumnTriple improperReflection = 1 := by
    rw [h, originalAdjointColumnTriple_eq_det,
      originalAdjointColorMatrix_det_one]
  linarith

end
end BFSSIBIG0B1NativeDetOneIndependentConsumer
