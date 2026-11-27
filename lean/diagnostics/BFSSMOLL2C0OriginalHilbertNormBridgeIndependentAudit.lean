import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2C0OriginalHilbertNormBridge

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2C0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLL2A0 FCP.BFSSMOLL2C0
open MeasureTheory

theorem originalSU2HilbertNormAudit (u : Boson 2 → Fermion 2)
    (hu : MemLp u 2 volume) :
    ‖(hu.toLp u : FullL2 2)‖ ^ 2 = ∫ x, ‖u x‖ ^ 2 :=
  toLp_norm_sq u hu

theorem originalSU2HilbertContractionAudit (φ : ContDiffBump (0 : Boson 2))
    (u : Boson 2 → Fermion 2) (hsm : StronglyMeasurable u)
    (h2 : MemLp u 2 volume) (hu : LocallyIntegrable u volume) (hs : HasCompactSupport u) :
    ‖coreToL2 (mollifiedCore (normalizedKernel φ) u hu hs)‖ ≤
      ‖(h2.toLp u : FullL2 2)‖ :=
  normalized_mollified_norm_le φ u hsm h2 hu hs

theorem originalSU2HilbertSmoothErrorAudit (φ : ContDiffBump (0 : Boson 2))
    (f : SmoothCore 2) (hf : LocallyIntegrable (f : Boson 2 → Fermion 2) volume) :
    ‖coreToL2 (mollifiedCore (normalizedKernel φ) f hf f.hasCompactSupport) -
      coreToL2 f‖ ^ 2 ≤
      φ.rOut ^ 2 * ∫ x, ‖fderiv ℝ (f : Boson 2 → Fermion 2) x‖ ^ 2 :=
  normalized_mollified_core_error φ f hf

#print axioms originalSU2HilbertNormAudit
#print axioms originalSU2HilbertContractionAudit
#print axioms originalSU2HilbertSmoothErrorAudit
end
end FCP.BFSSMOLL2C0Independent
