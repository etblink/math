import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQE0OriginalCoreEnergy

set_option autoImplicit false
set_option warningAsError true
namespace FCP.BFSSCSQE0Independent
noncomputable section
open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J

/-- Literal original charges acting twice, not a weighted proxy. -/
theorem pairedBasisSquareAudit (a b : SpinIndex) (f : pairedGaugeData.invariantCore) :
    pairedAlgebraData.charge a (pairedAlgebraData.charge a f.val) =
      pairedAlgebraData.charge b (pairedAlgebraData.charge b f.val) :=
  FCP.BFSSCSQE0.basisSquareCore a b f

/-- Compare directly against the original sixteen-term average. -/
theorem pairedEnergyAudit (a : SpinIndex) (f : pairedGaugeData.invariantCore) :
    ‖coreToL2 (pairedAlgebraData.charge a f.val)‖ ^ 2 =
      (1 / 16 : ℝ) * ∑ b : SpinIndex, ‖coreToL2 (pairedAlgebraData.charge b f.val)‖ ^ 2 :=
  FCP.BFSSCSQE0.originalBasisEnergy a f

#print axioms pairedBasisSquareAudit
#print axioms pairedEnergyAudit
end
end FCP.BFSSCSQE0Independent
