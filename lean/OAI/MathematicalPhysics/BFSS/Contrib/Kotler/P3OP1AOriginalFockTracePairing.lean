import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.T1OriginalFockTraceInvariance

/-!
# P3-OP1A — importable original Fock Spin(9) trace-pairing interface

This exports the exact trace-pairing argument already strict-qualified in
the independent T1 consumer BFSST1OriginalFockTraceIndependentAudit.lean
(#42769361446). The original diagnostic is not an OAI importable module.

The proof below preserves that accepted typed B2-star/B3-multiplication/T1-trace
calculation, on the actual Fermion 2 endomorphism algebra. No replacement
carrier, new Fock-vector unitary, topological continuity, gauge projection,
closed Hamiltonian, or spectral statement is asserted.
-/

set_option autoImplicit false

namespace FCP.BFSSP3OP1AOriginalFockTracePairing
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSST1OriginalFockTraceInvariance
open FCP.BFSSP2bB3OriginalFockStarAutomorphismAction

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

/-- The ordinary complex Hilbert--Schmidt trace pairing on the literal
original Fock operator carrier (without changing its operator norm). -/
noncomputable def originalFockTracePairing (S T : OriginalFockOp) : ℂ :=
  originalFockTrace (star S * T)

/-- Exact importable presentation of the already accepted T1 independent
consumer trace-pairing theorem, on the genuine physical-star algebra. -/
theorem source9Spin_originalFockTracePairing_invariant
    (g : spinGroup source9Quadratic) (S T : OriginalFockOp) :
    originalFockTracePairing
        (source9Spin_originalFockOperatorStarAutomorphismHom g S)
        (source9Spin_originalFockOperatorStarAutomorphismHom g T) =
      originalFockTracePairing S T := by
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

#print axioms originalFockTracePairing
#print axioms source9Spin_originalFockTracePairing_invariant

end
end FCP.BFSSP3OP1AOriginalFockTracePairing
