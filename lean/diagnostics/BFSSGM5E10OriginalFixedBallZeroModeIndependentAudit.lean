import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E10OriginalFixedBallZeroMode

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5E10Independent
noncomputable section

open OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AY FCP.BFSSSU2PhysicalDomainL6H5E8BE
open FCP.BFSSGM5B FCP.BFSSGM5E10
open Filter MeasureTheory Topology

/-- Read the criterion on the original paired SU(2) charge and natural
Hamiltonian domain using the probability integral over the literal closed ball. -/
theorem pairedOriginalZeroMode_of_fixedBallMass
    (f : ℕ → pairedGaugeData.invariantCore)
    {ι : Type*} [Fintype ι] (χ : ι → Boson 2 → ℝ)
    (hχ : ∀ j, ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) (χ j))
    (hg : ∀ j a x, χ j (pairedGaugeData.boson a x) = χ j x)
    (hpart : ∀ x, ∑ j, χ j x ^ 2 = 1)
    (j₀ : ι) (R S D : ℝ)
    (hS : 0 ≤ S) (hD : ∀ j x, ‖cutoffGradient (χ j) x‖ ^ 2 ≤ D)
    (hone : ∀ x : Boson 2, ‖x‖ ≤ R → χ j₀ x = 1)
    (hzero : ∀ x : Boson 2, S < ‖x‖ → χ j₀ x = 0)
    (hbounded : ∀ n, ‖coreToL2 (f n).val‖ ≤ 1)
    (hcharge : Tendsto (fun n => originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData
      (closedChargeCoreInput pairedAlgebraData pairedGaugeData (f n))) atTop (𝓝 0))
    (m : ℝ) (hm : 0 < m)
    (hmass : ∀ n, m ≤ ∫ x in Metric.closedBall (0 : Boson 2) R, ‖(f n).val x‖ ^ 2) :
    ∃ (u : pairedGaugeData.physicalSpace)
      (hu : u ∈ (originalMinimalPhysicalNormalizedHamiltonian
        pairedAlgebraData pairedGaugeData).domain),
      u ≠ 0 ∧ originalMinimalPhysicalNormalizedHamiltonian pairedAlgebraData pairedGaugeData
        ⟨u, hu⟩ = 0 :=
  originalZeroMode_of_fixedBallMass pairedAlgebraData pairedGaugeData f
    χ hχ hg hpart j₀ R S D hS hD hone hzero hbounded hcharge m hm hmass

#print axioms pairedOriginalZeroMode_of_fixedBallMass

end
end FCP.BFSSGM5E10Independent
