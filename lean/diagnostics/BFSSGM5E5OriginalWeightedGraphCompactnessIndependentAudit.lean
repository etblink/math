import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E5OriginalWeightedGraphCompactness

set_option autoImplicit false

namespace FCP.BFSSGM5E5Independent
noncomputable section

open OAI OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AY FCP.BFSSGM5B FCP.BFSSGM5E5
open MeasureTheory Filter Topology
open scoped NNReal

/-- Exercise the conditional compactness result on the literal paired charge
operator and square-root radial weight, in the original unweighted space. -/
theorem pairedWeightedNativeGraph_totallyBounded (f : ℕ → ℕ → pairedGaugeData.invariantCore)
    (u : ℕ → FullL2 2) (q : ℕ → PiLp 2 (fun _ : SpinIndex => FullL2 2))
    (w : ℕ → FullL2 2) (B Q W : ℝ≥0)
    (hu : ∀ j, Tendsto (fun n => OAI.BFSSQuantum.AlgebraData.coreToL2 (f j n).val) atTop (𝓝 (u j)))
    (hq : ∀ j, Tendsto (fun n => originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData
      (closedChargeCoreInput pairedAlgebraData pairedGaugeData (f j n))) atTop (𝓝 (q j)))
    (hw : ∀ j, Tendsto (fun n => BFSSSliceSobolev.weightedToL2 (volume : Measure (Boson 2))
      (fun x : Boson 2 => Real.sqrt ‖x‖) (Real.continuous_sqrt.comp continuous_norm)
      (f j n).val) atTop (𝓝 (w j)))
    (hB : ∀ j, ‖u j‖ ≤ (B : ℝ)) (hQ : ∀ j, ‖q j‖ ≤ (Q : ℝ))
    (hW : ∀ j, ‖w j‖ ≤ (W : ℝ)) : TotallyBounded (Set.range u) :=
  weightedNativeGraph_totallyBounded pairedAlgebraData pairedGaugeData f u q w B Q W
    hu hq hw hB hQ hW

#print axioms pairedWeightedNativeGraph_totallyBounded

end
end FCP.BFSSGM5E5Independent
