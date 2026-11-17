import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0A0OriginalSourceAxisWitness
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3AOriginalCliffordFockGeneratorAxisCrosswalk

/-!
# BFSS × QIT × SCC W0A1 — exact original 48-source real-linear generator transport

Original normalized 48-Majorana donor and active Fock source maps agree
at every literal source label; therefore their REAL-linear 48-coordinate
finite-sum maps agree at every original Source48Vector. The true
Fermion 2 complex continuous-linear Fock operator carrier is preserved.

No complex tensor Clifford-generation theorem, Schur commutant,
trace separation, W0 injectivity, K(A) bracket or physical state claim.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0A1OriginalRealLinearGammaTransport
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSS1V52L9E2
open FCP.BFSSS1V52L9E4
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSOP3AOriginalGeneratorAxisCrosswalk

/-- The actual donor sqrt(2)-normalized 24-mode Fock Majorana at
every literal original 48-label equals the active indexed generator.
No CAR expansion or source operator unification is assumed. -/
theorem originalNormalized_allSourceLabel_eq_activeGamma
    (p : Source48Label) :
    originalNormalizedFockMajorana
        (sourceBlockColorEquiv.symm p).1
        (sourceBlockColorEquiv.symm p).2 =
      sourceNormalizedGamma p := by
  let q : RealSpinBlock × ColorLabel := sourceBlockColorEquiv.symm p
  have hlabel : sourceBlockColorLabel q.1 q.2 = p := by
    change sourceBlockColorEquiv q = p
    exact sourceBlockColorEquiv.apply_symm_apply p
  simpa only [hlabel] using
    (donor_normalized_eq_active_source_axis q.1.1 q.1.2 q.2)

/-- The exact original qualified M2 donor gamma and active
source-normalized gamma agree as REAL-linear maps on EVERY original
48-real source vector. Their finite sums are matched termwise. -/
theorem originalFockGammaRealLinear_eq_sourceGammaRealLinear :
    FCP.BFSSS1V52L9E4.originalFockGammaRealLinear =
      FCP.BFSSSource48RealLinearGamma.sourceGammaRealLinear := by
  apply LinearMap.ext
  intro v
  change (∑ p : Source48Label,
      (v p) • originalNormalizedFockMajorana
        (sourceBlockColorEquiv.symm p).1
        (sourceBlockColorEquiv.symm p).2) =
    ∑ p : Source48Label, (v p) • sourceNormalizedGamma p
  apply Finset.sum_congr rfl
  intro p hp
  rw [originalNormalized_allSourceLabel_eq_activeGamma p]

#print axioms originalNormalized_allSourceLabel_eq_activeGamma
#print axioms originalFockGammaRealLinear_eq_sourceGammaRealLinear

end
end FCP.BFSSP3M4W0A1OriginalRealLinearGammaTransport
