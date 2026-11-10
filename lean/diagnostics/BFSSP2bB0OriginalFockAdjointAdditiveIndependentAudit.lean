import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P2bB0OriginalFockAdjointAdditiveBridge

/-!
Independent audit of the exact original Fermion 2 physical Hilbert
adjoint addition and conditional source Spin(9) sum compatibility.
No new claim of global star preservation.
-/

set_option autoImplicit false

namespace FCP.BFSSP2bB0OriginalFockAdjointAdditiveIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction
open FCP.BFSSP2bB0OriginalFockAdjointAdditiveBridge

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

example (X Y : OriginalFockOp) :
    star (X + Y) = star X + star Y :=
  originalFock_physicalStar_add X Y

example (g : spinGroup source9Quadratic) (X Y : OriginalFockOp)
    (hX : source9Spin_originalFockOperatorAutomorphismHom g (star X) =
      star (source9Spin_originalFockOperatorAutomorphismHom g X))
    (hY : source9Spin_originalFockOperatorAutomorphismHom g (star Y) =
      star (source9Spin_originalFockOperatorAutomorphismHom g Y)) :
    source9Spin_originalFockOperatorAutomorphismHom g (star (X + Y)) =
      star (source9Spin_originalFockOperatorAutomorphismHom g (X + Y)) :=
  originalFock_spinStarCompat_add g X Y hX hY

#print axioms FCP.BFSSP2bB0OriginalFockAdjointAdditiveBridge.originalFock_physicalStar_add
#print axioms FCP.BFSSP2bB0OriginalFockAdjointAdditiveBridge.originalFock_spinStarCompat_add

end
end FCP.BFSSP2bB0OriginalFockAdjointAdditiveIndependentAudit
