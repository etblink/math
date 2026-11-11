import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSBIL0COriginalFockQuadraticGaugeInvariant

/-!
# JOIN-0B2 — genuine original Fock quadratic star/transpose

For arbitrary REAL 16×16 source spinor coefficients, the actual Fock
Hilbert adjoint of the accepted BIL-0C quadratic is obtained by matrix
transpose. Only literal G1A self-adjoint Majoranas, the correctly
conjugate-linear complex star, and finite reindexing are used.
No CAR rederivation, Clifford surrogate, physical Hamiltonian,
original FullL2 domain, or spectral claim.

This is independent of pending JOIN-0B1 transpose geometry.
-/
set_option autoImplicit false

namespace FCP.BFSSJOIN0B2OriginalFockQuadraticStarTranspose
noncomputable section

open scoped BigOperators
open Finset Matrix
open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSBIL0COriginalFockQuadraticGaugeInvariant

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

/-- Actual source G1A Majorana Hilbert-star fixedness. -/
private theorem pairedTheta_star (α : SpinIndex) (A : ColorIndex 2) :
    star (pairedTheta α A) = pairedTheta α A := by
  rw [ContinuousLinearMap.star_eq_adjoint]
  exact (pairedTheta_selfAdjoint α A).adjoint_eq

/-- Reversal under Fock Hilbert adjoint, with the ORIGINAL three
color entries (not a generic or substitute Clifford representation). -/
private theorem originalColorPair_star (α β : SpinIndex) :
    star (∑ A : ColorIndex 2, pairedTheta α A * pairedTheta β A) =
      ∑ A : ColorIndex 2, pairedTheta β A * pairedTheta α A := by
  calc
    _ = ∑ A : ColorIndex 2, star (pairedTheta α A * pairedTheta β A) := by
      exact star_sum (Finset.univ : Finset (ColorIndex 2))
        (fun A => pairedTheta α A * pairedTheta β A)
    _ = _ := by
      apply Finset.sum_congr rfl
      intro A _
      rw [star_mul, pairedTheta_star β A, pairedTheta_star α A]

/-- Generic finite REAL weighted Fock star transport, isolated before
instantiation on the full original 16×16 spinor sum. -/
private theorem finiteRealWeightedFockStar
    (J : Matrix SpinIndex SpinIndex ℝ)
    (F : SpinIndex → SpinIndex → FockOp)
    (hF : ∀ α β, star (F α β) = F β α) :
    star (∑ α : SpinIndex, ∑ β : SpinIndex,
        ((J α β : ℝ) : ℂ) • F α β) =
      ∑ α : SpinIndex, ∑ β : SpinIndex,
        ((J β α : ℝ) : ℂ) • F α β := by
  calc
    _ = ∑ α : SpinIndex, star (∑ β : SpinIndex,
          ((J α β : ℝ) : ℂ) • F α β) := by
      exact star_sum (Finset.univ : Finset SpinIndex)
        (fun α => ∑ β : SpinIndex,
          ((J α β : ℝ) : ℂ) • F α β)
    _ = ∑ α : SpinIndex, ∑ β : SpinIndex,
          star (((J α β : ℝ) : ℂ) • F α β) := by
      apply Finset.sum_congr rfl
      intro α _
      exact star_sum (Finset.univ : Finset SpinIndex)
        (fun β => ((J α β : ℝ) : ℂ) • F α β)
    _ = ∑ α : SpinIndex, ∑ β : SpinIndex,
          ((J α β : ℝ) : ℂ) • F β α := by
      apply Finset.sum_congr rfl
      intro α _
      apply Finset.sum_congr rfl
      intro β _
      rw [star_smul, hF α β]
      congr 1
      simp
    _ = _ := by
      rw [Finset.sum_comm]

/-- **JOIN-0B2 root**: the physical original Fock Hilbert adjoint
of every real-coefficient original quadratic equals its coefficient
transpose. NO skew premise and NO altered CAR normalization. -/
theorem originalColorQuadratic_star_transpose
    (J : Matrix SpinIndex SpinIndex ℝ) :
    star (originalColorQuadratic J) =
      originalColorQuadratic (Jᵀ) := by
  unfold originalColorQuadratic
  simpa only [Matrix.transpose_apply] using
    (finiteRealWeightedFockStar J
      (fun α β => ∑ A : ColorIndex 2,
        pairedTheta α A * pairedTheta β A)
      originalColorPair_star)

#print axioms originalColorQuadratic_star_transpose

end
end FCP.BFSSJOIN0B2OriginalFockQuadraticStarTranspose
