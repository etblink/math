import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E2OriginalRadialWeightedCoreSubtraction

/-! Strong convergence of the original gradient from joint convergence of
the original input, native charge output, and radial weighted output. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5E3
noncomputable section

open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSGM5B FCP.BFSSGM5D FCP.BFSSGM5E1 FCP.BFSSGM5E2
open MeasureTheory Filter Topology

-- The explicit native partial-map proof from GM5D R3.
private theorem nativeCoreChargeValue_sub (M : AlgebraData 2) (G : M.GaugeData)
    (f g : G.invariantCore) :
    nativeCoreChargeValue M G (f - g) =
      nativeCoreChargeValue M G f - nativeCoreChargeValue M G g := by
  have hinput : closedChargeCoreInput M G (f - g) =
      closedChargeCoreInput M G f - closedChargeCoreInput M G g := by
    apply Subtype.ext
    apply Subtype.ext
    exact map_sub coreToL2 f.val g.val
  change originalMinimalPhysicalHilbertChargeColumn M G
    (closedChargeCoreInput M G (f - g)) =
      originalMinimalPhysicalHilbertChargeColumn M G
        (closedChargeCoreInput M G f) -
      originalMinimalPhysicalHilbertChargeColumn M G
        (closedChargeCoreInput M G g)
  rw [hinput]
  exact LinearPMap.map_sub (originalMinimalPhysicalHilbertChargeColumn M G)
    (closedChargeCoreInput M G f) (closedChargeCoreInput M G g)

-- The two-output Cauchy argument from GM5D R3, with different inputs below.
private theorem cauchySeq_of_sq_distance_le {E F H : Type*} [PseudoMetricSpace E]
    [PseudoMetricSpace F] [PseudoMetricSpace H] (a : ℝ) (b : ℝ)
    (u : ℕ → E) (v : ℕ → F) (w : ℕ → H) (hu : CauchySeq u) (hv : CauchySeq v)
    (h : ∀ n m, dist (w n) (w m) ^ 2 ≤ a * dist (u n) (u m) ^ 2 +
      b * dist (v n) (v m) ^ 2) : CauchySeq w := by
  have hu0 := cauchySeq_iff_tendsto_dist_atTop_0.mp hu
  have hv0 := cauchySeq_iff_tendsto_dist_atTop_0.mp hv
  let bound (p : ℕ × ℕ) := a * dist (u p.1) (u p.2) ^ 2 + b * dist (v p.1) (v p.2) ^ 2
  have hb : Tendsto bound atTop (𝓝 (0 : ℝ)) := by
    simpa only [zero_pow (by decide : (2 : ℕ) ≠ 0), mul_zero, add_zero] using
      ((hu0.pow 2).const_mul a).add ((hv0.pow 2).const_mul b)
  have hs : Tendsto (fun p => Real.sqrt (bound p)) atTop (𝓝 0) := by
    simpa only [Real.sqrt_zero] using hb.sqrt
  apply cauchySeq_iff_tendsto_dist_atTop_0.mpr
  apply squeeze_zero (fun _ => dist_nonneg) _ hs
  intro p
  have hp := h p.1 p.2
  exact (Real.le_sqrt dist_nonneg ((sq_nonneg _).trans hp)).2 hp

/-- Joint charge and radial weighted convergence force strong gradient
convergence. The limit triple lies in the original weighted Sobolev closure. -/
theorem weightedNativeGraph_gradientLimit (M : AlgebraData 2) (G : M.GaugeData)
    (f : ℕ → G.invariantCore)
    (u : FullL2 2) (q : PiLp 2 (fun _ : SpinIndex => FullL2 2)) (w : FullL2 2)
    (hu : Tendsto (fun n => coreToL2 (f n).val) atTop (𝓝 u))
    (hq : Tendsto (fun n => nativeCoreChargeValue M G (f n)) atTop (𝓝 q))
    (hw : Tendsto (fun n => radialWeightedCore (f n).val) atTop (𝓝 w)) :
    ∃ g : PiLp 2 (fun _ : CoordinateIndex 2 => FullL2 2),
      Tendsto (fun n => sourceCoreGradient (f n).val) atTop (𝓝 g) ∧
      (u, g, w) ∈ BFSSSliceSobolev.weightedClosure (F := Fermion 2)
        (volume : Measure (Boson 2)) coordinateDirection
        (fun x : Boson 2 => Real.sqrt ‖x‖) (Real.continuous_sqrt.comp continuous_norm) := by
  have hc : CauchySeq (fun n => sourceCoreGradient (f n).val) := by
    apply cauchySeq_of_sq_distance_le (1 / 8 : ℝ) (2 * M.fermionGrowthConstant)
      (fun n => nativeCoreChargeValue M G (f n)) (fun n => radialWeightedCore (f n).val)
      _ hq.cauchySeq hw.cauchySeq
    intro n m
    have hgsub : sourceCoreGradient ((f n - f m).val) =
        sourceCoreGradient (f n).val - sourceCoreGradient (f m).val :=
      map_sub (BFSSSliceSobolev.gradient (volume : Measure (Boson 2))
        coordinateDirection) (f n).val (f m).val
    have hwsub : radialWeightedCore ((f n - f m).val) =
        radialWeightedCore (f n).val - radialWeightedCore (f m).val :=
      radialWeightedCore_sub (f n).val (f m).val
    simpa only [dist_eq_norm, hgsub, nativeCoreChargeValue_sub, hwsub] using
      weightedCoreGradient_sq_le M G (f n - f m)
  obtain ⟨g, hg⟩ := cauchySeq_tendsto_of_complete hc
  let triple (h : SmoothCore 2) : FullL2 2 ×
      PiLp 2 (fun _ : CoordinateIndex 2 => FullL2 2) × FullL2 2 :=
    (coreToL2 h, sourceCoreGradient h, radialWeightedCore h)
  have hlim : Tendsto (fun n => triple (f n).val) atTop (𝓝 (u, g, w)) :=
    hu.prodMk_nhds (hg.prodMk_nhds hw)
  have hclosure : (u, g, w) ∈ closure (Set.range triple) :=
    mem_closure_of_tendsto hlim
      (Eventually.of_forall (fun n => Set.mem_range_self (f := triple) (f n).val))
  exact ⟨g, hg, hclosure⟩

#print axioms weightedNativeGraph_gradientLimit

end
end FCP.BFSSGM5E3
