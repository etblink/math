import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E4OriginalWeightedGradientLimitBound
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralWeightedClosureCompactness

/-! Conditional compactness of the original unweighted inputs for uniformly
bounded families of joint native charge and radial weighted core limits. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5E5
noncomputable section

open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSGM5D FCP.BFSSGM5E1 FCP.BFSSGM5E4
open MeasureTheory Filter Topology
open scoped NNReal

/-- The limit inputs of the original jointly convergent invariant core
families form a totally bounded set when all three limit norms are bounded. -/
theorem weightedNativeGraph_totallyBounded (M : AlgebraData 2) (G : M.GaugeData)
    (f : ℕ → ℕ → G.invariantCore)
    (u : ℕ → FullL2 2) (q : ℕ → PiLp 2 (fun _ : SpinIndex => FullL2 2))
    (w : ℕ → FullL2 2) (B Q W : ℝ≥0)
    (hu : ∀ j, Tendsto (fun n => coreToL2 (f j n).val) atTop (𝓝 (u j)))
    (hq : ∀ j, Tendsto (fun n => nativeCoreChargeValue M G (f j n)) atTop (𝓝 (q j)))
    (hw : ∀ j, Tendsto (fun n => radialWeightedCore (f j n).val) atTop (𝓝 (w j)))
    (hB : ∀ j, ‖u j‖ ≤ (B : ℝ)) (hQ : ∀ j, ‖q j‖ ≤ (Q : ℝ))
    (hW : ∀ j, ‖w j‖ ≤ (W : ℝ)) : TotallyBounded (Set.range u) := by
  classical
  have hbasis : coordinateDirection (N := 2) =
      ⇑(EuclideanSpace.basisFun (CoordinateIndex 2) ℝ) := by
    funext p
    simp only [coordinateDirection, EuclideanSpace.basisFun_apply]
  have hgrad (j : ℕ) : ∃ g : PiLp 2 (fun _ : CoordinateIndex 2 => FullL2 2),
      (u j, g, w j) ∈ BFSSSliceSobolev.weightedClosure (F := Fermion 2)
        (volume : Measure (Boson 2)) (EuclideanSpace.basisFun (CoordinateIndex 2) ℝ)
        (fun x : Boson 2 => Real.sqrt ‖x‖) (Real.continuous_sqrt.comp continuous_norm) ∧
      ‖g‖ ^ 2 ≤ (1 / 8 : ℝ) * ‖q j‖ ^ 2 + (2 * M.fermionGrowthConstant) * ‖w j‖ ^ 2 := by
    obtain ⟨g, _, hclosure, hbound⟩ :=
      weightedNativeGraph_gradientLimit_sq_le M G (f j) (u j) (q j) (w j) (hu j) (hq j) (hw j)
    rw [hbasis] at hclosure
    exact ⟨g, hclosure, hbound⟩
  choose g hclosure hbound using hgrad
  have hcoeff : 0 ≤ 2 * M.fermionGrowthConstant :=
    mul_nonneg (by norm_num) M.fermionGrowthConstant_nonneg
  have hfrac : (0 : ℝ) ≤ 1 / 8 := by norm_num
  let S : ℝ := (1 / 8 : ℝ) * (Q : ℝ) ^ 2 + (2 * M.fermionGrowthConstant) * (W : ℝ) ^ 2
  have hS : 0 ≤ S := add_nonneg (mul_nonneg hfrac (sq_nonneg _))
    (mul_nonneg hcoeff (sq_nonneg _))
  let A : ℝ≥0 := ⟨Real.sqrt S, Real.sqrt_nonneg S⟩
  have hA (j : ℕ) : ‖g j‖ ≤ (A : ℝ) :=
    (Real.le_sqrt (norm_nonneg (g j)) hS).2 <| (hbound j).trans <| add_le_add
      (mul_le_mul_of_nonneg_left (pow_le_pow_left₀ (norm_nonneg _) (hQ j) 2) hfrac)
      (mul_le_mul_of_nonneg_left (pow_le_pow_left₀ (norm_nonneg _) (hW j) 2) hcoeff)
  exact BFSSSliceSobolev.weightedClosure_sqrt_radial_totallyBounded
    u g w A B W hclosure hA hB hW

#print axioms weightedNativeGraph_totallyBounded

end
end FCP.BFSSGM5E5
