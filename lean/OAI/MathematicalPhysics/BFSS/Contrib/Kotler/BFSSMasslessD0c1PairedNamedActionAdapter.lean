import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessD0c0OriginalGenericPartialMultiplierGraph

/-!
MASSLESS-D0c1 — source exact literal paired SU(2) 48-Majorana
consumer of the independently accepted D0c0 original partial
complex-linear massless multiplier and its algebraic graph.

Deliberately retain the named original source action as the target:
do not expose the expensive explicit paired quantizer lambda that
caused the frozen D0b1 R1/R2 recursion failures.
No closedness, self-adjointness, gauge domain or spectral statement.
-/
set_option autoImplicit false

namespace FCP.BFSSMasslessD0c1
noncomputable section
open OAI
open OAI.BFSSQuantum
open MeasureTheory

/-- Original 48-Majorana paired SU(2) consumer: actual partial
multiplier agrees a.e. with its original source named massless action. -/
theorem pairedOriginalMasslessMultiplier_namedAction_ae
    (ψ : FCP.BFSSMasslessD0b0.originalMasslessDomain
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData) :
    (FCP.BFSSMasslessD0c0.originalMasslessMultiplier
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData ψ :
        Boson 2 → Fermion 2) =ᵐ[volume]
      FCP.BFSSMasslessD0b0.originalMasslessAction
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData ψ.val := by
  exact FCP.BFSSMasslessD0c0.originalMasslessMultiplier_ae
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData ψ

/-- Actual paired source graph membership, without unfolding the
massive 48-Majorana concrete theta construction. -/
theorem pairedOriginalMasslessGraph_mem
    (ψ : FCP.BFSSMasslessD0b0.originalMasslessDomain
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData) :
    ((ψ.val : FullL2 2),
        FCP.BFSSMasslessD0c0.originalMasslessMultiplier
          FCP.BFSSSU2GaugeG1A.pairedAlgebraData ψ) ∈
      FCP.BFSSMasslessD0c0.originalMasslessGraph
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData := by
  exact FCP.BFSSMasslessD0c0.originalMasslessGraph_mem
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData ψ

#print axioms pairedOriginalMasslessMultiplier_namedAction_ae
#print axioms pairedOriginalMasslessGraph_mem

end
end FCP.BFSSMasslessD0c1
