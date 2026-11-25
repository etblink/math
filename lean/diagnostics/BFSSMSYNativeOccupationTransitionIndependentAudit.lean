import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYNativeOccupationTransition

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYNativeOccupationTransitionIndependent
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A FCP.BFSSFermionF3B2
open FCP.BFSSMSYNativeOccupationTransition
open OAI.ContinuumCoulomb.HubbardGlobal

/-- Boundary label of the genuine eight-by-three mode packing. -/
theorem lastModeAudit : (colorModeEquiv ((7 : Fin 8), (2 : Fin 3))).val = 23 := by
  rw [modeIndex_val]
  decide

/-- Independent consumer of both parity branches on literal original
AlgebraData.theta, not on a replacement finite Fock operator. -/
theorem originalOddPhaseAudit
    (j : Fin 8) (C : ColorIndex 2) (A : Finset (Fin 24)) :
    pairedAlgebraData.theta (spinPairEquiv.symm (j, (1 : Fin 2))) C (occupationKet A) =
      if colorModeEquiv (j, C) ∈ A then
        -(Complex.I •
          pairedAlgebraData.theta (spinPairEquiv.symm (j, (0 : Fin 2))) C (occupationKet A))
      else
        Complex.I •
          pairedAlgebraData.theta (spinPairEquiv.symm (j, (0 : Fin 2))) C (occupationKet A) := by
  simp only [pairedAlgebraData_theta, pairedTheta_odd_occupationKet,
    pairedTheta_even_occupationKet]
  by_cases hi : colorModeEquiv (j, C) ∈ A
  · rw [if_pos hi, if_pos hi, if_pos hi]
    simp only [smul_neg, smul_smul]
    rw [mul_left_comm ((Real.sqrt 2 / 2 : ℝ) : ℂ) Complex.I]
  · rw [if_neg hi, if_neg hi, if_neg hi]
    simp only [smul_smul]
    rw [mul_left_comm ((Real.sqrt 2 / 2 : ℝ) : ℂ) Complex.I]

#print axioms lastModeAudit
#print axioms originalOddPhaseAudit

end
end FCP.BFSSMSYNativeOccupationTransitionIndependent
