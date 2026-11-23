import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5AOriginalPhysicalMasslessCorePairing

set_option autoImplicit false

namespace FCP.BFSSGM5AIndependent
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open MeasureTheory
open scoped InnerProductSpace
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSGM4A
open FCP.BFSSGM5A

/-- Independently restate the pairing on the literal paired source. -/
theorem pairedPhysicalMasslessCorePairing
    (f : pairedGaugeData.invariantCore) :
    (inner ℂ (physicalMasslessCoreInput pairedAlgebraData pairedGaugeData f).val
      (pairedOriginalPhysicalMasslessMultiplier
        (physicalMasslessCoreInput pairedAlgebraData pairedGaugeData f))).re =
      ∫ x : Boson 2,
        inner ℝ (f.val x) (pairedAlgebraData.deformedFermionField 1 0 x (f.val x)) :=
  physicalMasslessCorePairing pairedAlgebraData pairedGaugeData f

/-- The paired original smooth-core energy absorbs the new physical
multiplier pairing with the original kinetic and bosonic terms. -/
theorem pairedPhysicalMasslessCoreEnergy
    (f : pairedGaugeData.invariantCore) :
    pairedAlgebraData.coreForm f.val =
      (1 / 2 : ℝ) * ∑ p : SpaceIndex × ColorIndex 2,
        ‖coreToL2 (coordinateDerivative p.1 p.2 f.val)‖ ^ 2 +
      (∫ x : Boson 2, pairedAlgebraData.deformedBosonicPotential 1 0 x * ‖f.val x‖ ^ 2) +
      (inner ℂ (physicalMasslessCoreInput pairedAlgebraData pairedGaugeData f).val
        (pairedOriginalPhysicalMasslessMultiplier
          (physicalMasslessCoreInput pairedAlgebraData pairedGaugeData f))).re :=
  physicalMasslessCoreEnergy pairedAlgebraData pairedGaugeData f

#print axioms pairedPhysicalMasslessCorePairing
#print axioms pairedPhysicalMasslessCoreEnergy

end
end FCP.BFSSGM5AIndependent
