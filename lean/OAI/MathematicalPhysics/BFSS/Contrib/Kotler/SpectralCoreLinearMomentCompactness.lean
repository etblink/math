import OAI.MathematicalPhysics.BFSS.WeightedGradients
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralLinearMomentCompactness

/-! Smooth-core local compactness from the original gradient and L2 norms,
and global compactness from an additional first radial moment. These analysis
statements supply neither an energy estimate nor a physical closed operator. -/

set_option autoImplicit false

namespace OAI.BFSSSliceSobolev
noncomputable section
open MeasureTheory Set Filter Topology
open scoped NNReal

variable {ι F J : Type*} [Fintype ι] [NormedAddCommGroup F]
  [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]
local notation "X" => EuclideanSpace ℝ ι
local notation "μ" => (volume : Measure X)
local notation "e" => (EuclideanSpace.basisFun ι ℝ)

theorem core_gradient_l2_local_totallyBounded (f : J → Core (E := X) (F := F))
    (A B : ℝ≥0)
    (hA : ∀ j, ‖gradient μ e (f j)‖ ≤ A)
    (hB : ∀ j, ‖toL2 μ (f j)‖ ≤ B)
    (R : ℝ) (hR : 0 < R) :
    TotallyBounded (range (fun j => BFSSRellich.localLp
      (K := Metric.closedBall (0 : X) R) (f j) (f j).continuous)) := by
  classical
  let D : ℝ≥0 := (Fintype.card ι + 1) * A
  have hder (j : J) : (∫ x : X, ‖fderiv ℝ (f j : X → F) x‖^2) ≤ (D : ℝ)^2 := by
    calc
      _ ≤ ∫ x : X, (Fintype.card ι : ℝ) * ∑ k, ‖fderiv ℝ (f j : X → F) x (e k)‖^2 := by
        apply integral_mono (op_derivative_sq_integrable μ (f j))
          ((integrable_finsetSum _ (fun k _ => derivative_sq_integrable μ (f j) (e k))).const_mul _)
        intro x
        simpa only [EuclideanSpace.basisFun_apply] using
          BFSSRellich.opNorm_sq_le_coordinate_sum (ι := ι) (fderiv ℝ (f j : X → F) x)
      _ = (Fintype.card ι : ℝ) * ‖gradient μ e (f j)‖^2 := by
        rw [integral_const_mul, gradient_norm_sq]
      _ ≤ (Fintype.card ι : ℝ) * (A : ℝ)^2 :=
        mul_le_mul_of_nonneg_left (pow_le_pow_left₀ (norm_nonneg _) (hA j) 2) (by positivity)
      _ ≤ (D : ℝ)^2 := by
        change (Fintype.card ι : ℝ) * (A : ℝ)^2 ≤
          (((Fintype.card ι : ℝ) + 1) * (A : ℝ))^2
        nlinarith [sq_nonneg ((Fintype.card ι : ℝ) * (A : ℝ)),
          mul_nonneg (Nat.cast_nonneg (α := ℝ) (Fintype.card ι)) (sq_nonneg (A : ℝ))]
  have hnorm (j : J) : (∫ x : X, ‖f j x‖^2) ≤ (B : ℝ)^2 := by
    rw [←toL2_norm_sq]
    exact pow_le_pow_left₀ (norm_nonneg _) (hB j) 2
  let φ : ContDiffBump (0 : X) := ⟨R, 2 * R, hR, by linarith⟩
  apply BFSSRellich.localRellich_on φ (fun _ hx => hx) (fun j => (f j : X → F))
    (fun j => (f j).contDiff.of_le (by simp)) D B
  · intro j
    exact (setIntegral_le_integral (op_derivative_sq_integrable μ (f j))
      (Eventually.of_forall (fun x => sq_nonneg _))).trans (hder j)
  · intro j
    exact (setIntegral_le_integral
      ((f j).continuous.norm.pow 2 |>.integrable_of_hasCompactSupport
        (norm_sq_compact (f j) (f j).hasCompactSupport))
      (Eventually.of_forall (fun x => sq_nonneg _))).trans (hnorm j)

theorem core_linear_moment_totallyBounded (f : J → Core (E := X) (F := F))
    (A B C : ℝ≥0)
    (hA : ∀ j, ‖gradient μ e (f j)‖ ≤ A)
    (hB : ∀ j, ‖toL2 μ (f j)‖ ≤ B)
    (hC : ∀ j, (∫ x : X, ‖x‖ * ‖f j x‖^2) ≤ (C : ℝ)) :
    TotallyBounded (range (fun j => toL2 μ (f j))) := by
  have hlocal (R : ℝ) (hR : 0 < R) :=
    core_gradient_l2_local_totallyBounded f A B hA hB R hR
  have ht := BFSSRellich.linear_moment_tight_compactness (fun j => (f j : X → F))
    (fun j => (f j).continuous) (fun j => (f j).hasCompactSupport) C hC hlocal
  have he (j : J) : toL2 μ (f j) =
      BFSSRellich.compactLp (f j) (f j).continuous (f j).hasCompactSupport := rfl
  simpa only [←he] using ht

end
end OAI.BFSSSliceSobolev

#print axioms OAI.BFSSSliceSobolev.core_gradient_l2_local_totallyBounded
#print axioms OAI.BFSSSliceSobolev.core_linear_moment_totallyBounded
#eval IO.println "SPECTRAL_CORE_LINEAR_MOMENT_SOURCE_OK"
