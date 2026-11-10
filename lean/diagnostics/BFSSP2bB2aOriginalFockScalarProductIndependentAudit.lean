import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P2bB2aOriginalFockScalarProductPhysicalStar

/-!
Independent typed consumer of P2b-B2a exact ORIGINAL Fock-operator scalar
and multiplication closure. Does not infer global star preservation.
-/

set_option autoImplicit false

namespace FCP.BFSSP2bB2aOriginalFockScalarProductIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction
open FCP.BFSSP2bB2aOriginalFockScalarProductPhysicalStar

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

example (S T : OriginalFockOp) :
    star (S * T) = star T * star S :=
  originalFock_physicalStar_mul S T

example (g : spinGroup source9Quadratic) (z : ℂ) :
    source9Spin_originalFockOperatorAutomorphismHom g
        (star ((algebraMap ℂ OriginalFockOp) z)) =
      star (source9Spin_originalFockOperatorAutomorphismHom g
        ((algebraMap ℂ OriginalFockOp) z)) :=
  source9Spin_originalFockOperator_algebraMap_map_star g z

example (g : spinGroup source9Quadratic) (S T : OriginalFockOp)
    (hS : source9Spin_originalFockOperatorAutomorphismHom g (star S) =
      star (source9Spin_originalFockOperatorAutomorphismHom g S))
    (hT : source9Spin_originalFockOperatorAutomorphismHom g (star T) =
      star (source9Spin_originalFockOperatorAutomorphismHom g T)) :
    source9Spin_originalFockOperatorAutomorphismHom g (star (S * T)) =
      star (source9Spin_originalFockOperatorAutomorphismHom g (S * T)) :=
  source9Spin_originalFockOperator_mul_map_star g S T hS hT

#print axioms FCP.BFSSP2bB2aOriginalFockScalarProductPhysicalStar.originalFock_physicalStar_mul
#print axioms FCP.BFSSP2bB2aOriginalFockScalarProductPhysicalStar.source9Spin_originalFockOperator_algebraMap_map_star
#print axioms FCP.BFSSP2bB2aOriginalFockScalarProductPhysicalStar.source9Spin_originalFockOperator_mul_map_star

end
end FCP.BFSSP2bB2aOriginalFockScalarProductIndependentAudit
