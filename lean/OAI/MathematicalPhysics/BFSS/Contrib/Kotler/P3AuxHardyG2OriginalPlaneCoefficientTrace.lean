import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG1OriginalOddGammaTraces
import OAI.MathematicalPhysics.BFSS.GammaIdentity

/-!
HARDY-G2 R1: original plane coefficient and finite gamma trace contraction.
PROSPECTIVE until exact strict source and independent native consumer acceptance.
No derivative contraction, tau anticommutator, physical Spin9 or Hardy theorem.
-/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces

theorem originalGamma_pair_trace (M : AlgebraData 2) (i j : SpaceIndex) :
    Matrix.trace (M.gamma i * M.gamma j) = if i = j then 16 else 0 := by
  by_cases hij : i = j
  · subst j
    simpa only [ite_true] using originalGamma_square_trace M i
  · rw [ite_eq_right hij]
    have ha := congrArg Matrix.trace (OAI.BFSSGamma.gamma_anti M.gamma M.gamma_clifford hij)
    rw [Matrix.trace_neg] at ha
    have hc := Matrix.trace_mul_comm (M.gamma i) (M.gamma j)
    linarith

theorem originalGamma_three_transpose (M : AlgebraData 2) (i j k : SpaceIndex)
    (hij : i ≠ j) (hik : i ≠ k) (hjk : j ≠ k) :
    (M.gamma i * M.gamma j * M.gamma k).transpose =
      -(M.gamma i * M.gamma j * M.gamma k) := by
  have hn : ([i, j, k] : List SpaceIndex).Nodup := by simp [hij, hik, hjk]
  have hr := OAI.BFSSGamma.list_reverse_eq M.gamma M.gamma_clifford [i, j, k] hn
  have ht := OAI.BFSSGamma.list_transpose M.gamma
    (fun a => (M.gamma_symmetric a).eq) [i, j, k]
  have hs : OAI.BFSSGamma.rankSign ([i, j, k] : List SpaceIndex).length = -1 := by
    norm_num [OAI.BFSSGamma.rankSign, Nat.choose]
  rw [hr, hs, neg_one_smul] at ht
  simpa only [List.map_cons, List.map_nil, List.prod_cons, List.prod_nil,
    mul_one, mul_assoc] using ht

theorem originalGamma_trace_mul_three_distinct (M : AlgebraData 2)
    (a i j k : SpaceIndex) (hij : i ≠ j) (hik : i ≠ k) (hjk : j ≠ k) :
    Matrix.trace (M.gamma a * (M.gamma i * M.gamma j * M.gamma k)) = 0 := by
  rw [Matrix.trace_mul_comm]
  exact OAI.BFSSGamma.trace_skew_symm _ _
    (originalGamma_three_transpose M i j k hij hik hjk) (M.gamma_symmetric a).eq

noncomputable def originalHardyY (M : AlgebraData 2) (i j : SpaceIndex)
    (X : Boson 2) (A : ColorIndex 2) : GammaMatrix :=
  (1 / 16 : ℝ) • (X (i, A) • M.gamma j - X (j, A) • M.gamma i) +
    (1 / 56 : ℝ) • ∑ k ∈ Finset.univ.filter (fun k : SpaceIndex => k ≠ i ∧ k ≠ j),
      X (k, A) • (M.gamma k * M.gamma i * M.gamma j)

theorem originalHardyY_trace (M : AlgebraData 2) (i j : SpaceIndex)
    (hij : i ≠ j) (X : Boson 2) (A : ColorIndex 2) (a : SpaceIndex) :
    Matrix.trace (M.gamma a * originalHardyY M i j X A) =
      (if a = j then X (i, A) else 0) - (if a = i then X (j, A) else 0) := by
  have hsum : Matrix.trace (M.gamma a *
      (∑ k ∈ Finset.univ.filter (fun k : SpaceIndex => k ≠ i ∧ k ≠ j),
        X (k, A) • (M.gamma k * M.gamma i * M.gamma j))) = 0 := by
    rw [Matrix.mul_sum, Matrix.trace_sum]
    apply Finset.sum_eq_zero
    intro k hk
    have hk' := (Finset.mem_filter.mp hk).2
    rw [Matrix.mul_smul, Matrix.trace_smul,
      originalGamma_trace_mul_three_distinct M a k i j hk'.1 hk'.2 hij]
    simp
  have hleft : Matrix.trace (M.gamma a *
      (X (i, A) • M.gamma j - X (j, A) • M.gamma i)) =
      16 * (if a = j then X (i, A) else 0) -
        16 * (if a = i then X (j, A) else 0) := by
    simp only [Matrix.mul_sub, Matrix.trace_sub, Matrix.mul_smul, Matrix.trace_smul,
      originalGamma_pair_trace, smul_eq_mul]
    split_ifs <;> ring
  unfold originalHardyY
  rw [Matrix.mul_add, Matrix.trace_add, Matrix.mul_smul, Matrix.trace_smul, hleft,
    Matrix.mul_smul, Matrix.trace_smul, hsum]
  simp only [smul_eq_mul, mul_zero, add_zero]
  ring

#print axioms originalGamma_pair_trace
#print axioms originalGamma_three_transpose
#print axioms originalGamma_trace_mul_three_distinct
#print axioms originalHardyY
#print axioms originalHardyY_trace

end
end FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace
