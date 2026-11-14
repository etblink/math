import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyX0OriginalXiNormAndCutoff
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Independent actual original paired Fock Xi norm and smooth-core cutoff consumer. -/
set_option autoImplicit false
namespace BFSSP3AuxHardyX0OriginalXiNormAndCutoffIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyX0OriginalXiNormAndCutoff
open MeasureTheory

example : FullL2 2 = Lp (Fermion 2) 2
    (volume : Measure (Boson 2)) := rfl

example (α : SpinIndex) (X : Boson 2) :
    originalHardyXi pairedAlgebraData α X =
      pairedAlgebraData.principalSymbol (Pi.single α 1) X := rfl

example (α : SpinIndex) (X : Boson 2) (v : Fermion 2) :
    originalHardyXi pairedAlgebraData α X v =
      ∑ i : SpaceIndex, ∑ A : ColorIndex 2, ∑ β : SpinIndex,
        ((pairedAlgebraData.gamma i α β * X (i, A) : ℝ) : ℂ) •
          pairedAlgebraData.theta β A v :=
  originalHardyXi_apply pairedAlgebraData α X v

example (α : SpinIndex) (X : Boson 2) (v : Fermion 2) :
    ‖originalHardyXi pairedAlgebraData α X v‖ ^ 2 =
      (1 / 2 : ℝ) * ‖X‖ ^ 2 * ‖v‖ ^ 2 :=
  originalHardyXi_norm_sq pairedAlgebraData α X v

example (X : Boson 2) (v : Fermion 2) :
    (∑ α : SpinIndex, ‖originalHardyXi pairedAlgebraData α X v‖ ^ 2) =
      8 * ‖X‖ ^ 2 * ‖v‖ ^ 2 :=
  originalHardyXi_sum_norm_sq pairedAlgebraData X v

example (α : SpinIndex) (χ : Boson 2 → ℝ)
    (hχ : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) χ)
    (f : SmoothCore 2) (X : Boson 2) :
    pairedAlgebraData.charge α (realCutoff χ hχ f) X =
      (χ X : ℂ) • pairedAlgebraData.charge α f X +
        (-Complex.I) • originalHardyXi pairedAlgebraData α (cutoffGradient χ X) (f X) :=
  originalHardyXi_charge_realCutoff pairedAlgebraData α χ hχ f X

-- Original origin behavior via the existing real-linear principal-symbol map.
example (α : SpinIndex) (v : Fermion 2) :
    originalHardyXi pairedAlgebraData α (0 : Boson 2) v = 0 := by
  change (pairedAlgebraData.principalSymbolLinear α (0 : Boson 2)) v = 0
  simp

-- The doubled CAR convention gives the wrong coefficient on nonzero actual inputs.
example (X : Boson 2) (v : Fermion 2) (hX : X ≠ 0) (hv : v ≠ 0) :
    (∑ α : SpinIndex, ‖originalHardyXi pairedAlgebraData α X v‖ ^ 2) ≠
      16 * ‖X‖ ^ 2 * ‖v‖ ^ 2 := by
  intro hwrong
  rw [originalHardyXi_sum_norm_sq] at hwrong
  have hp : 0 < ‖X‖ ^ 2 * ‖v‖ ^ 2 :=
    mul_pos (pow_pos (norm_pos_iff.mpr hX) 2) (pow_pos (norm_pos_iff.mpr hv) 2)
  nlinarith

#print axioms FCP.BFSSP3AuxHardyX0OriginalXiNormAndCutoff.originalHardyXi
#print axioms FCP.BFSSP3AuxHardyX0OriginalXiNormAndCutoff.originalHardyXi_apply
#print axioms FCP.BFSSP3AuxHardyX0OriginalXiNormAndCutoff.originalHardyXi_norm_sq
#print axioms FCP.BFSSP3AuxHardyX0OriginalXiNormAndCutoff.originalHardyXi_sum_norm_sq
#print axioms FCP.BFSSP3AuxHardyX0OriginalXiNormAndCutoff.originalHardyXi_charge_realCutoff
#print axioms OAI.BFSSQuantum.AlgebraData.cliffordLinear_norm_sq
#print axioms OAI.BFSSQuantum.AlgebraData.principalSymbol_norm_sq
#print axioms OAI.BFSSQuantum.AlgebraData.principalSymbol_unit_norm_sq
#print axioms OAI.BFSSQuantum.AlgebraData.principalSymbol_basis_apply
#print axioms OAI.BFSSQuantum.AlgebraData.charge_realCutoff

end
end BFSSP3AuxHardyX0OriginalXiNormAndCutoffIndependentConsumer
