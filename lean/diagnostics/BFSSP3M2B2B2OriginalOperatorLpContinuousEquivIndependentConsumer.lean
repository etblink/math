import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2B2B2OriginalOperatorLpContinuousEquiv

/-!
Independent source consumer: original bounded Fermion 2 operators on the
actual Boson 2 volume L², genuine Fock ONB, continuous and NOT isometric
original operator-norm ↔ separate HS-column-norm L² equivalence.
-/
set_option autoImplicit false

namespace BFSSP3M2B2B2OriginalOperatorLpContinuousEquivIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M2AOriginalFockHSFiber
open FCP.BFSSP3M2B2B0OriginalFockOperatorHSContinuousEquiv
open FCP.BFSSP3M2B2B1OriginalOperatorLpTransport
open FCP.BFSSP3M2B2B2OriginalOperatorLpContinuousEquiv
open MeasureTheory

variable {ι : Type*} [Fintype ι]
variable (b : OrthonormalBasis ι ℂ (Fermion 2))

example : OriginalFockOperatorLp ≃L[ℂ] OriginalFockHSFieldLp ι :=
  originalFockOperatorLpHSContinuousEquiv b

example (f : OriginalFockOperatorLp) :
    (originalFockOperatorLpHSContinuousEquiv b).symm
      (originalFockOperatorLpHSContinuousEquiv b f) = f :=
  (originalFockOperatorLpHSContinuousEquiv b).symm_apply_apply f

example (u : OriginalFockHSFieldLp ι) :
    originalFockOperatorLpHSContinuousEquiv b
      ((originalFockOperatorLpHSContinuousEquiv b).symm u) = u :=
  (originalFockOperatorLpHSContinuousEquiv b).apply_symm_apply u

example (f : OriginalFockOperatorLp) :
    ((originalFockOperatorLpHSContinuousEquiv b f :
      OriginalFockHSFieldLp ι) : Boson 2 → OriginalFockHSFiber ι) =ᵐ[volume]
        (fun x : Boson 2 =>
          originalFockOperatorHSContinuousEquiv b (f x)) :=
  originalFockOperatorLpHSContinuousEquiv_apply_ae b f

example (u : OriginalFockHSFieldLp ι) :
    (((originalFockOperatorLpHSContinuousEquiv b).symm u :
      OriginalFockOperatorLp) :
      Boson 2 → (Fermion 2 →L[ℂ] Fermion 2)) =ᵐ[volume]
        (fun x : Boson 2 =>
          (originalFockOperatorHSContinuousEquiv b).symm (u x)) :=
  originalFockOperatorLpHSContinuousEquiv_symm_apply_ae b u

private abbrev OriginalFockIndex := Fin (2 ^ (8 * colorDim 2))

example : OrthonormalBasis OriginalFockIndex ℂ (Fermion 2) :=
  EuclideanSpace.basisFun OriginalFockIndex ℂ

example : OriginalFockOperatorLp ≃L[ℂ]
    OriginalFockHSFieldLp OriginalFockIndex :=
  originalFockOperatorLpHSContinuousEquiv
    (EuclideanSpace.basisFun OriginalFockIndex ℂ)

example (f : OriginalFockOperatorLp) :
    (originalFockOperatorLpHSContinuousEquiv
      (EuclideanSpace.basisFun OriginalFockIndex ℂ)).symm
      (originalFockOperatorLpHSContinuousEquiv
        (EuclideanSpace.basisFun OriginalFockIndex ℂ) f) = f :=
  (originalFockOperatorLpHSContinuousEquiv
    (EuclideanSpace.basisFun OriginalFockIndex ℂ)).symm_apply_apply f

#print axioms FCP.BFSSP3M2B2B2OriginalOperatorLpContinuousEquiv.originalFockOperatorLpHSContinuousEquiv
#print axioms FCP.BFSSP3M2B2B2OriginalOperatorLpContinuousEquiv.originalFockOperatorLpHSContinuousEquiv_apply_ae
#print axioms FCP.BFSSP3M2B2B2OriginalOperatorLpContinuousEquiv.originalFockOperatorLpHSContinuousEquiv_symm_apply_ae

end
end BFSSP3M2B2B2OriginalOperatorLpContinuousEquivIndependentConsumer
