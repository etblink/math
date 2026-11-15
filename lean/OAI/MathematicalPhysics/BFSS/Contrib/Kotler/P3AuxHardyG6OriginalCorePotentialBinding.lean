import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG5OriginalPotentialTauCAR
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4K9DSourcePotentialMultiplierProbe

/-! HARDY-G6: exact original coefficient, multiplier and smooth-core potential binding.
Prospective until strict source and original native consumer acceptance. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG6OriginalCorePotentialBinding
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation
open FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR

theorem originalPotentialGamma_eq_sourceCoefficient (M : AlgebraData 2)
    (X : Boson 2) (A : ColorIndex 2) (α β : SpinIndex) :
    originalPotentialGamma M X A α β =
      M.deformedPotentialCoefficients 1 0 X α (β, A) := by
  rw [originalPotentialGamma_apply,
    FCP.BFSSSU2GaugeG4K9C.sourceMasslessCoefficient_eq_halfOriginalOrdered]
  simp only [AlgebraData.coordinateBracketAll, Finset.mul_sum, Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  apply Finset.sum_congr rfl
  intro B _
  apply Finset.sum_congr rfl
  intro C _
  ring

theorem originalPotentialFermion_eq_sourceMultiplier (M : AlgebraData 2)
    (α : SpinIndex) (X : Boson 2) :
    originalPotentialFermion M α X = M.deformedPotentialMultiplier 1 0 X α := by
  unfold originalPotentialFermion AlgebraData.deformedPotentialMultiplier
  apply congrArg (fun c : FermionIndex 2 → ℝ => M.cliffordLinear c)
  funext p
  exact originalPotentialGamma_eq_sourceCoefficient M X p.2 α p.1

theorem originalPotentialFermion_eq_bracketMultiplier (M : AlgebraData 2)
    (α : SpinIndex) (X : Boson 2) :
    originalPotentialFermion M α X = M.bracketMultiplier α X := by
  exact (originalPotentialFermion_eq_sourceMultiplier M α X).trans
    (FCP.BFSSSU2GaugeG4K9D.sourcePotentialMultipliers_equal M α X)

theorem originalCharge_apply_kinetic_add_potential (M : AlgebraData 2)
    (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2) :
    M.charge α f X =
      (-Complex.I) • OAI.BFSSKinetic.kineticDerivative (M.kineticSymbol α) f X +
        originalPotentialFermion M α X (f X) := by
  rw [M.charge_kinetic_plus_bracket,
    ← originalPotentialFermion_eq_bracketMultiplier M α X]

theorem originalBracketPart_apply_potential (M : AlgebraData 2)
    (α : SpinIndex) (f : SmoothCore 2) (X : Boson 2) :
    M.bracketPart α f X = originalPotentialFermion M α X (f X) := by
  rw [M.bracketPart_apply,
    ← originalPotentialFermion_eq_bracketMultiplier M α X]

theorem originalBracketMultiplier_tau_anticommutator_zero (M : AlgebraData 2)
    (i j : SpaceIndex) (X : Boson 2) :
    (∑ α : SpinIndex,
      (M.bracketMultiplier α X * originalHardyTau M i j α X +
        originalHardyTau M i j α X * M.bracketMultiplier α X)) = 0 := by
  simp_rw [← originalPotentialFermion_eq_bracketMultiplier M]
  exact originalPotentialTau_anticommutator_zero M i j X

#print axioms originalPotentialGamma_eq_sourceCoefficient
#print axioms originalPotentialFermion_eq_sourceMultiplier
#print axioms originalPotentialFermion_eq_bracketMultiplier
#print axioms originalCharge_apply_kinetic_add_potential
#print axioms originalBracketPart_apply_potential
#print axioms originalBracketMultiplier_tau_anticommutator_zero

end
end FCP.BFSSP3AuxHardyG6OriginalCorePotentialBinding
