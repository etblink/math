import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG11OriginalDerivativeColorContraction
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG12FiniteCoefficientContraction
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG12TypedZeroActionDiagnostic

/-! G12 D0: original carriers and imports; failed G12 main module excluded. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG12TypedZeroActionNativeDiagnostic
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSP3AuxHardyG8OriginalTauDerivative
open FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR
open FCP.BFSSP3AuxHardyG11OriginalDerivativeColorContraction
open FCP.BFSSP3AuxHardyG12FiniteCoefficientContraction
open FCP.BFSSP3AuxHardyG12TypedZeroActionDiagnostic
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J

set_option pp.all true in
#check zero_smul
set_option pp.all true in
#check _root_.zero_smul
set_option pp.all true in
#check fun (M : AlgebraData 2) (β δ : SpinIndex) (B A : ColorIndex 2) =>
  (0 : ℂ) • (M.theta β B * M.theta δ A)

theorem originalZeroProduct (M : AlgebraData 2) (β δ : SpinIndex)
    (B A : ColorIndex 2) : (0 : ℂ) • (M.theta β B * M.theta δ A) = 0 :=
  _root_.zero_smul ℂ (M.theta β B * M.theta δ A)

theorem originalOffColorZero (M : AlgebraData 2) (β δ : SpinIndex)
    (B A : ColorIndex 2) (hAB : A ≠ B) (c : ℂ) :
    (if B = A then c else 0) • (M.theta β B * M.theta δ A) = 0 := by
  rw [ite_eq_right (Ne.symm hAB)]
  exact _root_.zero_smul ℂ (M.theta β B * M.theta δ A)

theorem originalSelectedColorSum (M : AlgebraData 2) (β δ : SpinIndex)
    (B : ColorIndex 2) (c : ℂ) :
    (∑ A : ColorIndex 2,
      (if B = A then c else 0) • (M.theta β B * M.theta δ A)) =
        c • (M.theta β B * M.theta δ B) :=
  complexSelectedColorSum B c (fun A : ColorIndex 2 => M.theta β B * M.theta δ A)

example (β δ : SpinIndex) (B A : ColorIndex 2) :
    (0 : ℂ) • (pairedAlgebraData.theta β B * pairedAlgebraData.theta δ A) = 0 :=
  originalZeroProduct pairedAlgebraData β δ B A

example (β δ : SpinIndex) (B A : ColorIndex 2) (hAB : A ≠ B) (c : ℂ) :
    (if B = A then c else 0) •
      (pairedAlgebraData.theta β B * pairedAlgebraData.theta δ A) = 0 :=
  originalOffColorZero pairedAlgebraData β δ B A hAB c

example (β δ : SpinIndex) (B : ColorIndex 2) (c : ℂ) :
    (∑ A : ColorIndex 2,
      (if B = A then c else 0) • (pairedAlgebraData.theta β B * pairedAlgebraData.theta δ A)) =
        c • (pairedAlgebraData.theta β B * pairedAlgebraData.theta δ B) :=
  originalSelectedColorSum pairedAlgebraData β δ B c

#print axioms FCP.BFSSP3AuxHardyG12TypedZeroActionNativeDiagnostic.originalZeroProduct
#print axioms FCP.BFSSP3AuxHardyG12TypedZeroActionNativeDiagnostic.originalOffColorZero
#print axioms FCP.BFSSP3AuxHardyG12TypedZeroActionNativeDiagnostic.originalSelectedColorSum
#print axioms FCP.BFSSP3AuxHardyG12TypedZeroActionDiagnostic.complexZeroOperatorProduct
#print axioms FCP.BFSSP3AuxHardyG12TypedZeroActionDiagnostic.complexSelectedColorSum

end
end FCP.BFSSP3AuxHardyG12TypedZeroActionNativeDiagnostic
