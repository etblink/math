import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0B2AOriginalCliffordModuleEndBridge
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainS1V52M3COriginalCliffordFockSchurAndFiniteProbe
import Mathlib.Algebra.Algebra.Basic

/-!
# W0B2B R1 — exact original Fock Schur scalar-commutant theorem

Uses only the qualified W0B2A original Clifford-module endomorphism
and the original M3C simple-module Schur bijection.
No trace, parity, gauge, Spin(9), QTC bracket or BFSS spectral assertion.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0B2BOriginalSchurScalarCommutant
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSS1V52M3B
open FCP.BFSSS1V52M3C
open FCP.BFSSP3M4W0B2AOriginalCliffordModuleEndBridge

private abbrev A := CliffordAlgebra (source48Quadratic.baseChange ℂ)
private abbrev V := Fermion 2
private abbrev Op := V →L[ℂ] V

local instance : Module A V := originalComplexCliffordFockModule
local instance : IsScalarTower ℂ A V := originalComplexCliffordFockModule_scalarTower

/-- Original M3C Schur bijection supplies a unique scalar preimage of
the exact qualified W0B2A endomorphism, not of a surrogate action. -/
theorem originalFockClifford_scalar_moduleEnd_unique
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p)) :
    ∃! z : ℂ, algebraMap ℂ (Module.End A V) z =
      originalFockClifford_moduleEnd T h := by
  obtain ⟨z, hz⟩ :=
    originalComplexCliffordFock_scalarCommutant.2
      (originalFockClifford_moduleEnd T h)
  refine ⟨z, hz, ?_⟩
  intro z' hz'
  exact originalComplexCliffordFock_scalarCommutant.1 (hz'.trans hz.symm)

/-- A complex linear operator commuting with every original Majorana
acts as one unique scalar on *every* original Fock vector. -/
theorem originalFockClifford_scalar_pointwise_unique
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p)) :
    ∃! z : ℂ, ∀ v : V, T v = z • v := by
  obtain ⟨z, hz, huniq⟩ := originalFockClifford_scalar_moduleEnd_unique T h
  have hpoint : ∀ v : V, T v = z • v := by
    intro v
    have hv := congrArg (fun f : Module.End A V => f v) hz
    rw [Module.algebraMap_end_apply ℂ A V z v,
      originalFockClifford_moduleEnd_apply] at hv
    exact hv.symm
  refine ⟨z, hpoint, ?_⟩
  intro z' hz'
  apply huniq
  apply LinearMap.ext
  intro v
  calc
    (algebraMap ℂ (Module.End A V) z') v = z' • v :=
      Module.algebraMap_end_apply ℂ A V z' v
    _ = T v := (hz' v).symm
    _ = originalFockClifford_moduleEnd T h v :=
      (originalFockClifford_moduleEnd_apply T h v).symm

/-- Source-exact scalar commutant of the 48 normalized original Majoranas
as an equality of original continuous complex-linear Fock operators. -/
theorem originalFockClifford_scalar_operator_unique
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p)) :
    ∃! z : ℂ, T = z • (1 : Op) := by
  obtain ⟨z, hz, huniq⟩ := originalFockClifford_scalar_pointwise_unique T h
  refine ⟨z, ?_, ?_⟩
  · apply ContinuousLinearMap.ext
    intro v
    simpa using hz v
  · intro z' hz'
    apply huniq
    intro v
    have hv := congrArg (fun f : Op => f v) hz'
    simpa using hv

#print axioms originalFockClifford_scalar_moduleEnd_unique
#print axioms originalFockClifford_scalar_pointwise_unique
#print axioms originalFockClifford_scalar_operator_unique

end
end FCP.BFSSP3M4W0B2BOriginalSchurScalarCommutant
