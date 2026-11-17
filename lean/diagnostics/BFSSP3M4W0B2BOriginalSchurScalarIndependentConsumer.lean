import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0B2BOriginalSchurScalarCommutant

/-!
# W0B2B R1 independent original Fock Schur scalar consumer

Uses the original source as a separate import and applies its exact
Schur uniqueness conclusions to the original Fermion 2 carrier.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0B2BOriginalSchurScalarIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSS1V52M3B
open FCP.BFSSP3M4W0B2AOriginalCliffordModuleEndBridge
open FCP.BFSSP3M4W0B2BOriginalSchurScalarCommutant

private abbrev A := CliffordAlgebra (source48Quadratic.baseChange ℂ)
private abbrev V := Fermion 2
private abbrev Op := V →L[ℂ] V

local instance : Module A V := originalComplexCliffordFockModule
local instance : IsScalarTower ℂ A V := originalComplexCliffordFockModule_scalarTower

theorem originalFockClifford_scalar_moduleEnd_unique_consumer
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p)) :
    ∃! z : ℂ, algebraMap ℂ (Module.End A V) z =
      originalFockClifford_moduleEnd T h :=
  originalFockClifford_scalar_moduleEnd_unique T h

theorem originalFockClifford_scalar_pointwise_unique_consumer
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p)) :
    ∃! z : ℂ, ∀ v : V, T v = z • v :=
  originalFockClifford_scalar_pointwise_unique T h

theorem originalFockClifford_scalar_operator_unique_consumer
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p)) :
    ∃! z : ℂ, T = z • (1 : Op) :=
  originalFockClifford_scalar_operator_unique T h

example (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p)) :
    ∃ z : ℂ, T = z • (1 : Op) := by
  obtain ⟨z, hz, _⟩ := originalFockClifford_scalar_operator_unique_consumer T h
  exact ⟨z, hz⟩

example (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p)) :
    ∃ z : ℂ, ∀ v : V, T v = z • v := by
  obtain ⟨z, hz, _⟩ := originalFockClifford_scalar_pointwise_unique_consumer T h
  exact ⟨z, hz⟩

example (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p)) :
    ∃ z : ℂ, algebraMap ℂ (Module.End A V) z =
      originalFockClifford_moduleEnd T h := by
  obtain ⟨z, hz, _⟩ := originalFockClifford_scalar_moduleEnd_unique_consumer T h
  exact ⟨z, hz⟩

#print axioms originalFockClifford_scalar_moduleEnd_unique_consumer
#print axioms originalFockClifford_scalar_pointwise_unique_consumer
#print axioms originalFockClifford_scalar_operator_unique_consumer

end
end FCP.BFSSP3M4W0B2BOriginalSchurScalarIndependentConsumer
