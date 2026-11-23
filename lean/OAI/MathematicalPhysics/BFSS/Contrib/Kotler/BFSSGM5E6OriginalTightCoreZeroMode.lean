import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E5OriginalWeightedGraphCompactness
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6H5E8BEOriginalNormalizedPhysicalHamiltonianProbe

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5E6
noncomputable section

open OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSGM5B FCP.BFSSGM5D FCP.BFSSGM5E1 FCP.BFSSGM5E5
open FCP.BFSSSU2PhysicalDomainL6H5E8AY FCP.BFSSSU2PhysicalDomainL6H5E8BE
open Filter Topology
open scoped NNReal

/-- A normalized invariant smooth-core sequence with vanishing native charge
column and uniformly bounded first radial moment yields a norm-one zero mode
of the original normalized Hamiltonian on its natural domain. -/
theorem originalZeroMode_of_tightCoreSequence
    (M : AlgebraData 2) (G : M.GaugeData) (f : ℕ → G.invariantCore) (W : ℝ≥0)
    (hnorm : ∀ n, ‖coreToL2 (f n).val‖ = 1)
    (hcharge : Tendsto (fun n => nativeCoreChargeValue M G (f n)) atTop (𝓝 0))
    (hmoment : ∀ n, ‖radialWeightedCore (f n).val‖ ≤ (W : ℝ)) :
    ∃ (u : G.physicalSpace)
      (hu : u ∈ (originalMinimalPhysicalNormalizedHamiltonian M G).domain),
      ‖(u : FullL2 2)‖ = 1 ∧ originalMinimalPhysicalNormalizedHamiltonian M G ⟨u, hu⟩ = 0 := by
  let input : ℕ → FullL2 2 := fun n => coreToL2 (f n).val
  let charge := fun n => nativeCoreChargeValue M G (f n)
  obtain ⟨C, hC⟩ := (Metric.isBounded_range_of_tendsto charge hcharge).exists_norm_le
  let Q : ℝ≥0 := ⟨max C 0, le_max_right C 0⟩
  have hQ (n : ℕ) : ‖charge n‖ ≤ (Q : ℝ) :=
    (hC _ (Set.mem_range_self n)).trans (le_max_left C 0)
  have hB (n : ℕ) : ‖input n‖ ≤ ((1 : ℝ≥0) : ℝ) := by
    rw [NNReal.coe_one]
    exact (hnorm n).le
  have hcompact : IsCompact (closure (Set.range input)) :=
    (weightedNativeGraph_totallyBounded M G (fun j _ => f j) input charge
      (fun j => radialWeightedCore (f j).val) 1 Q W
      (fun _ => tendsto_const_nhds) (fun _ => tendsto_const_nhds)
      (fun _ => tendsto_const_nhds) hB hQ hmoment).closure.isCompact_of_isClosed isClosed_closure
  obtain ⟨limit, _, subseq, hsubseq, hlimit⟩ :=
    hcompact.tendsto_subseq (fun n => subset_closure (Set.mem_range_self n))
  have hlimit_norm : ‖limit‖ = 1 := tendsto_nhds_unique hlimit.norm
    (by simpa only [Function.comp_apply, input, hnorm] using
      (tendsto_const_nhds : Tendsto (fun _ : ℕ => (1 : ℝ)) atTop (𝓝 1)))
  have hphysical : limit ∈ G.physicalSpace :=
    G.physicalSpace_closed.mem_of_tendsto hlimit
      (Eventually.of_forall fun n => (f (subseq n)).property)
  let v : G.physicalSpace := ⟨limit, hphysical⟩
  let T := originalMinimalPhysicalHilbertChargeColumn M G
  let trial := fun n => closedChargeCoreInput M G (f (subseq n))
  have hv : Tendsto (fun n => (trial n : G.physicalSpace)) atTop (𝓝 v) :=
    tendsto_subtype_rng.mpr hlimit
  have hgraph : IsClosed (T.graph : Set (G.physicalSpace ×
      PiLp 2 (fun _ : SpinIndex => FullL2 2))) :=
    originalMinimalPhysicalHilbertChargeColumn_isClosed M G
  have hzero : (v, (0 : PiLp 2 (fun _ : SpinIndex => FullL2 2))) ∈ T.graph :=
    hgraph.mem_of_tendsto (hv.prodMk_nhds (hcharge.comp hsubseq.tendsto_atTop))
      (Eventually.of_forall fun n => T.mem_graph (trial n))
  obtain ⟨u, hu, hTu⟩ := (LinearPMap.mem_graph_iff T).mp hzero
  have hn : ‖((u : G.physicalSpace) : FullL2 2)‖ = 1 := by
    rw [show (u : G.physicalSpace) = v from hu]
    exact hlimit_norm
  have hcharge_zero : originalMinimalPhysicalHilbertChargeColumn M G u = 0 := hTu
  obtain ⟨hH, hHu⟩ :=
    (originalMinimalPhysicalNormalizedHamiltonian_weakForm_iff M G u 0).mp
      (by intro w; simp [hcharge_zero])
  exact ⟨(u : G.physicalSpace), hH, hn, hHu.symm⟩

#print axioms originalZeroMode_of_tightCoreSequence

end
end FCP.BFSSGM5E6
