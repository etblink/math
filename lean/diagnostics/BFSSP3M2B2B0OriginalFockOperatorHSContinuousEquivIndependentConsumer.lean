import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2B2B0OriginalFockOperatorHSContinuousEquiv

/-!
Independent original source consumer: continuous operator/HS equivalence,
forward and inverse source ONB laws, both inverse identities, and a
concrete canonical original Fock ONB (no 2^24 basis enumeration).
-/
set_option autoImplicit false

namespace BFSSP3M2B2B0OriginalFockOperatorHSContinuousEquivIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M2AOriginalFockHSFiber
open FCP.BFSSP3M2B2B0OriginalFockOperatorHSContinuousEquiv

variable {ι : Type*} [Fintype ι]
variable (b : OrthonormalBasis ι ℂ (Fermion 2))

example : (Fermion 2 →L[ℂ] Fermion 2) ≃L[ℂ]
    OriginalFockHSFiber ι :=
  originalFockOperatorHSContinuousEquiv b

example (T : Fermion 2 →L[ℂ] Fermion 2) (i : ι) :
    (originalFockOperatorHSContinuousEquiv b T) i = T (b i) :=
  originalFockOperatorHSContinuousEquiv_apply_basis b T i

example (u : OriginalFockHSFiber ι) :
    (originalFockOperatorHSContinuousEquiv b).symm u =
      originalFockHSFiberToOperator b u :=
  originalFockOperatorHSContinuousEquiv_symm_apply b u

example (T : Fermion 2 →L[ℂ] Fermion 2) :
    (originalFockOperatorHSContinuousEquiv b).symm
      (originalFockOperatorHSContinuousEquiv b T) = T :=
  (originalFockOperatorHSContinuousEquiv b).symm_apply_apply T

example (u : OriginalFockHSFiber ι) :
    originalFockOperatorHSContinuousEquiv b
      ((originalFockOperatorHSContinuousEquiv b).symm u) = u :=
  (originalFockOperatorHSContinuousEquiv b).apply_symm_apply u

private abbrev OriginalFockIndex := Fin (2 ^ (8 * colorDim 2))

example : OrthonormalBasis OriginalFockIndex ℂ (Fermion 2) :=
  EuclideanSpace.basisFun OriginalFockIndex ℂ

example : (Fermion 2 →L[ℂ] Fermion 2) ≃L[ℂ]
    OriginalFockHSFiber OriginalFockIndex :=
  originalFockOperatorHSContinuousEquiv
    (EuclideanSpace.basisFun OriginalFockIndex ℂ)

example (T : Fermion 2 →L[ℂ] Fermion 2) (i : OriginalFockIndex) :
    (originalFockOperatorHSContinuousEquiv
      (EuclideanSpace.basisFun OriginalFockIndex ℂ) T) i =
      T ((EuclideanSpace.basisFun OriginalFockIndex ℂ) i) :=
  originalFockOperatorHSContinuousEquiv_apply_basis
    (EuclideanSpace.basisFun OriginalFockIndex ℂ) T i

#print axioms FCP.BFSSP3M2B2B0OriginalFockOperatorHSContinuousEquiv.originalFockOperatorHSContinuousEquiv
#print axioms FCP.BFSSP3M2B2B0OriginalFockOperatorHSContinuousEquiv.originalFockOperatorHSContinuousEquiv_apply_basis
#print axioms FCP.BFSSP3M2B2B0OriginalFockOperatorHSContinuousEquiv.originalFockOperatorHSContinuousEquiv_symm_apply

end
end BFSSP3M2B2B0OriginalFockOperatorHSContinuousEquivIndependentConsumer
