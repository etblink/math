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

private theorem coreRange_totallyBounded
    (M : AlgebraData 2) (G : M.GaugeData) (f : ℕ → G.invariantCore) (W : ℝ≥0)
    (hnorm : ∀ n, ‖coreToL2 (f n).val‖ = 1)
    (hcharge : Tendsto (fun n => nativeCoreChargeValue M G (f n)) atTop (𝓝 0))
    (hmoment : ∀ n, ‖radialWeightedCore (f n).val‖ ≤ (W : ℝ)) :
    TotallyBounded (Set.range (fun n => coreToL2 (f n).val)) := by
  let charge : ℕ → PiLp 2 (fun _ : SpinIndex => FullL2 2) :=
    fun n => nativeCoreChargeValue M G (f n)
  obtain ⟨C, hC⟩ := (Metric.isBounded_range_of_tendsto charge hcharge).exists_norm_le
  let Q : ℝ≥0 := ⟨max C 0, le_max_right C 0⟩
  have hQ (n : ℕ) : ‖charge n‖ ≤ (Q : ℝ) :=
    (hC (charge n) (Set.mem_range_self n)).trans (le_max_left C 0)
  have hB (n : ℕ) : ‖coreToL2 (f n).val‖ ≤ ((1 : ℝ≥0) : ℝ) := by
    rw [NNReal.coe_one]
    exact (hnorm n).le
  exact weightedNativeGraph_totallyBounded M G (fun j _ => f j)
    (fun j => coreToL2 (f j).val) charge (fun j => radialWeightedCore (f j).val) 1 Q W
    (fun _ => tendsto_const_nhds) (fun _ => tendsto_const_nhds)
    (fun _ => tendsto_const_nhds) hB hQ hmoment

/-- Compactness and graph closedness give a norm-one vector with zero output.
Working over an abstract closed input submodule keeps the proof independent
of the reductions in the native charge representation. -/
private theorem normOneGraphZero_of_totallyBounded
    {E F : Type*} [NormedAddCommGroup E] [NormedAddCommGroup F]
    [NormedSpace ℂ E] [NormedSpace ℂ F] [CompleteSpace E]
    (P : Submodule ℂ E) (hP : IsClosed (P : Set E))
    (T : P →ₗ.[ℂ] F) (hT : IsClosed (T.graph : Set (P × F)))
    (f : ℕ → T.domain)
    (hnorm : ∀ n, ‖((f n : P) : E)‖ = 1)
    (hcompact : TotallyBounded (Set.range (fun n => ((f n : P) : E))))
    (hcharge : Tendsto (fun n => T (f n)) atTop (𝓝 0)) :
    ∃ v : T.domain, ‖((v : P) : E)‖ = 1 ∧ T v = 0 := by
  let input : ℕ → E := fun n => ((f n : P) : E)
  have hc : IsCompact (closure (Set.range input)) :=
    hcompact.closure.isCompact_of_isClosed isClosed_closure
  obtain ⟨limit, _, φ, hφ, hlimit⟩ :=
    hc.tendsto_subseq (fun n => subset_closure (Set.mem_range_self n))
  have hn : ‖limit‖ = 1 := tendsto_nhds_unique hlimit.norm
    (by simpa only [Function.comp_apply, input, hnorm] using
      (tendsto_const_nhds : Tendsto (fun _ : ℕ => (1 : ℝ)) atTop (𝓝 1)))
  have hmem : limit ∈ P :=
    hP.mem_of_tendsto hlimit (Eventually.of_forall fun n => (f (φ n) : P).property)
  let v : P := ⟨limit, hmem⟩
  have hv : Tendsto (fun n => (f (φ n) : P)) atTop (𝓝 v) :=
    tendsto_subtype_rng.mpr hlimit
  have hzero : (v, (0 : F)) ∈ T.graph :=
    hT.mem_of_tendsto (hv.prodMk_nhds (hcharge.comp hφ.tendsto_atTop))
      (Eventually.of_forall fun n => T.mem_graph (f (φ n)))
  obtain ⟨u, hu, hTu⟩ := (LinearPMap.mem_graph_iff T).mp hzero
  have hnorm_u : ‖((u : P) : E)‖ = 1 := by
    rw [show (u : P) = v from hu]
    exact hn
  exact ⟨u, hnorm_u, hTu⟩

private theorem normalizedH_zero_of_charge_zero
    (M : AlgebraData 2) (G : M.GaugeData)
    (u : (originalMinimalPhysicalHilbertChargeColumn M G).domain)
    (hTu : originalMinimalPhysicalHilbertChargeColumn M G u = 0) :
    ∃ hu : (u : G.physicalSpace) ∈ (originalMinimalPhysicalNormalizedHamiltonian M G).domain,
      originalMinimalPhysicalNormalizedHamiltonian M G ⟨(u : G.physicalSpace), hu⟩ = 0 := by
  obtain ⟨hu, heq⟩ := (originalMinimalPhysicalNormalizedHamiltonian_weakForm_iff M G u 0).mp
    (by
      intro w
      simp only [hTu, inner_zero_left, mul_zero])
  exact ⟨hu, heq.symm⟩

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
  let T := originalMinimalPhysicalHilbertChargeColumn M G
  have hclosed : IsClosed (T.graph : Set (G.physicalSpace ×
      PiLp 2 (fun _ : SpinIndex => FullL2 2))) :=
    originalMinimalPhysicalHilbertChargeColumn_isClosed M G
  let trial : ℕ → T.domain := fun n => closedChargeCoreInput M G (f n)
  have hunit : ∀ n, ‖((trial n : G.physicalSpace) : FullL2 2)‖ = 1 := hnorm
  have htb : TotallyBounded (Set.range
      (fun n => ((trial n : G.physicalSpace) : FullL2 2))) :=
    coreRange_totallyBounded M G f W hnorm hcharge hmoment
  have hq : Tendsto (fun n => T (trial n)) atTop (𝓝 0) := hcharge
  obtain ⟨u, hu, hTu⟩ :=
    normOneGraphZero_of_totallyBounded G.physicalSpace G.physicalSpace_closed T hclosed
      trial hunit htb hq
  obtain ⟨hH, hHu⟩ := normalizedH_zero_of_charge_zero M G u hTu
  exact ⟨(u : G.physicalSpace), hH, hu, hHu⟩

#print axioms originalZeroMode_of_tightCoreSequence

end
end FCP.BFSSGM5E6
