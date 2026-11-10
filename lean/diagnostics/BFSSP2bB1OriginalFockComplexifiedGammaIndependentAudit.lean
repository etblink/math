import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P2bB1OriginalFockComplexifiedGammaPhysicalStar

/-!
# Independent P2b-B1 audit on original physical Fock operator algebra

Verify the source M3I image, every genuine complexified source vector,
source Spin(9) action, and the literal Fermion 2 physical adjoint.
No assertion about arbitrary original Fock operators.
-/

set_option autoImplicit false

namespace FCP.BFSSP2bB1OriginalFockComplexifiedGammaIndependentAudit
noncomputable section

open scoped TensorProduct
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction
open FCP.BFSSP2bB1OriginalFockComplexifiedGammaPhysicalStar

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

example (z : ℂ) (v : Source48Vector) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
      (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
        (z ⊗ₜ[ℝ] v)) =
      z • sourceGammaRealLinear v :=
  originalComplexCliffordFockAlgEquiv_tmul_activeGamma z v

example (g : spinGroup source9Quadratic)
    (w : ℂ ⊗[ℝ] Source48Vector) :
    source9Spin_originalFockOperatorAutomorphismHom g
        (star (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
          (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w))) =
      star (source9Spin_originalFockOperatorAutomorphismHom g
        (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
          (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w))) :=
  source9Spin_originalFockOperator_complexifiedGamma_map_star g w

#print axioms FCP.BFSSP2bB1OriginalFockComplexifiedGammaPhysicalStar.originalComplexCliffordFockAlgEquiv_tmul_activeGamma
#print axioms FCP.BFSSP2bB1OriginalFockComplexifiedGammaPhysicalStar.source9Spin_originalFockOperator_complexifiedGamma_map_star

end
end FCP.BFSSP2bB1OriginalFockComplexifiedGammaIndependentAudit
