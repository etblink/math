import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C4OriginalRealCliffordSpinAction

/-!
Independent original-carrier OP3-C4 audit: the accepted source Spin9
representation maps into the actual automorphism group of the exact
real source Clifford algebra, with original paired-48 covariance.
Does not prove an original physical Fock-unitary Spin action.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C4OriginalRealCliffordIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C3OriginalRealCliffordAlgEquiv
open FCP.BFSSOP3C4OriginalRealCliffordSpinAction

private abbrev RealSourceClifford :=
  CliffordAlgebra source48Quadratic

example :
    spinGroup source9Quadratic →*
      (RealSourceClifford ≃ₐ[ℝ] RealSourceClifford) :=
  source9Spin_originalRealCliffordAutomorphismHom

example (g : spinGroup source9Quadratic) :
    source9Spin_originalRealCliffordAutomorphismHom g =
      source9Spin_originalRealCliffordAlgEquiv g :=
  source9Spin_originalRealCliffordAutomorphismHom_apply g

example (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source9Spin_originalRealCliffordAutomorphismHom g
        (CliffordAlgebra.ι source48Quadratic v) =
      CliffordAlgebra.ι source48Quadratic
        (((source9SpinOriginalPaired48OrthogonalHom g :
          Matrix.orthogonalGroup Source48Label ℝ) :
          Matrix Source48Label Source48Label ℝ).mulVec v) :=
  source9Spin_originalRealCliffordAutomorphismHom_generator g v

#print axioms FCP.BFSSOP3C4OriginalRealCliffordSpinAction.source9Spin_originalRealCliffordAutomorphismHom
#print axioms FCP.BFSSOP3C4OriginalRealCliffordSpinAction.source9Spin_originalRealCliffordAutomorphismHom_apply
#print axioms FCP.BFSSOP3C4OriginalRealCliffordSpinAction.source9Spin_originalRealCliffordAutomorphismHom_generator

end
end FCP.BFSSOP3C4OriginalRealCliffordIndependentAudit
