import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessD0e0OriginalPointwiseLimitTransfer

/-!
MASSLESS-D0e1a — extract one common subsequence for both
coordinates of an original FullL2 graph-convergent sequence.
Use pinned Mathlib convergence-in-measure and a.e. subsequence results;
no finite-measure assumption, no explicit paired Fock quantizer expansion.
This prepares but does not assert graph closedness.
-/
set_option autoImplicit false

namespace FCP.BFSSMasslessD0e1a
noncomputable section
open OAI
open OAI.BFSSQuantum
open MeasureTheory

/-- Two independently L²-convergent original bosonic FullL2 sequences
possess one strictly increasing common subsequence converging pointwise
almost everywhere in both coordinates. -/
theorem originalFullL2_joint_ae_subsequence {N : ℕ}
    (ψ η : ℕ → FullL2 N) (φ ζ : FullL2 N)
    (hψ : Filter.Tendsto ψ Filter.atTop (nhds φ))
    (hη : Filter.Tendsto η Filter.atTop (nhds ζ)) :
    ∃ ns : ℕ → ℕ, StrictMono ns ∧
      (∀ᵐ x ∂(volume : Measure (Boson N)),
        Filter.Tendsto
          (fun i => (ψ (ns i) : Boson N → Fermion N) x)
          Filter.atTop (nhds ((φ : Boson N → Fermion N) x))) ∧
      (∀ᵐ x ∂(volume : Measure (Boson N)),
        Filter.Tendsto
          (fun i => (η (ns i) : Boson N → Fermion N) x)
          Filter.atTop (nhds ((ζ : Boson N → Fermion N) x))) := by
  obtain ⟨ns, hns, hψae⟩ :=
    (tendstoInMeasure_of_tendsto_Lp hψ).exists_seq_tendsto_ae
  have hηns : Filter.Tendsto (fun i => η (ns i)) Filter.atTop (nhds ζ) :=
    hη.comp hns.tendsto_atTop
  obtain ⟨ms, hms, hηae⟩ :=
    (tendstoInMeasure_of_tendsto_Lp hηns).exists_seq_tendsto_ae
  refine ⟨ns ∘ ms, hns.comp hms, ?_, hηae⟩
  filter_upwards [hψae] with x hx
  exact hx.comp hms.tendsto_atTop

/-- Original SU(2) bosonic configuration and 48-Majorana Fock carrier. -/
theorem pairedOriginalFullL2_joint_ae_subsequence
    (ψ η : ℕ → FullL2 2) (φ ζ : FullL2 2)
    (hψ : Filter.Tendsto ψ Filter.atTop (nhds φ))
    (hη : Filter.Tendsto η Filter.atTop (nhds ζ)) :
    ∃ ns : ℕ → ℕ, StrictMono ns ∧
      (∀ᵐ x ∂(volume : Measure (Boson 2)),
        Filter.Tendsto
          (fun i => (ψ (ns i) : Boson 2 → Fermion 2) x)
          Filter.atTop (nhds ((φ : Boson 2 → Fermion 2) x))) ∧
      (∀ᵐ x ∂(volume : Measure (Boson 2)),
        Filter.Tendsto
          (fun i => (η (ns i) : Boson 2 → Fermion 2) x)
          Filter.atTop (nhds ((ζ : Boson 2 → Fermion 2) x))) :=
  originalFullL2_joint_ae_subsequence ψ η φ ζ hψ hη

#print axioms originalFullL2_joint_ae_subsequence
#print axioms pairedOriginalFullL2_joint_ae_subsequence

end
end FCP.BFSSMasslessD0e1a
