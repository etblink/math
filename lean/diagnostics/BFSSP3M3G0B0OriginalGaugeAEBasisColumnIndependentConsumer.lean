import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M3G0B0OriginalGaugeAEBasisColumn

/-!
# P3-M3G0B0 independent source-real consumer — UNQUALIFIED until strict CI
Tests actual Boson 2, Fermion 2, FullL2 2, original bounded-operator
Lp and exact source SU2; no proxy action or pointwise conjugation.
-/
set_option autoImplicit false

namespace BFSSP3M3G0B0OriginalGaugeAEBasisColumnIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSS1V0
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6G7Z
open FCP.BFSSP3M2B2B1OriginalOperatorLpTransport
open FCP.BFSSP3M2C0OriginalFockOperatorLpColumns
open FCP.BFSSP3M3G0AOriginalFockGaugeColumnTransport
open FCP.BFSSP3M3G0B0OriginalGaugeAEBasisColumn
open MeasureTheory

variable {ι : Type*} [Fintype ι]

private abbrev OriginalFockIndex := Fin (2 ^ (8 * colorDim 2))

example : OriginalFockOperatorLp =
    Lp (Fermion 2 →L[ℂ] Fermion 2) 2
      (volume : Measure (Boson 2)) := rfl

example : FullL2 2 =
    Lp (Fermion 2) 2
      (volume : Measure (Boson 2)) := rfl

example : OrthonormalBasis OriginalFockIndex ℂ (Fermion 2) :=
  EuclideanSpace.basisFun OriginalFockIndex ℂ

example (g : GaugeGroup 2) (v : FullL2 2) :
    ((actualOriginalFullL2GaugeUnitaryHom g v : FullL2 2) :
      Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 => pairedGaugeData.fermion g
        (v (pairedGaugeData.boson g⁻¹ x))) :=
  actualOriginalFullL2GaugeUnitaryHom_apply_ae g v

example (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : GaugeGroup 2) (f : OriginalFockOperatorLp) (i : ι) :
    ((originalFockOperatorLpColumnsEquiv b
      (originalFockOperatorGaugeEquiv b g f) i : FullL2 2) :
        Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 =>
        pairedGaugeData.fermion g
          ((originalFockOperatorLpColumnsEquiv b f i : FullL2 2)
            (pairedGaugeData.boson g⁻¹ x))) :=
  originalFockOperatorGaugeEquiv_source_column_ae b g f i

example (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : GaugeGroup 2) (f : OriginalFockOperatorLp) (i : ι) :
    (fun x : Boson 2 =>
      ((originalFockOperatorGaugeEquiv b g f : OriginalFockOperatorLp) x)
        (b i)) =ᵐ[volume]
      (fun x : Boson 2 => pairedGaugeData.fermion g
        ((f (pairedGaugeData.boson g⁻¹ x)) (b i))) :=
  originalFockOperatorGaugeEquiv_source_basis_ae b g f i

example (g : GaugeGroup 2) (f : OriginalFockOperatorLp)
    (i : OriginalFockIndex) :
    (fun x : Boson 2 =>
      ((originalFockOperatorGaugeEquiv
        (EuclideanSpace.basisFun OriginalFockIndex ℂ) g f :
          OriginalFockOperatorLp) x)
        ((EuclideanSpace.basisFun OriginalFockIndex ℂ) i)) =ᵐ[volume]
      (fun x : Boson 2 =>
        pairedGaugeData.fermion g
          ((f (pairedGaugeData.boson g⁻¹ x))
            ((EuclideanSpace.basisFun OriginalFockIndex ℂ) i))) :=
  originalFockOperatorGaugeEquiv_source_basis_ae
    (EuclideanSpace.basisFun OriginalFockIndex ℂ) g f i

#print axioms FCP.BFSSP3M3G0B0OriginalGaugeAEBasisColumn.actualOriginalFullL2GaugeUnitaryHom_apply_ae
#print axioms FCP.BFSSP3M3G0B0OriginalGaugeAEBasisColumn.originalFockOperatorGaugeEquiv_source_column_ae
#print axioms FCP.BFSSP3M3G0B0OriginalGaugeAEBasisColumn.originalFockOperatorGaugeEquiv_source_basis_ae

end
end BFSSP3M3G0B0OriginalGaugeAEBasisColumnIndependentConsumer
