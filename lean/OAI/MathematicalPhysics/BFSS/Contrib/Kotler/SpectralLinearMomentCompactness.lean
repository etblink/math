import OAI.MathematicalPhysics.BFSS.WeightedCompactness

/-! Linear radial moments give uniform cutoff approximation and global L2 tightness.
This analysis module assumes local total boundedness; it supplies no BFSS coercivity,
symmetry action, physical-sector reduction, or Hamiltonian identification. -/

set_option autoImplicit false

namespace OAI.BFSSRellich
noncomputable section
open MeasureTheory Set
open scoped NNReal

variable {ι H : Type*} [Fintype ι] [NormedAddCommGroup H]
  [InnerProductSpace ℝ H]

lemma compactLp_bump_error_linear (φ : ContDiffBump (0 : EuclideanSpace ℝ ι))
    (f : EuclideanSpace ℝ ι → H) (hf : Continuous f) (hF : HasCompactSupport f) :
    φ.rIn * dist (compactLp f hf hF)
      (compactLp (fun x => φ x • f x) (φ.continuous.smul hf) hF.smul_left)^2 ≤
      ∫ x, ‖x‖ * ‖f x‖^2 := by
  rw [compactLp_dist_square, ←integral_const_mul]
  have hi := BFSSNormalMeasure.square_integrable (μ := volume) _
    (hf.sub (φ.continuous.smul hf)) (hF.sub hF.smul_left)
  have hg : Integrable (fun x => ‖x‖ * ‖f x‖^2) :=
    (continuous_norm.mul (hf.norm.pow 2)).integrable_of_hasCompactSupport
      (BFSSNormalMeasure.square_compact f hF).mul_left
  apply integral_mono (hi.const_mul _) hg
  intro x
  change φ.rIn * ‖f x - φ x • f x‖^2 ≤ ‖x‖ * ‖f x‖^2
  by_cases hx : ‖x‖ ≤ φ.rIn
  · have heq := φ.one_of_mem_closedBall (by simpa using hx)
    simp [heq]
    positivity
  · have hxr : φ.rIn ≤ ‖x‖ := le_of_not_ge hx
    have he : f x - φ x • f x = (1 - φ x) • f x := by rw [sub_smul, one_smul]
    rw [he, norm_smul, Real.norm_eq_abs,
      abs_of_nonneg (sub_nonneg.mpr φ.le_one), mul_pow]
    have hs : (1 - φ x)^2 ≤ 1 := by
      nlinarith [φ.nonneg (x := x), φ.le_one (x := x)]
    have hb : (1 - φ x)^2 * ‖f x‖^2 ≤ ‖f x‖^2 := by
      simpa only [one_mul] using mul_le_mul_of_nonneg_right hs (sq_nonneg ‖f x‖)
    calc
      φ.rIn * ((1 - φ x)^2 * ‖f x‖^2) ≤ φ.rIn * ‖f x‖^2 :=
        mul_le_mul_of_nonneg_left hb φ.rIn_pos.le
      _ ≤ _ := mul_le_mul_of_nonneg_right hxr (sq_nonneg _)

theorem linear_moment_tight_compactness {J : Type*}
    (u : J → EuclideanSpace ℝ ι → H) (hu : ∀ j, Continuous (u j))
    (hU : ∀ j, HasCompactSupport (u j)) (C : ℝ≥0)
    (hmoment : ∀ j, (∫ x, ‖x‖ * ‖u j x‖^2) ≤ (C : ℝ))
    (hlocal : ∀ R : ℝ, 0 < R → TotallyBounded (range (fun j =>
      localLp (K := Metric.closedBall 0 R) (u j) (hu j)))) :
    TotallyBounded (range (fun j => compactLp (u j) (hu j) (hU j))) := by
  classical
  apply totallyBounded_of_uniform_approximation
  intro ε hε
  let R : ℝ := ((C : ℝ) + 1) / ε^2
  have hR : 0 < R := div_pos (by positivity) (sq_pos_of_pos hε)
  let φ : ContDiffBump (0 : EuclideanSpace ℝ ι) := ⟨R, 2 * R, hR, by linarith⟩
  let g : J → Lp H 2 (volume : Measure (EuclideanSpace ℝ ι)) := fun j =>
    compactLp (fun x => φ x • u j x) (φ.continuous.smul (hu j)) (hU j).smul_left
  have hgb : TotallyBounded (range g) :=
    bump_family_totallyBounded φ u hu hU (hlocal φ.rOut φ.rOut_pos)
  refine ⟨g, hgb, ?_⟩
  intro j
  have he := (compactLp_bump_error_linear φ (u j) (hu j) (hU j)).trans (hmoment j)
  change R * dist (compactLp (u j) (hu j) (hU j)) (g j)^2 ≤ (C : ℝ) at he
  have hre : R * ε^2 = (C : ℝ) + 1 := div_mul_cancel₀ _ (sq_pos_of_pos hε).ne'
  by_contra hh
  have hd : ε ≤ dist (compactLp (u j) (hu j) (hU j)) (g j) := le_of_not_gt hh
  have hsq := pow_le_pow_left₀ hε.le hd 2
  have hb := mul_le_mul_of_nonneg_left hsq hR.le
  linarith

end
end OAI.BFSSRellich

#print axioms OAI.BFSSRellich.compactLp_bump_error_linear
#print axioms OAI.BFSSRellich.linear_moment_tight_compactness
#eval IO.println "SPECTRAL_LINEAR_MOMENT_SOURCE_OK"
