import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E8OriginalPersistentOverlapZeroMode

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5E8Independent
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AY FCP.BFSSSU2PhysicalDomainL6H5E8BE
open FCP.BFSSGM5B FCP.BFSSGM5E8
open Filter Topology
open scoped InnerProductSpace

/-- Check the fixed-overlap implication for the literal paired physical core,
native charge output, and normalized Hamiltonian. -/
theorem pairedOriginalZeroMode_of_persistentOverlap
    (f : ℕ → pairedGaugeData.invariantCore) (w : pairedGaugeData.physicalSpace)
    (δ : ℝ) (hδ : 0 < δ)
    (hbounded : ∀ n, ‖OAI.BFSSQuantum.AlgebraData.coreToL2 (f n).val‖ ≤ 1)
    (hcharge : Tendsto (fun n => originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData
      (closedChargeCoreInput pairedAlgebraData pairedGaugeData (f n))) atTop (𝓝 0))
    (hoverlap : ∀ᶠ n in atTop, δ ≤ ‖inner ℂ w
      (closedChargeCoreInput pairedAlgebraData pairedGaugeData (f n) :
        pairedGaugeData.physicalSpace)‖) :
    ∃ (u : pairedGaugeData.physicalSpace)
      (hu : u ∈ (originalMinimalPhysicalNormalizedHamiltonian
        pairedAlgebraData pairedGaugeData).domain),
      u ≠ 0 ∧ originalMinimalPhysicalNormalizedHamiltonian pairedAlgebraData pairedGaugeData ⟨u, hu⟩ = 0 :=
  originalZeroMode_of_persistentOverlap pairedAlgebraData pairedGaugeData
    f w δ hδ hbounded hcharge hoverlap

#print axioms pairedOriginalZeroMode_of_persistentOverlap

end
end FCP.BFSSGM5E8Independent
