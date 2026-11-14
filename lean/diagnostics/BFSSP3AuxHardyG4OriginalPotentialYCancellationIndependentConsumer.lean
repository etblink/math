import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG4OriginalPotentialYCancellation
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Native original potential coefficient, transpose pairing and nonzero probe controls. -/
set_option autoImplicit false
namespace BFSSP3AuxHardyG4OriginalPotentialYCancellationIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation
open MeasureTheory

private def nativeColorZero : ColorIndex 2 :=
  ⟨0, by change (0 : ℕ) < 3; decide⟩

example : FullL2 2 = Lp (Fermion 2) 2
    (volume : Measure (Boson 2)) := rfl

example (k l i j : SpaceIndex) (X : Boson 2) (D : ColorIndex 2) :
    Matrix.trace (pairedAlgebraData.gammaTwo k l *
      originalHardyY pairedAlgebraData i j X D) = 0 :=
  originalGammaTwo_trace_Y pairedAlgebraData k l i j X D

example (X : Boson 2) (A : ColorIndex 2) :
    originalPotentialGamma pairedAlgebraData X A =
      ∑ k : SpaceIndex, ∑ l : SpaceIndex, ∑ B : ColorIndex 2, ∑ C : ColorIndex 2,
        ((1 / 2 : ℝ) * pairedAlgebraData.structureConstant A B C * X (k, B) * X (l, C)) •
          pairedAlgebraData.gammaTwo k l := rfl

example (X : Boson 2) (A : ColorIndex 2) (α β : SpinIndex) :
    originalPotentialGamma pairedAlgebraData X A α β =
      ∑ k : SpaceIndex, ∑ l : SpaceIndex, ∑ B : ColorIndex 2, ∑ C : ColorIndex 2,
        (1 / 2 : ℝ) * pairedAlgebraData.structureConstant A B C *
          pairedAlgebraData.gammaTwo k l α β * X (k, B) * X (l, C) :=
  originalPotentialGamma_apply pairedAlgebraData X A α β

example (X : Boson 2) (A : ColorIndex 2) :
    (originalPotentialGamma pairedAlgebraData X A).transpose =
      -originalPotentialGamma pairedAlgebraData X A :=
  originalPotentialGamma_transpose pairedAlgebraData X A

example (X : Boson 2) (A D : ColorIndex 2) (i j : SpaceIndex) :
    Matrix.trace (originalPotentialGamma pairedAlgebraData X A *
      originalHardyY pairedAlgebraData i j X D) = 0 :=
  originalPotentialGamma_trace_Y pairedAlgebraData X A D i j

example (X : Boson 2) (A D : ColorIndex 2) (i j : SpaceIndex) :
    (∑ α : SpinIndex, ∑ β : SpinIndex,
      originalPotentialGamma pairedAlgebraData X A α β *
        originalHardyY pairedAlgebraData i j X D α β) = 0 :=
  originalPotentialGamma_pairing_zero pairedAlgebraData X A D i j

-- Diagonal color specialization is the scalar coefficient needed for later CAR compression.
example (X : Boson 2) (i j : SpaceIndex) :
    (∑ A : ColorIndex 2, ∑ α : SpinIndex, ∑ β : SpinIndex,
      originalPotentialGamma pairedAlgebraData X A α β *
        originalHardyY pairedAlgebraData i j X A α β) = 0 := by
  simp only [originalPotentialGamma_pairing_zero, Finset.sum_const_zero]

example (X : Boson 2) (D : ColorIndex 2) (i j : SpaceIndex) :
    Matrix.trace (pairedAlgebraData.gammaTwo 0 0 *
      originalHardyY pairedAlgebraData i j X D) = 0 :=
  originalGammaTwo_trace_Y pairedAlgebraData 0 0 i j X D

example (A : ColorIndex 2) :
    originalPotentialGamma pairedAlgebraData (0 : Boson 2) A = 0 := by
  simp [originalPotentialGamma]

-- Cancellation for gammaTwo must not become a false all-probes-vanish claim.
example : Matrix.trace (pairedAlgebraData.gamma 1 * originalHardyY pairedAlgebraData 0 1
    (EuclideanSpace.single (0, nativeColorZero) 1) nativeColorZero) = 1 := by
  rw [originalHardyY_trace pairedAlgebraData 0 1 (by decide)]
  norm_num [PiLp.single_apply]

example : Matrix.trace (pairedAlgebraData.gamma 1 * originalHardyY pairedAlgebraData 0 1
    (EuclideanSpace.single (0, nativeColorZero) 1) nativeColorZero) ≠ 0 := by
  rw [originalHardyY_trace pairedAlgebraData 0 1 (by decide)]
  norm_num [PiLp.single_apply]

#print axioms FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation.originalGammaTwo_trace_Y
#print axioms FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation.originalPotentialGamma
#print axioms FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation.originalPotentialGamma_apply
#print axioms FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation.originalPotentialGamma_transpose
#print axioms FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation.originalPotentialGamma_trace_Y
#print axioms FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation.originalPotentialGamma_pairing_zero
#print axioms FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces.originalGamma_three_trace_zero
#print axioms FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces.originalGamma_five_trace_zero
#print axioms FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace.originalHardyY
#print axioms OAI.BFSSQuantum.AlgebraData.gammaTwo
#print axioms OAI.BFSSQuantum.AlgebraData.charge

end
end BFSSP3AuxHardyG4OriginalPotentialYCancellationIndependentConsumer
