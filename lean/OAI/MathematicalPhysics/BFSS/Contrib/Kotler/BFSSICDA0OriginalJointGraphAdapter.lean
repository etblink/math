import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6H5E8AUOriginalMinimalClosedChargeLinearPMapProbe

/-! ICD-A0: isolate the literal joint-graph generator adapter from ICD0.
No common-domain, maximal-domain, self-adjointness or spectral conclusion. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSICDA0
noncomputable section
open Set
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6H5E8AU
open FCP.BFSSSU2PhysicalDomainL6H5E8AP

/-- The range/closure transport is entirely independent of BFSS. -/
theorem closed_range_eq_of_pointwise {D X : Type*} [TopologicalSpace X]
    (f g : D → X) (h : ∀ d : D, f d = g d) :
    closure (Set.range f) = closure (Set.range g) := by
  have hr : Set.range f = Set.range g := by
    ext x
    constructor
    · rintro ⟨d, hd⟩
      exact ⟨d, (h d).symm.trans hd⟩
    · rintro ⟨d, hd⟩
      exact ⟨d, (h d).trans hd⟩
  rw [hr]

/-- Literal source chargeVector evaluation, separated from all topology. -/
theorem source_joint_generator_eq {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (f : G.invariantCore) :
    (coreToL2 f.val, M.chargeVector f.val) =
      (coreToL2 f.val, fun b : SpinIndex => coreToL2 (M.charge b f.val)) := by
  apply Prod.ext
  · rfl
  · funext b
    simp only [AlgebraData.chargeVector, LinearMap.pi_apply, LinearMap.comp_apply]

/-- Exact equality of the original AU closed graph with the closure
of the literal individual-output column range. -/
theorem source_joint_closed_graph_eq {N : ℕ} (M : AlgebraData N) (G : M.GaugeData) :
    (originalMinimalClosedGraph M G : Set (FullL2 N × (SpinIndex → FullL2 N))) =
      closure (Set.range (fun f : G.invariantCore =>
        (coreToL2 f.val, fun b : SpinIndex => coreToL2 (M.charge b f.val)))) := by
  rw [originalMinimalClosedGraph_set_eq M G, originalPhysicalCoreGraphSet]
  exact closed_range_eq_of_pointwise
    (fun f : G.invariantCore => (coreToL2 f.val, M.chargeVector f.val))
    (fun f : G.invariantCore =>
      (coreToL2 f.val, fun b : SpinIndex => coreToL2 (M.charge b f.val)))
    (source_joint_generator_eq M G)

#print axioms closed_range_eq_of_pointwise
#print axioms source_joint_generator_eq
#print axioms source_joint_closed_graph_eq

end
end FCP.BFSSICDA0
