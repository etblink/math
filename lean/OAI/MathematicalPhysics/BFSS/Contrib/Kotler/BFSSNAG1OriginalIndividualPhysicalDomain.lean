import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNAG0OriginalIndividualPhysicalOperator
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSUGC2ClosedGraphGaugeCovariance
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6H5E8BAOriginalPhysicalChargeUnconditionalDensityProbe

/-! NAG1: native individual domain equals the original physical column
domain; its density follows from the qualified BA source density.
Keep graph reductions dimension-parametric. No adjoint or ESA claim. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSNAG1
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSNAG0 FCP.BFSSICDB0 FCP.BFSSICDC0 FCP.BFSSUGC2
open FCP.BFSSSU2PhysicalDomainL6H5E8AU FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSSU2PhysicalDomainL6H5E8BA
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J

theorem source_individual_output_physical (M : AlgebraData 2)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖)
    (u v : FullL2 2) (hu : u ∈ G.physicalSpace)
    (hp : (u, v) ∈ originalIndividualClosedGraph M G a) :
    v ∈ G.physicalSpace := by
  obtain ⟨y, hy, he⟩ := (source_component_graph_iff M G a h u v).mp hp
  rw [← he]
  exact closed_graph_physical_output M G (originalMinimalClosedGraph_le_full M G hy) hu a

theorem source_native_domain_iff {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖)
    (hout : ∀ u v : FullL2 N, u ∈ G.physicalSpace →
      (u, v) ∈ originalIndividualClosedGraph M G a → v ∈ G.physicalSpace)
    (u : G.physicalSpace) :
    u ∈ (individualPhysicalOperator M G a).domain ↔
      u ∈ (originalMinimalPhysicalHilbertChargeColumn M G).domain := by
  constructor
  · intro hu
    obtain ⟨v, hv⟩ := LinearPMap.mem_domain_iff.mp hu
    rw [individualPhysicalOperator_graph_eq M G a h] at hv
    exact (source_common_domain M G a h u).mp
      ⟨v, (individualPhysicalGraph_mem_iff M G a u v).mp hv⟩
  · intro hu
    obtain ⟨v, hv⟩ := (source_common_domain M G a h u).mpr hu
    let w : G.physicalSpace := ⟨v, hout (u : FullL2 N) v u.property hv⟩
    have hw : (u, w) ∈ (individualPhysicalOperator M G a).graph := by
      rw [individualPhysicalOperator_graph_eq M G a h]
      exact (individualPhysicalGraph_mem_iff M G a u w).mpr hv
    exact LinearPMap.mem_domain_of_mem_graph hw

theorem source_native_domain_eq (M : AlgebraData 2)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖) :
    (individualPhysicalOperator M G a).domain =
      (originalMinimalPhysicalHilbertChargeColumn M G).domain := by
  ext u
  exact source_native_domain_iff M G a h
    (source_individual_output_physical M G a h) u

theorem source_native_domain_dense (M : AlgebraData 2)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖) :
    Dense ((individualPhysicalOperator M G a).domain : Set G.physicalSpace) := by
  rw [source_native_domain_eq M G a h]
  exact originalMinimalPhysicalHilbertChargeColumn_domain_dense_unconditional M G

theorem paired_native_domain_eq (a : SpinIndex) :
    (individualPhysicalOperator pairedAlgebraData pairedGaugeData a).domain =
      (originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData).domain :=
  source_native_domain_eq pairedAlgebraData pairedGaugeData a
    (fun f b => paired_core_charge_norm a b f)

theorem paired_native_domain_dense (a : SpinIndex) :
    Dense ((individualPhysicalOperator pairedAlgebraData pairedGaugeData a).domain :
      Set pairedGaugeData.physicalSpace) :=
  source_native_domain_dense pairedAlgebraData pairedGaugeData a
    (fun f b => paired_core_charge_norm a b f)

#print axioms source_individual_output_physical
#print axioms source_native_domain_iff
#print axioms source_native_domain_eq
#print axioms source_native_domain_dense
#print axioms paired_native_domain_eq
#print axioms paired_native_domain_dense

end
end FCP.BFSSNAG1
