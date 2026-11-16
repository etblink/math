import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CZImage

/-!
Independent source consumer: arbitrary-angle native original SU(2) adjoint
Z image plus explicit off-diagonal sign/orientation controls.
No external spin-cover surjectivity assumption.
-/

set_option autoImplicit false

namespace BFSSIBIG0CZImageIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSIBIG0CZImage
open FCP.BFSSIBIG0CNativeZGenerator

example (θ : ℝ) :
    FCP.BFSSSU2GaugeG3A.adjointColorMatrix (sourceZGauge θ) =
      sourceRotZ θ :=
  originalAdjointColorMatrix_sourceZ_eq_rotZ θ

example (θ : ℝ) :
    (FCP.BFSSSU2GaugeG3A.adjointColorMatrix
      (sourceZGauge θ)) (1 : Fin 3) (0 : Fin 3) = Real.sin θ := by
  rw [originalAdjointColorMatrix_sourceZ_eq_rotZ]
  simp [sourceRotZ]

example (θ : ℝ) :
    (FCP.BFSSSU2GaugeG3A.adjointColorMatrix
      (sourceZGauge θ)) (0 : Fin 3) (1 : Fin 3) = -Real.sin θ := by
  rw [originalAdjointColorMatrix_sourceZ_eq_rotZ]
  simp [sourceRotZ]

end
end BFSSIBIG0CZImageIndependentConsumer
