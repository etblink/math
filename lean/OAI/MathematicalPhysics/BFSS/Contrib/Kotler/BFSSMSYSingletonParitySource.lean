import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYSingletonParityCore

/-! Bind the qualified parity core to Mathlib's literal exterior sorting
permutation and the original source creation coefficient. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYSingletonParitySource
noncomputable section

open Set.powersetCard
open FCP.BFSSMSYSingletonParityCore FCP.BFSSMSYNativeOccupationTransition
open FCP.BFSSFermionF3B2
open OAI.ContinuumCoulomb.HubbardGlobal

/-- Evaluate the original sorting permutation on the left summand. -/
theorem sorting_left_value {α : Type*} [LinearOrder α] {m n : ℕ}
    {S : Set.powersetCard α m} {T : Set.powersetCard α n}
    (hd : Disjoint S.val T.val) (j : Fin m) :
    ((orderIsoOfFin (disjUnion hd))
      (permOfDisjoint hd (Fin.castAdd n j))).val = (orderIsoOfFin S j).val := by
  simp only [permOfDisjoint, Equiv.trans_apply, finSumFinEquiv_symm_apply_castAdd]
  let z : (disjUnion hd).val :=
    Equiv.Finset.disjUnionEquiv S.val T.val hd (Sum.inl (orderIsoOfFin S j))
  change ((orderIsoOfFin (disjUnion hd))
    ((orderIsoOfFin (disjUnion hd)).symm z)).val = _
  calc
    _ = z.val := congrArg (fun x : (disjUnion hd).val => x.val)
      ((orderIsoOfFin (disjUnion hd)).apply_symm_apply z)
    _ = (orderIsoOfFin S j).val := rfl

/-- Evaluate the original sorting permutation on the right summand. -/
theorem sorting_right_value {α : Type*} [LinearOrder α] {m n : ℕ}
    {S : Set.powersetCard α m} {T : Set.powersetCard α n}
    (hd : Disjoint S.val T.val) (j : Fin n) :
    ((orderIsoOfFin (disjUnion hd))
      (permOfDisjoint hd (Fin.natAdd m j))).val = (orderIsoOfFin T j).val := by
  simp only [permOfDisjoint, Equiv.trans_apply, finSumFinEquiv_symm_apply_natAdd]
  let z : (disjUnion hd).val :=
    Equiv.Finset.disjUnionEquiv S.val T.val hd (Sum.inr (orderIsoOfFin T j))
  change ((orderIsoOfFin (disjUnion hd))
    ((orderIsoOfFin (disjUnion hd)).symm z)).val = _
  calc
    _ = z.val := congrArg (fun x : (disjUnion hd).val => x.val)
      ((orderIsoOfFin (disjUnion hd)).apply_symm_apply z)
    _ = (orderIsoOfFin T j).val := rfl

/-- Sign of the literal Mathlib singleton-then-occupation sorting permutation. -/
theorem singletonPerm_sign {α : Type*} [LinearOrder α]
    (i : α) (A : Finset α) (hi : i ∉ A) :
    let S : Set.powersetCard α 1 := ⟨{i}, Finset.card_singleton i⟩
    let T : Set.powersetCard α A.card := ⟨A, rfl⟩
    have hd : Disjoint S.val T.val := by simpa only [S, T, Finset.disjoint_singleton_left]
    (permOfDisjoint hd).sign = (-1) ^ (A.filter (fun k => k < i)).card := by
  dsimp only
  let S : Set.powersetCard α 1 := ⟨{i}, Finset.card_singleton i⟩
  let T : Set.powersetCard α A.card := ⟨A, rfl⟩
  have hd : Disjoint S.val T.val := by simpa only [S, T, Finset.disjoint_singleton_left]
  let U := disjUnion hd
  let π := permOfDisjoint hd
  let e : Fin (1 + A.card) ≃o Fin (A.card + 1) :=
    Fin.castOrderIso (Nat.add_comm 1 A.card)
  let σ : Equiv.Perm (Fin (A.card + 1)) := e.toEquiv.permCongr π
  change π.sign = _
  have hzero : e.symm 0 = Fin.castAdd A.card (0 : Fin 1) := by
    apply Fin.ext
    rfl
  have hsucc (j : Fin A.card) : e.symm j.succ = Fin.natAdd 1 j := by
    apply Fin.ext
    change j.val + 1 = 1 + j.val
    omega
  have htail : StrictMono (fun j : Fin A.card => σ j.succ) := by
    intro a b hab
    change e (π (e.symm a.succ)) < e (π (e.symm b.succ))
    rw [hsucc a, hsucc b]
    apply e.strictMono
    have hh : (orderIsoOfFin U) (π (Fin.natAdd 1 a)) <
        (orderIsoOfFin U) (π (Fin.natAdd 1 b)) := by
      change ((orderIsoOfFin (disjUnion hd))
        (permOfDisjoint hd (Fin.natAdd 1 a))).val <
        ((orderIsoOfFin (disjUnion hd))
        (permOfDisjoint hd (Fin.natAdd 1 b))).val
      rw [sorting_right_value, sorting_right_value]
      exact (orderIsoOfFin T).strictMono hab
    simpa only [OrderIso.symm_apply_apply] using (orderIsoOfFin U).symm.strictMono hh
  let x : U.val := (orderIsoOfFin U) (π (Fin.castAdd A.card (0 : Fin 1)))
  have hx : x.val = i := by
    change ((orderIsoOfFin (disjUnion hd))
      (permOfDisjoint hd (Fin.castAdd A.card (0 : Fin 1)))).val = i
    rw [sorting_left_value]
    exact Finset.mem_singleton.mp (show (orderIsoOfFin S 0).val ∈ {i} from
      (orderIsoOfFin S 0).prop)
  have hfilter : U.val.filter (fun k => k < i) = A.filter (fun k => k < i) := by
    ext k
    change k ∈ (S.val.disjUnion T.val hd).filter (fun y => y < i) ↔ _
    simp only [Finset.mem_filter, Finset.mem_disjUnion, S, T, Finset.mem_singleton]
    constructor
    · rintro ⟨hk | hk, hlt⟩
      · exact (lt_irrefl i (hk ▸ hlt)).elim
      · exact ⟨hk, hlt⟩
    · rintro ⟨hk, hlt⟩
      exact ⟨Or.inr hk, hlt⟩
  have hr := orderRank_eq_card_filter U.val U.prop x
  change ((orderIsoOfFin U).symm x).val = _ at hr
  rw [hx, hfilter] at hr
  have hrank : (σ 0).val = (A.filter (fun k => k < i)).card := by
    change (e (π (e.symm 0))).val = _
    rw [hzero]
    change (π (Fin.castAdd A.card (0 : Fin 1))).val = _
    simpa only [x, OrderIso.symm_apply_apply] using hr
  have hsign := sign_of_strictMono_succ σ htail
  rw [hrank] at hsign
  simpa only [σ, Equiv.Perm.sign_permCongr] using hsign

/-- The actual source complex creation coefficient reads the parity count,
with the same integer-unit sign convention as source sortSign. -/
theorem creationCoefficient_eq_parityTest (i : Fin 24) (A : Finset (Fin 24))
    (hi : i ∉ A) :
    creationCoefficient i A =
      if (-1 : ℤˣ) ^ (A.filter (fun k => k < i)).card = 1 then (1 : ℂ) else -1 := by
  calc
    creationCoefficient i A = sortSign i A hi :=
      creationCoefficient_eq_sortSign i A hi
    _ = _ :=
      congrArg (fun u : ℤˣ => if u = 1 then (1 : ℂ) else -1)
        (singletonPerm_sign i A hi)

#print axioms sorting_left_value
#print axioms sorting_right_value
#print axioms singletonPerm_sign
#print axioms creationCoefficient_eq_parityTest

end
end FCP.BFSSMSYSingletonParitySource
