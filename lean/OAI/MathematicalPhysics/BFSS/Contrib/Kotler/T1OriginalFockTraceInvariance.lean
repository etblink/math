import Mathlib.LinearAlgebra.Trace
import Mathlib.Topology.Algebra.Module.FiniteDimension
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P2bB3OriginalFockStarAutomorphismAction

/-!
# BFSS T1 — source-exact original Fock operator trace preservation

On the literal original 24-mode Fermion 2 complex Hilbert space,
transport the qualified B3 Spin(9) star-algebra action across Mathlib's
finite-dimensional Module.End.toContinuousLinearMap equivalence.

LinearMap.trace_map already establishes trace preservation for every
algebra equivalence of the exact original linear endomorphism carrier.
No surrogate matrix basis, left-regular trace rescaling, or unqualified
Fock-vector implementer is needed.

This is finite-dimensional Fock-operator trace invariance only: no
continuity in source Spin(9), gauge compatibility, closed Hamiltonian
form/domain, Hilbert-Schmidt completion theorem, or spectral claim.
-/

set_option autoImplicit false

namespace FCP.BFSST1OriginalFockTraceInvariance
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSP2bB3OriginalFockStarAutomorphismAction

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

/-- The canonical algebra equivalence between algebraic and continuous
complex endomorphisms of the actual original finite-dimensional Fock space. -/
noncomputable def originalFockEndAlgEquiv :
    Module.End ℂ (Fermion 2) ≃ₐ[ℂ] OriginalFockOp :=
  Module.End.toContinuousLinearMap (Fermion 2)

/-- The ordinary complex linear operator trace on original bounded
Fock endomorphisms, transported through their exact canonical equivalence. -/
noncomputable def originalFockTrace : OriginalFockOp →ₗ[ℂ] ℂ :=
  (LinearMap.trace ℂ (Fermion 2)).comp
    originalFockEndAlgEquiv.symm.toLinearEquiv.toLinearMap

theorem originalFockTrace_apply (T : OriginalFockOp) :
    originalFockTrace T =
      LinearMap.trace ℂ (Fermion 2) (originalFockEndAlgEquiv.symm T) := rfl

/-- The genuine source Spin(9) star action preserves the actual
original Fock trace on every bounded complex-linear operator. -/
theorem source9Spin_originalFockTrace_invariant
    (g : spinGroup source9Quadratic) (T : OriginalFockOp) :
    originalFockTrace (source9Spin_originalFockOperatorStarAutomorphismHom g T) =
      originalFockTrace T := by
  let e : Module.End ℂ (Fermion 2) ≃ₐ[ℂ] OriginalFockOp :=
    originalFockEndAlgEquiv
  let beta : Module.End ℂ (Fermion 2) ≃ₐ[ℂ]
      Module.End ℂ (Fermion 2) :=
    (e.trans (source9Spin_originalFockOperatorStarAlgEquiv g).toAlgEquiv).trans e.symm
  have htrace := LinearMap.trace_map beta (e.symm T)
  calc
    originalFockTrace (source9Spin_originalFockOperatorStarAutomorphismHom g T) =
        LinearMap.trace ℂ (Fermion 2)
          (e.symm (source9Spin_originalFockOperatorStarAutomorphismHom g T)) := rfl
    _ = LinearMap.trace ℂ (Fermion 2) (beta (e.symm T)) := by
      congr 1
    _ = originalFockTrace T := by
      exact htrace

#print axioms originalFockEndAlgEquiv
#print axioms originalFockTrace
#print axioms originalFockTrace_apply
#print axioms source9Spin_originalFockTrace_invariant

end
end FCP.BFSST1OriginalFockTraceInvariance
