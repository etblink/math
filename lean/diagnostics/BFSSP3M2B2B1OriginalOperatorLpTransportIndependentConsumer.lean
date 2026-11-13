import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2B2B1OriginalOperatorLpTransport

/-!
Independent consumer of the genuine source original operator-valued L²
on Boson 2, not a surrogate Hilbert Fock model or norm substitution.
Uses the actual Fermion 2 bounded operator type and concrete ONB.
-/
set_option autoImplicit false

namespace BFSSP3M2B2B1OriginalOperatorLpTransportIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M2AOriginalFockHSFiber
open FCP.BFSSP3M2B2B0OriginalFockOperatorHSContinuousEquiv
open FCP.BFSSP3M2B2B1OriginalOperatorLpTransport
open MeasureTheory

variable {ι : Type*} [Fintype ι]
variable (b : OrthonormalBasis ι ℂ (Fermion 2))

example : OriginalFockOperatorLp →L[ℂ] OriginalFockHSFieldLp ι :=
  originalFockOperatorLpToHSField b

example : OriginalFockHSFieldLp ι →L[ℂ] OriginalFockOperatorLp :=
  originalFockHSFieldLpToOperator b

example (f : OriginalFockOperatorLp) :
    ((originalFockOperatorLpToHSField b f : OriginalFockHSFieldLp ι) :
      Boson 2 → OriginalFockHSFiber ι) =ᵐ[volume]
        (fun x : Boson 2 => originalFockOperatorHSContinuousEquiv b (f x)) :=
  originalFockOperatorLpToHSField_ae b f

example (u : OriginalFockHSFieldLp ι) :
    ((originalFockHSFieldLpToOperator b u : OriginalFockOperatorLp) :
      Boson 2 → (Fermion 2 →L[ℂ] Fermion 2)) =ᵐ[volume]
        (fun x : Boson 2 =>
          (originalFockOperatorHSContinuousEquiv b).symm (u x)) :=
  originalFockHSFieldLpToOperator_ae b u

example (f : OriginalFockOperatorLp) :
    originalFockHSFieldLpToOperator b
      (originalFockOperatorLpToHSField b f) = f :=
  originalFockOperatorLp_recovered b f

example (u : OriginalFockHSFieldLp ι) :
    originalFockOperatorLpToHSField b
      (originalFockHSFieldLpToOperator b u) = u :=
  originalFockHSFieldLp_recovered b u

private abbrev OriginalFockIndex := Fin (2 ^ (8 * colorDim 2))

example : OrthonormalBasis OriginalFockIndex ℂ (Fermion 2) :=
  EuclideanSpace.basisFun OriginalFockIndex ℂ

example : OriginalFockOperatorLp →L[ℂ]
    OriginalFockHSFieldLp OriginalFockIndex :=
  originalFockOperatorLpToHSField
    (EuclideanSpace.basisFun OriginalFockIndex ℂ)

example (f : OriginalFockOperatorLp) :
    originalFockHSFieldLpToOperator
      (EuclideanSpace.basisFun OriginalFockIndex ℂ)
      (originalFockOperatorLpToHSField
        (EuclideanSpace.basisFun OriginalFockIndex ℂ) f) = f :=
  originalFockOperatorLp_recovered
    (EuclideanSpace.basisFun OriginalFockIndex ℂ) f

#print axioms FCP.BFSSP3M2B2B1OriginalOperatorLpTransport.originalFockOperatorLpToHSField
#print axioms FCP.BFSSP3M2B2B1OriginalOperatorLpTransport.originalFockHSFieldLpToOperator
#print axioms FCP.BFSSP3M2B2B1OriginalOperatorLpTransport.originalFockOperatorLpToHSField_ae
#print axioms FCP.BFSSP3M2B2B1OriginalOperatorLpTransport.originalFockHSFieldLpToOperator_ae
#print axioms FCP.BFSSP3M2B2B1OriginalOperatorLpTransport.originalFockOperatorLp_recovered
#print axioms FCP.BFSSP3M2B2B1OriginalOperatorLpTransport.originalFockHSFieldLp_recovered

end
end BFSSP3M2B2B1OriginalOperatorLpTransportIndependentConsumer
