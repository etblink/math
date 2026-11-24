import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQO0OriginalOrbitalDifference
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG1APairedThetaProbe

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQO0Independent
noncomputable section

open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2Full
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2PhysicalDomainL6G1
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3
open FCP.BFSSSU2PhysicalDomainL6G5P
open FCP.BFSSSU2PhysicalDomainL6G5W

private theorem pairedGamma : pairedAlgebraData.gamma = originalGamma := by
  funext i
  exact (pairedAlgebraData_gamma i).trans (concreteAlgebraData_gamma i)

/-- Check the direction and sign on the literal paired mixed operator. -/
theorem pairedRightOrderedAudit
    (w : SpinIndex → ℝ) (f : SmoothCore 2) (x : Boson 2) :
    ((sourceSpinorRightOrderedMixed pairedAlgebraData w) f) x =
      (-Complex.I) • fderiv ℝ (f : Boson 2 → Fermion 2) x
        (pairedAlgebraData.gaugeTangent x (sourceSpinorWeightedColor pairedAlgebraData w x)) :=
  FCP.BFSSCSQO0.rightOrderedMixed_orbital_apply pairedAlgebraData pairedGamma w f x

/-- Check the full difference from the two literal coefficient
half-squares, with the gamma and color matching premises discharged. -/
theorem pairedScalarDifferenceAudit (w z : SpinIndex → ℝ)
    (hn : spinorSquareNorm w = spinorSquareNorm z)
    (f : SmoothCore 2) (x : Boson 2) :
    (((1 / 2 : ℂ) • (∑ p : FermionLabel 2,
      sourceAllSpinorCoefficient pairedAlgebraData w p *
        sourceAllSpinorCoefficient pairedAlgebraData w p)) f) x -
      (((1 / 2 : ℂ) • (∑ p : FermionLabel 2,
        sourceAllSpinorCoefficient pairedAlgebraData z p *
          sourceAllSpinorCoefficient pairedAlgebraData z p)) f) x =
      (-Complex.I) • fderiv ℝ (f : Boson 2 → Fermion 2) x
        (pairedAlgebraData.gaugeTangent x
          (sourceSpinorWeightedColor pairedAlgebraData w x -
            sourceSpinorWeightedColor pairedAlgebraData z x)) := by
  have hc (a : ColorIndex 2) :
      pairedAlgebraData.color a = FCP.BFSSSU2.normalizedPauli a :=
    (pairedAlgebraData_color a).trans (concreteAlgebraData_color a)
  exact FCP.BFSSCSQO0.scalarHalfSquare_difference pairedAlgebraData hc pairedGamma w z hn f x

#print axioms pairedRightOrderedAudit
#print axioms pairedScalarDifferenceAudit

end
end FCP.BFSSCSQO0Independent
