import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2L0OriginalFullWeakPairReduction

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2L0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLL2G0 FCP.BFSSMOLL2H0 FCP.BFSSMOLL2K0 FCP.BFSSMOLL2L0
open MeasureTheory

theorem originalSU2PotentialPairingAudit (M : AlgebraData 2) (a : SpinIndex)
    (x : Boson 2) (v w : Fermion 2) :
    inner ℂ (potentialOperator M a x v) w =
      inner ℂ v (potentialOperator M a x w) :=
  potentialOperator_pairing M a x v w

theorem originalSU2CompactWeakReductionAudit (M : AlgebraData 2) (a : SpinIndex)
    (u v : Boson 2 → Fermion 2) (hsmu : StronglyMeasurable u)
    (hsmv : StronglyMeasurable v) (h2u : MemLp u 2 volume) (h2v : MemLp v 2 volume)
    (hsu : HasCompactSupport u) (hsv : HasCompactSupport v)
    (R : ℝ) (hR : tsupport u ⊆ Metric.closedBall 0 R)
    (h : ChargeWeakPair M a u v) :
    StronglyMeasurable (v - potentialField M a u) ∧
      MemLp (v - potentialField M a u) 2 volume ∧
      LocallyIntegrable (v - potentialField M a u) volume ∧
      HasCompactSupport (v - potentialField M a u) ∧
      KineticWeakPair M a u (v - potentialField M a u) :=
  compact_chargeWeakPair_reduction M a u v hsmu hsmv h2u h2v hsu hsv R hR h

#print axioms originalSU2PotentialPairingAudit
#print axioms originalSU2CompactWeakReductionAudit
end
end FCP.BFSSMOLL2L0Independent
