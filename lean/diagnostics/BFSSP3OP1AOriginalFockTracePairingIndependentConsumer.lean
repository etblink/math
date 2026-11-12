import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3OP1AOriginalFockTracePairing

/-!
# P3-OP1A independent original Fock trace-pairing consumer

Checks the general bilinear pairing and a separately stated physical
Hilbert-adjoint diagonal trace identity using only the exported module.
No source Spin continuity, gauge, closed physical domain, or spectrum claim.
-/

set_option autoImplicit false

namespace BFSSP3OP1AOriginalFockTracePairingIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSP2bB3OriginalFockStarAutomorphismAction
open FCP.BFSSP3OP1AOriginalFockTracePairing
open FCP.BFSST1OriginalFockTraceInvariance

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

/-- Arbitrary distinct original Fock operators may be paired. -/
example (g : spinGroup source9Quadratic) (S T : OriginalFockOp) :
    originalFockTracePairing
        (source9Spin_originalFockOperatorStarAutomorphismHom g S)
        (source9Spin_originalFockOperatorStarAutomorphismHom g T) =
      originalFockTracePairing S T :=
  source9Spin_originalFockTracePairing_invariant g S T

/-- Diagonal original physical Hilbert-adjoint trace is preserved. -/
example (g : spinGroup source9Quadratic) (T : OriginalFockOp) :
    originalFockTrace
      (star (source9Spin_originalFockOperatorStarAutomorphismHom g T) *
        source9Spin_originalFockOperatorStarAutomorphismHom g T) =
      originalFockTrace (star T * T) := by
  change
    originalFockTracePairing
        (source9Spin_originalFockOperatorStarAutomorphismHom g T)
        (source9Spin_originalFockOperatorStarAutomorphismHom g T) =
      originalFockTracePairing T T
  exact source9Spin_originalFockTracePairing_invariant g T T

#print axioms FCP.BFSSP3OP1AOriginalFockTracePairing.originalFockTracePairing
#print axioms FCP.BFSSP3OP1AOriginalFockTracePairing.source9Spin_originalFockTracePairing_invariant

end
end BFSSP3OP1AOriginalFockTracePairingIndependentConsumer
