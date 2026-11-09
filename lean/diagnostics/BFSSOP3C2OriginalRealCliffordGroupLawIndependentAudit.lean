import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C2OriginalRealCliffordGroupLaw

/-!
Independent OP3-C2 strict consumer on the exact original source
Spin(9), source48Quadratic and real Clifford algebra.
Checks identity and same-order product, not inverse, AlgEquiv,
complex Fock action, star, gauge or any spectral assertion.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C2OriginalRealCliffordIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C1OriginalRealCliffordDirectLift

private abbrev RealSourceClifford :=
  CliffordAlgebra source48Quadratic

example :
    source9Spin_originalRealCliffordAlgHom
        (1 : spinGroup source9Quadratic) =
      AlgHom.id ℝ RealSourceClifford :=
  FCP.BFSSOP3C2OriginalRealCliffordGroupLaw.source9Spin_originalRealCliffordAlgHom_one

example (g h : spinGroup source9Quadratic) :
    source9Spin_originalRealCliffordAlgHom (g * h) =
      (source9Spin_originalRealCliffordAlgHom g).comp
        (source9Spin_originalRealCliffordAlgHom h) :=
  FCP.BFSSOP3C2OriginalRealCliffordGroupLaw.source9Spin_originalRealCliffordAlgHom_mul g h

#print axioms FCP.BFSSOP3C2OriginalRealCliffordGroupLaw.source9Spin_originalRealCliffordAlgHom_one
#print axioms FCP.BFSSOP3C2OriginalRealCliffordGroupLaw.source9Spin_originalRealCliffordAlgHom_mul

end
end FCP.BFSSOP3C2OriginalRealCliffordIndependentAudit
