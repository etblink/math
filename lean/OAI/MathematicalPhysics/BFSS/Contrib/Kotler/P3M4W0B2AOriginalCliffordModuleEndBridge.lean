import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0H1BOriginalAdjoinFullCliffordCommutantR2
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainS1V52M3BOriginalComplexCliffordSimpleModuleProbe

/-!
# W0B2A — original complex Clifford-module endomorphism bridge

Input: qualified original W0H1B R2 all-Clifford-image commutation.
Output: the genuine original M3B A-linear endomorphism underlying the
original Fermion 2 continuous complex-linear operator. No Schur scalar
conclusion, trace, parity, gauge, K-bracket, or spectral claim.
-/ 

set_option autoImplicit false

namespace FCP.BFSSP3M4W0B2AOriginalCliffordModuleEndBridge
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSS1V52M2
open FCP.BFSSS1V52M3B
open FCP.BFSSP3M4W0H1BOriginalAdjoinFullCliffordCommutantR2

private abbrev A := CliffordAlgebra (source48Quadratic.baseChange ℂ)
private abbrev V := Fermion 2
private abbrev Op := V →L[ℂ] V

local instance : Module A V := originalComplexCliffordFockModule
local instance : IsScalarTower ℂ A V := originalComplexCliffordFockModule_scalarTower

/-- Original normalized Majorana commutation forces the actual M3B
complex Clifford module action to intertwine with T. -/
theorem originalFockClifford_module_smul
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (a : A) (v : V) :
    T (a • v) = a • T v := by
  have hmul :=
    (originalComplexEquiv_fullClifford_commutes T h a).eq
  have hv := congrArg (fun S : Op => S v) hmul
  change T ((FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv a) v) =
    (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv a) (T v) at hv
  exact hv

/-- The genuine original `Fermion 2` operator is an A-linear endomorphism
for the existing M3B Clifford-module instance; not a surrogate module. -/
noncomputable def originalFockClifford_moduleEnd
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p)) :
    Module.End A V where
  toFun := fun v => T v
  map_add' := by
    intro v w
    exact T.map_add v w
  map_smul' := by
    intro a v
    exact originalFockClifford_module_smul T h a v

/-- Pointwise identity with the original continuous complex-linear
Fock operator; no implicit replacement of the source representation. -/
theorem originalFockClifford_moduleEnd_apply
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (v : V) :
    originalFockClifford_moduleEnd T h v = T v := by
  rfl

#print axioms originalFockClifford_module_smul
#print axioms originalFockClifford_moduleEnd
#print axioms originalFockClifford_moduleEnd_apply

end
end FCP.BFSSP3M4W0B2AOriginalCliffordModuleEndBridge
