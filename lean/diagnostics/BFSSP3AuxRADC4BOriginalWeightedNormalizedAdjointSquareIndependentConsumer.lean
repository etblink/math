import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC4BOriginalWeightedNormalizedAdjointSquare
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Independent original paired SU2 consumer of all seven C4B contracts. -/
set_option autoImplicit false
namespace BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquareIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8BB
open FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph
open FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare
open FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare
open MeasureTheory

example : FullL2 2 = Lp (Fermion 2) 2
    (volume : Measure (Boson 2)) := rfl

example {ε : ℝ} (hε : 0 < ε) :
    originalWeightedPhysicalNormalizedAdjointSquare
      pairedAlgebraData pairedGaugeData hε =
        (1 / 16 : ℂ) • originalWeightedPhysicalAdjointSquare
          pairedAlgebraData pairedGaugeData hε :=
  originalWeightedPhysicalNormalizedAdjointSquare_eq
    pairedAlgebraData pairedGaugeData hε

example {ε : ℝ} (hε : 0 < ε) :
    (originalWeightedPhysicalNormalizedAdjointSquare
      pairedAlgebraData pairedGaugeData hε).domain =
        (originalWeightedPhysicalAdjointSquare
          pairedAlgebraData pairedGaugeData hε).domain :=
  originalWeightedPhysicalNormalizedAdjointSquare_domain
    pairedAlgebraData pairedGaugeData hε

example {ε : ℝ} (hε : 0 < ε)
    (u : (originalWeightedPhysicalAdjointSquare
      pairedAlgebraData pairedGaugeData hε).domain) :
    originalWeightedPhysicalNormalizedAdjointSquare
      pairedAlgebraData pairedGaugeData hε
      ⟨u, by
        rw [originalWeightedPhysicalNormalizedAdjointSquare_domain
          pairedAlgebraData pairedGaugeData hε]
        exact u.property⟩ =
      (1 / 16 : ℂ) • originalWeightedPhysicalAdjointSquare
        pairedAlgebraData pairedGaugeData hε u :=
  originalWeightedPhysicalNormalizedAdjointSquare_apply
    pairedAlgebraData pairedGaugeData hε u

example {ε : ℝ} (hε : 0 < ε) :
    letI : CompleteSpace pairedGaugeData.physicalSpace :=
      originalPhysicalHilbertComplete pairedAlgebraData pairedGaugeData
    IsSelfAdjoint (originalWeightedPhysicalNormalizedAdjointSquare
      pairedAlgebraData pairedGaugeData hε) :=
  originalWeightedPhysicalNormalizedAdjointSquare_selfAdjoint
    pairedAlgebraData pairedGaugeData hε

example {ε : ℝ} (hε : 0 < ε) :
    (originalWeightedPhysicalNormalizedAdjointSquare
      pairedAlgebraData pairedGaugeData hε).IsClosed :=
  originalWeightedPhysicalNormalizedAdjointSquare_closed
    pairedAlgebraData pairedGaugeData hε

example {ε : ℝ} (hε : 0 < ε) :
    Dense ((originalWeightedPhysicalNormalizedAdjointSquare
      pairedAlgebraData pairedGaugeData hε).domain :
      Set pairedGaugeData.physicalSpace) :=
  originalWeightedPhysicalNormalizedAdjointSquare_domain_dense
    pairedAlgebraData pairedGaugeData hε

example {ε : ℝ} (hε : 0 < ε)
    (u : (originalWeightedPhysicalChargeColumn
      pairedAlgebraData pairedGaugeData hε).domain)
    (w : pairedGaugeData.physicalSpace) :
    (∀ v : (originalWeightedPhysicalChargeColumn
      pairedAlgebraData pairedGaugeData hε).domain,
      inner ℂ w (v : pairedGaugeData.physicalSpace) =
        (1 / 16 : ℂ) *
          inner ℂ
            (originalWeightedPhysicalChargeColumn
              pairedAlgebraData pairedGaugeData hε u)
            (originalWeightedPhysicalChargeColumn
              pairedAlgebraData pairedGaugeData hε v)) ↔
      ∃ h : (u : pairedGaugeData.physicalSpace) ∈
          (originalWeightedPhysicalNormalizedAdjointSquare
            pairedAlgebraData pairedGaugeData hε).domain,
        w = originalWeightedPhysicalNormalizedAdjointSquare
          pairedAlgebraData pairedGaugeData hε ⟨u, h⟩ :=
  originalWeightedPhysicalNormalizedAdjointSquare_weakForm_iff
    pairedAlgebraData pairedGaugeData hε u w

#print axioms FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare.originalWeightedPhysicalNormalizedAdjointSquare_eq
#print axioms FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare.originalWeightedPhysicalNormalizedAdjointSquare_domain
#print axioms FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare.originalWeightedPhysicalNormalizedAdjointSquare_apply
#print axioms FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare.originalWeightedPhysicalNormalizedAdjointSquare_selfAdjoint
#print axioms FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare.originalWeightedPhysicalNormalizedAdjointSquare_closed
#print axioms FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare.originalWeightedPhysicalNormalizedAdjointSquare_domain_dense
#print axioms FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare.originalWeightedPhysicalNormalizedAdjointSquare_weakForm_iff
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.normalizedWeakRepresentative_iff_naturalAdjointSquare
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.one_sixteenth_inner_smul
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.adjoint_smul_of_dense
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.selfAdjoint_smul_real
#print axioms FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare.originalWeightedPhysicalAdjointSquare_selfAdjoint
#print axioms FCP.BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensity.originalWeightedPhysicalChargeColumn_domain_dense_unconditional

end
end BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquareIndependentConsumer
