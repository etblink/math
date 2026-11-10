import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C6COriginalFockActiveGammaCovariance

/-!
Independent original-carrier C6C consumer: exact equality of the two
original Fock operator-valued real-linear Majorana maps and genuine
source Spin(9) covariance of the ACTUAL active source gamma on every
original real source vector. No unitary implementer, star, gauge or
spectral claims.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C6COriginalFockActiveGammaIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSource48RealLinearGamma
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction
open FCP.BFSSOP3C6COriginalFockActiveGammaCovariance

example :
    (Source48Vector →ₗ[ℝ] (Fermion 2 →L[ℂ] Fermion 2)) :=
  sourceGammaRealLinear

example :
    FCP.BFSSS1V52L9E4.originalFockGammaRealLinear =
      sourceGammaRealLinear :=
  originalFockGammaRealLinear_eq_activeGammaRealLinear

example (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source9Spin_originalFockOperatorAutomorphismHom g
        (sourceGammaRealLinear v) =
      sourceGammaRealLinear
        (((source9SpinOriginalPaired48OrthogonalHom g :
          Matrix.orthogonalGroup Source48Label ℝ) :
          Matrix Source48Label Source48Label ℝ).mulVec v) :=
  source9Spin_originalFockOperatorAutomorphismHom_activeGamma g v

#print axioms FCP.BFSSOP3C6COriginalFockActiveGammaCovariance.originalFockGammaRealLinear_eq_activeGammaRealLinear
#print axioms FCP.BFSSOP3C6COriginalFockActiveGammaCovariance.source9Spin_originalFockOperatorAutomorphismHom_activeGamma

end
end FCP.BFSSOP3C6COriginalFockActiveGammaIndependentAudit
