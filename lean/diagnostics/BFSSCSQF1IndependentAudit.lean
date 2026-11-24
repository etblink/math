import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQF1OriginalFermionicDifference
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG1APairedThetaProbe

set_option autoImplicit false
set_option warningAsError true
namespace FCP.BFSSCSQF1Independent
noncomputable section
open scoped Matrix BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2Full
open FCP.BFSSSU2PhysicalDomainL6G1
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3
open FCP.BFSSSU2PhysicalDomainL6G5W
open FCP.BFSSSU2PhysicalDomainL6G6H
open FCP.BFSSSU2PhysicalDomainL6G6K

/-- Literal paired bounded current diagonal evaluation. -/
theorem pairedCurrentAudit (c : ColorIndex 2) (f : SmoothCore 2) (x : Boson 2) :
    sourceFiberFermionColorCurrent pairedAlgebraData c (f x) =
      (-Complex.I / 2 : ℂ) •
        (∑ p : FermionLabel 2, ∑ q : FermionLabel 2,
          if p.1 = q.1 then
            (pairedAlgebraData.structureConstant p.2 q.2 c : ℂ) •
              pairedAlgebraData.theta p.1 p.2 (pairedAlgebraData.theta q.1 q.2 (f x))
          else 0) :=
  FCP.BFSSCSQF1.current_diagonal_apply pairedAlgebraData c f x

/-- No free gamma/color matching premises in the actual paired consumer. -/
theorem pairedResponseAudit (w z : SpinIndex → ℝ)
    (hn : spinorSquareNorm w = spinorSquareNorm z)
    (f : SmoothCore 2) (x : Boson 2) :
    ((sourceOriginalOrderedFermionicResponse pairedAlgebraData w) f) x -
      ((sourceOriginalOrderedFermionicResponse pairedAlgebraData z) f) x =
      ∑ c : ColorIndex 2,
        ((sourceSpinorWeightedColor pairedAlgebraData w x c -
          sourceSpinorWeightedColor pairedAlgebraData z x c : ℝ) : ℂ) •
          sourceFiberFermionColorCurrent pairedAlgebraData c (f x) := by
  have hc (a : ColorIndex 2) :
      pairedAlgebraData.color a = FCP.BFSSSU2.normalizedPauli a :=
    (pairedAlgebraData_color a).trans (concreteAlgebraData_color a)
  have hg : pairedAlgebraData.gamma = originalGamma := by
    funext i
    exact (pairedAlgebraData_gamma i).trans (concreteAlgebraData_gamma i)
  exact FCP.BFSSCSQF1.originalFermionicDifference pairedAlgebraData hc hg w z hn f x

#print axioms pairedCurrentAudit
#print axioms pairedResponseAudit
end
end FCP.BFSSCSQF1Independent
