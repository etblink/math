import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P2bAOriginalFockGammaPhysicalStar

/-!
# Independent BFSS P2b-A physical-adjoint test

Independently typecheck exact source Spin(9), original active real
48-Majorana map, physical star on the literal Fermion 2 continuous
complex-linear operator algebra, and arbitrary complex coefficients.
No full StarAlgEquiv or closed physical Hamiltonian assertion.
-/

set_option autoImplicit false

namespace FCP.BFSSP2bAOriginalFockGammaIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction
open FCP.BFSSP2bAOriginalFockGammaPhysicalStar

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

example (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source9Spin_originalFockOperatorAutomorphismHom g
        (star (sourceGammaRealLinear v)) =
      star (source9Spin_originalFockOperatorAutomorphismHom g
        (sourceGammaRealLinear v)) :=
  source9Spin_originalFockOperator_activeGamma_map_star g v

example (g : spinGroup source9Quadratic) (z : ℂ)
    (v : Source48Vector) :
    source9Spin_originalFockOperatorAutomorphismHom g
        (star (z • sourceGammaRealLinear v)) =
      star (source9Spin_originalFockOperatorAutomorphismHom g
        (z • sourceGammaRealLinear v)) :=
  source9Spin_originalFockOperator_activeGamma_complex_smul_map_star g z v

#print axioms FCP.BFSSP2bAOriginalFockGammaPhysicalStar.source9Spin_originalFockOperator_activeGamma_map_star
#print axioms FCP.BFSSP2bAOriginalFockGammaPhysicalStar.source9Spin_originalFockOperator_activeGamma_complex_smul_map_star

end
end FCP.BFSSP2bAOriginalFockGammaIndependentAudit
