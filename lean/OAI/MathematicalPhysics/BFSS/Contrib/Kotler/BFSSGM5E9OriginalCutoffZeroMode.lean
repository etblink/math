import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E5OriginalWeightedGraphCompactness
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E7OriginalGaugeCoreLocalization
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E8OriginalPersistentOverlapZeroMode

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5E9
noncomputable section

open OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSGM5B FCP.BFSSGM5D FCP.BFSSGM5E1 FCP.BFSSGM5E5
open FCP.BFSSGM5E7 FCP.BFSSGM5E8 FCP.BFSSSU2PhysicalDomainL6H5E8BE
open Filter MeasureTheory Topology
open scoped InnerProductSpace NNReal

private theorem realCutoff_pairing (χ : Boson 2 → ℝ)
    (hχ : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) χ) (f g : SmoothCore 2) :
    inner ℂ (coreToL2 (realCutoff χ hχ f)) (coreToL2 g) =
      inner ℂ (coreToL2 f) (coreToL2 (realCutoff χ hχ g)) := by
  rw [coreToL2_inner, coreToL2_inner]
  apply integral_congr_ae
  filter_upwards [] with x
  change inner ℂ ((χ x : ℂ) • f x) (g x) = inner ℂ (f x) ((χ x : ℂ) • g x)
  simp only [inner_smul_left, inner_smul_right, Complex.conj_ofReal]

private theorem overlap_of_nonzero_limit {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (x : ℕ → E) (v : E)
    (hv : Tendsto x atTop (𝓝 v)) (hne : v ≠ 0) :
    ∃ (k : ℕ) (δ : ℝ), 0 < δ ∧ ∀ᶠ n in atTop, δ ≤ ‖inner ℂ (x k) (x n)‖ := by
  let a := ‖inner ℂ v v‖
  have ha : 0 < a := norm_pos_iff.mpr ((inner_self_ne_zero (𝕜 := ℂ)).mpr hne)
  have hl : Tendsto (fun n => ‖inner ℂ (x n) v‖) atTop (𝓝 a) :=
    (hv.inner (𝕜 := ℂ) tendsto_const_nhds).norm
  obtain ⟨k, hk⟩ := (hl.eventually_const_lt (half_lt_self ha)).exists
  have hkpos : 0 < ‖inner ℂ (x k) v‖ := lt_trans (half_pos ha) hk
  have hr : Tendsto (fun n => ‖inner ℂ (x k) (x n)‖) atTop
      (𝓝 ‖inner ℂ (x k) v‖) :=
    (tendsto_const_nhds.inner (𝕜 := ℂ) hv).norm
  exact ⟨k, ‖inner ℂ (x k) v‖ / 2, half_pos hkpos,
    (hr.eventually_const_lt (half_lt_self hkpos)).mono (fun _ h => h.le)⟩

private theorem zeroMode_of_cutoffLimit
    (M : AlgebraData 2) (G : M.GaugeData) (f : ℕ → G.invariantCore)
    (χ : Boson 2 → ℝ) (hχ : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) χ)
    (hg : ∀ g x, χ (G.boson g x) = χ x)
    (hbounded : ∀ n, ‖coreToL2 (f n).val‖ ≤ 1)
    (hcharge : Tendsto (fun n => nativeCoreChargeValue M G (f n)) atTop (𝓝 0))
    (v : FullL2 2) (hne : v ≠ 0)
    (hv : Tendsto (fun n => coreToL2 (gaugeInvariantRealCutoff M G χ hχ hg (f n)).val)
      atTop (𝓝 v)) :
    ∃ (u : G.physicalSpace)
      (hu : u ∈ (originalMinimalPhysicalNormalizedHamiltonian M G).domain),
      u ≠ 0 ∧ originalMinimalPhysicalNormalizedHamiltonian M G ⟨u, hu⟩ = 0 := by
  let g : ℕ → G.invariantCore := fun n => gaugeInvariantRealCutoff M G χ hχ hg (f n)
  obtain ⟨k, δ, hδ, hevent⟩ :=
    overlap_of_nonzero_limit (fun n => coreToL2 (g n).val) v hv hne
  let test := gaugeInvariantRealCutoff M G χ hχ hg (g k)
  let w : G.physicalSpace := ⟨coreToL2 test.val, test.property⟩
  refine originalZeroMode_of_persistentOverlap M G f w δ hδ hbounded hcharge ?_
  apply hevent.mono
  intro n hn
  change δ ≤ ‖inner ℂ (coreToL2 (realCutoff χ hχ (g k).val)) (coreToL2 (f n).val)‖
  rw [realCutoff_pairing]
  exact hn

/-- If a single gauge-invariant real cutoff retains a positive input norm
and the cutoff states have bounded input, charge and first radial moment,
the original sequence with vanishing charge produces a physical zero mode. -/
theorem originalZeroMode_of_localizedCoreSequence
    (M : AlgebraData 2) (G : M.GaugeData) (f : ℕ → G.invariantCore)
    (χ : Boson 2 → ℝ) (hχ : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) χ)
    (hg : ∀ g x, χ (G.boson g x) = χ x)
    (hbounded : ∀ n, ‖coreToL2 (f n).val‖ ≤ 1)
    (hcharge : Tendsto (fun n => nativeCoreChargeValue M G (f n)) atTop (𝓝 0))
    (B Q W : ℝ≥0) (δ : ℝ) (hδ : 0 < δ)
    (hretain : ∀ n, δ ≤ ‖coreToL2 (gaugeInvariantRealCutoff M G χ hχ hg (f n)).val‖)
    (hB : ∀ n, ‖coreToL2 (gaugeInvariantRealCutoff M G χ hχ hg (f n)).val‖ ≤ (B : ℝ))
    (hQ : ∀ n, ‖nativeCoreChargeValue M G (gaugeInvariantRealCutoff M G χ hχ hg (f n))‖ ≤ (Q : ℝ))
    (hW : ∀ n, ‖radialWeightedCore (gaugeInvariantRealCutoff M G χ hχ hg (f n)).val‖ ≤ (W : ℝ)) :
    ∃ (u : G.physicalSpace)
      (hu : u ∈ (originalMinimalPhysicalNormalizedHamiltonian M G).domain),
      u ≠ 0 ∧ originalMinimalPhysicalNormalizedHamiltonian M G ⟨u, hu⟩ = 0 := by
  let g : ℕ → G.invariantCore := fun n => gaugeInvariantRealCutoff M G χ hχ hg (f n)
  let x : ℕ → FullL2 2 := fun n => coreToL2 (g n).val
  have htb : TotallyBounded (Set.range x) :=
    weightedNativeGraph_totallyBounded M G (fun n _ => g n) x
      (fun n => nativeCoreChargeValue M G (g n))
      (fun n => radialWeightedCore (g n).val) B Q W
      (fun _ => tendsto_const_nhds) (fun _ => tendsto_const_nhds)
      (fun _ => tendsto_const_nhds) hB hQ hW
  have hc : IsCompact (closure (Set.range x)) :=
    htb.closure.isCompact_of_isClosed isClosed_closure
  obtain ⟨v, _, φ, hφ, hv⟩ := hc.tendsto_subseq
    (fun n => subset_closure (Set.mem_range_self n))
  have hle : δ ≤ ‖v‖ := ge_of_tendsto hv.norm
    (Eventually.of_forall fun n => hretain (φ n))
  exact zeroMode_of_cutoffLimit M G (f ∘ φ) χ hχ hg (fun n => hbounded (φ n))
    (hcharge.comp hφ.tendsto_atTop) v (norm_pos_iff.mp (lt_of_lt_of_le hδ hle)) hv

#print axioms originalZeroMode_of_localizedCoreSequence

end
end FCP.BFSSGM5E9
