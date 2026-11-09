import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C6AOriginalFockOperatorSpinAction

/-!
Independent original-carrier audit for OP3-C6A. Assert the literal
original source Spin(9) group and Fermion 2 continuous-linear operator
algebra, identity/multiplication, and pointwise equality with the exact
M3I source Clifford correspondence. No star, vector unitary or spectrum.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C6AOriginalFockOperatorIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C5BOriginalComplexCliffordSpinAction
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

example :
    spinGroup source9Quadratic →*
      (OriginalFockOp ≃ₐ[ℂ] OriginalFockOp) :=
  source9Spin_originalFockOperatorAutomorphismHom

example :
    source9Spin_originalFockOperatorAutomorphismHom
      (1 : spinGroup source9Quadratic) = 1 :=
  map_one source9Spin_originalFockOperatorAutomorphismHom

example (g h : spinGroup source9Quadratic) :
    source9Spin_originalFockOperatorAutomorphismHom (g * h) =
      source9Spin_originalFockOperatorAutomorphismHom g *
        source9Spin_originalFockOperatorAutomorphismHom h :=
  map_mul source9Spin_originalFockOperatorAutomorphismHom g h

example (g : spinGroup source9Quadratic) :
    source9Spin_originalFockOperatorAutomorphismHom g =
      FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv.symm.trans
        ((source9Spin_originalComplexCliffordAutomorphismHom g).trans
          FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv) :=
  source9Spin_originalFockOperatorAutomorphismHom_apply g

example (g : spinGroup source9Quadratic) (T : OriginalFockOp) :
    (source9Spin_originalFockOperatorAutomorphismHom g) T =
      FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        ((source9Spin_originalComplexCliffordAutomorphismHom g)
          (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv.symm T)) :=
  source9Spin_originalFockOperatorAutomorphismHom_apply_operator g T

#print axioms FCP.BFSSOP3C6AOriginalFockOperatorSpinAction.source9Spin_originalFockOperatorAutomorphismHom
#print axioms FCP.BFSSOP3C6AOriginalFockOperatorSpinAction.source9Spin_originalFockOperatorAutomorphismHom_apply
#print axioms FCP.BFSSOP3C6AOriginalFockOperatorSpinAction.source9Spin_originalFockOperatorAutomorphismHom_apply_operator

end
end FCP.BFSSOP3C6AOriginalFockOperatorIndependentAudit
