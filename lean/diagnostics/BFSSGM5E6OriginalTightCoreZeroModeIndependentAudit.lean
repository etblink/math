import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E6OriginalTightCoreZeroMode

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5E6Independent
noncomputable section

open OAI OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J
open FCP.BFSSGM5B FCP.BFSSGM5E6
open FCP.BFSSSU2PhysicalDomainL6H5E8AY FCP.BFSSSU2PhysicalDomainL6H5E8BE
open Filter MeasureTheory Topology
open scoped NNReal

/-- Exercise the criterion with the literal paired Hilbert space, charge,
radial weight and normalized Hamiltonian. -/
theorem pairedOriginalZeroMode_of_tightCoreSequence
    (f : ℕ → pairedGaugeData.invariantCore) (W : ℝ≥0)
    (hnorm : ∀ n, ‖OAI.BFSSQuantum.AlgebraData.coreToL2 (f n).val‖ = 1)
    (hcharge : Tendsto (fun n => originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData
      (closedChargeCoreInput pairedAlgebraData pairedGaugeData (f n))) atTop (𝓝 0))
    (hmoment : ∀ n, ‖BFSSSliceSobolev.weightedToL2 (volume : Measure (Boson 2))
      (fun x : Boson 2 => Real.sqrt ‖x‖) (Real.continuous_sqrt.comp continuous_norm)
      (f n).val‖ ≤ (W : ℝ)) :
    ∃ (u : pairedGaugeData.physicalSpace)
      (hu : u ∈ (originalMinimalPhysicalNormalizedHamiltonian
        pairedAlgebraData pairedGaugeData).domain),
      ‖(u : FullL2 2)‖ = 1 ∧
        originalMinimalPhysicalNormalizedHamiltonian pairedAlgebraData pairedGaugeData ⟨u, hu⟩ = 0 :=
  originalZeroMode_of_tightCoreSequence pairedAlgebraData pairedGaugeData f W hnorm hcharge hmoment

#print axioms pairedOriginalZeroMode_of_tightCoreSequence

end
end FCP.BFSSGM5E6Independent
