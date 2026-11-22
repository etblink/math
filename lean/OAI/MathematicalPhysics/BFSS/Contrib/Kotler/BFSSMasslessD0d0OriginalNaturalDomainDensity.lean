import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessD0c1PairedNamedActionAdapter

/-!
MASSLESS-D0d0 — density of the exact original massless multiplier domain.
Reuses the frozen original smooth-core dense-range theorem and the
independently accepted D0b0 smooth-core inclusion. Specializes to the
literal paired SU(2) 48-Majorana source only after the generic proof.
Does NOT prove graph closedness, self-adjointness, gauge-domain
invariance, spectral properties, or a normalizable physical state.
-/
set_option autoImplicit false

namespace FCP.BFSSMasslessD0d0
noncomputable section
open OAI
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open MeasureTheory

/-- The natural original full-L² domain of the partial massless multiplier
is dense because it contains the original dense smooth compact core. -/
theorem originalMasslessDomain_dense {N : ℕ} (M : AlgebraData N) :
    Dense (FCP.BFSSMasslessD0b0.originalMasslessDomain M :
      Set (FullL2 N)) := by
  apply (coreToL2_dense (N := N)).mono
  rintro ψ ⟨f, rfl⟩
  exact FCP.BFSSMasslessD0b0.originalCore_mem_originalMasslessDomain M f

/-- Literal paired SU(2) 48-Majorana source, not a replacement Fock model. -/
theorem pairedOriginalMasslessDomain_dense :
    Dense (FCP.BFSSMasslessD0b0.originalMasslessDomain
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData :
      Set (FullL2 2)) :=
  originalMasslessDomain_dense FCP.BFSSSU2GaugeG1A.pairedAlgebraData

#print axioms originalMasslessDomain_dense
#print axioms pairedOriginalMasslessDomain_dense

end
end FCP.BFSSMasslessD0d0
