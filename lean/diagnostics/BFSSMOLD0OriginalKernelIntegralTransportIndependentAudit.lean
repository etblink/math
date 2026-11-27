import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLD0OriginalKernelIntegralTransport

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLD0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLD0
open MeasureTheory

theorem originalSU2KernelDerivativeIntegrableAudit
    (k : TestFunction (⊤ : TopologicalSpace.Opens (Boson 2)) ℝ ⊤)
    (u : Boson 2 → Fermion 2) (hu : LocallyIntegrable u volume)
    (i : SpaceIndex) (A : ColorIndex 2) (x : Boson 2) :
    Integrable (fun y => (fderiv ℝ (k : Boson 2 → ℝ) (x - y)
      (EuclideanSpace.single (i, A) 1)) • u y) volume :=
  kernelDerivative_integrable k u hu i A x

theorem originalSU2KineticTermIntegralAudit (M : AlgebraData 2)
    (a b : SpinIndex) (i : SpaceIndex) (A : ColorIndex 2)
    (k : TestFunction (⊤ : TopologicalSpace.Opens (Boson 2)) ℝ ⊤)
    (u : Boson 2 → Fermion 2) (hu : LocallyIntegrable u volume)
    (hs : HasCompactSupport u) (x : Boson 2) :
    (∫ y, (-Complex.I * (M.gamma i a b : ℂ)) •
      M.theta b A ((fderiv ℝ (k : Boson 2 → ℝ) (x - y)
        (EuclideanSpace.single (i, A) 1)) • u y)) =
      (-Complex.I * (M.gamma i a b : ℂ)) •
        M.theta b A (coordinateDerivative i A (mollifiedCore k u hu hs) x) :=
  kineticTerm_integral M a b i A k u hu hs x

#print axioms originalSU2KernelDerivativeIntegrableAudit
#print axioms originalSU2KineticTermIntegralAudit
end
end FCP.BFSSMOLD0Independent
