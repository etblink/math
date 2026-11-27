import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2A0OriginalNormalizedKernel

/-! MOL-L2B0: measurable translation-square integrability and Jensen/Fubini
contraction for compact original L2 representatives. No derivative assumption
on the input and no bundled L2 norm or strong convergence conclusion yet. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2B0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLL2A0
open MeasureTheory

/-- Replace continuity in the original Rellich translation-product argument
with joint measurability. Compact support is not needed here. -/
theorem translation_square_integrable {N : ℕ} (u : Boson N → Fermion N)
    (hsm : StronglyMeasurable u) (hu : MemLp u 2 volume)
    (μ : Measure (Boson N)) [IsFiniteMeasure μ] :
    Integrable (fun z : Boson N × Boson N => ‖u (z.1 + z.2)‖ ^ 2)
      (volume.prod μ) := by
  have hm : Measurable (fun z : Boson N × Boson N => u (z.1 + z.2)) :=
    hsm.measurable.comp (measurable_fst.add measurable_snd)
  have hs : StronglyMeasurable (fun z : Boson N × Boson N => ‖u (z.1 + z.2)‖ ^ 2) :=
    (continuous_norm.pow 2).comp_stronglyMeasurable hm.stronglyMeasurable
  have h2 : Integrable (fun x : Boson N => ‖u x‖ ^ 2) volume :=
    hu.integrable_norm_pow (p := 2) (by norm_num)
  apply (integrable_prod_iff' hs.aestronglyMeasurable).mpr
  constructor
  · exact Filter.Eventually.of_forall fun y =>
      ((measurePreserving_add_right volume y).integrable_comp h2.aestronglyMeasurable).mpr h2
  · have he :
        (fun y : Boson N => ∫ x : Boson N, ‖‖u (x + y)‖ ^ 2‖) =
          fun _ => ∫ x : Boson N, ‖u x‖ ^ 2 := by
        funext y
        simp only [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _)]
        exact integral_add_right_eq_self (fun x : Boson N => ‖u x‖ ^ 2) y
    rw [he]
    exact integrable_const _

theorem translation_square_integral {N : ℕ} (u : Boson N → Fermion N)
    (hsm : StronglyMeasurable u) (hu : MemLp u 2 volume)
    (μ : Measure (Boson N)) [IsProbabilityMeasure μ] :
    (∫ x : Boson N, ∫ y : Boson N, ‖u (x + y)‖ ^ 2 ∂μ) =
      ∫ x : Boson N, ‖u x‖ ^ 2 := by
  have hi := translation_square_integrable u hsm hu μ
  calc
    _ = ∫ y : Boson N, (∫ x : Boson N, ‖u (x + y)‖ ^ 2) ∂μ :=
      integral_integral_swap hi
    _ = ∫ _y : Boson N, (∫ x : Boson N, ‖u x‖ ^ 2) ∂μ := by
      apply integral_congr_ae
      filter_upwards [] with y
      exact integral_add_right_eq_self (fun x : Boson N => ‖u x‖ ^ 2) y
    _ = _ := by simp

/-- The integral-square contraction on the actual compact mollified core.
The probability sections require integrability, established a.e. above. -/
theorem normalized_mollified_square_le {N : ℕ} (φ : ContDiffBump (0 : Boson N))
    (u : Boson N → Fermion N) (hsm : StronglyMeasurable u)
    (h2 : MemLp u 2 volume) (hu : LocallyIntegrable u volume) (hs : HasCompactSupport u) :
    (∫ x, ‖mollifiedCore (normalizedKernel φ) u hu hs x‖ ^ 2) ≤
      ∫ x, ‖u x‖ ^ 2 := by
  let μ := BFSSRellich.bumpMeasure φ
  haveI : IsProbabilityMeasure μ := BFSSRellich.bumpMeasure_probability φ
  have hi := translation_square_integrable u hsm h2 μ
  have hpoint : ∀ᵐ x ∂(volume : Measure (Boson N)),
      ‖mollifiedCore (normalizedKernel φ) u hu hs x‖ ^ 2 ≤
        ∫ y, ‖u (x + y)‖ ^ 2 ∂μ := by
    filter_upwards [hi.prod_right_ae] with x hx
    have hm : AEStronglyMeasurable (fun y : Boson N => u (x + y)) μ :=
      (hsm.measurable.comp (measurable_const.add measurable_id)).aestronglyMeasurable
    have hn : Integrable (fun y : Boson N => ‖u (x + y)‖) μ := by
      simpa only [pow_one] using
        integrable_norm_pow_of_le hm (p := 1) (q := 2) (by norm_num) hx
    have hf : Integrable (fun y : Boson N => u (x + y)) μ :=
      (integrable_norm_iff hm).mp hn
    rw [normalized_mollified_eq_smoothAverage]
    change ‖∫ y, u (x + y) ∂μ‖ ^ 2 ≤ ∫ y, ‖u (x + y)‖ ^ 2 ∂μ
    exact BFSSRellich.norm_integral_sq_le hf hx
  have hl : Integrable (fun x => ‖mollifiedCore (normalizedKernel φ) u hu hs x‖ ^ 2) volume :=
    BFSSRellich.continuous_norm_sq_integrable
      (mollifiedCore (normalizedKernel φ) u hu hs).continuous
      (mollifiedCore (normalizedKernel φ) u hu hs).hasCompactSupport
  calc
    _ ≤ ∫ x : Boson N, ∫ y : Boson N, ‖u (x + y)‖ ^ 2 ∂μ :=
      integral_mono_ae hl hi.integral_prod_left hpoint
    _ = _ := translation_square_integral u hsm h2 μ

#print axioms translation_square_integrable
#print axioms translation_square_integral
#print axioms normalized_mollified_square_le

end
end FCP.BFSSMOLL2B0
