import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2F0OriginalUniformSupport

/-! MOL-L2G0: literal original quadratic charge potential as a continuous
operator field, uniformly bounded on each closed ball. No L2 multiplier
convergence or graph approximation conclusion yet. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2G0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open MeasureTheory

def potentialOperator {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (x : Boson N) : Fermion N →L[ℂ] Fermion N :=
  ∑ i : SpaceIndex, ∑ j : SpaceIndex, ∑ A : ColorIndex N,
    ∑ B : ColorIndex N, ∑ C : ColorIndex N, ∑ b : SpinIndex,
    (((1 / 2 : ℝ) * M.structureConstant A B C * M.gammaTwo i j a b : ℝ) : ℂ) •
      ((coordinate i B x : ℂ) • ((coordinate j C x : ℂ) • M.theta b A))

theorem potentialOperator_apply {N : ℕ} (M : AlgebraData N) (a : SpinIndex)
    (x : Boson N) (v : Fermion N) :
    potentialOperator M a x v =
      ∑ i : SpaceIndex, ∑ j : SpaceIndex, ∑ A : ColorIndex N,
        ∑ B : ColorIndex N, ∑ C : ColorIndex N, ∑ b : SpinIndex,
        (((1 / 2 : ℝ) * M.structureConstant A B C * M.gammaTwo i j a b : ℝ) : ℂ) •
          M.theta b A ((coordinate i B x : ℂ) • ((coordinate j C x : ℂ) • v)) := by
  simp only [potentialOperator, sum_apply, smul_apply, map_smul]

theorem potentialOperator_continuous {N : ℕ} (M : AlgebraData N) (a : SpinIndex) :
    Continuous (potentialOperator M a) := by
  unfold potentialOperator
  apply continuous_finsetSum _
  intro i hi
  apply continuous_finsetSum _
  intro j hj
  apply continuous_finsetSum _
  intro A hA
  apply continuous_finsetSum _
  intro B hB
  apply continuous_finsetSum _
  intro C hC
  apply continuous_finsetSum _
  intro b hb
  have h1 : Continuous (fun x : Boson N => (coordinate i B x : ℂ)) :=
    Complex.ofRealCLM.continuous.comp (coordinate_contDiff i B).continuous
  have h2 : Continuous (fun x : Boson N => (coordinate j C x : ℂ)) :=
    Complex.ofRealCLM.continuous.comp (coordinate_contDiff j C).continuous
  have htheta : Continuous (fun _ : Boson N => M.theta b A) :=
    continuous_const
  have hcoef : Continuous (fun _ : Boson N =>
      (((1 / 2 : ℝ) * M.structureConstant A B C * M.gammaTwo i j a b : ℝ) : ℂ)) :=
    continuous_const
  exact hcoef.smul (h1.smul (h2.smul htheta))

theorem potentialOperator_ball_bound {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (R : ℝ) :
    ∃ K : ℝ, 0 ≤ K ∧ ∀ x ∈ Metric.closedBall (0 : Boson N) R,
      ‖potentialOperator M a x‖ ≤ K := by
  have hc : Continuous (fun x => ‖potentialOperator M a x‖) :=
    (potentialOperator_continuous M a).norm
  obtain ⟨K, hK⟩ := (isCompact_closedBall (0 : Boson N) R).bddAbove_image hc.continuousOn
  refine ⟨max K 0, le_max_right _ _, ?_⟩
  intro x hx
  exact (hK (Set.mem_image_of_mem _ hx)).trans (le_max_left _ _)

theorem potentialOperator_difference_bound {N : ℕ} (M : AlgebraData N)
    (a : SpinIndex) (R : ℝ) :
    ∃ K : ℝ, 0 ≤ K ∧ ∀ x ∈ Metric.closedBall (0 : Boson N) R,
      ∀ v w : Fermion N,
        ‖potentialOperator M a x v - potentialOperator M a x w‖ ≤ K * ‖v - w‖ := by
  obtain ⟨K, hK, hb⟩ := potentialOperator_ball_bound M a R
  refine ⟨K, hK, ?_⟩
  intro x hx v w
  rw [← map_sub]
  exact (potentialOperator M a x).le_of_opNorm_le (hb x hx) (v - w)

#print axioms potentialOperator
#print axioms potentialOperator_apply
#print axioms potentialOperator_continuous
#print axioms potentialOperator_ball_bound
#print axioms potentialOperator_difference_bound

end
end FCP.BFSSMOLL2G0
