import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC4COriginalWeightedKernelPreservation
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Independent exact paired SU2 partial-kernel consumer, all nine contracts. -/
set_option autoImplicit false
namespace BFSSP3AuxRADC4COriginalWeightedKernelPreservationIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSSU2PhysicalDomainL6H5E8BA
open FCP.BFSSSU2PhysicalDomainL6H5E8BB
open FCP.BFSSSU2PhysicalDomainL6H5E8BC
open FCP.BFSSSU2PhysicalDomainL6H5E8BE
open FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph
open FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare
open FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare
open FCP.BFSSP3AuxRADC4COriginalWeightedKernelPreservation
open MeasureTheory

example : FullL2 2 = Lp (Fermion 2) 2
    (volume : Measure (Boson 2)) := rfl

example (x : pairedGaugeData.physicalSpace) :
    x ∈ (originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData).ker ↔
      (x, (0 : PiLp 2 (fun _ : SpinIndex => FullL2 2))) ∈
        (originalMinimalPhysicalHilbertChargeColumn
          pairedAlgebraData pairedGaugeData).graph :=
  mem_ker_iff_graph_zero _ x

example {ε : ℝ} (hε : 0 < ε) :
    ((1 / 16 : ℂ) • originalWeightedPhysicalAdjointSquare
      pairedAlgebraData pairedGaugeData hε).ker =
      (originalWeightedPhysicalAdjointSquare
        pairedAlgebraData pairedGaugeData hε).ker :=
  oneSixteenth_ker _

example (x : pairedGaugeData.physicalSpace) :
    letI : CompleteSpace pairedGaugeData.physicalSpace :=
      originalPhysicalHilbertComplete pairedAlgebraData pairedGaugeData
    (x, (0 : pairedGaugeData.physicalSpace)) ∈
        (naturalComp
          (originalMinimalPhysicalHilbertChargeColumn
            pairedAlgebraData pairedGaugeData).adjoint
          (originalMinimalPhysicalHilbertChargeColumn
            pairedAlgebraData pairedGaugeData)).graph ↔
      (x, (0 : PiLp 2 (fun _ : SpinIndex => FullL2 2))) ∈
        (originalMinimalPhysicalHilbertChargeColumn
          pairedAlgebraData pairedGaugeData).graph := by
  let : CompleteSpace pairedGaugeData.physicalSpace :=
    originalPhysicalHilbertComplete pairedAlgebraData pairedGaugeData
  exact naturalAdjointSquare_graph_zero_iff _
    (originalMinimalPhysicalHilbertChargeColumn_domain_dense_unconditional
      pairedAlgebraData pairedGaugeData) x

example :
    letI : CompleteSpace pairedGaugeData.physicalSpace :=
      originalPhysicalHilbertComplete pairedAlgebraData pairedGaugeData
    (naturalComp
      (originalMinimalPhysicalHilbertChargeColumn
        pairedAlgebraData pairedGaugeData).adjoint
      (originalMinimalPhysicalHilbertChargeColumn
        pairedAlgebraData pairedGaugeData)).ker =
      (originalMinimalPhysicalHilbertChargeColumn
        pairedAlgebraData pairedGaugeData).ker := by
  let : CompleteSpace pairedGaugeData.physicalSpace :=
    originalPhysicalHilbertComplete pairedAlgebraData pairedGaugeData
  exact naturalAdjointSquare_ker _
    (originalMinimalPhysicalHilbertChargeColumn_domain_dense_unconditional
      pairedAlgebraData pairedGaugeData)

example {ε : ℝ} (hε : 0 < ε) (x : pairedGaugeData.physicalSpace) :
    (x, (0 : PiLp 2 (fun _ : SpinIndex => FullL2 2))) ∈
        (originalWeightedPhysicalChargeColumn
          pairedAlgebraData pairedGaugeData hε).graph ↔
      (x, (0 : PiLp 2 (fun _ : SpinIndex => FullL2 2))) ∈
        (originalMinimalPhysicalHilbertChargeColumn
          pairedAlgebraData pairedGaugeData).graph :=
  originalWeightedPhysicalCharge_graph_zero_iff
    pairedAlgebraData pairedGaugeData hε x

example {ε : ℝ} (hε : 0 < ε) :
    (originalWeightedPhysicalChargeColumn
      pairedAlgebraData pairedGaugeData hε).ker =
      (originalMinimalPhysicalHilbertChargeColumn
        pairedAlgebraData pairedGaugeData).ker :=
  originalWeightedPhysicalCharge_ker_eq_original
    pairedAlgebraData pairedGaugeData hε

example {ε : ℝ} (hε : 0 < ε) :
    (originalWeightedPhysicalNormalizedAdjointSquare
      pairedAlgebraData pairedGaugeData hε).ker =
      (originalWeightedPhysicalChargeColumn
        pairedAlgebraData pairedGaugeData hε).ker :=
  originalWeightedNormalized_ker_eq_charge
    pairedAlgebraData pairedGaugeData hε

example :
    (originalMinimalPhysicalNormalizedHamiltonian
      pairedAlgebraData pairedGaugeData).ker =
      (originalMinimalPhysicalHilbertChargeColumn
        pairedAlgebraData pairedGaugeData).ker :=
  originalNormalizedHamiltonian_ker_eq_charge
    pairedAlgebraData pairedGaugeData

example {ε : ℝ} (hε : 0 < ε) :
    (originalWeightedPhysicalNormalizedAdjointSquare
      pairedAlgebraData pairedGaugeData hε).ker =
      (originalMinimalPhysicalNormalizedHamiltonian
        pairedAlgebraData pairedGaugeData).ker :=
  originalWeightedNormalized_ker_eq_originalH
    pairedAlgebraData pairedGaugeData hε

#print axioms FCP.BFSSP3AuxRADC4COriginalWeightedKernelPreservation.mem_ker_iff_graph_zero
#print axioms FCP.BFSSP3AuxRADC4COriginalWeightedKernelPreservation.oneSixteenth_ker
#print axioms FCP.BFSSP3AuxRADC4COriginalWeightedKernelPreservation.naturalAdjointSquare_graph_zero_iff
#print axioms FCP.BFSSP3AuxRADC4COriginalWeightedKernelPreservation.naturalAdjointSquare_ker
#print axioms FCP.BFSSP3AuxRADC4COriginalWeightedKernelPreservation.originalWeightedPhysicalCharge_graph_zero_iff
#print axioms FCP.BFSSP3AuxRADC4COriginalWeightedKernelPreservation.originalWeightedPhysicalCharge_ker_eq_original
#print axioms FCP.BFSSP3AuxRADC4COriginalWeightedKernelPreservation.originalWeightedNormalized_ker_eq_charge
#print axioms FCP.BFSSP3AuxRADC4COriginalWeightedKernelPreservation.originalNormalizedHamiltonian_ker_eq_charge
#print axioms FCP.BFSSP3AuxRADC4COriginalWeightedKernelPreservation.originalWeightedNormalized_ker_eq_originalH
#print axioms FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph.originalWeightedPhysicalChargeColumn_graph_eq
#print axioms FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph.originalWeightedPhysicalChargeGraph_mem_iff
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BD.mem_graph_naturalComp
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BA.originalMinimalPhysicalHilbertChargeColumn_domain_dense_unconditional
#print axioms FCP.BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensity.originalWeightedPhysicalChargeColumn_domain_dense_unconditional
#print axioms FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare.originalWeightedPhysicalNormalizedAdjointSquare_eq
#print axioms FCP.BFSSSU2PhysicalDomainL6H5E8BE.originalMinimalPhysicalNormalizedHamiltonian_selfAdjoint

end
end BFSSP3AuxRADC4COriginalWeightedKernelPreservationIndependentConsumer
