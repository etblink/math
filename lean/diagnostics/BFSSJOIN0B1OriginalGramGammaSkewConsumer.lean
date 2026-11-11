import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSJOIN0B1OriginalGramGammaTranspose

/-!
# JOIN-0B1 independent skew-carrier consumer

A nontrivial downstream use of the general transpose source theorem:
the source-qualified original Gram–gamma map preserves the full real
skew subspace of original 16×16 SpinIndex matrices. This neither
constructs a Fock-star observable nor proves a physical spectrum.
-/
set_option autoImplicit false

namespace FCP.BFSSJOIN0B1OriginalGramGammaSkewConsumer
noncomputable section

open Matrix
open OAI.BFSSQuantum
open FCP.BFSSVLY0BOriginalGramGammaCoefficient
open FCP.BFSSJOIN0B1OriginalGramGammaTranspose

theorem originalGramGammaCoefficient_preserves_skew
    (x : Boson 2) (B : GammaMatrix) (hB : Bᵀ = -B) :
    (originalGramGammaCoefficient x B)ᵀ =
      -(originalGramGammaCoefficient x B) := by
  rw [originalGramGammaCoefficient_transpose, hB]
  simp [originalGramGammaCoefficient, mul_neg, neg_mul, smul_neg]

#print axioms FCP.BFSSJOIN0B1OriginalGramGammaTranspose.originalGramGammaCoefficient_transpose
#print axioms originalGramGammaCoefficient_preserves_skew

end
end FCP.BFSSJOIN0B1OriginalGramGammaSkewConsumer
