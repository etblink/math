import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C6BOriginalFockDonorGammaCovariance

/-!
Independent OP3-C6B source-carrier consumer: genuine source Spin(9),
original Fermion 2 Fock operator algebra, precise M3I original Clifford
generator images, and exact original donor normalized Majorana vector
covariance. Does not claim active all-vector gamma, physical star,
Fock-unitary implementers, gauge or spectral results.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C6BOriginalFockDonorGammaIndependentAudit
noncomputable section

open scoped TensorProduct
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction
open FCP.BFSSOP3C6BOriginalFockDonorGammaCovariance

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

example (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source9Spin_originalFockOperatorAutomorphismHom g
        (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
          (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
            (1 ⊗ₜ[ℝ] v))) =
      FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ]
            (((source9SpinOriginalPaired48OrthogonalHom g :
              Matrix.orthogonalGroup Source48Label ℝ) :
              Matrix Source48Label Source48Label ℝ).mulVec v))) :=
  source9Spin_originalFockOperatorAutomorphismHom_M3IGenerator g v

example (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source9Spin_originalFockOperatorAutomorphismHom g
        (FCP.BFSSS1V52L9E4.originalFockGammaRealLinear v) =
      FCP.BFSSS1V52L9E4.originalFockGammaRealLinear
        (((source9SpinOriginalPaired48OrthogonalHom g :
          Matrix.orthogonalGroup Source48Label ℝ) :
          Matrix Source48Label Source48Label ℝ).mulVec v) :=
  source9Spin_originalFockOperatorAutomorphismHom_donorGamma g v

#print axioms FCP.BFSSOP3C6BOriginalFockDonorGammaCovariance.source9Spin_originalFockOperatorAutomorphismHom_M3IGenerator
#print axioms FCP.BFSSOP3C6BOriginalFockDonorGammaCovariance.source9Spin_originalFockOperatorAutomorphismHom_donorGamma

end
end FCP.BFSSOP3C6BOriginalFockDonorGammaIndependentAudit
