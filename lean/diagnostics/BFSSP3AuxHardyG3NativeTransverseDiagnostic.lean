import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG3OriginalYDerivativeContraction
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Isolated exact native ninth-axis control, checked before the full G3 consumer. -/
set_option autoImplicit false
namespace BFSSP3AuxHardyG3NativeTransverseDiagnostic
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction

private def nativeColorZero : ColorIndex 2 :=
  ⟨0, by change (0 : ℕ) < 3; decide⟩

theorem nativeTransverseControl (X : Boson 2) :
    fderiv ℝ (fun Z : Boson 2 => originalHardyY pairedAlgebraData 0 1 Z nativeColorZero) X
      (EuclideanSpace.single (8, nativeColorZero) 1) =
      (1 / 56 : ℝ) • (pairedAlgebraData.gamma 8 * pairedAlgebraData.gamma 0 *
        pairedAlgebraData.gamma 1) := by
  rw [originalHardyY_fderiv, originalHardyYCLM_apply]
  simp [originalHardyY, PiLp.single_apply, ite_smul]

#print axioms BFSSP3AuxHardyG3NativeTransverseDiagnostic.nativeTransverseControl

end
end BFSSP3AuxHardyG3NativeTransverseDiagnostic
