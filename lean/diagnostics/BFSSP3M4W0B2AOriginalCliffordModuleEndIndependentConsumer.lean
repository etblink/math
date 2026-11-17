import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0B2AOriginalCliffordModuleEndBridge

/-!
# W0B2A — independent original `Fermion 2` module-end consumer

Only imports the new original source module. The theorem calls and
three controls use the actual original Clifford-module action.
-/ 

set_option autoImplicit false

namespace FCP.BFSSP3M4W0B2AOriginalCliffordModuleEndIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSS1V52M3B
open FCP.BFSSP3M4W0B2AOriginalCliffordModuleEndBridge

private abbrev A := CliffordAlgebra (source48Quadratic.baseChange ℂ)
private abbrev V := Fermion 2
private abbrev Op := V →L[ℂ] V

local instance : Module A V := originalComplexCliffordFockModule
local instance : IsScalarTower ℂ A V := originalComplexCliffordFockModule_scalarTower

theorem originalFockClifford_module_smul_consumer
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (a : A) (v : V) :
    T (a • v) = a • T v :=
  originalFockClifford_module_smul T h a v

theorem originalFockClifford_moduleEnd_apply_consumer
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (v : V) :
    originalFockClifford_moduleEnd T h v = T v :=
  originalFockClifford_moduleEnd_apply T h v

theorem originalFockClifford_moduleEnd_smul_consumer
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (a : A) (v : V) :
    originalFockClifford_moduleEnd T h (a • v) =
      a • originalFockClifford_moduleEnd T h v :=
  (originalFockClifford_moduleEnd T h).map_smul a v

example (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (v : V) :
    T ((0 : A) • v) = (0 : A) • T v :=
  originalFockClifford_module_smul_consumer T h 0 v

example (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (v : V) :
    T ((1 : A) • v) = (1 : A) • T v :=
  originalFockClifford_module_smul_consumer T h 1 v

example (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (a : A) (v : V) :
    originalFockClifford_moduleEnd T h (a • v) =
      a • originalFockClifford_moduleEnd T h v :=
  originalFockClifford_moduleEnd_smul_consumer T h a v

#print axioms originalFockClifford_module_smul_consumer
#print axioms originalFockClifford_moduleEnd_apply_consumer
#print axioms originalFockClifford_moduleEnd_smul_consumer

end
end FCP.BFSSP3M4W0B2AOriginalCliffordModuleEndIndependentConsumer
