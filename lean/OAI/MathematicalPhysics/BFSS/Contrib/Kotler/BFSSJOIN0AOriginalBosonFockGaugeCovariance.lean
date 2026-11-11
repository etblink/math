import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSBIL0COriginalFockQuadraticGaugeInvariant
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSVLY0BOriginalGramGammaCoefficient

/-!
# JOIN-0A — source-exact pointwise original BFSS boson/Fock gauge covariance

This gate joins the already qualified BIL-0C original Fock SU(2)
quadratic commutation with VLY-0B original bosonic Gram-gamma
coefficient invariance. The result is on the literal Boson 2 and
Fermion 2 carriers; no direct color-column Kx identity, eigenvalue,
physical FullL2 multiplier, charge-domain symmetry, or spectrum.
-/
set_option autoImplicit false

namespace FCP.BFSSJOIN0AOriginalBosonFockGaugeCovariance
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG4E
open FCP.BFSSBIL0COriginalFockQuadraticGaugeInvariant
open FCP.BFSSVLY0BOriginalGramGammaCoefficient

/-- For any original bosonic configuration and any real source
16×16 coefficient B, an actual bounded operator on original Fermion 2. -/
noncomputable def originalFockGramObservable
    (x : Boson 2) (B : GammaMatrix) : Fermion 2 →L[ℂ] Fermion 2 :=
  originalColorQuadratic (originalGramGammaCoefficient x B)

/-- Genuine original SU2 gauge covariance on boson/Fock pairs, pointwise.
The original bosonic argument transforms by G2A and the Fock vector by
G4E. This is NOT an unbounded physical FullL2 covariance theorem. -/
theorem originalFockGramObservable_gauge_covariant
    (g : GaugeGroup 2) (x : Boson 2) (B : GammaMatrix)
    (v : Fermion 2) :
    fermionGaugeUnitaryHom g (originalFockGramObservable x B v) =
      originalFockGramObservable
        (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv g x) B
          (fermionGaugeUnitaryHom g v) := by
  change fermionGaugeUnitaryHom g
      (originalColorQuadratic (originalGramGammaCoefficient x B) v) =
    originalColorQuadratic
      (originalGramGammaCoefficient
        (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv g x) B)
      (fermionGaugeUnitaryHom g v)
  rw [originalGramGammaCoefficient_gauge_invariant]
  exact originalColorQuadratic_gauge_commutes g
    (originalGramGammaCoefficient x B) v

#print axioms originalFockGramObservable
#print axioms originalFockGramObservable_gauge_covariant

end
end FCP.BFSSJOIN0AOriginalBosonFockGaugeCovariance
