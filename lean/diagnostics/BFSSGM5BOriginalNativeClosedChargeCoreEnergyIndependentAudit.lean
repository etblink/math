import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5BOriginalNativeClosedChargeCoreEnergy

set_option autoImplicit false

namespace FCP.BFSSGM5BIndependent
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSGM4A
open FCP.BFSSGM5A
open FCP.BFSSGM5B
open MeasureTheory
open scoped InnerProductSpace

/-- Check the exact native column and all original paired charge coordinates. -/
theorem pairedClosedChargeCoreOutput (f : pairedGaugeData.invariantCore) :
    originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData
      (closedChargeCoreInput pairedAlgebraData pairedGaugeData f) =
        WithLp.toLp 2 (pairedAlgebraData.chargeVector f.val) :=
  closedChargeCoreOutput pairedAlgebraData pairedGaugeData f

/-- Check the massless energy on the native paired charge domain and the
original paired physical fermion multiplier domain. -/
theorem pairedPhysicalMasslessClosedChargeCoreEnergy
    (f : pairedGaugeData.invariantCore) :
    (1 / 16 : ℝ) * ‖originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData
      (closedChargeCoreInput pairedAlgebraData pairedGaugeData f)‖ ^ 2 =
      (1 / 2 : ℝ) * ∑ p : SpaceIndex × ColorIndex 2,
        ‖coreToL2 (coordinateDerivative p.1 p.2 f.val)‖ ^ 2 +
      (∫ x : Boson 2, pairedAlgebraData.deformedBosonicPotential 1 0 x * ‖f.val x‖ ^ 2) +
      (inner ℂ (physicalMasslessCoreInput pairedAlgebraData pairedGaugeData f).val
        (pairedOriginalPhysicalMasslessMultiplier
          (physicalMasslessCoreInput pairedAlgebraData pairedGaugeData f))).re :=
  physicalMasslessClosedChargeCoreEnergy pairedAlgebraData pairedGaugeData f

#print axioms pairedClosedChargeCoreOutput
#print axioms pairedPhysicalMasslessClosedChargeCoreEnergy

end
end FCP.BFSSGM5BIndependent
