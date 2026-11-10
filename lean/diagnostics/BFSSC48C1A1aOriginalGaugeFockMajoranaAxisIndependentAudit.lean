import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1aOriginalGaugeFockMajoranaAxisCovariance

/-!
Independent C48-1A1a audit: actual G4E original Fermion 2 unitary,
actual G1A paired 48 source-coordinate basis, true active gamma,
and original G3A output-row/input-column color coefficients.

Consume the exact source theorem in reverse and at a completely
arbitrary original 48-label index. No source all-vector matrix action
or physical gauge-fixed subspace is inferred.
-/

set_option autoImplicit false

namespace FCP.BFSSC48C1A1aOriginalGaugeFockMajoranaAxisIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSC48C1A1aOriginalGaugeFockMajoranaAxisCovariance

/-- Reverse equation fixes the color-row/output order independently. -/
theorem originalGaugeUnitary_originalAxis_reverse
    (q : GaugeGroup 2) (j : Fin 8) (s : Fin 2)
    (A : ColorIndex 2) (ψ : Fermion 2) :
    (∑ B : ColorIndex 2,
        (FCP.BFSSSU2GaugeG3A.adjointColorMatrix q B A : ℂ) •
          (sourceGammaRealLinear (sourceBlockColorAxis (j,s) B)
            (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ))) =
      FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q
        (sourceGammaRealLinear (sourceBlockColorAxis (j,s) A) ψ) :=
  (originalGaugeUnitary_sourceGammaAxis_covariant q j s A ψ).symm

/-- The original G1A label crosswalk is surjective; this exact
consumer checks the gate at any literal Source48Label, without
silently identifying that label with an arbitrary Fin 48 order. -/
theorem originalGaugeUnitary_originalSource48Label
    (q : GaugeGroup 2) (p : Source48Label) (ψ : Fermion 2) :
    FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q
      (sourceGammaRealLinear
        (sourceBlockColorAxis
          (FCP.BFSSS1V5.sourceBlockColorEquiv.symm p).1
          (FCP.BFSSS1V5.sourceBlockColorEquiv.symm p).2) ψ) =
    ∑ B : ColorIndex 2,
      (FCP.BFSSSU2GaugeG3A.adjointColorMatrix q B
        (FCP.BFSSS1V5.sourceBlockColorEquiv.symm p).2 : ℂ) •
        (sourceGammaRealLinear
          (sourceBlockColorAxis
            (FCP.BFSSS1V5.sourceBlockColorEquiv.symm p).1 B)
            (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ)) := by
  -- Name and destruct the genuine original G1A index crosswalk
  -- before instantiating the source theorem; avoid deep reducible
  -- nested projections during elaboration.
  generalize hlabel :
    FCP.BFSSS1V5.sourceBlockColorEquiv.symm p = label
  rcases label with ⟨⟨j, s⟩, A⟩
  exact originalGaugeUnitary_sourceGammaAxis_covariant q j s A ψ

#print axioms FCP.BFSSC48C1A1aOriginalGaugeFockMajoranaAxisCovariance.sourceGammaAxis_eq_originalGaugeTheta
#print axioms FCP.BFSSC48C1A1aOriginalGaugeFockMajoranaAxisCovariance.originalGaugeUnitary_sourceGammaAxis_covariant
#print axioms originalGaugeUnitary_originalAxis_reverse
#print axioms originalGaugeUnitary_originalSource48Label

end
end FCP.BFSSC48C1A1aOriginalGaugeFockMajoranaAxisIndependentAudit
