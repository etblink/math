import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG13OriginalCoreKineticTauAssembly

/-! G14: literal original core orbital/quarter-gamma anticommutator collapse.
Prospective until complete strict source/native qualification.
No tau norm, physical Spin9 action or closed-generator identification. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG14OriginalCoreAnticommutatorCollapse
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR
open FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore
open FCP.BFSSP3AuxHardyG8OriginalTauDerivative
open FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR
open FCP.BFSSP3AuxHardyG12OriginalDerivativeFockBilinear
open FCP.BFSSP3AuxHardyG13OriginalCoreKineticTauAssembly

theorem originalOrbitalCoefficient_sum_apply (i j : SpaceIndex) (f : SmoothCore 2) (X : Boson 2) :
    (∑ k : SpaceIndex, ∑ B : ColorIndex 2,
      (((if k = j then X (i, B) else 0) -
        (if k = i then X (j, B) else 0) : ℝ) : ℂ) •
          (coordinateDerivative k B f X)) =
      (∑ B : ColorIndex 2,
        ((X (i, B) : ℂ) • (coordinateDerivative j B f X) -
          (X (j, B) : ℂ) • (coordinateDerivative i B f X))) := by
  classical
  have hsel (k l : SpaceIndex) (a : ℝ) (v : Fermion 2) :
      (((if k = l then a else 0 : ℝ) : ℂ) • v) =
        if k = l then (a : ℂ) • v else 0 := by
    by_cases h : k = l <;> simp [h]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro B _
  simp_rw [Complex.ofReal_sub, sub_smul, hsel]
  rw [Finset.sum_sub_distrib]
  simp

theorem originalKineticTauCore_orbital_sum_apply (M : AlgebraData 2) (i j : SpaceIndex) (hij : i ≠ j)
    (f : SmoothCore 2) (X : Boson 2) :
    (∑ α : SpinIndex, ∑ k : SpaceIndex, ∑ B : ColorIndex 2,
      (originalKineticFermion M α k B
          (originalHardyTau M i j α X (coordinateDerivative k B f X)) +
        originalHardyTau M i j α X
          (originalKineticFermion M α k B (coordinateDerivative k B f X)))) = (∑ B : ColorIndex 2,
        ((X (i, B) : ℂ) • (coordinateDerivative j B f X) -
          (X (j, B) : ℂ) • (coordinateDerivative i B f X))) := by
  calc
    _ = ∑ k : SpaceIndex, ∑ B : ColorIndex 2, ∑ α : SpinIndex,
        (originalKineticFermion M α k B
            (originalHardyTau M i j α X (coordinateDerivative k B f X)) +
          originalHardyTau M i j α X
            (originalKineticFermion M α k B (coordinateDerivative k B f X))) := by
      rw [Finset.sum_comm]
      apply Finset.sum_congr rfl
      intro k _
      exact Finset.sum_comm
    _ = _ := by
      simp_rw [originalKineticTau_anticommutator_apply M i j hij]
      exact originalOrbitalCoefficient_sum_apply i j f X

theorem originalKineticTauCore_derivative_sum_apply (M : AlgebraData 2) (i j : SpaceIndex) (hij : i ≠ j)
    (f : SmoothCore 2) (X : Boson 2) :
    (∑ α : SpinIndex, ∑ k : SpaceIndex, ∑ B : ColorIndex 2,
      originalKineticFermion M α k B
        (originalHardyTauDerivative M i j k B α X (f X))) = (∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ δ : SpinIndex,
        ((1 / 4 : ℂ) * ((M.gamma i * M.gamma j) β δ : ℂ)) •
          M.theta β B (M.theta δ B (f X))) := by
  rw [Finset.sum_comm]
  simpa only [originalKineticTauDerivativeFermion, _root_.sum_apply,
    mul_apply_eq_comp] using
    (originalKineticTauDerivativeFermion_apply M i j hij X (f X))

theorem originalKineticTauCore_sum_apply (M : AlgebraData 2) (i j : SpaceIndex) (hij : i ≠ j)
    (f : SmoothCore 2) (X : Boson 2) :
    (∑ α : SpinIndex,
      (OAI.BFSSKinetic.kineticDerivative (M.kineticSymbol α)
          (originalHardyTauCore M i j α f) X +
        originalHardyTauCore M i j α
          (OAI.BFSSKinetic.kineticDerivative (M.kineticSymbol α) f) X)) =
      (∑ B : ColorIndex 2,
        ((X (i, B) : ℂ) • (coordinateDerivative j B f X) -
          (X (j, B) : ℂ) • (coordinateDerivative i B f X))) + (∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ δ : SpinIndex,
        ((1 / 4 : ℂ) * ((M.gamma i * M.gamma j) β δ : ℂ)) •
          M.theta β B (M.theta δ B (f X))) := by
  simp_rw [originalKineticTauCore_pair_apply]
  rw [Finset.sum_add_distrib,
    originalKineticTauCore_orbital_sum_apply M i j hij f X,
    originalKineticTauCore_derivative_sum_apply M i j hij f X]

theorem originalChargeTauCore_sum_apply (M : AlgebraData 2) (i j : SpaceIndex) (hij : i ≠ j)
    (f : SmoothCore 2) (X : Boson 2) :
    (∑ α : SpinIndex,
      (M.charge α (originalHardyTauCore M i j α f) X +
        originalHardyTauCore M i j α (M.charge α f) X)) =
      (-Complex.I) • ((∑ B : ColorIndex 2,
        ((X (i, B) : ℂ) • (coordinateDerivative j B f X) -
          (X (j, B) : ℂ) • (coordinateDerivative i B f X))) + (∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ δ : SpinIndex,
        ((1 / 4 : ℂ) * ((M.gamma i * M.gamma j) β δ : ℂ)) •
          M.theta β B (M.theta δ B (f X)))) := by
  rw [originalChargeTauCore_sum_eq_kinetic_apply,
    originalKineticTauCore_sum_apply M i j hij f X]

theorem originalChargeTauCore_sum_distributed_apply (M : AlgebraData 2) (i j : SpaceIndex) (hij : i ≠ j)
    (f : SmoothCore 2) (X : Boson 2) :
    (∑ α : SpinIndex,
      (M.charge α (originalHardyTauCore M i j α f) X +
        originalHardyTauCore M i j α (M.charge α f) X)) =
      (∑ B : ColorIndex 2,
        (-Complex.I) • ((X (i, B) : ℂ) • (coordinateDerivative j B f X) -
          (X (j, B) : ℂ) • (coordinateDerivative i B f X))) +
      ∑ B : ColorIndex 2, ∑ β : SpinIndex, ∑ δ : SpinIndex,
        ((-Complex.I) * ((1 / 4 : ℂ) * ((M.gamma i * M.gamma j) β δ : ℂ))) •
          M.theta β B (M.theta δ B (f X)) := by
  rw [originalChargeTauCore_sum_apply M i j hij f X, smul_add]
  simp only [Finset.smul_sum, smul_smul]

#print axioms originalOrbitalCoefficient_sum_apply
#print axioms originalKineticTauCore_orbital_sum_apply
#print axioms originalKineticTauCore_derivative_sum_apply
#print axioms originalKineticTauCore_sum_apply
#print axioms originalChargeTauCore_sum_apply
#print axioms originalChargeTauCore_sum_distributed_apply

end
end FCP.BFSSP3AuxHardyG14OriginalCoreAnticommutatorCollapse
