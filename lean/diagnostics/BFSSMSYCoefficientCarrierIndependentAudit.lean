import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYCoefficientCarrier

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYCoefficientCarrierIndependent
noncomputable section

open OAI.BFSSQuantum OAI.ContinuumCoulomb.HubbardGlobal
open FCP.BFSSFermionF1 FCP.BFSSFermionF3B5 FCP.BFSSSU2GaugeG1A
open FCP.BFSSMSYCoefficientCarrier

/-- Independent audit of the actual F1 unitary inverse coordinate. -/
theorem literalCoordinateAudit (c : FockCoordinateSpace 23) (A : Finset (Fin 24)) :
    occupationCoeff (fockBFSSUnitary c) A = c A :=
  occupationCoeff_carrier c A

/-- Independent audit uses the literal original pairedAlgebraData.theta. -/
theorem literalOddCarrierAudit (j : Fin 8) (C : ColorIndex 2)
    (c : FockCoordinateSpace 23) :
    pairedAlgebraData.theta (spinPairEquiv.symm (j, (1 : Fin 2))) C (fockBFSSUnitary c) =
      ∑ A : Finset (Fin 24), c A • oddTerm (colorModeEquiv (j, C)) A := by
  rw [pairedAlgebraData_theta]
  exact oddCarrier j C c

#print axioms literalCoordinateAudit
#print axioms literalOddCarrierAudit

end
end FCP.BFSSMSYCoefficientCarrierIndependent
