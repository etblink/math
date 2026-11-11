import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSJOIN0B3OriginalFockGramStarTranspose
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSJOIN0B1OriginalGramGammaSkewConsumer
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSJOIN0B2OriginalFockSkewAdjointConsumer

/-!
# JOIN-0B3 independent source-typed self-adjoint Fock consumer

Use separately strict-qualified real Gram–gamma skew preservation
(B1 independent consumer) and original Fock skew-adjointness
(B2 independent consumer), then Mathlib's skew-adjoint/i bridge.

The resulting observable acts on genuine Fermion 2 for EACH Boson 2
configuration. It is not a uniformly bounded original FullL2
multiplier or a BFSS Hamiltonian/spectral self-adjointness theorem.
-/
set_option autoImplicit false

namespace FCP.BFSSJOIN0B3OriginalFockGramSelfAdjointConsumer
noncomputable section

open Matrix
open OAI.BFSSQuantum
open FCP.BFSSJOIN0AOriginalBosonFockGaugeCovariance
open FCP.BFSSVLY0BOriginalGramGammaCoefficient
open FCP.BFSSBIL0COriginalFockQuadraticGaugeInvariant
open FCP.BFSSJOIN0B1OriginalGramGammaSkewConsumer
open FCP.BFSSJOIN0B2OriginalFockSkewAdjointConsumer

/-- A true pointwise self-adjoint operator on the original complex
Fock Hilbert space for every real skew source spinor matrix B. -/
theorem originalFockGramI_isSelfAdjoint
    (x : Boson 2) (B : GammaMatrix) (hB : Bᵀ = -B) :
    IsSelfAdjoint ((Complex.I : ℂ) • originalFockGramObservable x B) := by
  have hG : (originalGramGammaCoefficient x B)ᵀ =
      -(originalGramGammaCoefficient x B) :=
    originalGramGammaCoefficient_preserves_skew x B hB
  have hQ : star (originalColorQuadratic
        (originalGramGammaCoefficient x B)) =
      -(originalColorQuadratic (originalGramGammaCoefficient x B)) :=
    originalColorQuadratic_skewAdjoint
      (originalGramGammaCoefficient x B) hG
  have hskew : originalFockGramObservable x B ∈
      skewAdjoint (Fermion 2 →L[ℂ] Fermion 2) := by
    apply (skewAdjoint.mem_iff).2
    change star (originalColorQuadratic
        (originalGramGammaCoefficient x B)) =
      -(originalColorQuadratic (originalGramGammaCoefficient x B))
    exact hQ
  exact IsSelfAdjoint.I_smul_of_mem_skewAdjoint hskew

#print axioms FCP.BFSSJOIN0B3OriginalFockGramStarTranspose.originalFockGramObservable_star_transpose
#print axioms originalFockGramI_isSelfAdjoint

end
end FCP.BFSSJOIN0B3OriginalFockGramSelfAdjointConsumer
