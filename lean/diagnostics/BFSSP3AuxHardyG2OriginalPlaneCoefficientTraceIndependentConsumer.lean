import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG2OriginalPlaneCoefficientTrace
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Independent actual paired-gamma plane coefficient and orientation controls. -/
set_option autoImplicit false
namespace BFSSP3AuxHardyG2OriginalPlaneCoefficientTraceIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open MeasureTheory

example : FullL2 2 = Lp (Fermion 2) 2
    (volume : Measure (Boson 2)) := rfl

example (i j : SpaceIndex) :
    Matrix.trace (pairedAlgebraData.gamma i * pairedAlgebraData.gamma j) =
      if i = j then 16 else 0 :=
  originalGamma_pair_trace pairedAlgebraData i j

example (i j k : SpaceIndex) (hij : i ≠ j) (hik : i ≠ k) (hjk : j ≠ k) :
    (pairedAlgebraData.gamma i * pairedAlgebraData.gamma j *
      pairedAlgebraData.gamma k).transpose =
      -(pairedAlgebraData.gamma i * pairedAlgebraData.gamma j * pairedAlgebraData.gamma k) :=
  originalGamma_three_transpose pairedAlgebraData i j k hij hik hjk

example (a i j k : SpaceIndex) (hij : i ≠ j) (hik : i ≠ k) (hjk : j ≠ k) :
    Matrix.trace (pairedAlgebraData.gamma a * (pairedAlgebraData.gamma i *
      pairedAlgebraData.gamma j * pairedAlgebraData.gamma k)) = 0 :=
  originalGamma_trace_mul_three_distinct pairedAlgebraData a i j k hij hik hjk

example (i j : SpaceIndex) (X : Boson 2) (A : ColorIndex 2) :
    originalHardyY pairedAlgebraData i j X A =
      (1 / 16 : ℝ) • (X (i, A) • pairedAlgebraData.gamma j -
        X (j, A) • pairedAlgebraData.gamma i) +
      (1 / 56 : ℝ) • ∑ k ∈ Finset.univ.filter (fun k : SpaceIndex => k ≠ i ∧ k ≠ j),
        X (k, A) • (pairedAlgebraData.gamma k * pairedAlgebraData.gamma i *
          pairedAlgebraData.gamma j) := rfl

example (i j : SpaceIndex) (hij : i ≠ j) (X : Boson 2) (A : ColorIndex 2)
    (a : SpaceIndex) :
    Matrix.trace (pairedAlgebraData.gamma a * originalHardyY pairedAlgebraData i j X A) =
      (if a = j then X (i, A) else 0) - (if a = i then X (j, A) else 0) :=
  originalHardyY_trace pairedAlgebraData i j hij X A a

-- First plane axis has positive orientation against the second gamma.
example : Matrix.trace (pairedAlgebraData.gamma 1 *
    originalHardyY pairedAlgebraData 0 1 (EuclideanSpace.single (0, 0) 1) 0) = 1 := by
  rw [originalHardyY_trace pairedAlgebraData 0 1 (by decide)]
  norm_num [PiLp.single_apply]

-- Second plane axis has negative orientation against the first gamma.
example : Matrix.trace (pairedAlgebraData.gamma 0 *
    originalHardyY pairedAlgebraData 0 1 (EuclideanSpace.single (1, 0) 1) 0) = -1 := by
  rw [originalHardyY_trace pairedAlgebraData 0 1 (by decide)]
  norm_num [PiLp.single_apply]

example (X : Boson 2) (A : ColorIndex 2) (a : SpaceIndex) :
    Matrix.trace (pairedAlgebraData.gamma a * originalHardyY pairedAlgebraData 0 1 X A) =
      -Matrix.trace (pairedAlgebraData.gamma a * originalHardyY pairedAlgebraData 1 0 X A) := by
  rw [originalHardyY_trace pairedAlgebraData 0 1 (by decide),
    originalHardyY_trace pairedAlgebraData 1 0 (by decide)]
  ring

example (i j : SpaceIndex) (hij : i ≠ j) (A : ColorIndex 2) (a : SpaceIndex) :
    Matrix.trace (pairedAlgebraData.gamma a *
      originalHardyY pairedAlgebraData i j (0 : Boson 2) A) = 0 := by
  rw [originalHardyY_trace pairedAlgebraData i j hij]
  simp

-- The incorrect positive sign on the second axis is rejected.
example : Matrix.trace (pairedAlgebraData.gamma 0 *
    originalHardyY pairedAlgebraData 0 1 (EuclideanSpace.single (1, 0) 1) 0) ≠ 1 := by
  rw [originalHardyY_trace pairedAlgebraData 0 1 (by decide)]
  norm_num [PiLp.single_apply]

#print axioms FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace.originalGamma_pair_trace
#print axioms FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace.originalGamma_three_transpose
#print axioms FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace.originalGamma_trace_mul_three_distinct
#print axioms FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace.originalHardyY
#print axioms FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace.originalHardyY_trace
#print axioms FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces.originalGamma_square_trace
#print axioms OAI.BFSSGamma.gamma_anti
#print axioms OAI.BFSSGamma.list_reverse_eq
#print axioms OAI.BFSSGamma.list_transpose
#print axioms OAI.BFSSGamma.trace_skew_symm

end
end BFSSP3AuxHardyG2OriginalPlaneCoefficientTraceIndependentConsumer
