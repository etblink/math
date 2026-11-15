import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG14OriginalCoreAnticommutatorCollapse
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG15RealCoefficientSumDiagnostic

/-! G15: exact original tau action norms reduced to real coefficients.
Cross terms in the four-plane sum are retained inside its square.
No numerical coefficient estimate, physical Hardy or domain conclusion. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG15OriginalTauCoefficientNormReduction
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
open FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR
open FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore
open FCP.BFSSP3AuxHardyG14OriginalCoreAnticommutatorCollapse

theorem originalHardyTau_sq (M : AlgebraData 2) (i j : SpaceIndex)
    (α : SpinIndex) (X : Boson 2) :
    originalHardyTau M i j α X * originalHardyTau M i j α X =
      ((1 / 2 : ℝ) * (∑ p : FermionIndex 2, (originalHardyY M i j X p.2 α p.1) ^ 2) : ℂ) •
        (1 : Fermion 2 →L[ℂ] Fermion 2) := by
  exact M.cliffordLinear_sq _

theorem originalHardyTau_selfAdjoint (M : AlgebraData 2) (i j : SpaceIndex)
    (α : SpinIndex) (X : Boson 2) :
    IsSelfAdjoint (originalHardyTau M i j α X) := by
  exact M.cliffordLinear_selfAdjoint _

theorem originalHardyTau_norm_sq (M : AlgebraData 2) (i j : SpaceIndex)
    (α : SpinIndex) (X : Boson 2) (v : Fermion 2) :
    ‖originalHardyTau M i j α X v‖ ^ 2 =
      (1 / 2 : ℝ) * (∑ p : FermionIndex 2, (originalHardyY M i j X p.2 α p.1) ^ 2) * ‖v‖ ^ 2 := by
  exact M.cliffordLinear_norm_sq _ v

theorem originalHardyTau_sum_norm_sq (M : AlgebraData 2) (i j : SpaceIndex)
    (X : Boson 2) (v : Fermion 2) :
    (∑ α : SpinIndex, ‖originalHardyTau M i j α X v‖ ^ 2) =
      (1 / 2 : ℝ) * (∑ α : SpinIndex, ∑ p : FermionIndex 2,
        (originalHardyY M i j X p.2 α p.1) ^ 2) * ‖v‖ ^ 2 := by
  simp_rw [originalHardyTau_norm_sq]
  rw [← Finset.sum_mul, ← Finset.mul_sum]

theorem originalHardyTau_fourPlane_sum_eq_cliffordLinear (M : AlgebraData 2)
    (i j : Fin 4 → SpaceIndex) (α : SpinIndex) (X : Boson 2) :
    (∑ t : Fin 4, originalHardyTau M (i t) (j t) α X) =
      M.cliffordLinear (fun p : FermionIndex 2 =>
        ∑ t : Fin 4, originalHardyY M (i t) (j t) X p.2 α p.1) := by
  have hsum (b : Fin 4 → FermionIndex 2 → ℝ) :
      (∑ t : Fin 4, M.cliffordLinear (b t)) =
        M.cliffordLinear (fun p : FermionIndex 2 => ∑ t : Fin 4, b t p) := by
    unfold AlgebraData.cliffordLinear
    exact FCP.BFSSP3AuxHardyG15RealCoefficientSumDiagnostic.realCoefficient_doubleSum b
      (fun p : FermionIndex 2 => M.theta p.1 p.2)
  exact hsum (fun t p => originalHardyY M (i t) (j t) X p.2 α p.1)

theorem originalHardyTau_fourPlane_sum_norm_sq (M : AlgebraData 2)
    (i j : Fin 4 → SpaceIndex) (X : Boson 2) (v : Fermion 2) :
    (∑ α : SpinIndex,
      ‖(∑ t : Fin 4, originalHardyTau M (i t) (j t) α X) v‖ ^ 2) =
      (1 / 2 : ℝ) * (∑ α : SpinIndex, ∑ p : FermionIndex 2,
        (∑ t : Fin 4, originalHardyY M (i t) (j t) X p.2 α p.1) ^ 2) * ‖v‖ ^ 2 := by
  simp_rw [originalHardyTau_fourPlane_sum_eq_cliffordLinear,
    M.cliffordLinear_norm_sq]
  rw [← Finset.sum_mul, ← Finset.mul_sum]

#print axioms originalHardyTau_sq
#print axioms originalHardyTau_selfAdjoint
#print axioms originalHardyTau_norm_sq
#print axioms originalHardyTau_sum_norm_sq
#print axioms originalHardyTau_fourPlane_sum_eq_cliffordLinear
#print axioms originalHardyTau_fourPlane_sum_norm_sq

end
end FCP.BFSSP3AuxHardyG15OriginalTauCoefficientNormReduction
