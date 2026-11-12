import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSP2C3OriginalMasslessCoreDensity

/-!
# P2-C4A: original source smooth-core integral monotonicity

Integrate the qualified literal BFSS P2-C3 density under TWO EXPLICIT
integrability hypotheses. These hypotheses remain for a later compact
support/continuity gate. This is not a closed Hamiltonian statement.
-/

set_option autoImplicit false

namespace FCP.BFSSP2C4AOriginalCoreIntegralTransfer
noncomputable section

open MeasureTheory
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP2C3OriginalMasslessCoreDensity

/-- A transparent abbreviation for the exact source lower density. -/
abbrev originalLowerDensity (f : SmoothCore 2) (x : Boson 2) : ℝ :=
  (FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0 x -
    FCP.BFSSSU2Full.concreteAlgebraData.fermionGrowthConstant * ‖x‖) * ‖f x‖^2

/-- A transparent abbreviation for the exact original source energy density. -/
abbrev originalActualDensity (f : SmoothCore 2) (x : Boson 2) : ℝ :=
  FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0 x * ‖f x‖^2 +
    inner ℝ (f x)
      (FCP.BFSSSU2Full.concreteAlgebraData.deformedFermionField 1 0 x (f x))

/-- Original density integral inequality with integrability made explicit. -/
theorem originalMasslessDensity_integral_lower (f : SmoothCore 2)
    (hLower : Integrable (originalLowerDensity f) (volume : Measure (Boson 2)))
    (hActual : Integrable (originalActualDensity f) (volume : Measure (Boson 2))) :
    (∫ x : Boson 2, originalLowerDensity f x) ≤
      ∫ x : Boson 2, originalActualDensity f x := by
  apply integral_mono hLower hActual
  intro x
  exact originalMasslessCoreDensity_lower x (f x)

/-- The literal original massless SmoothCore form lower bound, still conditional
only on integrability of its two source-defined energy densities. -/
theorem originalMasslessCoreForm_lower_of_integrable (f : SmoothCore 2)
    (hLower : Integrable (originalLowerDensity f) (volume : Measure (Boson 2)))
    (hActual : Integrable (originalActualDensity f) (volume : Measure (Boson 2))) :
    (1/2 : ℝ) * ∑ p : SpaceIndex × ColorIndex 2,
      ‖coreToL2 (coordinateDerivative p.1 p.2 f)‖^2 +
      (∫ x : Boson 2, originalLowerDensity f x) ≤
        FCP.BFSSSU2Full.concreteAlgebraData.coreForm f := by
  rw [originalMasslessCoreForm_energy]
  exact add_le_add_right (originalMasslessDensity_integral_lower f hLower hActual) _

#print axioms originalMasslessDensity_integral_lower
#print axioms originalMasslessCoreForm_lower_of_integrable

end
end FCP.BFSSP2C4AOriginalCoreIntegralTransfer
