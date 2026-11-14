import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG1OriginalOddGammaTraces
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Independent original paired gamma trace consumer, including odd/even controls. -/
set_option autoImplicit false
namespace BFSSP3AuxHardyG1OriginalOddGammaTracesIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces
open MeasureTheory

example : FullL2 2 = Lp (Fermion 2) 2
    (volume : Measure (Boson 2)) := rfl

example (l : List SpaceIndex) (hl : l.length ≤ 5) :
    ∃ k : SpaceIndex, k ∉ l :=
  originalGamma_missing_of_length_le_five l hl

-- The omitted ninth label controls a concrete three-factor conjugation.
example : Matrix.trace (([0, 1, 2].map pairedAlgebraData.gamma).prod) = 0 := by
  apply originalGamma_trace_of_missing_odd pairedAlgebraData [0, 1, 2] 8
  · decide
  · norm_num

example (i j k : SpaceIndex) :
    Matrix.trace (pairedAlgebraData.gamma i * pairedAlgebraData.gamma j *
      pairedAlgebraData.gamma k) = 0 :=
  originalGamma_three_trace_zero pairedAlgebraData i j k

example (i j k l m : SpaceIndex) :
    Matrix.trace (pairedAlgebraData.gamma i * pairedAlgebraData.gamma j *
      pairedAlgebraData.gamma k * pairedAlgebraData.gamma l *
      pairedAlgebraData.gamma m) = 0 :=
  originalGamma_five_trace_zero pairedAlgebraData i j k l m

-- Repetition is allowed; no spurious distinct-label hypothesis.
example : Matrix.trace (pairedAlgebraData.gamma 0 * pairedAlgebraData.gamma 0 *
    pairedAlgebraData.gamma 0) = 0 :=
  originalGamma_three_trace_zero pairedAlgebraData 0 0 0

example : Matrix.trace (pairedAlgebraData.gamma 0 * pairedAlgebraData.gamma 1 *
    pairedAlgebraData.gamma 2 * pairedAlgebraData.gamma 3 *
    pairedAlgebraData.gamma 4) = 0 :=
  originalGamma_five_trace_zero pairedAlgebraData 0 1 2 3 4

example (i : SpaceIndex) :
    Matrix.trace (pairedAlgebraData.gamma i * pairedAlgebraData.gamma i) = 16 :=
  originalGamma_square_trace pairedAlgebraData i

-- Odd cancellation must not turn into a false all-word trace-zero claim.
example (i : SpaceIndex) :
    Matrix.trace (pairedAlgebraData.gamma i * pairedAlgebraData.gamma i) ≠ 0 := by
  rw [originalGamma_square_trace]
  norm_num

example : Matrix.trace ((([] : List SpaceIndex).map pairedAlgebraData.gamma).prod) = 16 := by
  norm_num [Matrix.trace_one, SpinIndex]

#print axioms FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces.originalGamma_missing_of_length_le_five
#print axioms FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces.originalGamma_trace_of_missing_odd
#print axioms FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces.originalGamma_three_trace_zero
#print axioms FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces.originalGamma_five_trace_zero
#print axioms FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces.originalGamma_square_trace
#print axioms OAI.BFSSGamma.gamma_sq
#print axioms OAI.BFSSGamma.gamma_anti
#print axioms OAI.BFSSGamma.list_commute
#print axioms OAI.BFSSGamma.list_conj
#print axioms OAI.BFSSGamma.trace_conj

end
end BFSSP3AuxHardyG1OriginalOddGammaTracesIndependentConsumer
