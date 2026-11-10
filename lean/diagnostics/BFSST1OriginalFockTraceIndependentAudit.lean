import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.T1OriginalFockTraceInvariance

/-!
Independent T1 consumer: ordinary trace on the exact original Fermion 2
continuous-operator carrier; no surrogate matrix basis, no continuity,
no gauge claim, no physical Hamiltonian or spectrum.
-/

set_option autoImplicit false

namespace FCP.BFSST1OriginalFockTraceIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSST1OriginalFockTraceInvariance
open FCP.BFSSP2bB3OriginalFockStarAutomorphismAction

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

example (T : OriginalFockOp) :
    originalFockTrace T =
      LinearMap.trace ℂ (Fermion 2) (originalFockEndAlgEquiv.symm T) :=
  originalFockTrace_apply T

example (g : spinGroup source9Quadratic) (T : OriginalFockOp) :
    originalFockTrace (source9Spin_originalFockOperatorStarAutomorphismHom g T) =
      originalFockTrace T :=
  source9Spin_originalFockTrace_invariant g T

/-- Independent consumer of the original operator Hilbert-Schmidt
trace pairing. This is an algebraic finite-dimensional identity, not
a topological unitary-representation or closed-Hamiltonian statement. -/
theorem originalFock_trace_pairing_invariant
    (g : spinGroup source9Quadratic) (S T : OriginalFockOp) :
    originalFockTrace
      (star (source9Spin_originalFockOperatorStarAutomorphismHom g S) *
        source9Spin_originalFockOperatorStarAutomorphismHom g T) =
      originalFockTrace (star S * T) := by
  let alpha : OriginalFockOp ≃⋆ₐ[ℂ] OriginalFockOp :=
    source9Spin_originalFockOperatorStarAlgEquiv g
  have hstar : alpha (star S) = star (alpha S) := by
    change
      FCP.BFSSOP3C6AOriginalFockOperatorSpinAction.source9Spin_originalFockOperatorAutomorphismHom
        g (star S) =
      star (FCP.BFSSOP3C6AOriginalFockOperatorSpinAction.source9Spin_originalFockOperatorAutomorphismHom
        g S)
    exact
      FCP.BFSSP2bB2OriginalFockGlobalPhysicalStar.source9Spin_originalFockOperator_global_map_star
        g S
  have hmul : alpha (star S * T) = alpha (star S) * alpha T :=
    (alpha.toAlgEquiv).map_mul (star S) T
  change originalFockTrace (star (alpha S) * alpha T) =
    originalFockTrace (star S * T)
  calc
    originalFockTrace (star (alpha S) * alpha T) =
        originalFockTrace (alpha (star S * T)) := by
      rw [hmul, hstar]
    _ = originalFockTrace (star S * T) :=
      source9Spin_originalFockTrace_invariant g (star S * T)

#print axioms FCP.BFSST1OriginalFockTraceInvariance.originalFockEndAlgEquiv
#print axioms FCP.BFSST1OriginalFockTraceInvariance.originalFockTrace
#print axioms FCP.BFSST1OriginalFockTraceInvariance.originalFockTrace_apply
#print axioms FCP.BFSST1OriginalFockTraceInvariance.source9Spin_originalFockTrace_invariant
#print axioms originalFock_trace_pairing_invariant

end
end FCP.BFSST1OriginalFockTraceIndependentAudit
