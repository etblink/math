import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG14OriginalCoreAnticommutatorCollapse
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG15RealCoefficientSumDiagnostic

/-! Original-source sum adapters only; full G15 stays blocked and unimported. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG15RealCoefficientSumNativeDiagnostic
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyG15RealCoefficientSumDiagnostic

theorem originalCliffordLinear_fourSum (M : AlgebraData 2) (b : Fin 4 → FermionIndex 2 → ℝ) :
    (∑ t : Fin 4, M.cliffordLinear (b t)) =
      M.cliffordLinear (fun p : FermionIndex 2 => ∑ t : Fin 4, b t p) := by
  unfold AlgebraData.cliffordLinear
  exact realCoefficient_doubleSum b (fun p : FermionIndex 2 => M.theta p.1 p.2)

theorem originalTau_fourSum (M : AlgebraData 2) (i j : Fin 4 → SpaceIndex)
    (α : SpinIndex) (X : Boson 2) :
    (∑ t : Fin 4, originalHardyTau M (i t) (j t) α X) =
      M.cliffordLinear (fun p : FermionIndex 2 =>
        ∑ t : Fin 4, originalHardyY M (i t) (j t) X p.2 α p.1) := by
  exact originalCliffordLinear_fourSum M
    (fun t p => originalHardyY M (i t) (j t) X p.2 α p.1)

example (b : Fin 4 → FermionIndex 2 → ℝ) :
    (∑ t : Fin 4, pairedAlgebraData.cliffordLinear (b t)) =
      pairedAlgebraData.cliffordLinear (fun p : FermionIndex 2 => ∑ t : Fin 4, b t p) :=
  originalCliffordLinear_fourSum pairedAlgebraData b

example (i j : Fin 4 → SpaceIndex)
    (α : SpinIndex) (X : Boson 2) :
    (∑ t : Fin 4, originalHardyTau pairedAlgebraData (i t) (j t) α X) =
      pairedAlgebraData.cliffordLinear (fun p : FermionIndex 2 =>
        ∑ t : Fin 4, originalHardyY pairedAlgebraData (i t) (j t) X p.2 α p.1) :=
  originalTau_fourSum pairedAlgebraData i j α X

example (i j : Fin 4 → SpaceIndex)
    (α : SpinIndex) :
    (∑ t : Fin 4, originalHardyTau pairedAlgebraData (i t) (j t) α (0 : Boson 2)) =
      pairedAlgebraData.cliffordLinear (fun p : FermionIndex 2 =>
        ∑ t : Fin 4, originalHardyY pairedAlgebraData (i t) (j t) (0 : Boson 2) p.2 α p.1) := by
  generalize (0 : Boson 2) = X
  exact originalTau_fourSum pairedAlgebraData i j α X

#print axioms FCP.BFSSP3AuxHardyG15RealCoefficientSumNativeDiagnostic.originalCliffordLinear_fourSum
#print axioms FCP.BFSSP3AuxHardyG15RealCoefficientSumNativeDiagnostic.originalTau_fourSum
#print axioms FCP.BFSSP3AuxHardyG15RealCoefficientSumDiagnostic.realCoefficient_sum_smul
#print axioms FCP.BFSSP3AuxHardyG15RealCoefficientSumDiagnostic.realCoefficient_doubleSum

end
end FCP.BFSSP3AuxHardyG15RealCoefficientSumNativeDiagnostic
