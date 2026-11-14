import OAI.MathematicalPhysics.BFSS.Core
import OAI.MathematicalPhysics.BFSS.GammaWords

/-!
HARDY-G1 R1: original ordered odd gamma traces by existing Clifford conjugation.
PROSPECTIVE until exact strict source and independent native consumer acceptance.
No tau identity, physical Spin9, Hardy/fidelity or spectral theorem.
-/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces
noncomputable section

open OAI.BFSSQuantum

theorem originalGamma_missing_of_length_le_five (l : List SpaceIndex)
    (hl : l.length ≤ 5) : ∃ k : SpaceIndex, k ∉ l := by
  classical
  have hc : l.toFinset.card < (Finset.univ : Finset SpaceIndex).card := by
    have hle := List.toFinset_card_le l
    simp only [Finset.card_univ, Fintype.card_fin]
    omega
  obtain ⟨k, _, hk⟩ := Finset.exists_mem_notMem_of_card_lt_card hc
  exact ⟨k, by simpa only [List.mem_toFinset] using hk⟩

theorem originalGamma_trace_of_missing_odd (M : AlgebraData 2)
    (l : List SpaceIndex) (k : SpaceIndex) (hk : k ∉ l)
    (hodd : (-1 : ℝ) ^ l.length = -1) :
    Matrix.trace ((l.map M.gamma).prod) = 0 := by
  have hc := OAI.BFSSGamma.list_commute M.gamma M.gamma_clifford k l hk
  have hconj : M.gamma k * (l.map M.gamma).prod * M.gamma k =
      (-1 : ℝ) ^ l.length • (l.map M.gamma).prod := by
    rw [mul_assoc, hc, mul_smul_comm, ← mul_assoc,
      OAI.BFSSGamma.gamma_sq M.gamma M.gamma_clifford k, one_mul]
  have ht := OAI.BFSSGamma.trace_conj M.gamma M.gamma_clifford k
    ((l.map M.gamma).prod)
  rw [hconj, hodd, Matrix.trace_smul, smul_eq_mul] at ht
  linarith

theorem originalGamma_three_trace_zero (M : AlgebraData 2)
    (i j k : SpaceIndex) :
    Matrix.trace (M.gamma i * M.gamma j * M.gamma k) = 0 := by
  obtain ⟨a, ha⟩ := originalGamma_missing_of_length_le_five [i, j, k] (by decide)
  have ht := originalGamma_trace_of_missing_odd M [i, j, k] a ha (by norm_num)
  simpa only [List.map_cons, List.map_nil, List.prod_cons, List.prod_nil,
    mul_one, mul_assoc] using ht

theorem originalGamma_five_trace_zero (M : AlgebraData 2)
    (i j k l m : SpaceIndex) :
    Matrix.trace (M.gamma i * M.gamma j * M.gamma k * M.gamma l * M.gamma m) = 0 := by
  obtain ⟨a, ha⟩ := originalGamma_missing_of_length_le_five [i, j, k, l, m] (by decide)
  have ht := originalGamma_trace_of_missing_odd M [i, j, k, l, m] a ha (by norm_num)
  simpa only [List.map_cons, List.map_nil, List.prod_cons, List.prod_nil,
    mul_one, mul_assoc] using ht

theorem originalGamma_square_trace (M : AlgebraData 2) (i : SpaceIndex) :
    Matrix.trace (M.gamma i * M.gamma i) = 16 := by
  rw [OAI.BFSSGamma.gamma_sq M.gamma M.gamma_clifford i]
  norm_num [Matrix.trace_one, SpinIndex]

#print axioms originalGamma_missing_of_length_le_five
#print axioms originalGamma_trace_of_missing_odd
#print axioms originalGamma_three_trace_zero
#print axioms originalGamma_five_trace_zero
#print axioms originalGamma_square_trace

end
end FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces
