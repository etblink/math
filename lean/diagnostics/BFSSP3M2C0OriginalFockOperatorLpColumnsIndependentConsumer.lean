import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M2C0OriginalFockOperatorLpColumns

/-!
Independent original Boson 2 / Fermion 2 Fock operator L² consumer.
This checks the actual operator-norm source, real vector-valued L²
columns, a.e. evaluation on the original ONB and both inverse laws.
-/
set_option autoImplicit false

namespace BFSSP3M2C0OriginalFockOperatorLpColumnsIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M2B2B1OriginalOperatorLpTransport
open FCP.BFSSP3M2C0OriginalFockOperatorLpColumns
open MeasureTheory

variable {ι : Type*} [Fintype ι]
variable (b : OrthonormalBasis ι ℂ (Fermion 2))

example : OriginalFockOperatorLp ≃L[ℂ]
    PiLp 2 (fun _ : ι =>
      Lp (Fermion 2) 2 (volume : Measure (Boson 2))) :=
  originalFockOperatorLpColumnsEquiv b

example (f : OriginalFockOperatorLp) (i : ι) :
    ((originalFockOperatorLpColumnsEquiv b f i :
      Lp (Fermion 2) 2 (volume : Measure (Boson 2))) :
        Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 => (f x) (b i)) :=
  originalFockOperatorLpColumnsEquiv_apply_ae b f i

example (f : OriginalFockOperatorLp) :
    (originalFockOperatorLpColumnsEquiv b).symm
      (originalFockOperatorLpColumnsEquiv b f) = f :=
  originalFockOperatorLpColumnsEquiv_symm_apply_apply b f

example (v : PiLp 2 (fun _ : ι =>
    Lp (Fermion 2) 2 (volume : Measure (Boson 2)))) :
    originalFockOperatorLpColumnsEquiv b
      ((originalFockOperatorLpColumnsEquiv b).symm v) = v :=
  (originalFockOperatorLpColumnsEquiv b).apply_symm_apply v

private abbrev OriginalFockIndex := Fin (2 ^ (8 * colorDim 2))

example : OrthonormalBasis OriginalFockIndex ℂ (Fermion 2) :=
  EuclideanSpace.basisFun OriginalFockIndex ℂ

example : OriginalFockOperatorLp ≃L[ℂ]
    PiLp 2 (fun _ : OriginalFockIndex =>
      Lp (Fermion 2) 2 (volume : Measure (Boson 2))) :=
  originalFockOperatorLpColumnsEquiv
    (EuclideanSpace.basisFun OriginalFockIndex ℂ)

example (f : OriginalFockOperatorLp) (i : OriginalFockIndex) :
    ((originalFockOperatorLpColumnsEquiv
      (EuclideanSpace.basisFun OriginalFockIndex ℂ) f i :
      Lp (Fermion 2) 2 (volume : Measure (Boson 2))) :
        Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 =>
        (f x) ((EuclideanSpace.basisFun OriginalFockIndex ℂ) i)) :=
  originalFockOperatorLpColumnsEquiv_apply_ae
    (EuclideanSpace.basisFun OriginalFockIndex ℂ) f i

#print axioms FCP.BFSSP3M2C0OriginalFockOperatorLpColumns.originalFockOperatorLpColumnsEquiv
#print axioms FCP.BFSSP3M2C0OriginalFockOperatorLpColumns.originalFockOperatorLpColumnsEquiv_apply_ae
#print axioms FCP.BFSSP3M2C0OriginalFockOperatorLpColumns.originalFockOperatorLpColumnsEquiv_symm_apply_apply

end
end BFSSP3M2C0OriginalFockOperatorLpColumnsIndependentConsumer
