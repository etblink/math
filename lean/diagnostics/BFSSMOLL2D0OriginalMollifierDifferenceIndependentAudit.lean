import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2D0OriginalMollifierDifference

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2D0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLL2A0 FCP.BFSSMOLL2D0
open MeasureTheory

theorem originalSU2MollifierDifferenceAudit
    (k : TestFunction (⊤ : TopologicalSpace.Opens (Boson 2)) ℝ ⊤)
    (u v : Boson 2 → Fermion 2)
    (hu : LocallyIntegrable u volume) (hv : LocallyIntegrable v volume)
    (hsu : HasCompactSupport u) (hsv : HasCompactSupport v) :
    mollifiedCore k (u - v) (hu.sub hv) (hsu.sub hsv) =
      mollifiedCore k u hu hsu - mollifiedCore k v hv hsv :=
  mollifiedCore_sub k u v hu hv hsu hsv

theorem originalSU2DensityBoundAudit (φ : ContDiffBump (0 : Boson 2))
    (u : Boson 2 → Fermion 2) (hsm : StronglyMeasurable u)
    (h2 : MemLp u 2 volume) (hu : LocallyIntegrable u volume) (hs : HasCompactSupport u)
    (f : SmoothCore 2) (hf : LocallyIntegrable (f : Boson 2 → Fermion 2) volume) :
    ‖coreToL2 (mollifiedCore (normalizedKernel φ) u hu hs) - (h2.toLp u : FullL2 2)‖ ≤
      2 * ‖(h2.toLp u : FullL2 2) - coreToL2 f‖ +
      ‖coreToL2 (mollifiedCore (normalizedKernel φ) f hf f.hasCompactSupport) -
        coreToL2 f‖ :=
  normalized_mollified_density_bound φ u hsm h2 hu hs f hf

#print axioms originalSU2MollifierDifferenceAudit
#print axioms originalSU2DensityBoundAudit
end
end FCP.BFSSMOLL2D0Independent
