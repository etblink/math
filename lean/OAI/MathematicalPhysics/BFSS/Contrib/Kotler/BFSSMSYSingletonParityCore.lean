import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYNativeOccupationTransition
import Mathlib.GroupTheory.Perm.Fin
import Mathlib.Order.Interval.Finset.Fin

/-! General combinatorial core for the singleton sorting parity bridge.
The literal source permutation adapter is a separate next step. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYSingletonParityCore
noncomputable section

/-- A permutation with an increasing tail is the inverse of the initial
cycle ending at its first image. This is independent of Fock conventions. -/
theorem sign_of_strictMono_succ {n : ℕ}
    (σ : Equiv.Perm (Fin (n + 1)))
    (h : StrictMono (fun j : Fin n => σ j.succ)) :
    σ.sign = (-1) ^ (σ 0).val := by
  have hc : ({σ 0}ᶜ : Finset (Fin (n + 1))).card = n := by
    simp [Finset.card_compl]
  have hm (j : Fin n) : σ j.succ ∈ ({σ 0}ᶜ : Finset (Fin (n + 1))) := by
    simp only [Finset.mem_compl, Finset.mem_singleton]
    exact fun he => Fin.succ_ne_zero j (σ.injective he)
  have hu := Finset.orderEmbOfFin_unique hc hm h
  have ht (j : Fin n) : σ j.succ = (σ 0).succAbove j := by
    have hj := congrFun hu j
    rw [Finset.orderEmbOfFin_compl_singleton_eq_succAboveOrderEmb] at hj
    exact hj
  have he : σ = (Fin.cycleRange (σ 0)).symm := by
    ext j : 1
    refine Fin.cases ?_ (fun k => ?_) j
    · exact (Fin.cycleRange_symm_zero (σ 0)).symm
    · rw [ht, Fin.cycleRange_symm_succ]
  calc
    σ.sign = Equiv.Perm.sign (Fin.cycleRange (σ 0)).symm :=
      congrArg (fun p : Equiv.Perm (Fin (n + 1)) => p.sign) he
    _ = (-1) ^ (σ 0).val := by
      rw [Equiv.Perm.sign_symm, Fin.sign_cycleRange]

/-- The position of an element in an increasing finite enumeration is
the number of elements strictly smaller than it. -/
theorem orderRank_eq_card_filter {α : Type*} [LinearOrder α]
    (U : Finset α) {n : ℕ} (hU : U.card = n) (x : U) :
    ((U.orderIsoOfFin hU).symm x).val = (U.filter (fun y => y < x.val)).card := by
  let e := U.orderIsoOfFin hU
  have hm : (Finset.Iio (e.symm x)).map (U.orderEmbOfFin hU).toEmbedding =
      U.filter (fun y => y < x.val) := by
    ext y
    simp only [Finset.mem_map, Finset.mem_Iio, Finset.mem_filter]
    constructor
    · rintro ⟨j, hj, rfl⟩
      refine ⟨Finset.orderEmbOfFin_mem U hU j, ?_⟩
      change (e j).val < x.val
      have hj' := e.strictMono hj
      rw [e.apply_symm_apply] at hj'
      exact hj'
    · rintro ⟨hy, hlt⟩
      let y' : U := ⟨y, hy⟩
      refine ⟨e.symm y', e.symm.strictMono (show y' < x from hlt), ?_⟩
      change (e (e.symm y')).val = y
      rw [e.apply_symm_apply]
  change (e.symm x).val = _
  rw [← hm, Finset.card_map, Fin.card_Iio]

#print axioms sign_of_strictMono_succ
#print axioms orderRank_eq_card_filter

end
end FCP.BFSSMSYSingletonParityCore
