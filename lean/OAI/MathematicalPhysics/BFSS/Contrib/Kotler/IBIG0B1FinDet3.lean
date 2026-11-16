import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG1BOriginalSignedCross

/-!
# IBI-G0B1 FIN-DET3 — signed source-color determinant polynomial
FIN-DET3 binds the existing Pauli colorCross to ordered columns
of the actual G3A source matrix. No native determinant-one claim.
-/

set_option autoImplicit false

namespace FCP.BFSSIBIG0B1FinDet3
noncomputable section
open OAI.BFSSQuantum

/-- The original Pauli cross in ordered output-row/input-column coordinates. -/
noncomputable def originalColumnTriple (R : Matrix (Fin 3) (Fin 3) ℝ) : ℝ :=
  ∑ A : Fin 3,
    FCP.BFSSSU2.colorCross
      (fun B : Fin 3 => R B 0)
      (fun B : Fin 3 => R B 1) A * R A 2

theorem originalColumnTriple_eq_det (R : Matrix (Fin 3) (Fin 3) ℝ) :
    originalColumnTriple R = R.det := by
  simp [originalColumnTriple, Fin.sum_univ_three,
    FCP.BFSSSU2.colorCross, Matrix.det_fin_three]
  ring

/-- Exact specialization to the original BFSS G3A gauge-adjoint matrix. -/
theorem originalAdjointColumnTriple_eq_det (g : GaugeGroup 2) :
    originalColumnTriple (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) =
      (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g).det :=
  originalColumnTriple_eq_det _

#print axioms originalColumnTriple
#print axioms originalColumnTriple_eq_det
#print axioms originalAdjointColumnTriple_eq_det

end
end FCP.BFSSIBIG0B1FinDet3
