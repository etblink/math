import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1P0AOriginalSource48SkewPlane

/-!
# M4-LB1P0B: exact sparse-plane normalization on original Fock operators
Only elementary K(E) normalization is targeted. Original source labels,
real scalars, gamma normalization and K coefficient 1/4 are unchanged.
No Lie closure, physical group action or spectral assertion is made.
-/
set_option autoImplicit false

namespace FCP.BFSSP3M4LB1P0BOriginalSource48SkewPlaneNormalization
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4LB1P0AOriginalSource48SkewPlane

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

private theorem originalFock_real_zero_smul (x : Op) :
    (0 : ℝ) • x = (0 : Op) := by
  rw [FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul]
  exact zero_smul ℂ x

private theorem originalFock_real_sub_smul (a b : ℝ) (x : Op) :
    (a - b) • x = a • x - b • x := by
  calc
    (a - b) • x = (((a - b : ℝ) : ℂ)) • x :=
      FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul
        (a - b) x
    _ = ((a : ℂ) - (b : ℂ)) • x := by rw [Complex.ofReal_sub]
    _ = (a : ℂ) • x - (b : ℂ) • x := sub_smul _ _ _
    _ = a • x - b • x := by
      rw [← FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul a x,
        ← FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul b x]

private theorem originalFock_quarter_indicator
    (b : Prop) [Decidable b] (x : Op) :
    ((if b then (1 : ℝ) else 0) / 4 : ℝ) • x =
      if b then (1 / 4 : ℝ) • x else (0 : Op) := by
  by_cases h : b
  · simp only [if_pos h]
  · simp only [if_neg h, zero_div]
    exact originalFock_real_zero_smul x

/-- Opaque finite contraction before original gamma substitution. -/
private theorem originalFock_sparse_plane_contract
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    (f : ι → ι → Op) (i j : ι) :
    (∑ p : ι, ∑ q : ι,
      (((if p = i ∧ q = j then (1 : ℝ) else 0) -
        (if p = j ∧ q = i then (1 : ℝ) else 0)) / 4 : ℝ) • f p q) =
      (1 / 4 : ℝ) • (f i j - f j i) := by
  classical
  have hmask (a b : ι) :
      (∑ p : ι, ∑ q : ι,
        if p = a ∧ q = b then (1 / 4 : ℝ) • f p q else (0 : Op)) =
          (1 / 4 : ℝ) • f a b := by
    have hinner (p : ι) :
        (∑ q : ι,
          if p = a ∧ q = b then (1 / 4 : ℝ) • f p q else (0 : Op)) =
            if p = a then (1 / 4 : ℝ) • f p b else (0 : Op) := by
      by_cases h : p = a
      · subst p
        simp
      · simp [h]
    calc
      (∑ p : ι, ∑ q : ι,
        if p = a ∧ q = b then (1 / 4 : ℝ) • f p q else (0 : Op)) =
          ∑ p : ι, if p = a then (1 / 4 : ℝ) • f p b else (0 : Op) := by
            apply Finset.sum_congr rfl
            intro p hp
            exact hinner p
      _ = (1 / 4 : ℝ) • f a b := by simp
  have hterm (p q : ι) :
      (((if p = i ∧ q = j then (1 : ℝ) else 0) -
        (if p = j ∧ q = i then (1 : ℝ) else 0)) / 4 : ℝ) • f p q =
      (if p = i ∧ q = j then (1 / 4 : ℝ) • f p q else (0 : Op)) -
        (if p = j ∧ q = i then (1 / 4 : ℝ) • f p q else (0 : Op)) := by
    rw [sub_div, originalFock_real_sub_smul,
      originalFock_quarter_indicator, originalFock_quarter_indicator]
  calc
    (∑ p : ι, ∑ q : ι,
      (((if p = i ∧ q = j then (1 : ℝ) else 0) -
        (if p = j ∧ q = i then (1 : ℝ) else 0)) / 4 : ℝ) • f p q) =
      ∑ p : ι, ∑ q : ι,
        ((if p = i ∧ q = j then (1 / 4 : ℝ) • f p q else (0 : Op)) -
          (if p = j ∧ q = i then (1 / 4 : ℝ) • f p q else (0 : Op))) := by
            apply Finset.sum_congr rfl
            intro p hp
            apply Finset.sum_congr rfl
            intro q hq
            exact hterm p q
    _ = (∑ p : ι, ∑ q : ι,
          if p = i ∧ q = j then (1 / 4 : ℝ) • f p q else (0 : Op)) -
        (∑ p : ι, ∑ q : ι,
          if p = j ∧ q = i then (1 / 4 : ℝ) • f p q else (0 : Op)) := by
            simp only [Finset.sum_sub_distrib]
    _ = (1 / 4 : ℝ) • f i j - (1 / 4 : ℝ) • f j i := by
      rw [hmask i j, hmask j i]
    _ = (1 / 4 : ℝ) • (f i j - f j i) :=
      (smul_sub (1 / 4 : ℝ) (f i j) (f j i)).symm

/-- Exact original sparse sum, valid also for coincident labels. -/
theorem originalSource48BivectorK_plane_antisym (i j : Source48Label) :
    originalSource48BivectorK (originalSource48SkewPlane i j) =
      (1 / 4 : ℝ) •
        (sourceNormalizedGamma i * sourceNormalizedGamma j -
          sourceNormalizedGamma j * sourceNormalizedGamma i) := by
  classical
  change (∑ p : Source48Label, ∑ q : Source48Label,
      (((if p = i ∧ q = j then (1 : ℝ) else 0) -
        (if p = j ∧ q = i then (1 : ℝ) else 0)) / 4 : ℝ) •
          (sourceNormalizedGamma p * sourceNormalizedGamma q)) = _
  exact originalFock_sparse_plane_contract
    (fun p q => sourceNormalizedGamma p * sourceNormalizedGamma q) i j

/-- Distinct original labels give the exact half-product generator. -/
theorem originalSource48BivectorK_plane_half
    (i j : Source48Label) (hij : i ≠ j) :
    originalSource48BivectorK (originalSource48SkewPlane i j) =
      (1 / 2 : ℝ) • (sourceNormalizedGamma i * sourceNormalizedGamma j) := by
  let x : Op := sourceNormalizedGamma i * sourceNormalizedGamma j
  let y : Op := sourceNormalizedGamma j * sourceNormalizedGamma i
  have hcar : x + y = (0 : Op) := by
    calc
      x + y = (0 : ℂ) • (1 : Op) := by
        simpa [x, y, hij] using (sourceNormalizedGamma_pairwise_CAR i j)
      _ = (0 : Op) := zero_smul ℂ (1 : Op)
  have hreverse : y = -x := by
    calc
      y = (x + y) - x := by abel
      _ = -x := by rw [hcar]; simp
  have hcoeff :
      (((1 / 4 : ℝ) : ℂ) + ((1 / 4 : ℝ) : ℂ)) =
        ((1 / 2 : ℝ) : ℂ) := by norm_num
  calc
    originalSource48BivectorK (originalSource48SkewPlane i j) =
        (1 / 4 : ℝ) • (x - y) :=
      originalSource48BivectorK_plane_antisym i j
    _ = ((1 / 4 : ℝ) : ℂ) • (x - y) :=
      FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul
        (1 / 4) (x - y)
    _ = ((1 / 4 : ℝ) : ℂ) • x + ((1 / 4 : ℝ) : ℂ) • x := by
      rw [hreverse, sub_neg_eq_add, smul_add]
    _ = (((1 / 4 : ℝ) : ℂ) + ((1 / 4 : ℝ) : ℂ)) • x :=
      (add_smul _ _ x).symm
    _ = ((1 / 2 : ℝ) : ℂ) • x := by rw [hcoeff]
    _ = (1 / 2 : ℝ) • x :=
      (FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul
        (1 / 2) x).symm

#print axioms originalSource48BivectorK_plane_antisym
#print axioms originalSource48BivectorK_plane_half

end
end FCP.BFSSP3M4LB1P0BOriginalSource48SkewPlaneNormalization
