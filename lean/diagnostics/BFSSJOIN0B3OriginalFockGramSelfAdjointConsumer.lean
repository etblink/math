import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSJOIN0B3OriginalFockGramStarTranspose

/-!
# JOIN-0B3 independent original Fock self-adjoint consumer

The original B1/B2 independent strict diagnostics under lean/diagnostics
are certified consumers but are NOT importable source modules. The
first B3 gate failed solely because it tried importing them as source.

This corrected consumer imports only the cold-built B3 source. It
reuses the EXACT B2-qualified finite-sum proof of Q(-J) = -Q(J)
(B2 green #42947348625, diagnostic blob 1a2e9fd...) locally, and the
already-tested simple Gram-gamma negation simp pattern from B1.
Then it consumes the NEW general B3 source theorem to derive
self-adjointness of i times the original Fock Gram observable.

Original Boson 2 and Fermion 2 only: pointwise bounded Hilbert
operators, not the original FullL2 2 multiplier or source Hamiltonian.
-/
set_option autoImplicit false

namespace FCP.BFSSJOIN0B3OriginalFockGramSelfAdjointConsumer
noncomputable section

open Matrix
open OAI.BFSSQuantum
open FCP.BFSSJOIN0AOriginalBosonFockGaugeCovariance
open FCP.BFSSVLY0BOriginalGramGammaCoefficient
open FCP.BFSSBIL0COriginalFockQuadraticGaugeInvariant
open FCP.BFSSJOIN0B3OriginalFockGramStarTranspose

/-- Local reproduction of the exact separately-qualified B2 diagnostic
finite-sum lemma, needed because diagnostic files are not Lean modules.
The proof body is copied without modification from the accepted
B2 consumer blob 1a2e9fd33c75c80c52cd028d44e02c87c474b18c. -/
private theorem originalColorQuadratic_neg
    (J : Matrix SpinIndex SpinIndex ℝ) :
    originalColorQuadratic (-J) = -originalColorQuadratic J := by
  let F : SpinIndex → SpinIndex →
      (Fermion 2 →L[ℂ] Fermion 2) :=
    fun α β => ∑ A : ColorIndex 2,
      FCP.BFSSSU2GaugeG1A.pairedTheta α A *
      FCP.BFSSSU2GaugeG1A.pairedTheta β A
  change (∑ α : SpinIndex, ∑ β : SpinIndex,
      (((-J) α β : ℝ) : ℂ) • F α β) =
    -(∑ α : SpinIndex, ∑ β : SpinIndex,
      ((J α β : ℝ) : ℂ) • F α β)
  calc
    _ = ∑ α : SpinIndex, ∑ β : SpinIndex,
          -(((J α β : ℝ) : ℂ) • F α β) := by
      apply Finset.sum_congr rfl
      intro α _
      apply Finset.sum_congr rfl
      intro β _
      rw [Matrix.neg_apply, Complex.ofReal_neg]
      exact neg_smul ((J α β : ℝ) : ℂ) (F α β)
    _ = ∑ α : SpinIndex, -(∑ β : SpinIndex,
          ((J α β : ℝ) : ℂ) • F α β) := by
      apply Finset.sum_congr rfl
      intro α _
      rw [Finset.sum_neg_distrib]
    _ = -(∑ α : SpinIndex, ∑ β : SpinIndex,
          ((J α β : ℝ) : ℂ) • F α β) := by
      rw [Finset.sum_neg_distrib]


/-- The source original Gram–gamma map is odd in real B.
The identical simplifier pattern was independently checked by B1's
strict-qualified skew-preservation consumer. -/
private theorem originalGramGammaCoefficient_neg
    (x : Boson 2) (B : GammaMatrix) :
    originalGramGammaCoefficient x (-B) =
      -originalGramGammaCoefficient x B := by
  simp [originalGramGammaCoefficient, mul_neg, neg_mul, smul_neg]

/-- Real-input oddness of the literal original gauge-covariant
Fock Gram observable; no alternative Clifford carrier. -/
private theorem originalFockGramObservable_neg
    (x : Boson 2) (B : GammaMatrix) :
    originalFockGramObservable x (-B) =
      -originalFockGramObservable x B := by
  change originalColorQuadratic
      (originalGramGammaCoefficient x (-B)) =
    -originalColorQuadratic (originalGramGammaCoefficient x B)
  rw [originalGramGammaCoefficient_neg, originalColorQuadratic_neg]

/-- Independently checked genuine pointwise self-adjoint operator
on original Fermion 2 for every source skew 16-by-16 real B. -/
theorem originalFockGramI_isSelfAdjoint
    (x : Boson 2) (B : GammaMatrix) (hB : Bᵀ = -B) :
    IsSelfAdjoint ((Complex.I : ℂ) • originalFockGramObservable x B) := by
  have hstar : star (originalFockGramObservable x B) =
      -(originalFockGramObservable x B) := by
    rw [originalFockGramObservable_star_transpose, hB,
      originalFockGramObservable_neg]
  have hskew : originalFockGramObservable x B ∈
      skewAdjoint (Fermion 2 →L[ℂ] Fermion 2) :=
    (skewAdjoint.mem_iff).2 hstar
  exact IsSelfAdjoint.I_smul_of_mem_skewAdjoint hskew

#print axioms FCP.BFSSJOIN0B3OriginalFockGramStarTranspose.originalFockGramObservable_star_transpose
#print axioms originalFockGramI_isSelfAdjoint

end
end FCP.BFSSJOIN0B3OriginalFockGramSelfAdjointConsumer
