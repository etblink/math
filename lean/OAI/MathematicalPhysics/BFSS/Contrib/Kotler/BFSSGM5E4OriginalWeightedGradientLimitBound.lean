import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E3OriginalWeightedGraphGradientLimit

/-! The original weighted core gradient estimate passes to the strong
gradient limit in the original weighted Sobolev closure. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5E4
noncomputable section

open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSGM5D FCP.BFSSGM5E1 FCP.BFSSGM5E3
open MeasureTheory Filter Topology

/-- The GM5E3 gradient limit obeys the same charge and radial weighted
bound as its invariant smooth-core approximants. -/
theorem weightedNativeGraph_gradientLimit_sq_le (M : AlgebraData 2) (G : M.GaugeData)
    (f : ℕ → G.invariantCore)
    (u : FullL2 2) (q : PiLp 2 (fun _ : SpinIndex => FullL2 2)) (w : FullL2 2)
    (hu : Tendsto (fun n => coreToL2 (f n).val) atTop (𝓝 u))
    (hq : Tendsto (fun n => nativeCoreChargeValue M G (f n)) atTop (𝓝 q))
    (hw : Tendsto (fun n => radialWeightedCore (f n).val) atTop (𝓝 w)) :
    ∃ g : PiLp 2 (fun _ : CoordinateIndex 2 => FullL2 2),
      Tendsto (fun n => sourceCoreGradient (f n).val) atTop (𝓝 g) ∧
      (u, g, w) ∈ BFSSSliceSobolev.weightedClosure (F := Fermion 2)
        (volume : Measure (Boson 2)) coordinateDirection
        (fun x : Boson 2 => Real.sqrt ‖x‖) (Real.continuous_sqrt.comp continuous_norm) ∧
      ‖g‖ ^ 2 ≤ (1 / 8 : ℝ) * ‖q‖ ^ 2 + (2 * M.fermionGrowthConstant) * ‖w‖ ^ 2 := by
  obtain ⟨g, hg, hclosure⟩ := weightedNativeGraph_gradientLimit M G f u q w hu hq hw
  refine ⟨g, hg, hclosure, ?_⟩
  exact le_of_tendsto_of_tendsto' (hg.norm.pow 2)
    (((hq.norm.pow 2).const_mul (1 / 8 : ℝ)).add
      ((hw.norm.pow 2).const_mul (2 * M.fermionGrowthConstant)))
    (fun n => weightedCoreGradient_sq_le M G (f n))

#print axioms weightedNativeGraph_gradientLimit_sq_le

end
end FCP.BFSSGM5E4
