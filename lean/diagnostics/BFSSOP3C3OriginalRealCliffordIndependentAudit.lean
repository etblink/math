import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C3OriginalRealCliffordAlgEquiv

/-!
Independent OP3-C3 original-carrier consumer: explicit source Spin(9)
inverse-left/right relations and the exact real Clifford AlgEquiv.
No complexified Fock implementation, star, topology or spectral claim.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C3OriginalRealCliffordIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C1OriginalRealCliffordDirectLift
open FCP.BFSSOP3C3OriginalRealCliffordAlgEquiv

private abbrev RealSourceClifford :=
  CliffordAlgebra source48Quadratic

example (g : spinGroup source9Quadratic) :
    (source9Spin_originalRealCliffordAlgHom g).comp
        (source9Spin_originalRealCliffordAlgHom g⁻¹) =
      AlgHom.id ℝ RealSourceClifford :=
  source9Spin_originalRealCliffordAlgHom_comp_inv g

example (g : spinGroup source9Quadratic) :
    (source9Spin_originalRealCliffordAlgHom g⁻¹).comp
        (source9Spin_originalRealCliffordAlgHom g) =
      AlgHom.id ℝ RealSourceClifford :=
  source9Spin_originalRealCliffordAlgHom_inv_comp g

example (g : spinGroup source9Quadratic) :
    RealSourceClifford ≃ₐ[ℝ] RealSourceClifford :=
  source9Spin_originalRealCliffordAlgEquiv g

example (g : spinGroup source9Quadratic) :
    ((source9Spin_originalRealCliffordAlgEquiv g :
        RealSourceClifford ≃ₐ[ℝ] RealSourceClifford) :
      RealSourceClifford →ₐ[ℝ] RealSourceClifford) =
    source9Spin_originalRealCliffordAlgHom g :=
  source9Spin_originalRealCliffordAlgEquiv_toAlgHom g

#print axioms FCP.BFSSOP3C3OriginalRealCliffordAlgEquiv.source9Spin_originalRealCliffordAlgHom_comp_inv
#print axioms FCP.BFSSOP3C3OriginalRealCliffordAlgEquiv.source9Spin_originalRealCliffordAlgHom_inv_comp
#print axioms FCP.BFSSOP3C3OriginalRealCliffordAlgEquiv.source9Spin_originalRealCliffordAlgEquiv
#print axioms FCP.BFSSOP3C3OriginalRealCliffordAlgEquiv.source9Spin_originalRealCliffordAlgEquiv_toAlgHom

end
end FCP.BFSSOP3C3OriginalRealCliffordIndependentAudit
