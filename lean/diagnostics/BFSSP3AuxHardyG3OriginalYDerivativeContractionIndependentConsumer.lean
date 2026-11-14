import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG3OriginalYDerivativeContraction
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Independent native Y derivative, transverse coefficient and normalization controls. -/
set_option autoImplicit false
namespace BFSSP3AuxHardyG3OriginalYDerivativeContractionIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction
open MeasureTheory

private def nativeColorZero : ColorIndex 2 :=
  ⟨0, by change (0 : ℕ) < 3; decide⟩

example : FullL2 2 = Lp (Fermion 2) 2
    (volume : Measure (Boson 2)) := rfl

example (i j : SpaceIndex) (A : ColorIndex 2) (X : Boson 2) :
    originalHardyYCLM pairedAlgebraData i j A X =
      originalHardyY pairedAlgebraData i j X A :=
  originalHardyYCLM_apply pairedAlgebraData i j A X

example (i j : SpaceIndex) (A : ColorIndex 2) (X Z : Boson 2) :
    originalHardyYCLM pairedAlgebraData i j A (X + Z) =
      originalHardyY pairedAlgebraData i j X A + originalHardyY pairedAlgebraData i j Z A := by
  rw [map_add, originalHardyYCLM_apply, originalHardyYCLM_apply]

example (i j : SpaceIndex) (A : ColorIndex 2) (X : Boson 2) :
    fderiv ℝ (fun Z : Boson 2 => originalHardyY pairedAlgebraData i j Z A) X =
      originalHardyYCLM pairedAlgebraData i j A :=
  originalHardyY_fderiv pairedAlgebraData i j A X

example (i j : SpaceIndex) (hij : i ≠ j) (A : ColorIndex 2) :
    (∑ k : SpaceIndex, pairedAlgebraData.gamma k *
      originalHardyY pairedAlgebraData i j (EuclideanSpace.single (k, A) 1) A) =
      (1 / 4 : ℝ) • (pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) :=
  originalHardyY_basis_contraction pairedAlgebraData i j hij A

example (i j : SpaceIndex) (hij : i ≠ j) (A : ColorIndex 2) (X : Boson 2) :
    (∑ k : SpaceIndex, pairedAlgebraData.gamma k *
      (fderiv ℝ (fun Z : Boson 2 => originalHardyY pairedAlgebraData i j Z A) X
        (EuclideanSpace.single (k, A) 1))) =
      (1 / 4 : ℝ) • (pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) :=
  originalHardyY_derivative_contraction pairedAlgebraData i j hij A X

example (i j : SpaceIndex) (hij : i ≠ j) (A : ColorIndex 2) :
    (∑ k : SpaceIndex, pairedAlgebraData.gamma k *
      (fderiv ℝ (fun Z : Boson 2 => originalHardyY pairedAlgebraData i j Z A) (0 : Boson 2)
        (EuclideanSpace.single (k, A) 1))) =
      (1 / 4 : ℝ) • (pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) :=
  originalHardyY_derivative_contraction pairedAlgebraData i j hij A 0

example (A : ColorIndex 2) (X : Boson 2) :
    (∑ k : SpaceIndex, pairedAlgebraData.gamma k *
      (fderiv ℝ (fun Z : Boson 2 => originalHardyY pairedAlgebraData 1 0 Z A) X
        (EuclideanSpace.single (k, A) 1))) =
      -(1 / 4 : ℝ) • (pairedAlgebraData.gamma 0 * pairedAlgebraData.gamma 1) := by
  rw [originalHardyY_derivative_contraction pairedAlgebraData 1 0 (by decide)]
  rw [OAI.BFSSGamma.gamma_anti pairedAlgebraData.gamma pairedAlgebraData.gamma_clifford
    (by decide : (1 : SpaceIndex) ≠ 0)]
  simp only [smul_neg, neg_smul]

example (X : Boson 2) :
    fderiv ℝ (fun Z : Boson 2 => originalHardyY pairedAlgebraData 0 1 Z nativeColorZero) X
      (EuclideanSpace.single (0, nativeColorZero) 1) =
      (1 / 16 : ℝ) • pairedAlgebraData.gamma 1 := by
  rw [originalHardyY_fderiv, originalHardyYCLM_apply]
  simp [originalHardyY, PiLp.single_apply]

-- The ninth spatial direction independently tests the transverse coefficient.
example (X : Boson 2) :
    fderiv ℝ (fun Z : Boson 2 => originalHardyY pairedAlgebraData 0 1 Z nativeColorZero) X
      (EuclideanSpace.single (8, nativeColorZero) 1) =
      (1 / 56 : ℝ) • (pairedAlgebraData.gamma 8 * pairedAlgebraData.gamma 0 *
        pairedAlgebraData.gamma 1) := by
  rw [originalHardyY_fderiv, originalHardyYCLM_apply]
  simp [originalHardyY, PiLp.single_apply, ite_smul]

private theorem nativeProbe (X : Boson 2) :
    Matrix.trace ((pairedAlgebraData.gamma 1 * pairedAlgebraData.gamma 0) *
      (∑ k : SpaceIndex, pairedAlgebraData.gamma k *
        (fderiv ℝ (fun Z : Boson 2 => originalHardyY pairedAlgebraData 0 1 Z nativeColorZero) X
          (EuclideanSpace.single (k, nativeColorZero) 1)))) = 4 := by
  rw [originalHardyY_derivative_contraction pairedAlgebraData 0 1 (by decide), Matrix.mul_smul]
  have hp : (pairedAlgebraData.gamma 1 * pairedAlgebraData.gamma 0) *
      (pairedAlgebraData.gamma 0 * pairedAlgebraData.gamma 1) = 1 := by
    calc
      _ = pairedAlgebraData.gamma 1 * (pairedAlgebraData.gamma 0 * pairedAlgebraData.gamma 0) *
          pairedAlgebraData.gamma 1 := by simp only [mul_assoc]
      _ = 1 := by
        rw [OAI.BFSSGamma.gamma_sq pairedAlgebraData.gamma pairedAlgebraData.gamma_clifford 0,
          mul_one, OAI.BFSSGamma.gamma_sq pairedAlgebraData.gamma pairedAlgebraData.gamma_clifford 1]
  rw [hp, Matrix.trace_smul, Matrix.trace_one]
  norm_num [SpinIndex]

example (X : Boson 2) :
    Matrix.trace ((pairedAlgebraData.gamma 1 * pairedAlgebraData.gamma 0) *
      (∑ k : SpaceIndex, pairedAlgebraData.gamma k *
        (fderiv ℝ (fun Z : Boson 2 => originalHardyY pairedAlgebraData 0 1 Z nativeColorZero) X
          (EuclideanSpace.single (k, nativeColorZero) 1)))) = 4 := nativeProbe X

example (X : Boson 2) :
    Matrix.trace ((pairedAlgebraData.gamma 1 * pairedAlgebraData.gamma 0) *
      (∑ k : SpaceIndex, pairedAlgebraData.gamma k *
        (fderiv ℝ (fun Z : Boson 2 => originalHardyY pairedAlgebraData 0 1 Z nativeColorZero) X
          (EuclideanSpace.single (k, nativeColorZero) 1)))) ≠ 8 := by
  rw [nativeProbe X]
  norm_num

#print axioms FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction.originalHardyYCLM
#print axioms FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction.originalHardyYCLM_apply
#print axioms FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction.originalHardyY_fderiv
#print axioms FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction.originalHardyY_basis_contraction
#print axioms FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction.originalHardyY_derivative_contraction
#print axioms FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace.originalHardyY
#print axioms FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace.originalHardyY_trace
#print axioms FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces.originalGamma_square_trace
#print axioms OAI.BFSSGamma.gamma_sq
#print axioms OAI.BFSSGamma.gamma_anti

end
end BFSSP3AuxHardyG3OriginalYDerivativeContractionIndependentConsumer
