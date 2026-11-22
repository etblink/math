import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessD0d0OriginalNaturalDomainDensity

/-!
MASSLESS-D0e0 — the original massless pointwise Fock multiplier
preserves almost-everywhere convergence of input representatives.

This is an isolated prerequisite for a future maximal-domain closed-
graph argument. It does not assert that the graph is closed, nor prove
a spectrum, self-adjointness, or gauge-domain invariance. No expanded
48-Majorana quantizer reduction is allowed.
-/
set_option autoImplicit false

namespace FCP.BFSSMasslessD0e0
noncomputable section
open OAI
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open MeasureTheory

/-- Any almost-everywhere pointwise convergent original FullL2 sequence
has pointwise massless quantizer outputs converging to the quantizer of
the limit, with no uniform operator-norm bound in the bosonic variable.
The continuity used here is at each fixed configuration x. -/
theorem originalMasslessAction_preserves_ae_tendsto {N : ℕ}
    (M : AlgebraData N) (ψ : ℕ → FullL2 N) (φ : FullL2 N)
    (hψ : ∀ᵐ x ∂(volume : Measure (Boson N)),
      Filter.Tendsto (fun n => (ψ n : Boson N → Fermion N) x)
        Filter.atTop (nhds ((φ : Boson N → Fermion N) x))) :
    ∀ᵐ x ∂(volume : Measure (Boson N)),
      Filter.Tendsto
        (fun n => FCP.BFSSMasslessD0b0.originalMasslessAction M (ψ n) x)
        Filter.atTop
        (nhds (FCP.BFSSMasslessD0b0.originalMasslessAction M φ x)) := by
  filter_upwards [hψ] with x hx
  change Filter.Tendsto
    (fun n => M.quantizeFrequency
      (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) ((ψ n) x))
    Filter.atTop
    (nhds (M.quantizeFrequency
      (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) (φ x)))
  exact ((M.quantizeFrequency
    (FCP.BFSSMasslessM1a.masslessSourceFrequency M x)).continuous.tendsto
      (φ x)).comp hx

/-- The identical original-source continuity assertion for literal
paired SU(2) 48-Majorana Fock algebra data. -/
theorem pairedOriginalMasslessAction_preserves_ae_tendsto
    (ψ : ℕ → FullL2 2) (φ : FullL2 2)
    (hψ : ∀ᵐ x ∂(volume : Measure (Boson 2)),
      Filter.Tendsto (fun n => (ψ n : Boson 2 → Fermion 2) x)
        Filter.atTop (nhds ((φ : Boson 2 → Fermion 2) x))) :
    ∀ᵐ x ∂(volume : Measure (Boson 2)),
      Filter.Tendsto
        (fun n => FCP.BFSSMasslessD0b0.originalMasslessAction
          FCP.BFSSSU2GaugeG1A.pairedAlgebraData (ψ n) x)
        Filter.atTop
        (nhds (FCP.BFSSMasslessD0b0.originalMasslessAction
          FCP.BFSSSU2GaugeG1A.pairedAlgebraData φ x)) :=
  originalMasslessAction_preserves_ae_tendsto
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData ψ φ hψ

#print axioms originalMasslessAction_preserves_ae_tendsto
#print axioms pairedOriginalMasslessAction_preserves_ae_tendsto

end
end FCP.BFSSMasslessD0e0
