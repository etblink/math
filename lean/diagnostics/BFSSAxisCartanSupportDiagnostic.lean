import Mathlib.Analysis.InnerProductSpace.Projection.FiniteDimensional
import Mathlib.Analysis.InnerProductSpace.PiL2

/-!
Exploratory diagnostic, not a qualified BFSS source theorem.
Adapted from Mathlib's pinned reflections_generate_dim_aux (Apache 2.0;
Zhouhang Zhou, Frédéric Dupuis, Heather Macbeth). Retain its product order
and dimension induction, recording orthogonality to one fixed vector.
-/

set_option autoImplicit false

namespace FCP.BFSSAxisCartanSupportDiagnostic
noncomputable section

open Module Submodule

theorem reflections_generate_fixing_aux
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    [FiniteDimensional ℝ F] {n : ℕ}
    (φ : F ≃ₗᵢ[ℝ] F) (a : F) (ha : φ a = a)
    (hn : finrank ℝ (ContinuousLinearMap.id ℝ F - φ).kerᗮ ≤ n) :
    ∃ l : List F, l.length ≤ n ∧ (∀ u ∈ l, inner ℝ a u = 0) ∧
      φ = (l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod := by
  induction n generalizing φ with
  | zero =>
    refine ⟨[], rfl.le, by simp, show φ = 1 from ?_⟩
    have hk : (ContinuousLinearMap.id ℝ F - φ).ker = ⊤ := by
      rwa [le_zero_iff, finrank_eq_zero, orthogonal_eq_bot_iff] at hn
    symm
    ext x
    have hx := LinearMap.congr_fun (LinearMap.ker_eq_top.mp hk) x
    simpa only [sub_eq_zero, ContinuousLinearMap.toLinearMap_sub,
      LinearMap.sub_apply, LinearMap.zero_apply] using! hx
  | succ n ih =>
    let W := (ContinuousLinearMap.id ℝ F - φ).ker
    have hW : ∀ w ∈ W, φ w = w := fun w hw => (sub_eq_zero.mp hw).symm
    have haW : a ∈ W := by
      change a - φ a = 0
      rw [ha, sub_self]
    by_cases hn' : finrank ℝ Wᗮ ≤ n
    · obtain ⟨l, hl, hs, hf⟩ := ih φ ha hn'
      exact ⟨l, hl.trans n.le_succ, hs, hf⟩
    have : Nontrivial Wᗮ := nontrivial_of_finrank_pos (by omega : 0 < finrank ℝ Wᗮ)
    obtain ⟨v, hv⟩ := exists_ne (0 : Wᗮ)
    have hφv : φ v ∈ Wᗮ := by
      intro w hw
      rw [← hW w hw, LinearIsometryEquiv.inner_map_map]
      exact v.prop w hw
    have hv' : (v : F) ∉ W := by
      intro h
      exact hv ((mem_left_iff_eq_zero_of_disjoint W.orthogonal_disjoint).mp h)
    let x : F := v - φ v
    let ρ := (ℝ ∙ x)ᗮ.reflection
    have hxW : x ∈ Wᗮ := Submodule.sub_mem _ v.prop hφv
    have hax : inner ℝ a x = 0 := hxW a haW
    have hρa : ρ a = a := by
      apply reflection_mem_subspace_eq_self
      rw [mem_orthogonal_singleton_iff_inner_left]
      exact hax
    have hnext : (ρ * φ) a = a := by
      calc
        (ρ * φ) a = ρ (φ a) := rfl
        _ = a := by rw [ha, hρa]
    let V := (ContinuousLinearMap.id ℝ F - φ.trans ρ).ker
    have hV : ∀ w, ρ (φ w) = w → w ∈ V := by
      intro w hw
      change w - ρ (φ w) = 0
      rw [sub_eq_zero, hw]
    have hWV : W ≤ V := by
      intro w hw
      apply hV
      rw [hW w hw]
      apply reflection_mem_subspace_eq_self
      rw [mem_orthogonal_singleton_iff_inner_left]
      exact hxW w hw
    have hvV : (v : F) ∈ V := by
      apply hV
      have hswap : ρ v = φ v := reflection_sub (φ.norm_map v).symm
      rw [← hswap]
      exact reflection_reflection _ _
    have hdim : finrank ℝ Vᗮ ≤ n := by
      change finrank ℝ Wᗮ ≤ n + 1 at hn
      have hlt : finrank ℝ W + 1 ≤ finrank ℝ V :=
        finrank_lt_finrank_of_lt
          ((SetLike.lt_iff_le_and_exists (B := F)).2 ⟨hWV, v, hvV, hv'⟩)
      have hVdim := V.finrank_add_finrank_orthogonal
      have hWdim := W.finrank_add_finrank_orthogonal
      omega
    obtain ⟨l, hl, hs, hf⟩ := ih (ρ * φ) hnext hdim
    refine ⟨x :: l, Nat.succ_le_succ hl, ?_, ?_⟩
    · intro u hu
      rcases List.mem_cons.mp hu with hu | hu
      · subst u
        exact hax
      · exact hs u hu
    · rw [List.map_cons, List.prod_cons]
      have heq := congrArg (ρ * ·) hf
      rwa [← mul_assoc, reflection_mul_reflection, one_mul] at heq

theorem reflections_generate_fixing_nine
    (φ : EuclideanSpace ℝ (Fin 9) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin 9))
    (a : EuclideanSpace ℝ (Fin 9)) (ha0 : a ≠ 0) (ha : φ a = a) :
    ∃ l : List (EuclideanSpace ℝ (Fin 9)), l.length ≤ 8 ∧
      (∀ u ∈ l, inner ℝ a u = 0) ∧
      φ = (l.map fun u => (ℝ ∙ u)ᗮ.reflection).prod := by
  let W := (ContinuousLinearMap.id ℝ (EuclideanSpace ℝ (Fin 9)) - φ).ker
  have haW : a ∈ W := by
    change a - φ a = 0
    rw [ha, sub_self]
  have hspan : (ℝ ∙ a) ≤ W := (Submodule.span_singleton_le_iff_mem a W).mpr haW
  have hpositive : 1 ≤ finrank ℝ W := by
    simpa only [finrank_span_singleton ha0] using Submodule.finrank_mono hspan
  have hadd := W.finrank_add_finrank_orthogonal
  have htotal : finrank ℝ (EuclideanSpace ℝ (Fin 9)) = 9 := by simp
  have hbound : finrank ℝ Wᗮ ≤ 8 := by omega
  exact reflections_generate_fixing_aux φ a ha hbound

#print axioms FCP.BFSSAxisCartanSupportDiagnostic.reflections_generate_fixing_aux
#print axioms FCP.BFSSAxisCartanSupportDiagnostic.reflections_generate_fixing_nine
#eval IO.println "BFSS_AXIS_CARTAN_SUPPORT_DIAGNOSTIC_SOURCE_COMPLETE"

end
end FCP.BFSSAxisCartanSupportDiagnostic
