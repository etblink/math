import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E9OriginalCutoffZeroMode

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5E9Independent
noncomputable section

open OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AY FCP.BFSSSU2PhysicalDomainL6H5E8BE
open FCP.BFSSGM5B FCP.BFSSGM5E1 FCP.BFSSGM5E7 FCP.BFSSGM5E9
open Filter Topology
open scoped NNReal

/-- Use the cutoff criterion on the original paired physical Hilbert space,
with the charge expressed through the original native partial operator. -/
theorem pairedOriginalZeroMode_of_localizedCoreSequence
    (f : ℕ → pairedGaugeData.invariantCore)
    (χ : Boson 2 → ℝ) (hχ : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) χ)
    (hg : ∀ a x, χ (pairedGaugeData.boson a x) = χ x)
    (hbounded : ∀ n, ‖coreToL2 (f n).val‖ ≤ 1)
    (hcharge : Tendsto (fun n => originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData
      (closedChargeCoreInput pairedAlgebraData pairedGaugeData (f n))) atTop (𝓝 0))
    (B Q W : ℝ≥0) (δ : ℝ) (hδ : 0 < δ)
    (hretain : ∀ n, δ ≤ ‖coreToL2
      (gaugeInvariantRealCutoff pairedAlgebraData pairedGaugeData χ hχ hg (f n)).val‖)
    (hB : ∀ n, ‖coreToL2 (gaugeInvariantRealCutoff
      pairedAlgebraData pairedGaugeData χ hχ hg (f n)).val‖ ≤ (B : ℝ))
    (hQ : ∀ n, ‖originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData (closedChargeCoreInput pairedAlgebraData pairedGaugeData
        (gaugeInvariantRealCutoff pairedAlgebraData pairedGaugeData χ hχ hg (f n)))‖ ≤ (Q : ℝ))
    (hW : ∀ n, ‖radialWeightedCore (gaugeInvariantRealCutoff
      pairedAlgebraData pairedGaugeData χ hχ hg (f n)).val‖ ≤ (W : ℝ)) :
    ∃ (u : pairedGaugeData.physicalSpace)
      (hu : u ∈ (originalMinimalPhysicalNormalizedHamiltonian
        pairedAlgebraData pairedGaugeData).domain),
      u ≠ 0 ∧ originalMinimalPhysicalNormalizedHamiltonian pairedAlgebraData pairedGaugeData
        ⟨u, hu⟩ = 0 :=
  originalZeroMode_of_localizedCoreSequence pairedAlgebraData pairedGaugeData
    f χ hχ hg hbounded hcharge B Q W δ hδ hretain hB hQ hW

#print axioms pairedOriginalZeroMode_of_localizedCoreSequence

end
end FCP.BFSSGM5E9Independent
