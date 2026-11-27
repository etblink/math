import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLA0OriginalMollifiedCore

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLA0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open MeasureTheory
open FCP.BFSSMOLA0

/-- Independent literal source carrier and integral, before specialization. -/
theorem originalMollifiedCoreAudit {N : ℕ}
    (k : TestFunction (⊤ : TopologicalSpace.Opens (Boson N)) ℝ ⊤)
    (u : Boson N → Fermion N) (hu : LocallyIntegrable u volume)
    (hs : HasCompactSupport u) :
    ∃ f : SmoothCore N, ∀ x : Boson N, f x = ∫ y, k (x - y) • u y :=
  ⟨mollifiedCore k u hu hs, mollifiedCore_apply k u hu hs⟩

/-- Independently spell out the original SU2 coordinate derivative. -/
theorem originalSU2MollifiedDerivativeAudit
    (k : TestFunction (⊤ : TopologicalSpace.Opens (Boson 2)) ℝ ⊤)
    (u : Boson 2 → Fermion 2) (hu : LocallyIntegrable u volume)
    (hs : HasCompactSupport u) (i : SpaceIndex) (A : ColorIndex 2) (x : Boson 2) :
    coordinateDerivative i A (mollifiedCore k u hu hs) x =
      ∫ y, (fderiv ℝ (k : Boson 2 → ℝ) (x - y)
        (EuclideanSpace.single (i, A) 1)) • u y :=
  mollifiedCore_coordinateDerivative k u hu hs i A x

#print axioms originalMollifiedCoreAudit
#print axioms originalSU2MollifiedDerivativeAudit
end
end FCP.BFSSMOLA0Independent
