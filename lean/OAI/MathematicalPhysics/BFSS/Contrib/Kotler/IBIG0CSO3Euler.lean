/-
Copyright (c) 2026 QICLean contributors. All rights reserved.
This adapted Euler-angle proof is based on LionSR/QICLean,
released under Apache License, Version 2.0:
https://github.com/LionSR/QICLean/blob/603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac/LICENSE
Adaptation (FCP/IBI): names, namespace, independent abstract SO3 rotation
definitions, and reliance on an independently qualified unit-circle lemma
in the pinned BFSS Lean 4.34.1 / Mathlib toolchain.
-/
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CSO3Angle

/-!
# G0C-SO3-EULER — arbitrary SO(3) ZXZ Euler decomposition

A pure matrix theorem: no BFSS gauge, physical, Fock or spin hypotheses.
This stand-alone proof is a candidate until source-pinned strict CI GREEN.
-/
set_option autoImplicit false
set_option maxHeartbeats 450000

open scoped Matrix BigOperators
open Matrix Finset

namespace FCP.BFSSIBIG0CSO3Euler
noncomputable section
open FCP.BFSSIBIG0CSO3Angle

def rotZ (θ : ℝ) : Matrix (Fin 3) (Fin 3) ℝ :=
  !![Real.cos θ, -Real.sin θ, 0;
     Real.sin θ, Real.cos θ, 0;
     0, 0, 1]

def rotX (β : ℝ) : Matrix (Fin 3) (Fin 3) ℝ :=
  !![1, 0, 0;
     0, Real.cos β, -Real.sin β;
     0, Real.sin β, Real.cos β]

/-- Abstract real proper rotation, including both gimbal-lock branches,
as an ordered product of coordinate-axis rotations. -/
theorem sourceSO3_euler_decomp (M : Matrix (Fin 3) (Fin 3) ℝ)
    (hM : M ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ) :
    ∃ α β γ : ℝ, M = rotZ α * rotX β * rotZ γ := by
  rw [Matrix.mem_specialOrthogonalGroup_iff] at hM
  obtain ⟨ho, hdet⟩ := hM
  have hoM : M * Mᵀ = 1 := (Matrix.mem_orthogonalGroup_iff (Fin 3) ℝ).mp ho
  have hoT : Mᵀ * M = 1 := (Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).mp ho
  have hadj : Mᵀ = M.adjugate := by
    rw [show Mᵀ = M⁻¹ from (Matrix.inv_eq_right_inv hoM).symm, Matrix.inv_def, hdet]; simp
  -- concrete row/column dot products and cofactors
  have row : ∀ p q : Fin 3, M p 0 * M q 0 + M p 1 * M q 1 + M p 2 * M q 2 =
      if p = q then 1 else 0 := by
    intro p q
    have := congrFun (congrFun hoM p) q
    simpa only [Matrix.mul_apply, Fin.sum_univ_three, Matrix.transpose_apply,
      Matrix.one_apply] using this
  have col : ∀ p q : Fin 3, M 0 p * M 0 q + M 1 p * M 1 q + M 2 p * M 2 q =
      if p = q then 1 else 0 := by
    intro p q
    have := congrFun (congrFun hoT p) q
    simpa only [Matrix.mul_apply, Fin.sum_univ_three, Matrix.transpose_apply,
      Matrix.one_apply] using this
  have cof : ∀ p q : Fin 3, M q p = (M.adjugate) p q := by
    intro p q
    have := congrFun (congrFun hadj p) q; rwa [Matrix.transpose_apply] at this
  -- the nine cofactor identities
  have cof00 : M 0 0 = M 1 1 * M 2 2 - M 1 2 * M 2 1 := by
    have := cof 0 0; simp only [Matrix.adjugate_fin_three, Matrix.of_apply, Matrix.cons_val',
      Matrix.cons_val_zero, Matrix.cons_val_fin_one, Matrix.empty_val'] at this
    linarith only [this]
  have cof01 : M 1 0 = -(M 0 1 * M 2 2) + M 0 2 * M 2 1 := by
    have := cof 0 1; simp only [Matrix.adjugate_fin_three, Matrix.of_apply, Matrix.cons_val',
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_fin_one,
      Matrix.empty_val'] at this
    linarith only [this]
  have cof10 : M 0 1 = -(M 1 0 * M 2 2) + M 1 2 * M 2 0 := by
    have := cof 1 0; simp only [Matrix.adjugate_fin_three, Matrix.of_apply, Matrix.cons_val',
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_fin_one,
      Matrix.empty_val'] at this
    linarith only [this]
  have cof11 : M 1 1 = M 0 0 * M 2 2 - M 0 2 * M 2 0 := by
    have := cof 1 1; simp only [Matrix.adjugate_fin_three, Matrix.of_apply, Matrix.cons_val',
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_fin_one,
      Matrix.empty_val'] at this
    linarith only [this]
  -- norms of relevant rows/cols
  have hr22 : M 2 0 * M 2 0 + M 2 1 * M 2 1 + M 2 2 * M 2 2 = 1 := by
    have := row 2 2; rwa [ite_eq_left rfl] at this
  have hc22 : M 0 2 * M 0 2 + M 1 2 * M 1 2 + M 2 2 * M 2 2 = 1 := by
    have := col 2 2; rwa [ite_eq_left rfl] at this
  have hbound : M 2 2 ^ 2 ≤ 1 := by
    nlinarith only [hr22, sq_nonneg (M 2 0), sq_nonneg (M 2 1)]
  set sβ := Real.sqrt (1 - M 2 2 ^ 2) with hsβdef
  have hsβsq : sβ ^ 2 = 1 - M 2 2 ^ 2 := by
    rw [hsβdef, Real.sq_sqrt (by nlinarith only [hbound])]
  obtain ⟨β, hcosβ, hsinβ⟩ :=
    unitCircle_exists_angle (c := M 2 2) (s := sβ) (by nlinarith only [hsβsq])
  by_cases hs : sβ = 0
  · -- gimbal lock: sin β = 0, so M 2 2 = ±1 and the off-axis entries vanish
    have h22sq : M 2 2 ^ 2 = 1 := by
      have : sβ ^ 2 = 0 := by rw [hs]; ring
      rw [this] at hsβsq
      linarith only [hsβsq]
    have hz20 : M 2 0 = 0 := by
      nlinarith only [hr22, h22sq, sq_nonneg (M 2 0), sq_nonneg (M 2 1)]
    have hz21 : M 2 1 = 0 := by
      nlinarith only [hr22, h22sq, sq_nonneg (M 2 0), sq_nonneg (M 2 1)]
    have hz02 : M 0 2 = 0 := by
      nlinarith only [hc22, h22sq, sq_nonneg (M 0 2), sq_nonneg (M 1 2)]
    have hz12 : M 1 2 = 0 := by
      nlinarith only [hc22, h22sq, sq_nonneg (M 0 2), sq_nonneg (M 1 2)]
    have hcol0 : M 0 0 ^ 2 + M 1 0 ^ 2 = 1 := by
      have := col 0 0
      rw [ite_eq_left rfl] at this
      nlinarith only [this, hz20]
    obtain ⟨α, hcosα, hsinα⟩ :=
      unitCircle_exists_angle (c := M 0 0) (s := M 1 0) (by nlinarith only [hcol0])
    refine ⟨α, β, 0, ?_⟩
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp only [rotZ, rotX, Matrix.mul_apply, Fin.sum_univ_three,
        Matrix.of_apply, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two,
        Matrix.head_cons, Matrix.tail_cons, Matrix.cons_val', Matrix.empty_val',
        Matrix.cons_val_fin_one, Matrix.head_fin_const,
        Fin.zero_eta, Fin.mk_one, Fin.isValue, Fin.reduceFinMk,
        hcosα, hsinα, hcosβ, hsinβ, Real.cos_zero, Real.sin_zero, hs,
        hz02, hz12, hz20, hz21] <;>
      first
        | linear_combination cof10 + M 1 2 * hz20
        | linear_combination cof11 - M 0 2 * hz20
        | ring
  · have hsβne : sβ ≠ 0 := hs
    obtain ⟨α, hcosα, hsinα⟩ := unitCircle_exists_angle (c := -M 1 2 / sβ) (s := M 0 2 / sβ) (by
      rw [div_pow, div_pow, ← add_div, div_eq_one_iff_eq (pow_ne_zero 2 hsβne)]
      nlinarith only [hc22, hsβsq])
    obtain ⟨γ, hcosγ, hsinγ⟩ := unitCircle_exists_angle (c := M 2 1 / sβ) (s := M 2 0 / sβ) (by
      rw [div_pow, div_pow, ← add_div, div_eq_one_iff_eq (pow_ne_zero 2 hsβne)]
      nlinarith only [hr22, hsβsq])
    refine ⟨α, β, γ, ?_⟩
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp only [rotZ, rotX, Matrix.mul_apply, Fin.sum_univ_three,
        Matrix.of_apply, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two,
        Matrix.head_cons, Matrix.tail_cons, Matrix.cons_val', Matrix.empty_val',
        Matrix.cons_val_fin_one, Matrix.head_fin_const,
        Fin.zero_eta, Fin.mk_one, Fin.isValue, Fin.reduceFinMk,
        hcosα, hsinα, hcosβ, hsinβ, hcosγ, hsinγ] <;>
      field_simp <;>
      first
        | linear_combination M 0 0 * hsβsq + cof00 + M 2 2 * cof11
        | linear_combination M 0 1 * hsβsq + cof10 - M 2 2 * cof01
        | linear_combination M 1 0 * hsβsq + cof01 - M 2 2 * cof10
        | linear_combination M 1 1 * hsβsq + cof11 + M 2 2 * cof00
        | nlinarith only [hsβsq, hr22, hc22]

#print axioms sourceSO3_euler_decomp

end
end FCP.BFSSIBIG0CSO3Euler
