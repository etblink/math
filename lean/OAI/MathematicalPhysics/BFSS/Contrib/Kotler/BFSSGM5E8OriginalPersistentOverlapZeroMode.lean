import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5BOriginalNativeClosedChargeCoreEnergy
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6H5E8BEOriginalNormalizedPhysicalHamiltonianProbe

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5E8
noncomputable section

open OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSGM5B
open FCP.BFSSSU2PhysicalDomainL6H5E8AY FCP.BFSSSU2PhysicalDomainL6H5E8BB
open FCP.BFSSSU2PhysicalDomainL6H5E8BE
open Filter Topology Submodule
open scoped InnerProductSpace

section HilbertGraph

variable {E F : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
  [NormedAddCommGroup F] [InnerProductSpace ℂ F] [CompleteSpace F]

private theorem dense_fst_orthogonal
    (K : Submodule ℂ (WithLp 2 (E × F))) (hK : IsClosed (K : Set (WithLp 2 (E × F))))
    (hzero : ∀ x : E, WithLp.toLp 2 (x, (0 : F)) ∈ K → x = 0) :
    Dense ((Kᗮ.map (WithLp.fstL 2 ℂ E F).toLinearMap : Submodule ℂ E) : Set E) := by
  let D := Kᗮ.map (WithLp.fstL 2 ℂ E F).toLinearMap
  have hdouble : Kᗮᗮ = K :=
    (K.orthogonal_orthogonal_eq_closure).trans hK.submodule_topologicalClosure_eq
  have hD : Dᗮ = ⊥ := by
    apply le_antisymm _ bot_le
    intro x hx
    apply Submodule.mem_bot.mpr
    apply hzero
    rw [← hdouble]
    apply ((Kᗮ).mem_orthogonal _).mpr
    intro z hz
    have hzfst : (WithLp.ofLp z).1 ∈ D := Submodule.mem_map.mpr ⟨z, hz, rfl⟩
    rw [WithLp.prod_inner_apply]
    change inner ℂ (WithLp.ofLp z).1 x + inner ℂ (WithLp.ofLp z).2 (0 : F) = 0
    rw [inner_zero_right, add_zero]
    exact (D.mem_orthogonal x).mp hx _ hzfst
  apply Submodule.dense_iff_topologicalClosure_eq_top.mpr
  change D.topologicalClosure = ⊤
  rw [← D.orthogonal_orthogonal_eq_closure, hD, Submodule.bot_orthogonal_eq_top]

private theorem horizontal_of_persistentOverlap
    (K : Submodule ℂ (WithLp 2 (E × F))) (hK : IsClosed (K : Set (WithLp 2 (E × F))))
    (x : ℕ → E) (q : ℕ → F) (w : E) (δ : ℝ) (hδ : 0 < δ)
    (hgraph : ∀ n, WithLp.toLp 2 (x n, q n) ∈ K)
    (hbounded : ∀ n, ‖x n‖ ≤ 1)
    (hcharge : Tendsto q atTop (𝓝 0))
    (hoverlap : ∀ᶠ n in atTop, δ ≤ ‖inner ℂ w (x n)‖) :
    ∃ u : E, u ≠ 0 ∧ WithLp.toLp 2 (u, (0 : F)) ∈ K := by
  classical
  by_contra hnone
  have hzero (u : E) (hu : WithLp.toLp 2 (u, (0 : F)) ∈ K) : u = 0 := by
    by_contra hne
    exact hnone ⟨u, hne, hu⟩
  obtain ⟨b, hb, hnear⟩ :=
    Metric.mem_closure_iff.mp (dense_fst_orthogonal K hK hzero w) (δ / 2) (by positivity)
  obtain ⟨z, hz, hzb⟩ := Submodule.mem_map.mp hb
  have hfst : (WithLp.ofLp z).1 = b := hzb
  have hclose : ‖w - (WithLp.ofLp z).1‖ < δ / 2 := by
    rw [hfst, ← dist_eq_norm]
    exact hnear
  have hsmall : Tendsto (fun n => ‖inner ℂ (WithLp.ofLp z).2 (q n)‖) atTop (𝓝 0) := by
    have hc : Continuous (fun y : F => inner ℂ (WithLp.ofLp z).2 y) :=
      (innerSL ℂ (WithLp.ofLp z).2).continuous
    have ht : Tendsto (fun n => inner ℂ (WithLp.ofLp z).2 (q n)) atTop
        (𝓝 (inner ℂ (WithLp.ofLp z).2 (0 : F))) := (hc.tendsto 0).comp hcharge
    rw [inner_zero_right] at ht
    simpa only [norm_zero] using ht.norm
  obtain ⟨n, hobs, hn⟩ :=
    (hoverlap.and (hsmall.eventually_lt_const (show (0 : ℝ) < δ / 2 by positivity))).exists
  have horth := K.inner_left_of_mem_orthogonal (hgraph n) hz
  rw [WithLp.prod_inner_apply] at horth
  have hsign : inner ℂ (WithLp.ofLp z).1 (x n) = -inner ℂ (WithLp.ofLp z).2 (q n) :=
    eq_neg_iff_add_eq_zero.mpr horth
  have hleft : ‖inner ℂ (WithLp.ofLp z).1 (x n)‖ < δ / 2 := by
    rw [hsign, norm_neg]
    exact hn
  have herr : ‖inner ℂ (w - (WithLp.ofLp z).1) (x n)‖ < δ / 2 := calc
    _ ≤ ‖w - (WithLp.ofLp z).1‖ * ‖x n‖ := norm_inner_le_norm _ _
    _ ≤ ‖w - (WithLp.ofLp z).1‖ * 1 := mul_le_mul_of_nonneg_left (hbounded n) (norm_nonneg _)
    _ < δ / 2 := by rw [mul_one]; exact hclose
  have hsum : inner ℂ (w - (WithLp.ofLp z).1) (x n) + inner ℂ (WithLp.ofLp z).1 (x n) =
      inner ℂ w (x n) := by rw [inner_sub_left, sub_add_cancel]
  have hlt : ‖inner ℂ w (x n)‖ < δ := calc
    _ = ‖inner ℂ (w - (WithLp.ofLp z).1) (x n) + inner ℂ (WithLp.ofLp z).1 (x n)‖ :=
      congrArg norm hsum.symm
    _ ≤ ‖inner ℂ (w - (WithLp.ofLp z).1) (x n)‖ + ‖inner ℂ (WithLp.ofLp z).1 (x n)‖ :=
      norm_add_le _ _
    _ < δ := by linarith
  exact (not_lt_of_ge hobs) hlt

private theorem graphZero_of_persistentOverlap
    (T : E →ₗ.[ℂ] F) (hT : T.IsClosed) (trial : ℕ → T.domain)
    (w : E) (δ : ℝ) (hδ : 0 < δ) (hbounded : ∀ n, ‖(trial n : E)‖ ≤ 1)
    (hcharge : Tendsto (fun n => T (trial n)) atTop (𝓝 0))
    (hoverlap : ∀ᶠ n in atTop, δ ≤ ‖inner ℂ w (trial n : E)‖) :
    ∃ u : T.domain, (u : E) ≠ 0 ∧ T u = 0 := by
  let e := WithLp.prodContinuousLinearEquiv 2 ℂ E F
  let K := T.graph.comap e.toLinearEquiv.toLinearMap
  have hc : IsClosed (K : Set (WithLp 2 (E × F))) :=
    (show IsClosed (T.graph : Set (E × F)) from hT).preimage e.continuous
  have hgraph (n : ℕ) : WithLp.toLp 2 ((trial n : E), T (trial n)) ∈ K :=
    T.mem_graph (trial n)
  obtain ⟨u, hne, hu⟩ := horizontal_of_persistentOverlap K hc (fun n => (trial n : E))
    (fun n => T (trial n)) w δ hδ hgraph hbounded hcharge hoverlap
  have hzero : (u, (0 : F)) ∈ T.graph := hu
  obtain ⟨v, hv, hTv⟩ := (LinearPMap.mem_graph_iff T).mp hzero
  exact ⟨v, fun hvzero => hne (hv.symm.trans hvzero), hTv⟩

end HilbertGraph

private theorem originalH_zero_of_nativeCharge_zero
    (M : AlgebraData 2) (G : M.GaugeData)
    (u : (originalMinimalPhysicalHilbertChargeColumn M G).domain)
    (hTu : originalMinimalPhysicalHilbertChargeColumn M G u = 0) :
    ∃ hu : (u : G.physicalSpace) ∈ (originalMinimalPhysicalNormalizedHamiltonian M G).domain,
      originalMinimalPhysicalNormalizedHamiltonian M G ⟨(u : G.physicalSpace), hu⟩ = 0 := by
  obtain ⟨hu, heq⟩ := (originalMinimalPhysicalNormalizedHamiltonian_weakForm_iff M G u 0).mp
    (by
      intro v
      simp only [hTu, inner_zero_left, mul_zero])
  exact ⟨hu, heq.symm⟩

/-- A fixed physical overlap detects a nonzero native zero mode in a
bounded near-zero-charge sequence. -/
theorem originalZeroMode_of_persistentOverlap
    (M : AlgebraData 2) (G : M.GaugeData) (f : ℕ → G.invariantCore)
    (w : G.physicalSpace) (δ : ℝ) (hδ : 0 < δ)
    (hbounded : ∀ n, ‖coreToL2 (f n).val‖ ≤ 1)
    (hcharge : Tendsto (fun n => originalMinimalPhysicalHilbertChargeColumn M G
      (closedChargeCoreInput M G (f n))) atTop (𝓝 0))
    (hoverlap : ∀ᶠ n in atTop, δ ≤ ‖inner ℂ w
      (closedChargeCoreInput M G (f n) : G.physicalSpace)‖) :
    ∃ (u : G.physicalSpace)
      (hu : u ∈ (originalMinimalPhysicalNormalizedHamiltonian M G).domain),
      u ≠ 0 ∧ originalMinimalPhysicalNormalizedHamiltonian M G ⟨u, hu⟩ = 0 := by
  let : CompleteSpace G.physicalSpace := originalPhysicalHilbertComplete M G
  let T := originalMinimalPhysicalHilbertChargeColumn M G
  let trial : ℕ → T.domain := fun n => closedChargeCoreInput M G (f n)
  have hnorm : ∀ n, ‖(trial n : G.physicalSpace)‖ ≤ 1 := hbounded
  obtain ⟨u, hne, hTu⟩ := graphZero_of_persistentOverlap T
    (originalMinimalPhysicalHilbertChargeColumn_isClosed M G)
    trial w δ hδ hnorm hcharge hoverlap
  obtain ⟨hu, hHu⟩ := originalH_zero_of_nativeCharge_zero M G u hTu
  exact ⟨(u : G.physicalSpace), hu, hne, hHu⟩

#print axioms originalZeroMode_of_persistentOverlap

end
end FCP.BFSSGM5E8
