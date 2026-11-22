import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM4AOriginalMasslessPhysicalFixedSpaceRestriction

/-!
Independent GM4A exact source-physical-space restricted ORIGINAL
massless Fock multiplier. The output is the true pairedGaugeData
physicalSpace, not an artificial substitute Hilbert space.
-/
set_option autoImplicit false

namespace FCP.BFSSGM4AIndependent
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- Imported independently: the genuine 48-Majorana physical
massless domain carries a complex-linear partial operator whose
codomain is the actual SU(2) physical Hilbert space. -/
noncomputable def pairedSourcePhysicalMasslessMultiplier :
    FCP.BFSSGM4A.pairedOriginalPhysicalMasslessDomain →ₗ[ℂ]
      FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace :=
  FCP.BFSSGM4A.pairedOriginalPhysicalMasslessMultiplier

/-- The consumer independently applies the original source
physical-output theorem to an arbitrary true-domain vector. -/
theorem pairedSourceMasslessMultiplier_output_physical
    (ψ : FCP.BFSSMasslessD0b0.originalMasslessDomain
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData)
    (hψ : ψ.val ∈ FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace) :
    FCP.BFSSMasslessD0c0.originalMasslessMultiplier
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData ψ ∈
    FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace :=
  FCP.BFSSGM4A.originalMasslessMultiplier_output_mem_physical
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData
    FCP.BFSSSU2GaugeG4J.pairedGaugeData ψ hψ

#print axioms pairedSourcePhysicalMasslessMultiplier
#print axioms pairedSourceMasslessMultiplier_output_physical

end FCP.BFSSGM4AIndependent
