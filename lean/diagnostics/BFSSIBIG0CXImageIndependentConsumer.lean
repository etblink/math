import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CXImage

/-!
Independent original BFSS source consumer for arbitrary-angle X-adjoint image;
two asymmetrical sign controls prevent a transpose/inverse substitution.
-/
set_option autoImplicit false

namespace BFSSIBIG0CXImageIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSIBIG0CXImage
open FCP.BFSSIBIG0CNativeXGenerator

example (β : ℝ) :
    FCP.BFSSSU2GaugeG3A.adjointColorMatrix (sourceXGauge β) =
      sourceRotX β :=
  originalAdjointColorMatrix_sourceX_eq_rotX β

example (β : ℝ) :
    (FCP.BFSSSU2GaugeG3A.adjointColorMatrix
      (sourceXGauge β)) (2 : Fin 3) (1 : Fin 3) = Real.sin β := by
  rw [originalAdjointColorMatrix_sourceX_eq_rotX]
  simp [sourceRotX]

example (β : ℝ) :
    (FCP.BFSSSU2GaugeG3A.adjointColorMatrix
      (sourceXGauge β)) (1 : Fin 3) (2 : Fin 3) = -Real.sin β := by
  rw [originalAdjointColorMatrix_sourceX_eq_rotX]
  simp [sourceRotX]

end
end BFSSIBIG0CXImageIndependentConsumer
