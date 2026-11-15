import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG6OriginalCorePotentialBinding
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Actual source potential/charge binding. Conditional controls do not assert a nonzero state. -/
set_option autoImplicit false
namespace BFSSP3AuxHardyG6OriginalCorePotentialBindingIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation
open FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR
open FCP.BFSSP3AuxHardyG6OriginalCorePotentialBinding
open MeasureTheory

example (X : Boson 2) (A : ColorIndex 2) (α β : SpinIndex) :
    originalPotentialGamma pairedAlgebraData X A α β =
      pairedAlgebraData.deformedPotentialCoefficients 1 0 X α (β, A) :=
  originalPotentialGamma_eq_sourceCoefficient pairedAlgebraData X A α β

example (α : SpinIndex) (X : Boson 2) :
    originalPotentialFermion pairedAlgebraData α X =
      pairedAlgebraData.deformedPotentialMultiplier 1 0 X α :=
  originalPotentialFermion_eq_sourceMultiplier pairedAlgebraData α X

example (α : SpinIndex) (X : Boson 2) :
    originalPotentialFermion pairedAlgebraData α X = pairedAlgebraData.bracketMultiplier α X :=
  originalPotentialFermion_eq_bracketMultiplier pairedAlgebraData α X

example (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2) :
    pairedAlgebraData.charge α f X =
      (-Complex.I) • OAI.BFSSKinetic.kineticDerivative (pairedAlgebraData.kineticSymbol α) f X +
        originalPotentialFermion pairedAlgebraData α X (f X) :=
  originalCharge_apply_kinetic_add_potential pairedAlgebraData α f X

example (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2) :
    pairedAlgebraData.bracketPart α f X =
      originalPotentialFermion pairedAlgebraData α X (f X) :=
  originalBracketPart_apply_potential pairedAlgebraData α f X

example (i j : SpaceIndex) (X : Boson 2) :
    (∑ α : SpinIndex,
      (pairedAlgebraData.bracketMultiplier α X * originalHardyTau pairedAlgebraData i j α X +
        originalHardyTau pairedAlgebraData i j α X * pairedAlgebraData.bracketMultiplier α X)) = 0 :=
  originalBracketMultiplier_tau_anticommutator_zero pairedAlgebraData i j X

example : FullL2 2 = Lp (Fermion 2) 2 (volume : Measure (Boson 2)) := rfl

example (α : SpinIndex) (X : Boson 2) :
    pairedAlgebraData.bracketMultiplier α X =
      ∑ i : SpaceIndex, ∑ j : SpaceIndex, ∑ A : ColorIndex 2,
        ∑ B : ColorIndex 2, ∑ C : ColorIndex 2, ∑ β : SpinIndex,
          ((((1 / 2 : ℝ) * pairedAlgebraData.structureConstant A B C *
            pairedAlgebraData.gammaTwo i j α β : ℝ) : ℂ) *
            (X (i, B) : ℂ) * (X (j, C) : ℂ)) • pairedAlgebraData.theta β A := rfl

example (α : SpinIndex) (X : Boson 2) (v : Fermion 2) :
    originalPotentialFermion pairedAlgebraData α X v =
      pairedAlgebraData.bracketMultiplier α X v :=
  congrArg (fun T : Fermion 2 →L[ℂ] Fermion 2 => T v)
    (originalPotentialFermion_eq_bracketMultiplier pairedAlgebraData α X)

example (α : SpinIndex) (f : SmoothCore 2) :
    pairedAlgebraData.bracketPart α f =
      pairedAlgebraData.charge α f -
        (-Complex.I) • OAI.BFSSKinetic.kineticDerivative (pairedAlgebraData.kineticSymbol α) f := rfl

-- A swapped spinor coefficient has opposite sign, if that coefficient is nonzero.
example (X : Boson 2) (A : ColorIndex 2) (α β : SpinIndex)
    (hc : originalPotentialGamma pairedAlgebraData X A α β ≠ 0) :
    pairedAlgebraData.deformedPotentialCoefficients 1 0 X β (α, A) ≠
      originalPotentialGamma pairedAlgebraData X A α β := by
  rw [← originalPotentialGamma_eq_sourceCoefficient pairedAlgebraData X A β α]
  have ht := congrArg (fun C : GammaMatrix => C α β)
    (originalPotentialGamma_transpose pairedAlgebraData X A)
  simp only [Matrix.transpose_apply, Matrix.neg_apply] at ht
  rw [ht]
  intro h
  apply hc
  linarith

-- Reject doubling while keeping the authentic one-half normalization.
example (X : Boson 2) (A : ColorIndex 2) (α β : SpinIndex)
    (hc : originalPotentialGamma pairedAlgebraData X A α β ≠ 0) :
    pairedAlgebraData.deformedPotentialCoefficients 1 0 X α (β, A) ≠
      2 * originalPotentialGamma pairedAlgebraData X A α β := by
  rw [← originalPotentialGamma_eq_sourceCoefficient pairedAlgebraData X A α β]
  intro h
  apply hc
  linarith

#print axioms FCP.BFSSP3AuxHardyG6OriginalCorePotentialBinding.originalPotentialGamma_eq_sourceCoefficient
#print axioms FCP.BFSSP3AuxHardyG6OriginalCorePotentialBinding.originalPotentialFermion_eq_sourceMultiplier
#print axioms FCP.BFSSP3AuxHardyG6OriginalCorePotentialBinding.originalPotentialFermion_eq_bracketMultiplier
#print axioms FCP.BFSSP3AuxHardyG6OriginalCorePotentialBinding.originalCharge_apply_kinetic_add_potential
#print axioms FCP.BFSSP3AuxHardyG6OriginalCorePotentialBinding.originalBracketPart_apply_potential
#print axioms FCP.BFSSP3AuxHardyG6OriginalCorePotentialBinding.originalBracketMultiplier_tau_anticommutator_zero
#print axioms FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation.originalPotentialGamma_apply
#print axioms FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR.originalPotentialTau_anticommutator_zero
#print axioms FCP.BFSSSU2GaugeG4K9C.sourceMasslessCoefficient_eq_halfOriginalOrdered
#print axioms FCP.BFSSSU2GaugeG4K9D.sourcePotentialMultipliers_equal
#print axioms OAI.BFSSQuantum.AlgebraData.charge_kinetic_plus_bracket
#print axioms OAI.BFSSQuantum.AlgebraData.bracketPart_apply

end
end BFSSP3AuxHardyG6OriginalCorePotentialBindingIndependentConsumer
