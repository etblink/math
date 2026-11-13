import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M3G0B1OriginalGaugeAEFullOperator

/-!
P3-M3G0B1 — independent consumer on exact original operators/Fock fiber.
PROSPECTIVE / UNCOMPILED until independently strict qualified.
-/
set_option autoImplicit false

namespace BFSSP3M3G0B1OriginalGaugeAEFullOperatorIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSS1V0
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSP3M2B2B1OriginalOperatorLpTransport
open FCP.BFSSP3M3G0AOriginalFockGaugeColumnTransport
open FCP.BFSSP3M3G0B1OriginalGaugeAEFullOperator
open MeasureTheory

variable {ι : Type*} [Fintype ι]

private abbrev OriginalFockIndex := Fin (2 ^ (8 * colorDim 2))

example : OriginalFockOperatorLp =
  Lp (Fermion 2 →L[ℂ] Fermion 2) 2 (volume : Measure (Boson 2)) := rfl

example : OrthonormalBasis OriginalFockIndex ℂ (Fermion 2) :=
  EuclideanSpace.basisFun OriginalFockIndex ℂ

example (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : GaugeGroup 2) (f : OriginalFockOperatorLp) :
    ∀ᵐ x : Boson 2 ∂(volume : Measure (Boson 2)),
      ∀ i : ι,
        ((originalFockOperatorGaugeEquiv b g f : OriginalFockOperatorLp) x)
          (b i) =
        pairedGaugeData.fermion g
          ((f (pairedGaugeData.boson g⁻¹ x)) (b i)) :=
  originalFockOperatorGaugeEquiv_source_all_basis_ae b g f

example (b : OrthonormalBasis ι ℂ (Fermion 2))
    (T S : Fermion 2 →L[ℂ] Fermion 2)
    (h : ∀ i : ι, T (b i) = S (b i)) : T = S :=
  originalFockOperator_eq_of_basis b T S h

example (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : GaugeGroup 2) (f : OriginalFockOperatorLp) :
    (fun x : Boson 2 =>
      ((originalFockOperatorGaugeEquiv b g f : OriginalFockOperatorLp) x)) =ᵐ[volume]
      (fun x : Boson 2 =>
        ((pairedGaugeData.fermion g).toContinuousLinearEquiv.toContinuousLinearMap).comp
          (f (pairedGaugeData.boson g⁻¹ x))) :=
  originalFockOperatorGaugeEquiv_source_operator_ae b g f

example (g : GaugeGroup 2) (f : OriginalFockOperatorLp) :
    (fun x : Boson 2 =>
      ((originalFockOperatorGaugeEquiv
        (EuclideanSpace.basisFun OriginalFockIndex ℂ) g f :
          OriginalFockOperatorLp) x)) =ᵐ[volume]
      (fun x : Boson 2 =>
        ((pairedGaugeData.fermion g).toContinuousLinearEquiv.toContinuousLinearMap).comp
          (f (pairedGaugeData.boson g⁻¹ x))) :=
  originalFockOperatorGaugeEquiv_source_operator_ae
    (EuclideanSpace.basisFun OriginalFockIndex ℂ) g f

#print axioms FCP.BFSSP3M3G0B1OriginalGaugeAEFullOperator.originalFockOperatorGaugeEquiv_source_all_basis_ae
#print axioms FCP.BFSSP3M3G0B1OriginalGaugeAEFullOperator.originalFockOperator_eq_of_basis
#print axioms FCP.BFSSP3M3G0B1OriginalGaugeAEFullOperator.originalFockOperatorGaugeEquiv_source_operator_ae

end
end BFSSP3M3G0B1OriginalGaugeAEFullOperatorIndependentConsumer
