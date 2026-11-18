import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C1OriginalCommutatorTraceWitness

/-!
# W0C1 R1 — independent original-Fock witness consumer

Imports only the source-exact original W0C1 module, then verifies its
zero-kernel and witness-injectivity theorems and three original controls.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0C1OriginalCommutatorTraceIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSST1OriginalFockTraceInvariance
open FCP.BFSSP3M4W0C1OriginalCommutatorTraceWitness

private abbrev V := Fermion 2
private abbrev Op := V →L[ℂ] V

theorem originalFockWitness_kernel_zero_consumer (D : Op)
    (hgamma : ∀ p : Source48Label, Commute D (sourceNormalizedGamma p))
    (htrace : originalFockTrace D = 0) : D = 0 :=
  originalFockWitness_kernel_zero D hgamma htrace

theorem originalFockWitnessSignature_injective_consumer :
    Function.Injective originalFockWitnessSignature :=
  originalFockWitnessSignature_injective

example (D : Op)
    (hgamma : ∀ p : Source48Label, Commute D (sourceNormalizedGamma p))
    (htrace : originalFockTrace D = 0) : D = 0 :=
  originalFockWitness_kernel_zero_consumer D hgamma htrace

example (T S : Op)
    (h : originalFockWitnessSignature T = originalFockWitnessSignature S) :
    T = S :=
  originalFockWitnessSignature_injective_consumer h

example :
    originalFockWitnessSignature (0 : Op) =
      ((0 : ℂ), fun _ : Source48Label => (0 : Op)) := by
  simp [originalFockWitnessSignature]

#print axioms originalFockWitness_kernel_zero_consumer
#print axioms originalFockWitnessSignature_injective_consumer

end
end FCP.BFSSP3M4W0C1OriginalCommutatorTraceIndependentConsumer
