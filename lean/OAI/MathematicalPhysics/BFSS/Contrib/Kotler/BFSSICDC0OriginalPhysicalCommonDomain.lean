import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSICDB0OriginalComponentGraphLifting
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQE0OriginalCoreEnergy
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6H5E8AYOriginalPhysicalHilbertChargeGraphProbe

/-! ICD-C0: exact common graph-closure input domain on the actual physical
Hilbert space, using the qualified ICD-B0 and CSQE0 theorems. Not ESA,
maximal-domain equality, Hamiltonian squares, or a spectral conclusion. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSICDC0
noncomputable section
open Set
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSICDB0
open FCP.BFSSSU2PhysicalDomainL6H5E8AU FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J

/-- The AU ambient graph and AY native physical column have exactly the
same input membership on the actual physical Hilbert subtype. -/
theorem source_joint_domain_iff {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (u : G.physicalSpace) :
    (∃ y : SpinIndex → FullL2 N, ((u : FullL2 N), y) ∈ originalMinimalClosedGraph M G) ↔
      u ∈ (originalMinimalPhysicalHilbertChargeColumn M G).domain := by
  rw [originalMinimalPhysicalHilbertChargeColumn_domain_iff M G]
  rw [LinearPMap.mem_domain_iff]
  rw [originalMinimalClosedChargeColumn_graph_eq M G]

/-- Common individual/column domain, at arbitrary N under the literal
core norm identity. -/
theorem source_common_domain {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖)
    (u : G.physicalSpace) :
    (∃ v : FullL2 N, ((u : FullL2 N), v) ∈ originalIndividualClosedGraph M G a) ↔
      u ∈ (originalMinimalPhysicalHilbertChargeColumn M G).domain := by
  rw [← source_joint_domain_iff M G u]
  constructor
  · rintro ⟨v, hv⟩
    obtain ⟨y, hy, _⟩ := (source_component_graph_iff M G a h (u : FullL2 N) v).mp hv
    exact ⟨y, hy⟩
  · rintro ⟨y, hy⟩
    exact ⟨y a, (source_component_graph_iff M G a h (u : FullL2 N) (y a)).mpr
      ⟨y, hy, rfl⟩⟩

/-- Remove the squares using nonnegativity; the only physical premise is
the already qualified paired CSQE0 identity. -/
theorem paired_core_charge_norm (a b : SpinIndex) (f : pairedGaugeData.invariantCore) :
    ‖coreToL2 (pairedAlgebraData.charge b f.val)‖ =
      ‖coreToL2 (pairedAlgebraData.charge a f.val)‖ := by
  have h := congrArg Real.sqrt (FCP.BFSSCSQE0.basisEnergyEqual b a f)
  simpa only [Real.sqrt_sq (norm_nonneg _)] using h

/-- Exact graph-level statement on the actual paired SU2 data. -/
theorem paired_component_graph_iff (a : SpinIndex) (u v : FullL2 2) :
    (u, v) ∈ originalIndividualClosedGraph pairedAlgebraData pairedGaugeData a ↔
      ∃ y : SpinIndex → FullL2 2,
        (u, y) ∈ originalMinimalClosedGraph pairedAlgebraData pairedGaugeData ∧ y a = v :=
  source_component_graph_iff pairedAlgebraData pairedGaugeData a
    (fun f b => paired_core_charge_norm a b f) u v

/-- The individual graph-closure input domain is exactly the native
physical Hilbert charge column domain, for each original spin label. -/
theorem paired_common_domain (a : SpinIndex) (u : pairedGaugeData.physicalSpace) :
    (∃ v : FullL2 2, ((u : FullL2 2), v) ∈
      originalIndividualClosedGraph pairedAlgebraData pairedGaugeData a) ↔
      u ∈ (originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData).domain :=
  source_common_domain pairedAlgebraData pairedGaugeData a
    (fun f b => paired_core_charge_norm a b f) u

#print axioms source_joint_domain_iff
#print axioms source_common_domain
#print axioms paired_core_charge_norm
#print axioms paired_component_graph_iff
#print axioms paired_common_domain

end
end FCP.BFSSICDC0
