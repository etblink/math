import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC4AOriginalWeightedNaturalAdjointSquare
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Independent exact paired SU2/Fock/FullL2 natural weighted adjoint-square consumer. -/
set_option autoImplicit false
namespace BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquareIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8BB
open FCP.BFSSSU2PhysicalDomainL6H5E8BC
open FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph
open FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare
open MeasureTheory

example : FullL2 2 = Lp (Fermion 2) 2
    (volume : Measure (Boson 2)) := rfl

example {ε : ℝ} (hε : 0 < ε) (u : pairedGaugeData.physicalSpace) :
    letI : CompleteSpace pairedGaugeData.physicalSpace :=
      originalPhysicalHilbertComplete pairedAlgebraData pairedGaugeData
    u ∈ (originalWeightedPhysicalAdjointSquare
      pairedAlgebraData pairedGaugeData hε).domain ↔
      ∃ hu : u ∈ (originalWeightedPhysicalChargeColumn
        pairedAlgebraData pairedGaugeData hε).domain,
        originalWeightedPhysicalChargeColumn
          pairedAlgebraData pairedGaugeData hε ⟨u, hu⟩ ∈
          (originalWeightedPhysicalChargeColumn
            pairedAlgebraData pairedGaugeData hε).adjoint.domain :=
  originalWeightedPhysicalAdjointSquare_domain
    pairedAlgebraData pairedGaugeData hε u

example {ε : ℝ} (hε : 0 < ε) :
    letI : CompleteSpace pairedGaugeData.physicalSpace :=
      originalPhysicalHilbertComplete pairedAlgebraData pairedGaugeData
    IsSelfAdjoint (originalWeightedPhysicalAdjointSquare
      pairedAlgebraData pairedGaugeData hε) :=
  originalWeightedPhysicalAdjointSquare_selfAdjoint
    pairedAlgebraData pairedGaugeData hε

example {ε : ℝ} (hε : 0 < ε) :
    (originalWeightedPhysicalAdjointSquare
      pairedAlgebraData pairedGaugeData hε).IsClosed :=
  originalWeightedPhysicalAdjointSquare_closed
    pairedAlgebraData pairedGaugeData hε

example {ε : ℝ} (hε : 0 < ε) :
    Dense ((originalWeightedPhysicalAdjointSquare
      pairedAlgebraData pairedGaugeData hε).domain :
      Set pairedGaugeData.physicalSpace) :=
  originalWeightedPhysicalAdjointSquare_domain_dense
    pairedAlgebraData pairedGaugeData hε

example {ε : ℝ} (hε : 0 < ε)
    (u : (originalWeightedPhysicalAdjointSquare
      pairedAlgebraData pairedGaugeData hε).domain) :
    letI : CompleteSpace pairedGaugeData.physicalSpace :=
      originalPhysicalHilbertComplete pairedAlgebraData pairedGaugeData
    Complex.re (inner ℂ
      (originalWeightedPhysicalAdjointSquare
        pairedAlgebraData pairedGaugeData hε u)
      (u : pairedGaugeData.physicalSpace)) =
      ‖originalWeightedPhysicalChargeColumn
        pairedAlgebraData pairedGaugeData hε
        ⟨u, naturalComp_domain_le u.property⟩‖ ^ 2 :=
  originalWeightedPhysicalAdjointSquare_energy
    pairedAlgebraData pairedGaugeData hε u

example {ε : ℝ} (hε : 0 < ε)
    (u : (originalWeightedPhysicalAdjointSquare
      pairedAlgebraData pairedGaugeData hε).domain) :
    0 ≤ Complex.re (inner ℂ
      (originalWeightedPhysicalAdjointSquare
        pairedAlgebraData pairedGaugeData hε u)
      (u : pairedGaugeData.physicalSpace)) :=
  originalWeightedPhysicalAdjointSquare_nonneg
    pairedAlgebraData pairedGaugeData hε u

#print axioms FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare.originalWeightedPhysicalAdjointSquare_domain
#print axioms FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare.originalWeightedPhysicalAdjointSquare_selfAdjoint
#print axioms FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare.originalWeightedPhysicalAdjointSquare_closed
#print axioms FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare.originalWeightedPhysicalAdjointSquare_domain_dense
#print axioms FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare.originalWeightedPhysicalAdjointSquare_energy
#print axioms FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare.originalWeightedPhysicalAdjointSquare_nonneg
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BC.naturalComp_mem_domain
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BC.naturalFormalProduct_inner
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BC.naturalFormalProduct_symmetric
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BD.naturalAdjointSquare_shift_graph_surjective
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BD.selfAdjoint_of_formalSymmetry_and_shift_surjectivity
#print axioms FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph.originalWeightedPhysicalChargeColumn_isClosed
#print axioms FCP.BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensity.originalWeightedPhysicalChargeColumn_domain_dense_unconditional

end
end BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquareIndependentConsumer
