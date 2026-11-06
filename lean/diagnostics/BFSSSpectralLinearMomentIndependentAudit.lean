import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralLinearMomentCompactness

/-! Independent exact-type consumers, including the original SU(2) Hilbert aliases.
No physical-sector or spectral conclusion is asserted. -/

set_option autoImplicit false

noncomputable section
open MeasureTheory Set OAI.BFSSRellich
open scoped NNReal

variable {ι H J : Type*} [Fintype ι] [NormedAddCommGroup H]
  [InnerProductSpace ℝ H]

-- Exact linear cutoff estimate: the radius is not squared.
example (φ : ContDiffBump (0 : EuclideanSpace ℝ ι))
    (f : EuclideanSpace ℝ ι → H) (hf : Continuous f) (hF : HasCompactSupport f) :
    φ.rIn * dist (compactLp f hf hF)
      (compactLp (fun x => φ x • f x) (φ.continuous.smul hf) hF.smul_left)^2 ≤
      ∫ x, ‖x‖ * ‖f x‖^2 :=
  compactLp_bump_error_linear φ f hf hF

-- Arbitrary indexed families with a uniform first radial moment.
example (u : J → EuclideanSpace ℝ ι → H) (hu : ∀ j, Continuous (u j))
    (hU : ∀ j, HasCompactSupport (u j)) (C : ℝ≥0)
    (hm : ∀ j, (∫ x, ‖x‖ * ‖u j x‖^2) ≤ (C : ℝ))
    (hl : ∀ R : ℝ, 0 < R → TotallyBounded (range (fun j =>
      localLp (K := Metric.closedBall 0 R) (u j) (hu j)))) :
    TotallyBounded (range (fun j => compactLp (u j) (hu j) (hU j))) :=
  linear_moment_tight_compactness u hu hU C hm hl

-- The sequence interface needed for later form-compactness work.
example (u : ℕ → EuclideanSpace ℝ ι → H) (hu : ∀ n, Continuous (u n))
    (hU : ∀ n, HasCompactSupport (u n)) (C : ℝ≥0)
    (hm : ∀ n, (∫ x, ‖x‖ * ‖u n x‖^2) ≤ (C : ℝ))
    (hl : ∀ R : ℝ, 0 < R → TotallyBounded (range (fun n =>
      localLp (K := Metric.closedBall 0 R) (u n) (hu n)))) :
    TotallyBounded (range (fun n => compactLp (u n) (hu n) (hU n))) :=
  linear_moment_tight_compactness u hu hU C hm hl

-- Increasing a valid moment bound requires no quadratic-moment hypothesis.
example (u : J → EuclideanSpace ℝ ι → H) (hu : ∀ j, Continuous (u j))
    (hU : ∀ j, HasCompactSupport (u j)) (C D : ℝ≥0) (hCD : C ≤ D)
    (hm : ∀ j, (∫ x, ‖x‖ * ‖u j x‖^2) ≤ (C : ℝ))
    (hl : ∀ R : ℝ, 0 < R → TotallyBounded (range (fun j =>
      localLp (K := Metric.closedBall 0 R) (u j) (hu j)))) :
    TotallyBounded (range (fun j => compactLp (u j) (hu j) (hU j))) := by
  apply linear_moment_tight_compactness u hu hU D _ hl
  intro j
  exact (hm j).trans (by exact_mod_cast hCD)

open OAI.BFSSQuantum

-- The cutoff estimate consumes the original SU(2) Boson/Fermion definitions.
example (φ : ContDiffBump (0 : Boson 2)) (f : Boson 2 → Fermion 2)
    (hf : Continuous f) (hF : HasCompactSupport f) :
    φ.rIn * dist (compactLp f hf hF)
      (compactLp (fun x => φ x • f x) (φ.continuous.smul hf) hF.smul_left)^2 ≤
      ∫ x, ‖x‖ * ‖f x‖^2 :=
  compactLp_bump_error_linear φ f hf hF

-- The global conclusion has the exact original FullL2 2 carrier.
example (u : J → Boson 2 → Fermion 2) (hu : ∀ j, Continuous (u j))
    (hU : ∀ j, HasCompactSupport (u j)) (C : ℝ≥0)
    (hm : ∀ j, (∫ x, ‖x‖ * ‖u j x‖^2) ≤ (C : ℝ))
    (hl : ∀ R : ℝ, 0 < R → TotallyBounded (range (fun j =>
      localLp (K := Metric.closedBall 0 R) (u j) (hu j)))) :
    TotallyBounded (range (fun j => (compactLp (u j) (hu j) (hU j) : FullL2 2))) :=
  linear_moment_tight_compactness u hu hU C hm hl

#print axioms OAI.BFSSRellich.compactLp_bump_error_linear
#print axioms OAI.BFSSRellich.linear_moment_tight_compactness
#eval IO.println "SPECTRAL_LINEAR_MOMENT_AUDIT_OK"
