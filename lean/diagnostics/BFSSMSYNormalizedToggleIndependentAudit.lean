import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYNormalizedToggle

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYNormalizedToggleIndependent
noncomputable section

open OAI.BFSSQuantum OAI.ContinuumCoulomb.HubbardGlobal
open FCP.BFSSFermionF1 FCP.BFSSFermionF3B5 FCP.BFSSSU2GaugeG1A
open FCP.BFSSMSYCoefficientCarrier FCP.BFSSMSYNormalizedToggle

/-- Actual original theta with a recovered arbitrary output coefficient. -/
theorem literalOddOutputAudit (j : Fin 8) (C : ColorIndex 2)
    (c : FockCoordinateSpace 23) (B : Finset (Fin 24)) :
    occupationCoeff
      (((Real.sqrt 2 : ℝ) : ℂ) •
        pairedAlgebraData.theta (spinPairEquiv.symm (j, (1 : Fin 2))) C (fockBFSSUnitary c)) B =
      c (toggleOccupation (colorModeEquiv (j, C)) B) *
        oddWeight (colorModeEquiv (j, C)) (toggleOccupation (colorModeEquiv (j, C)) B) := by
  rw [pairedAlgebraData_theta]
  calc
    _ = occupationCoeff (coefficientCarrier (oddAction (colorModeEquiv (j, C)) c)) B :=
      congrArg (fun x : Fermion 2 => occupationCoeff x B) (oddIntertwine j C c).symm
    _ = _ := occupationCoeff_carrier _ B

/-- Output phase is evaluated on the input occupation, not the destination. -/
theorem oddWeightVacuumAudit (i : Fin 24) :
    oddWeight i ∅ = Complex.I := by
  simp [oddWeight, occupationParity]

#print axioms literalOddOutputAudit
#print axioms oddWeightVacuumAudit

end
end FCP.BFSSMSYNormalizedToggleIndependent
