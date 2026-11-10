import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSVLY0AOriginalBosonGramGaugeInvariant
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2RealGammaProbe

/-!
# VLY-0B — original gauge-invariant Gram–gamma coefficient operator

This is a *source-typed* algebraic interface from original Boson 2 to
real original 16 × 16 SpinIndex matrices. It uses the previously
qualified original spatial Gram and exact original nine gamma matrices.

The color-column identity K_x(B) = ∑_A Γ(x_A) B Γ(x_A), all auxiliary
trace-moment formulas, physical Fock operator applications, near-valley
projectors, and original Hamiltonian bounds are separate later gates.
-/
set_option autoImplicit false

namespace FCP.BFSSVLY0BOriginalGramGammaCoefficient
noncomputable section

open scoped BigOperators
open Finset
open OAI.BFSSQuantum
open FCP.BFSSVLY0AOriginalBosonGramGaugeInvariant

/-- Polynomial real 16×16 coefficient map built from the *original*
spatial Gram and actual source gamma matrices. -/
noncomputable def originalGramGammaCoefficient
    (x : Boson 2) (B : GammaMatrix) : GammaMatrix :=
  ∑ i : SpaceIndex, ∑ j : SpaceIndex,
    (originalSpatialGram x i j) •
      (FCP.BFSSGamma9.gamma i * B * FCP.BFSSGamma9.gamma j)

/-- The actual G2A SU(2) action leaves this original real matrix
coefficient unchanged for every source SpinIndex matrix B. -/
theorem originalGramGammaCoefficient_gauge_invariant
    (g : GaugeGroup 2) (x : Boson 2) (B : GammaMatrix) :
    originalGramGammaCoefficient
        (FCP.BFSSSU2GaugeG2A.bosonGaugeEquiv g x) B =
      originalGramGammaCoefficient x B := by
  simp only [originalGramGammaCoefficient,
    originalSpatialGram_gauge_invariant]

#print axioms originalGramGammaCoefficient
#print axioms originalGramGammaCoefficient_gauge_invariant

end
end FCP.BFSSVLY0BOriginalGramGammaCoefficient
