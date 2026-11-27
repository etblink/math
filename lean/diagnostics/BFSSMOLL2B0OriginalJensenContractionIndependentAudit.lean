import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2B0OriginalJensenContraction

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2B0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLL2A0 FCP.BFSSMOLL2B0
open MeasureTheory

theorem originalSU2TranslationSquareAudit (u : Boson 2 → Fermion 2)
    (hsm : StronglyMeasurable u) (hu : MemLp u 2 volume)
    (μ : Measure (Boson 2)) [IsProbabilityMeasure μ] :
    Integrable (fun z : Boson 2 × Boson 2 => ‖u (z.1 + z.2)‖ ^ 2)
      (volume.prod μ) ∧
    (∫ x : Boson 2, ∫ y : Boson 2, ‖u (x + y)‖ ^ 2 ∂μ) =
      ∫ x : Boson 2, ‖u x‖ ^ 2 :=
  ⟨translation_square_integrable u hsm hu μ, translation_square_integral u hsm hu μ⟩

theorem originalSU2LiteralContractionAudit (φ : ContDiffBump (0 : Boson 2))
    (u : Boson 2 → Fermion 2) (hsm : StronglyMeasurable u)
    (h2 : MemLp u 2 volume) (hu : LocallyIntegrable u volume) (hs : HasCompactSupport u) :
    (∫ x, ‖∫ y, φ.normed volume (x - y) • u y‖ ^ 2) ≤ ∫ x, ‖u x‖ ^ 2 := by
  simpa only [mollifiedCore_apply, normalizedKernel_apply] using
    normalized_mollified_square_le φ u hsm h2 hu hs

#print axioms originalSU2TranslationSquareAudit
#print axioms originalSU2LiteralContractionAudit
end
end FCP.BFSSMOLL2B0Independent
