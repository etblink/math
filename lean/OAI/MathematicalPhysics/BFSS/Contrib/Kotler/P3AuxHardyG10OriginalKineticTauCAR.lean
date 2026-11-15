import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG9OriginalYEntryDerivativeBinding
import OAI.MathematicalPhysics.BFSS.Kinetic

/-! HARDY-G10: pointwise original kinetic/tau orbital CAR coefficient.
Prospective until complete strict source/native qualification.
No coefficient-derivative fermion contraction or full smooth-core rotation identity. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR

noncomputable def originalKineticFermion (M : AlgebraData 2) (α : SpinIndex)
    (k : SpaceIndex) (B : ColorIndex 2) : Fermion 2 →L[ℂ] Fermion 2 :=
  M.principalSymbol (Pi.single α 1) (EuclideanSpace.single (k, B) 1)

theorem originalKineticFermion_apply (M : AlgebraData 2) (α : SpinIndex)
    (k : SpaceIndex) (B : ColorIndex 2) (v : Fermion 2) :
    originalKineticFermion M α k B v =
      ∑ β : SpinIndex, (M.gamma k α β : ℂ) • M.theta β B v := by
  change M.kineticSymbol α (k, B) v = _
  exact M.kineticSymbol_apply α k B v

theorem originalKineticCoefficient_basis (M : AlgebraData 2) (α : SpinIndex)
    (k : SpaceIndex) (B : ColorIndex 2) (p : FermionIndex 2) :
    M.principalCoefficients (Pi.single α 1) (EuclideanSpace.single (k, B) 1) p =
      if p.2 = B then M.gamma k α p.1 else 0 := by
  classical
  rcases p with ⟨β, A⟩
  rw [M.principalCoefficients_basis]
  simp [PiLp.single_apply, Prod.mk.injEq, ite_and, eq_comm]

theorem originalKineticTauCoefficient_trace (M : AlgebraData 2)
    (i j : SpaceIndex) (hij : i ≠ j) (k : SpaceIndex) (B : ColorIndex 2)
    (X : Boson 2) :
    (∑ α : SpinIndex, ∑ p : FermionIndex 2,
      M.principalCoefficients (Pi.single α 1) (EuclideanSpace.single (k, B) 1) p *
        originalHardyY M i j X p.2 α p.1) =
      (if k = j then X (i, B) else 0) - (if k = i then X (j, B) else 0) := by
  classical
  simp_rw [originalKineticCoefficient_basis]
  simp only [Fintype.sum_prod_type, ite_mul, zero_mul,
    Finset.sum_ite_eq', Finset.mem_univ, ite_true]
  have htrace : Matrix.trace ((M.gamma k).transpose * originalHardyY M i j X B) =
      ∑ α : SpinIndex, ∑ β : SpinIndex,
        M.gamma k α β * originalHardyY M i j X B α β := by
    simp only [Matrix.trace, Matrix.diag_apply, Matrix.mul_apply, Matrix.transpose_apply]
    exact Finset.sum_comm
  rw [← htrace, (M.gamma_symmetric k).eq, originalHardyY_trace M i j hij X B k]

theorem originalKineticTau_anticommutator (M : AlgebraData 2)
    (i j : SpaceIndex) (hij : i ≠ j) (k : SpaceIndex) (B : ColorIndex 2)
    (X : Boson 2) :
    (∑ α : SpinIndex,
      (originalKineticFermion M α k B * originalHardyTau M i j α X +
        originalHardyTau M i j α X * originalKineticFermion M α k B)) =
      (((if k = j then X (i, B) else 0) -
        (if k = i then X (j, B) else 0) : ℝ) : ℂ) •
          (1 : Fermion 2 →L[ℂ] Fermion 2) := by
  unfold originalKineticFermion AlgebraData.principalSymbol originalHardyTau
  simp_rw [M.cliffordLinear_mixed]
  rw [← Finset.sum_smul, ← Complex.ofReal_sum,
    originalKineticTauCoefficient_trace M i j hij k B X]

theorem originalKineticTau_anticommutator_apply (M : AlgebraData 2)
    (i j : SpaceIndex) (hij : i ≠ j) (k : SpaceIndex) (B : ColorIndex 2)
    (X : Boson 2) (v : Fermion 2) :
    (∑ α : SpinIndex,
      (originalKineticFermion M α k B (originalHardyTau M i j α X v) +
        originalHardyTau M i j α X (originalKineticFermion M α k B v))) =
      (((if k = j then X (i, B) else 0) -
        (if k = i then X (j, B) else 0) : ℝ) : ℂ) • v := by
  have he := congrArg (fun L : Fermion 2 →L[ℂ] Fermion 2 => L v)
    (originalKineticTau_anticommutator M i j hij k B X)
  simpa only [_root_.sum_apply, IsAddApply.add_apply, mul_apply_eq_comp,
    IsSMulApply.smul_apply, ContinuousLinearMap.one_apply] using he

#print axioms originalKineticFermion
#print axioms originalKineticFermion_apply
#print axioms originalKineticCoefficient_basis
#print axioms originalKineticTauCoefficient_trace
#print axioms originalKineticTau_anticommutator
#print axioms originalKineticTau_anticommutator_apply

end
end FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR
