import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSJOIN0AOriginalBosonFockGaugeCovariance
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSJOIN0B1OriginalGramGammaTranspose
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSJOIN0B2OriginalFockQuadraticStarTranspose

/-!
# JOIN-0B3 — original Fock Gram observable star/transpose

Combine the independently strict-qualified JOIN-0A pointwise original
Boson 2 / Fermion 2 observable, JOIN-0B1 original real Gram–gamma
transpose, and JOIN-0B2 true original Fock Hilbert adjoint transpose.

The theorem is valid for ALL real 16×16 source coefficient matrices B.
It neither assumes skewness nor redefines original Majoranas.
Pointwise operators on genuine Fermion 2 only: no uniform FullL2
multiplier, physical supercharge domain, Hamiltonian or spectrum.
-/
set_option autoImplicit false

namespace FCP.BFSSJOIN0B3OriginalFockGramStarTranspose
noncomputable section

open Matrix
open OAI.BFSSQuantum
open FCP.BFSSJOIN0AOriginalBosonFockGaugeCovariance
open FCP.BFSSBIL0COriginalFockQuadraticGaugeInvariant
open FCP.BFSSVLY0BOriginalGramGammaCoefficient
open FCP.BFSSJOIN0B1OriginalGramGammaTranspose
open FCP.BFSSJOIN0B2OriginalFockQuadraticStarTranspose

/-- General genuine original Fock Hilbert-star transport through the
configuration-dependent real Gram–gamma operator, with no skew premise. -/
theorem originalFockGramObservable_star_transpose
    (x : Boson 2) (B : GammaMatrix) :
    star (originalFockGramObservable x B) =
      originalFockGramObservable x (Bᵀ) := by
  change star (originalColorQuadratic
      (originalGramGammaCoefficient x B)) =
    originalColorQuadratic (originalGramGammaCoefficient x (Bᵀ))
  rw [originalColorQuadratic_star_transpose,
    originalGramGammaCoefficient_transpose]

#print axioms originalFockGramObservable_star_transpose

end
end FCP.BFSSJOIN0B3OriginalFockGramStarTranspose
