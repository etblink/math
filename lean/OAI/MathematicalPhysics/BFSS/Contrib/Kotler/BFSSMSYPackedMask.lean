import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYNormalizedToggle

/-! Exact bounded packed-mask decoder. Use little-endian bit labels and
the pinned Nat bitwise semantics, not the F1 arbitrary Fintype ordering.
The count below is the finite bit count, not a claim about Python execution. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYPackedMask
noncomputable section

open FCP.BFSSMSYCoefficientCarrier

/-- Decode a natural number on exactly n bit positions. -/
def decodeNat (n : ℕ) (m : ℕ) : Finset (Fin n) :=
  Finset.univ.filter (fun k => m.testBit k.val = true)

def decodeMask {n : ℕ} (m : Fin (2 ^ n)) : Finset (Fin n) :=
  decodeNat n m.val

theorem mem_decodeNat {n : ℕ} (m : ℕ) (k : Fin n) :
    k ∈ decodeNat n m ↔ m.testBit k.val = true := by
  simp only [decodeNat, Finset.mem_filter, Finset.mem_univ, true_and]

theorem mem_decodeMask {n : ℕ} (m : Fin (2 ^ n)) (k : Fin n) :
    k ∈ decodeMask m ↔ m.val.testBit k.val = true :=
  mem_decodeNat m.val k

/-- No information is lost, since every bit above the width is zero. -/
theorem decodeMask_injective (n : ℕ) :
    Function.Injective (decodeMask (n := n)) := by
  intro a b hab
  apply Fin.ext
  apply Nat.eq_of_testBit_eq
  intro k
  by_cases hk : k < n
  · have hm : (⟨k, hk⟩ : Fin n) ∈ decodeMask a ↔
        (⟨k, hk⟩ : Fin n) ∈ decodeMask b := by rw [hab]
    have hh : a.val.testBit k = true ↔ b.val.testBit k = true :=
      (mem_decodeMask a ⟨k, hk⟩).symm.trans
        (hm.trans (mem_decodeMask b ⟨k, hk⟩))
    cases ha : a.val.testBit k <;> cases hb : b.val.testBit k <;>
      simp [ha, hb] at hh ⊢
  · have hp : 2 ^ n ≤ 2 ^ k :=
      Nat.pow_le_pow_right (by decide : 0 < 2) (Nat.le_of_not_gt hk)
    have ha := Nat.testBit_lt_two_pow (lt_of_lt_of_le a.isLt hp)
    have hb := Nat.testBit_lt_two_pow (lt_of_lt_of_le b.isLt hp)
    exact ha.trans hb.symm

theorem decodeMask_bijective (n : ℕ) :
    Function.Bijective (decodeMask (n := n)) := by
  apply (Fintype.bijective_iff_injective_and_card _).2
  exact ⟨decodeMask_injective n, by
    simp only [Fintype.card_fin, Fintype.card_finset]⟩

noncomputable def maskEquiv (n : ℕ) : Fin (2 ^ n) ≃ Finset (Fin n) :=
  Equiv.ofBijective (decodeMask (n := n)) (decodeMask_bijective n)

/-- Python m ^ (1 << i), with an exact width bound. -/
def xorMask {n : ℕ} (m : Fin (2 ^ n)) (i : Fin n) : Fin (2 ^ n) :=
  ⟨m.val ^^^ (2 ^ i.val), Nat.xor_lt_two_pow m.isLt
    (Nat.pow_lt_pow_right (by decide : 1 < 2) i.isLt)⟩

theorem xorMask_bit {n : ℕ} (m : Fin (2 ^ n)) (i k : Fin n) :
    (xorMask m i).val.testBit k.val =
      (m.val.testBit k.val ^^ decide (i.val = k.val)) := by
  change (m.val ^^^ (2 ^ i.val)).testBit k.val = _
  rw [Nat.testBit_xor, Nat.testBit_two_pow]

/-- Generic set toggle, specialized below to the qualified source toggle. -/
theorem decode_xor {n : ℕ} (m : Fin (2 ^ n)) (i : Fin n) :
    decodeMask (xorMask m i) =
      if i ∈ decodeMask m then (decodeMask m).erase i else insert i (decodeMask m) := by
  ext k
  rw [mem_decodeMask, xorMask_bit]
  by_cases hik : i = k
  · subst k
    by_cases hm : i ∈ decodeMask m
    · have hb := (mem_decodeMask m i).mp hm
      simp [hm, hb]
    · have hb : m.val.testBit i.val = false := by
        cases h : m.val.testBit i.val
        · rfl
        · exact (hm ((mem_decodeMask m i).mpr h)).elim
      simp [hm, hb]
  · have hne : i.val ≠ k.val := fun h => hik (Fin.ext h)
    have hx : (m.val.testBit k.val ^^ decide (i.val = k.val)) =
        m.val.testBit k.val := by simp [hne]
    rw [hx, ← mem_decodeMask m k]
    by_cases hm : i ∈ decodeMask m
    · rw [ite_eq_left hm]
      constructor
      · intro hk
        exact Finset.mem_erase.mpr ⟨Ne.symm hik, hk⟩
      · intro hk
        exact (Finset.mem_erase.mp hk).2
    · rw [ite_eq_right hm]
      constructor
      · intro hk
        exact Finset.mem_insert.mpr (Or.inr hk)
      · intro hk
        rcases Finset.mem_insert.mp hk with heq | hk
        · exact (hik heq.symm).elim
        · exact hk

theorem decode_xor_source (m : Fin (2 ^ 24)) (i : Fin 24) :
    decodeMask (xorMask m i) = toggleOccupation i (decodeMask m) :=
  decode_xor m i

/-- Count set bits in the specified finite width. -/
def popcountWidth (n : ℕ) (m : ℕ) : ℕ := (decodeNat n m).card

/-- Lower-bit masking is literally filtering occupied indices. -/
theorem decode_and_low {n : ℕ} (m : Fin (2 ^ n)) (j : ℕ) :
    decodeNat n (m.val &&& (2 ^ j - 1)) =
      (decodeMask m).filter (fun k => k.val < j) := by
  ext k
  rw [mem_decodeNat, Nat.testBit_and, Nat.testBit_two_pow_sub_one,
    Finset.mem_filter, mem_decodeMask]
  simp only [Bool.and_eq_true, decide_eq_true_eq]

theorem popcount_low {n : ℕ} (m : Fin (2 ^ n)) (j : ℕ) :
    popcountWidth n (m.val &&& (2 ^ j - 1)) =
      ((decodeMask m).filter (fun k => k.val < j)).card :=
  congrArg Finset.card (decode_and_low m j)

/-- The finite-width bit count of the lower mask equals the source parity. -/
theorem source_even_mask_weight (m : Fin (2 ^ 24)) (i : Fin 24) :
    occupationParity i (decodeMask m) =
      if (-1 : ℤˣ) ^ popcountWidth 24 (m.val &&& (2 ^ i.val - 1)) = 1
      then (1 : ℂ) else -1 := by
  unfold occupationParity
  rw [popcount_low]
  rfl

#print axioms mem_decodeMask
#print axioms decodeMask_injective
#print axioms decodeMask_bijective
#print axioms xorMask_bit
#print axioms decode_xor_source
#print axioms decode_and_low
#print axioms popcount_low
#print axioms source_even_mask_weight

end
end FCP.BFSSMSYPackedMask
