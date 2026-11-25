import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYPackedMask

/-! Exact packed coefficient carrier and both computational Majorana phases.
Reuse the qualified decoder, native coefficient carrier and normalized
occupation intertwining. No dense matrices, no physical singlet claim. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYPackedCarrier
noncomputable section

open OAI.BFSSQuantum OAI.ContinuumCoulomb.HubbardGlobal
open FCP.BFSSSU2GaugeG1A FCP.BFSSMSYCoefficientCarrier
open FCP.BFSSMSYNormalizedToggle FCP.BFSSMSYPackedMask

/-- Increasing the low mask by one bit adds exactly the occupied boundary bit. -/
theorem inclusiveCard {n : ℕ} (A : Finset (Fin n)) (i : Fin n) :
    (A.filter (fun k => k.val < i.val + 1)).card =
      (A.filter (fun k => k.val < i.val)).card + (if i ∈ A then 1 else 0) := by
  by_cases h : i ∈ A
  · have he : A.filter (fun k => k.val < i.val + 1) =
        insert i (A.filter (fun k => k.val < i.val)) := by
      ext k
      by_cases hk : k = i
      · subst k
        simp [h]
      · have hn : k.val ≠ i.val := fun hh => hk (Fin.ext hh)
        have hl : k.val < i.val + 1 ↔ k.val < i.val := by omega
        simp only [Finset.mem_filter, Finset.mem_insert, hk, false_or, hl]
    have hnot : i ∉ A.filter (fun k => k.val < i.val) := by
      intro hi
      exact (lt_irrefl i.val) (Finset.mem_filter.mp hi).2
    rw [he, Finset.card_insert_of_notMem hnot, ite_eq_left h]
  · have he : A.filter (fun k => k.val < i.val + 1) =
        A.filter (fun k => k.val < i.val) := by
      ext k
      by_cases hk : k = i
      · subst k
        simp [h]
      · have hn : k.val ≠ i.val := fun hh => hk (Fin.ext hh)
        have hl : k.val < i.val + 1 ↔ k.val < i.val := by omega
        simp only [Finset.mem_filter, hl]
    rw [he, ite_eq_right h, Nat.add_zero]

theorem packedCount_succ (m : Fin (2 ^ 24)) (i : Fin 24) :
    popcountWidth 24 (m.val &&& (2 ^ (i.val + 1) - 1)) =
      popcountWidth 24 (m.val &&& (2 ^ i.val - 1)) +
        (if i ∈ decodeMask m then 1 else 0) := by
  rw [popcount_low, popcount_low]
  exact inclusiveCard (decodeMask m) i

noncomputable def paritySign (k : ℕ) : ℂ :=
  if (-1 : ℤˣ) ^ k = 1 then 1 else -1

theorem paritySign_succ (k : ℕ) : paritySign (k + 1) = -paritySign k := by
  have hn : (-1 : ℤˣ) ≠ 1 := by decide
  have hm : (-1 : ℤˣ) * (-1 : ℤˣ) = 1 := by decide
  unfold paritySign
  rw [pow_succ]
  rcases Int.units_eq_one_or ((-1 : ℤˣ) ^ k) with h | h
  · simp [h, hn]
  · simp [h, hn, hm]

noncomputable def packedSign (m : Fin (2 ^ 24)) (j : ℕ) : ℂ :=
  paritySign (popcountWidth 24 (m.val &&& (2 ^ j - 1)))

noncomputable def packedEvenWeight (i : Fin 24) (m : Fin (2 ^ 24)) : ℂ :=
  packedSign m i.val

/-- Literal inclusive-mask phase used by the Python normalized odd action. -/
noncomputable def packedOddWeight (i : Fin 24) (m : Fin (2 ^ 24)) : ℂ :=
  Complex.I * packedSign m (i.val + 1)

theorem evenWeight_agrees (i : Fin 24) (m : Fin (2 ^ 24)) :
    occupationParity i (decodeMask m) = packedEvenWeight i m :=
  source_even_mask_weight m i

theorem oddWeight_agrees (i : Fin 24) (m : Fin (2 ^ 24)) :
    oddWeight i (decodeMask m) = packedOddWeight i m := by
  have he : occupationParity i (decodeMask m) = packedSign m i.val :=
    evenWeight_agrees i m
  by_cases h : i ∈ decodeMask m
  · have hs : packedSign m (i.val + 1) = -packedSign m i.val := by
      unfold packedSign
      rw [packedCount_succ, ite_eq_left h, paritySign_succ]
    rw [oddWeight, ite_eq_left h, he, packedOddWeight, hs, mul_neg]
  · have hs : packedSign m (i.val + 1) = packedSign m i.val := by
      unfold packedSign
      rw [packedCount_succ, ite_eq_right h, Nat.add_zero]
    rw [oddWeight, ite_eq_right h, he, packedOddWeight, hs]

abbrev PackedCoordinates := EuclideanSpace ℂ (Fin (2 ^ 24))

/-- The literal bit decoder reindexes coordinates isometrically. -/
noncomputable def maskReindex : PackedCoordinates ≃ₗᵢ[ℂ] FockCoordinateSpace 23 :=
  LinearIsometryEquiv.piLpCongrLeft 2 ℂ ℂ (maskEquiv 24)

theorem maskReindex_at (c : PackedCoordinates) (m : Fin (2 ^ 24)) :
    maskReindex c (decodeMask m) = c m := by
  change c ((maskEquiv 24).symm ((maskEquiv 24) m)) = c m
  exact congrArg (fun a : Fin (2 ^ 24) => c a) ((maskEquiv 24).symm_apply_apply m)

noncomputable def packedCarrier : PackedCoordinates ≃ₗᵢ[ℂ] Fermion 2 :=
  maskReindex.trans coefficientCarrier

theorem packedCarrier_norm (c : PackedCoordinates) :
    ‖packedCarrier c‖ = ‖c‖ :=
  packedCarrier.norm_map c

/-- Gather from the unique XOR predecessor, with its input weight. -/
noncomputable def packedWeighted (i : Fin 24) (w : Fin (2 ^ 24) → ℂ)
    (c : PackedCoordinates) : PackedCoordinates :=
  WithLp.toLp 2 (fun m : Fin (2 ^ 24) => c (xorMask m i) * w (xorMask m i))

noncomputable def packedEvenAction (i : Fin 24) (c : PackedCoordinates) :
    PackedCoordinates := packedWeighted i (packedEvenWeight i) c

noncomputable def packedOddAction (i : Fin 24) (c : PackedCoordinates) :
    PackedCoordinates := packedWeighted i (packedOddWeight i) c

/-- Prove the general reindexing pointwise instead of using a huge finite sum. -/
theorem reindex_weighted (i : Fin 24) (w : Fin (2 ^ 24) → ℂ)
    (v : Finset (Fin 24) → ℂ) (c : PackedCoordinates)
    (hw : ∀ m, v (decodeMask m) = w m) :
    maskReindex (packedWeighted i w c) =
      weightedToggle i v (maskReindex c) := by
  apply (WithLp.linearEquiv 2 ℂ (Finset (Fin 24) → ℂ)).injective
  funext A
  change maskReindex (packedWeighted i w c) A =
    weightedToggle i v (maskReindex c) A
  obtain ⟨m, hm⟩ := (decodeMask_bijective 24).2 A
  subst A
  calc
    _ = packedWeighted i w c m := maskReindex_at _ _
    _ = c (xorMask m i) * w (xorMask m i) := rfl
    _ = maskReindex c (decodeMask (xorMask m i)) *
        v (decodeMask (xorMask m i)) :=
      congrArg₂ (fun a b : ℂ => a * b) (maskReindex_at c (xorMask m i)).symm
        (hw (xorMask m i)).symm
    _ = _ := by
      rw [decode_xor_source]
      exact (weightedToggle_apply i v (maskReindex c) (decodeMask m)).symm

theorem packedEvenIntertwine (j : Fin 8) (C : ColorIndex 2)
    (c : PackedCoordinates) :
    packedCarrier (packedEvenAction (colorModeEquiv (j, C)) c) =
      majoranaNormalization •
        pairedTheta (spinPairEquiv.symm (j, (0 : Fin 2))) C (packedCarrier c) := by
  calc
    _ = coefficientCarrier (maskReindex (packedEvenAction (colorModeEquiv (j, C)) c)) := rfl
    _ = coefficientCarrier (evenAction (colorModeEquiv (j, C)) (maskReindex c)) :=
      congrArg (fun x : FockCoordinateSpace 23 => coefficientCarrier x)
        (reindex_weighted (colorModeEquiv (j, C)) _ _ c (evenWeight_agrees _))
    _ = _ := evenIntertwine j C (maskReindex c)

theorem packedOddIntertwine (j : Fin 8) (C : ColorIndex 2)
    (c : PackedCoordinates) :
    packedCarrier (packedOddAction (colorModeEquiv (j, C)) c) =
      majoranaNormalization •
        pairedTheta (spinPairEquiv.symm (j, (1 : Fin 2))) C (packedCarrier c) := by
  calc
    _ = coefficientCarrier (maskReindex (packedOddAction (colorModeEquiv (j, C)) c)) := rfl
    _ = coefficientCarrier (oddAction (colorModeEquiv (j, C)) (maskReindex c)) :=
      congrArg (fun x : FockCoordinateSpace 23 => coefficientCarrier x)
        (reindex_weighted (colorModeEquiv (j, C)) _ _ c (oddWeight_agrees _))
    _ = _ := oddIntertwine j C (maskReindex c)

#print axioms inclusiveCard
#print axioms packedCount_succ
#print axioms paritySign_succ
#print axioms evenWeight_agrees
#print axioms oddWeight_agrees
#print axioms maskReindex_at
#print axioms packedCarrier_norm
#print axioms reindex_weighted
#print axioms packedEvenIntertwine
#print axioms packedOddIntertwine

end
end FCP.BFSSMSYPackedCarrier
