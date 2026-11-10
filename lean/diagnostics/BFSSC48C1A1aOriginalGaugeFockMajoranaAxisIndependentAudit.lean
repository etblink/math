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

/-- For EVERY genuine original Source48Label p, use the S1V5 bijection
to exhibit an exact (j,s,A) preimage and the actual G4H
gauge-unitary source Majorana covariance at that index.

Equivalent to the previous equation written using
sourceBlockColorEquiv.symm p, but deliberately keeps that
reducible inverse packing OUT of the large Fock-operator goal.
The proof uses the original source equivalence, not Fin 48
or a new gauge representation. -/
theorem originalGaugeUnitary_originalSource48Label
    (q : GaugeGroup 2) (p : Source48Label) (ψ : Fermion 2) :
    ∃ (j : Fin 8) (s : Fin 2) (A : ColorIndex 2),
      sourceBlockColorLabel (j, s) A = p ∧
        FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q
          (sourceGammaRealLinear
            (sourceBlockColorAxis (j, s) A) ψ) =
        ∑ B : ColorIndex 2,
          (FCP.BFSSSU2GaugeG3A.adjointColorMatrix q B A : ℂ) •
            (sourceGammaRealLinear
              (sourceBlockColorAxis (j, s) B)
                (FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q ψ)) := by
  obtain ⟨⟨⟨j, s⟩, A⟩, hp⟩ :=
    FCP.BFSSS1V5.sourceBlockColorEquiv.surjective p
  refine ⟨j, s, A, ?_, ?_⟩
  · change FCP.BFSSS1V5.sourceBlockColorEquiv ((j, s), A) = p
    exact hp
  · exact originalGaugeUnitary_sourceGammaAxis_covariant q j s A ψ

#print axioms FCP.BFSSC48C1A1aOriginalGaugeFockMajoranaAxisCovariance.sourceGammaAxis_eq_originalGaugeTheta
#print axioms FCP.BFSSC48C1A1aOriginalGaugeFockMajoranaAxisCovariance.originalGaugeUnitary_sourceGammaAxis_covariant
#print axioms originalGaugeUnitary_originalAxis_reverse
#print axioms originalGaugeUnitary_originalSource48Label

end
end FCP.BFSSC48C1A1aOriginalGaugeFockMajoranaAxisIndependentAudit
