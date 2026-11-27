import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2B0OriginalJensenContraction

/-! MOL-L2C0: identify the integral of the squared norm with the actual
original FullL2 norm and transport both accepted mollifier estimates.
No shrinking sequence, strong convergence or graph density yet. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2C0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLL2A0 FCP.BFSSMOLL2B0
open MeasureTheory

/-- Exact representative norm identity on the original Hilbert carrier. -/
theorem toLp_norm_sq {N : ℕ} (u : Boson N → Fermion N) (hu : MemLp u 2 volume) :
    ‖hu.toLp u‖ ^ 2 = ∫ x, ‖u x‖ ^ 2 := by
  let v : FullL2 N := hu.toLp u
  have hv : (v : Boson N → Fermion N) =ᵐ[volume] u := hu.coeFn_toLp
  calc
    ‖hu.toLp u‖ ^ 2 = RCLike.re (inner ℂ v v) :=
      (inner_self_eq_norm_sq (𝕜 := ℂ) v).symm
    _ = RCLike.re (∫ x : Boson N, inner ℂ (v x) (v x)) := by
      rw [L2.inner_def]
    _ = ∫ x : Boson N, RCLike.re (inner ℂ (v x) (v x)) :=
      (integral_re (L2.integrable_inner v v)).symm
    _ = _ := by
      apply integral_congr_ae
      filter_upwards [hv] with x hx
      rw [hx]
      exact inner_self_eq_norm_sq (𝕜 := ℂ) (u x)

theorem core_norm_sq {N : ℕ} (f : SmoothCore N) :
    ‖coreToL2 f‖ ^ 2 = ∫ x, ‖f x‖ ^ 2 :=
  toLp_norm_sq (f : Boson N → Fermion N)
    (f.continuous.memLp_of_hasCompactSupport f.hasCompactSupport)

theorem core_sub_norm_sq {N : ℕ} (f g : SmoothCore N) :
    ‖coreToL2 f - coreToL2 g‖ ^ 2 = ∫ x, ‖f x - g x‖ ^ 2 := by
  rw [← map_sub]
  exact core_norm_sq (f - g)

/-- Integral-square contraction transported to the actual original L2 norm. -/
theorem normalized_mollified_norm_le {N : ℕ} (φ : ContDiffBump (0 : Boson N))
    (u : Boson N → Fermion N) (hsm : StronglyMeasurable u)
    (h2 : MemLp u 2 volume) (hu : LocallyIntegrable u volume) (hs : HasCompactSupport u) :
    ‖coreToL2 (mollifiedCore (normalizedKernel φ) u hu hs)‖ ≤ ‖h2.toLp u‖ := by
  apply le_of_sq_le_sq _ (norm_nonneg _)
  rw [core_norm_sq, toLp_norm_sq]
  exact normalized_mollified_square_le φ u hsm h2 hu hs

/-- The smooth-core Rellich error in the actual original Hilbert norm. -/
theorem normalized_mollified_core_error {N : ℕ} (φ : ContDiffBump (0 : Boson N))
    (f : SmoothCore N) (hf : LocallyIntegrable (f : Boson N → Fermion N) volume) :
    ‖coreToL2 (mollifiedCore (normalizedKernel φ) f hf f.hasCompactSupport) -
      coreToL2 f‖ ^ 2 ≤
      φ.rOut ^ 2 * ∫ x, ‖fderiv ℝ (f : Boson N → Fermion N) x‖ ^ 2 := by
  rw [core_sub_norm_sq]
  exact normalized_mollified_smooth_error φ f hf

#print axioms toLp_norm_sq
#print axioms core_norm_sq
#print axioms core_sub_norm_sq
#print axioms normalized_mollified_norm_le
#print axioms normalized_mollified_core_error

end
end FCP.BFSSMOLL2C0
