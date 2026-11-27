import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2K0OriginalCompactChargeConvergence

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2K0Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLL2A0 FCP.BFSSMOLL2E0
open FCP.BFSSMOLL2I0 FCP.BFSSMOLL2J0 FCP.BFSSMOLL2K0
open MeasureTheory Filter
open scoped Topology

theorem originalSU2KineticMollifierAudit (M : AlgebraData 2) (a : SpinIndex)
    (u w : Boson 2 → Fermion 2) (hu : LocallyIntegrable u volume)
    (hw : LocallyIntegrable w volume) (hsu : HasCompactSupport u)
    (hsw : HasCompactSupport w) (h : KineticWeakPair M a u w)
    (k : ScalarCore 2) :
    kineticCore M a (mollifiedCore k u hu hsu) = mollifiedCore k w hw hsw :=
  kineticCore_mollified_eq M a u w hu hw hsu hsw h k

theorem originalSU2CompactChargeConvergenceAudit (M : AlgebraData 2)
    (a : SpinIndex) (u w : Boson 2 → Fermion 2)
    (hsmu : StronglyMeasurable u) (h2u : MemLp u 2 volume)
    (hsmw : StronglyMeasurable w) (h2w : MemLp w 2 volume)
    (hu : LocallyIntegrable u volume) (hw : LocallyIntegrable w volume)
    (hsu : HasCompactSupport u) (hsw : HasCompactSupport w)
    (R : ℝ) (hR : tsupport u ⊆ Metric.closedBall 0 R)
    (h : KineticWeakPair M a u w) :
    Tendsto (fun n => coreToL2 (M.charge a
      (mollifiedCore (normalizedKernel (shrinkingBump 2 n)) u hu hsu)))
      atTop (𝓝 (h2w.toLp w +
        potentialL2 M a u hsmu h2u (R + 1) (input_support_enlarged u R hR))) :=
  concrete_mollified_charge_tendsto M a u w hsmu h2u hsmw h2w hu hw hsu hsw R hR h

#print axioms originalSU2KineticMollifierAudit
#print axioms originalSU2CompactChargeConvergenceAudit
end
end FCP.BFSSMOLL2K0Independent
