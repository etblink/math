import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5DOriginalFixedRadiusGradientLimit

set_option autoImplicit false

namespace FCP.BFSSGM5DIndependent
noncomputable section

open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSGM5B FCP.BFSSGM5D
open MeasureTheory Filter Topology

/-- Check the fixed-radius gradient estimate for the literal paired charge column. -/
theorem pairedFixedRadiusCoreGradient_sq_le (f : pairedGaugeData.invariantCore)
    (R : ℝ) (hzero : ∀ x : Boson 2, R < ‖x‖ → f.val x = 0) :
    ‖sourceCoreGradient f.val‖ ^ 2 ≤
      (1 / 8 : ℝ) * ‖originalMinimalPhysicalHilbertChargeColumn
        pairedAlgebraData pairedGaugeData
        (closedChargeCoreInput pairedAlgebraData pairedGaugeData f)‖ ^ 2 +
      (2 * (pairedAlgebraData.fermionGrowthConstant * R)) * ‖coreToL2 f.val‖ ^ 2 :=
  fixedRadiusCoreGradient_sq_le pairedAlgebraData pairedGaugeData f R hzero

/-- Check the gradient graph and kinetic limit on paired source data. -/
theorem pairedFixedRadiusNativeGraph_gradientLimit (R : ℝ)
    (f : ℕ → pairedGaugeData.invariantCore)
    (hzero : ∀ n (x : Boson 2), R < ‖x‖ → (f n).val x = 0)
    (u : FullL2 2) (v : PiLp 2 (fun _ : SpinIndex => FullL2 2))
    (hu : Tendsto (fun n => coreToL2 (f n).val) atTop (𝓝 u))
    (hv : Tendsto (fun n => originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData
      (closedChargeCoreInput pairedAlgebraData pairedGaugeData (f n))) atTop (𝓝 v)) :
    ∃ g : PiLp 2 (fun _ : SpaceIndex × ColorIndex 2 => FullL2 2),
      (u, g) ∈ BFSSSliceSobolev.closedGraph (volume : Measure (Boson 2)) coordinateDirection ∧
      Tendsto (fun n => sourceCoreGradient (f n).val) atTop (𝓝 g) ∧
      Tendsto (fun n => (1 / 2 : ℝ) * ∑ p : SpaceIndex × ColorIndex 2,
        ‖coreToL2 (coordinateDerivative p.1 p.2 (f n).val)‖ ^ 2)
        atTop (𝓝 ((1 / 2 : ℝ) * ‖g‖ ^ 2)) :=
  fixedRadiusNativeGraph_gradientLimit pairedAlgebraData pairedGaugeData R f hzero u v hu hv

#print axioms pairedFixedRadiusCoreGradient_sq_le
#print axioms pairedFixedRadiusNativeGraph_gradientLimit

end
end FCP.BFSSGM5DIndependent
