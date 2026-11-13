import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M3G0AOriginalFockGaugeColumnTransport

/-!
P3-M3G0A — PROSPECTIVE / UNCOMPILED source-exact consumer.
No proxy boson field, no replacement fermion or HS isometry,
no physical fixed-point or spectral claims.
-/
set_option autoImplicit false

namespace BFSSP3M3G0AOriginalFockGaugeColumnTransportIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M2B2B1OriginalOperatorLpTransport
open FCP.BFSSP3M2C0OriginalFockOperatorLpColumns
open FCP.BFSSP3M3G0AOriginalFockGaugeColumnTransport
open FCP.BFSSSU2PhysicalDomainL6G7Z
open MeasureTheory

variable {ι : Type*} [Fintype ι]
variable (b : OrthonormalBasis ι ℂ (Fermion 2))
variable (g h : GaugeGroup 2) (f : OriginalFockOperatorLp)

/-- Exact original bounded-operator L² carrier over actual Boson 2. -/
example : OriginalFockOperatorLp =
    Lp (Fermion 2 →L[ℂ] Fermion 2) 2
      (volume : Measure (Boson 2)) := rfl

/-- Actual FullL2 is the original Fermion 2 fiber and Boson 2 base. -/
example : FullL2 2 =
    Lp (Fermion 2) 2 (volume : Measure (Boson 2)) := rfl

example :
    originalFockOperatorLpColumnsEquiv b
      (originalFockOperatorGaugeEquiv b g f) =
        originalFockDiagonalGaugeUnitary (ι := ι) g
          (originalFockOperatorLpColumnsEquiv b f) :=
  originalFockOperatorGaugeEquiv_columns b g f

example (i : ι) :
    (originalFockOperatorLpColumnsEquiv b
      (originalFockOperatorGaugeEquiv b g f)) i =
        actualOriginalFullL2GaugeUnitaryHom g
          ((originalFockOperatorLpColumnsEquiv b f) i) :=
  originalFockOperatorGaugeEquiv_column_apply b g f i

example : originalFockOperatorGaugeEquiv b (1 : GaugeGroup 2) f = f :=
  originalFockOperatorGaugeEquiv_one_apply b f

example : originalFockOperatorGaugeEquiv b (g * h) f =
    originalFockOperatorGaugeEquiv b g
      (originalFockOperatorGaugeEquiv b h f) :=
  originalFockOperatorGaugeEquiv_mul_apply b g h f

example : originalFockOperatorGaugeEquiv b g⁻¹
    (originalFockOperatorGaugeEquiv b g f) = f :=
  originalFockOperatorGaugeEquiv_inv_cancel b g f

/-- Literal source Fock basis, avoiding explicit 2^24 enumeration. -/
private abbrev OriginalFockIndex := Fin (2 ^ (8 * colorDim 2))

example : OrthonormalBasis OriginalFockIndex ℂ (Fermion 2) :=
  EuclideanSpace.basisFun OriginalFockIndex ℂ

example (f : OriginalFockOperatorLp) :
    originalFockOperatorGaugeEquiv
      (EuclideanSpace.basisFun OriginalFockIndex ℂ) (1 : GaugeGroup 2) f = f :=
  originalFockOperatorGaugeEquiv_one_apply
    (EuclideanSpace.basisFun OriginalFockIndex ℂ) f

#print axioms FCP.BFSSP3M3G0AOriginalFockGaugeColumnTransport.originalFockDiagonalGaugeUnitary
#print axioms FCP.BFSSP3M3G0AOriginalFockGaugeColumnTransport.originalFockOperatorGaugeEquiv
#print axioms FCP.BFSSP3M3G0AOriginalFockGaugeColumnTransport.originalFockOperatorGaugeEquiv_columns
#print axioms FCP.BFSSP3M3G0AOriginalFockGaugeColumnTransport.originalFockOperatorGaugeEquiv_column_apply
#print axioms FCP.BFSSP3M3G0AOriginalFockGaugeColumnTransport.originalFockDiagonalGaugeUnitary_one_apply
#print axioms FCP.BFSSP3M3G0AOriginalFockGaugeColumnTransport.originalFockDiagonalGaugeUnitary_mul_apply
#print axioms FCP.BFSSP3M3G0AOriginalFockGaugeColumnTransport.originalFockOperatorGaugeEquiv_one_apply
#print axioms FCP.BFSSP3M3G0AOriginalFockGaugeColumnTransport.originalFockOperatorGaugeEquiv_mul_apply
#print axioms FCP.BFSSP3M3G0AOriginalFockGaugeColumnTransport.originalFockOperatorGaugeEquiv_inv_cancel

end
end BFSSP3M3G0AOriginalFockGaugeColumnTransportIndependentConsumer
