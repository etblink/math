import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSVLY0AOriginalBosonGramGaugeInvariant

/-!
# BFSS NORM-0A — original Gram trace and uniform coefficient envelope

Only the original Boson 2, original spatialColor and the already strictly
qualified VLY-0A real Gram matrix enter this source module.
No original Fock/gamma manipulation, physical FullL2 multipliers, or
Hamiltonian/spectral claims.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0AOriginalGramTraceBound
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSVLY0AOriginalBosonGramGaugeInvariant

/-- The trace of the literal original 9-by-9 real spatial Gram matrix. -/
noncomputable def originalGramTrace (x : Boson 2) : ℝ :=
  ∑ i : SpaceIndex, originalSpatialGram x i i

/-- A source coordinate Gram trace is a finite sum of real squares. -/
theorem originalGramTrace_nonneg (x : Boson 2) :
    0 ≤ originalGramTrace x := by
  unfold originalGramTrace
  apply Finset.sum_nonneg
  intro i _
  change 0 ≤ inner ℝ (spatialColor x i) (spatialColor x i)
  exact real_inner_self_nonneg

private theorem originalGram_diag_le_trace
    (x : Boson 2) (i : SpaceIndex) :
    originalSpatialGram x i i ≤ originalGramTrace x := by
  unfold originalGramTrace
  apply Finset.single_le_sum
  · intro j _
    change 0 ≤ inner ℝ (spatialColor x j) (spatialColor x j)
    exact real_inner_self_nonneg
  · exact Finset.mem_univ i

/-- The Gram coefficient is bounded by the entire nonnegative Gram trace.
This uses only true original real inner products, Cauchy–Schwarz and
finite-sum positivity; no source Clifford operator-norm theorem. -/
theorem originalGram_abs_le_trace
    (x : Boson 2) (i j : SpaceIndex) :
    |originalSpatialGram x i j| ≤ originalGramTrace x := by
  have hi : ‖spatialColor x i‖ ^ 2 ≤ originalGramTrace x := by
    simpa only [originalSpatialGram, real_inner_self_eq_norm_sq] using
      originalGram_diag_le_trace x i
  have hj : ‖spatialColor x j‖ ^ 2 ≤ originalGramTrace x := by
    simpa only [originalSpatialGram, real_inner_self_eq_norm_sq] using
      originalGram_diag_le_trace x j
  have hcs := abs_real_inner_le_norm (spatialColor x i) (spatialColor x j)
  have hsq : 0 ≤ (‖spatialColor x i‖ - ‖spatialColor x j‖) ^ 2 := sq_nonneg _
  change |inner ℝ (spatialColor x i) (spatialColor x j)| ≤
    originalGramTrace x
  nlinarith

#print axioms originalGramTrace_nonneg
#print axioms originalGram_abs_le_trace

end
end FCP.BFSSNORM0AOriginalGramTraceBound
