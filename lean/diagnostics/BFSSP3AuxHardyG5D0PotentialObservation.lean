import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG5OriginalPotentialTauCAR
import diagnostics.BFSSP3AuxHardyG5D0NativeZero
import diagnostics.BFSSTDC1AD2R2ExpressionInspector

/-! Diagnostic observation; strict consumer remains frozen. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG5D0
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation
open FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR
open FCP.BFSSTDC1AD2R2

example (α : SpinIndex) :
    originalPotentialFermion pairedAlgebraData α (0 : Boson 2) = 0 := by
  simp [originalPotentialFermion, AlgebraData.cliffordLinear, originalPotentialGamma]
  have hw := nativeThetaZeroSum
  td_c1a_d2r2_compare hw
  trace_state
  td_c1a_d2r2_stop


end
end FCP.BFSSP3AuxHardyG5D0
