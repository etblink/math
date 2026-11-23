import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E3OriginalWeightedGraphGradientLimit

set_option autoImplicit false

namespace FCP.BFSSGM5E3Independent
noncomputable section

open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSGM5B FCP.BFSSGM5D FCP.BFSSGM5E3
open MeasureTheory Filter Topology

/-- Restate the conclusion with the native paired charge column and the
original weighted Sobolev carrier, including the actual radial weight. -/
theorem pairedWeightedNativeGraph_gradientLimit (f : ℕ → pairedGaugeData.invariantCore)
    (u : FullL2 2) (q : PiLp 2 (fun _ : SpinIndex => FullL2 2)) (w : FullL2 2)
    (hu : Tendsto (fun n => coreToL2 (f n).val) atTop (𝓝 u))
    (hq : Tendsto (fun n => originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData
      (closedChargeCoreInput pairedAlgebraData pairedGaugeData (f n))) atTop (𝓝 q))
    (hw : Tendsto (fun n => BFSSSliceSobolev.weightedToL2 (volume : Measure (Boson 2))
      (fun x : Boson 2 => Real.sqrt ‖x‖) (Real.continuous_sqrt.comp continuous_norm)
      (f n).val) atTop (𝓝 w)) :
    ∃ g : PiLp 2 (fun _ : SpaceIndex × ColorIndex 2 => FullL2 2),
      Tendsto (fun n => sourceCoreGradient (f n).val) atTop (𝓝 g) ∧
      (u, g, w) ∈ BFSSSliceSobolev.weightedClosure (F := Fermion 2)
        (volume : Measure (Boson 2)) coordinateDirection
        (fun x : Boson 2 => Real.sqrt ‖x‖) (Real.continuous_sqrt.comp continuous_norm) :=
  weightedNativeGraph_gradientLimit pairedAlgebraData pairedGaugeData f u q w hu hq hw

#print axioms pairedWeightedNativeGraph_gradientLimit

end
end FCP.BFSSGM5E3Independent
