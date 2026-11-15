import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0B1FinDet3

/-! Independent G0B1 FIN-DET3 controls: actual G3A, identity and a
nonsymmetric improper reflection of determinant -1. -/

set_option autoImplicit false

namespace BFSSIBIG0B1FinDet3IndependentConsumer

open OAI.BFSSQuantum
open FCP.BFSSIBIG0B1FinDet3

example (g : GaugeGroup 2) :
    originalColumnTriple (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) =
      (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g).det :=
  originalAdjointColumnTriple_eq_det g

example :
    originalColumnTriple (1 : Matrix (Fin 3) (Fin 3) ℝ) = 1 := by
  rw [originalColumnTriple_eq_det]
  simp

private def reflectedColorMatrix : Matrix (Fin 3) (Fin 3) ℝ :=
  !![0, 1, 0; 0, 0, 1; -1, 0, 0]

example : originalColumnTriple reflectedColorMatrix = -1 := by
  norm_num [originalColumnTriple, reflectedColorMatrix,
    FCP.BFSSSU2.colorCross, Fin.sum_univ_three]

end BFSSIBIG0B1FinDet3IndependentConsumer
