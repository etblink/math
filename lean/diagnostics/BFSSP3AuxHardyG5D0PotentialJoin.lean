import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG5OriginalPotentialTauCAR
import diagnostics.BFSSP3AuxHardyG5D0NativeZero

/-! Diagnostic join; strict consumer remains frozen. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG5D0
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation
open FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR

theorem potentialZeroJoin (α : SpinIndex) :
    originalPotentialFermion pairedAlgebraData α (0 : Boson 2) = 0 := by
  simp [originalPotentialFermion, AlgebraData.cliffordLinear, originalPotentialGamma]
  exact nativeThetaZeroSum

#print axioms FCP.BFSSP3AuxHardyG5D0.potentialZeroJoin

end
end FCP.BFSSP3AuxHardyG5D0
