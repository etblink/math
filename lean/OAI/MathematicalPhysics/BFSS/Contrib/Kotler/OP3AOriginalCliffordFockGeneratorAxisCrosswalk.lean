import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainS1V52L9E4OriginalFockRealLinearCliffordGeneratorMapProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSSource48RealLinearGammaProbe

/-!
# OP3-A1 — exact donor-to-active original Fock gamma source-axis crosswalk

The historical original Fock gamma construction and the active Fock
gamma construction both act on the ORIGINAL Source48Vector and ORIGINAL
Fermion 2 continuous-linear operators. Their apparent label conventions
differ unless one uses the exact G1A spin-paired, color-preserving map.

Prove generator compatibility only on an original source block/color
coordinate axis. The physical Majoranas obey delta-one CAR; Clifford
unit axes use the indispensable positive sqrt(2) normalization.

This is an R1-A component, NOT a full linear-map equality, not yet the
complexified Clifford M2/M3I generator formula, and not a Spin(9) action.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3AOriginalGeneratorAxisCrosswalk
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSSource48RealLinearGamma

/-- The historical original G1A and active crosswalk pack exactly
the same 8 × 2 × 3 source mode, in their respective namespace
definitions. Prove this strictly at the small LABEL level first:
an apparent equality of two named Fock operators is not a licensed
definitional rewrite. -/
theorem donor_paired_label_eq_active_source_axis
    (j : Fin 8) (s : Fin 2) (A : ColorIndex 2) :
    FCP.BFSSSU2GaugeG1A.pairedLabelEquiv
        (FCP.BFSSSU2GaugeG1A.spinPairEquiv.symm (j, s), A) =
      FCP.BFSSPairedThetaLabelCrosswalk.pairedLabelEquiv
        (FCP.BFSSPairedThetaLabelCrosswalk.spinPairEquiv.symm (j, s), A) := by
  simp only [FCP.BFSSSU2GaugeG1A.pairedLabelEquiv,
    FCP.BFSSPairedThetaLabelCrosswalk.pairedLabelEquiv,
    Equiv.coe_fn_mk, Equiv.apply_symm_apply]
  -- Both historical G1A and active crosswalk definitions use exactly
  -- finProdFinEquiv for the same original (j, A) color/mode indices.
  rfl

/-- On the genuine original 8 × 2 × 3 block/color axes, the
donor normalized Majorana equals the active normalized source gamma.
The G1A and active paired-label definitions are explicitly matched;
no source-index ordering or normalization is silently assumed. -/
theorem donor_normalized_eq_active_source_axis
    (j : Fin 8) (s : Fin 2) (A : ColorIndex 2) :
    FCP.BFSSS1V52L9E2.originalNormalizedFockMajorana (j, s) A =
      sourceNormalizedGamma (sourceBlockColorLabel (j, s) A) := by
  have hlabel :
      FCP.BFSSSU2GaugeG1A.pairedLabelEquiv
          (FCP.BFSSSU2GaugeG1A.spinPairEquiv.symm (j, s), A) =
        sourceBlockColorLabel (j, s) A :=
    (donor_paired_label_eq_active_source_axis j s A).trans
      (FCP.BFSSS1V7.sourceBlockColorLabel_eq_original_paired j s A).symm
  change (↑(Real.sqrt 2) : ℂ) •
      majoranaCandidate (FCP.BFSSSU2GaugeG1A.pairedLabelEquiv
        (FCP.BFSSSU2GaugeG1A.spinPairEquiv.symm (j, s), A)) =
    (↑(Real.sqrt 2) : ℂ) • majoranaCandidate
      (sourceBlockColorLabel (j, s) A)
  exact congrArg
    (fun p : Source48Label =>
      (↑(Real.sqrt 2) : ℂ) • majoranaCandidate p) hlabel

/-- The two REAL-LINEAR original-source Fock gamma constructions
coincide at every genuine original coordinate axis. Crucially,
this theorem does not force Lean to unfold or compare the entire
24-mode Fock-operator-valued finite sums. -/
theorem donor_real_gamma_eq_active_on_source_axis
    (j : Fin 8) (s : Fin 2) (A : ColorIndex 2) :
    FCP.BFSSS1V52L9E4.originalFockGammaRealLinear
        (sourceBlockColorAxis (j, s) A) =
      sourceGammaRealLinear (sourceBlockColorAxis (j, s) A) := by
  calc
    FCP.BFSSS1V52L9E4.originalFockGammaRealLinear
        (sourceBlockColorAxis (j, s) A) =
        FCP.BFSSS1V52L9E2.originalNormalizedFockMajorana (j, s) A :=
      FCP.BFSSS1V52L9E4.originalFockGammaRealLinear_sourceAxis (j, s) A
    _ = sourceNormalizedGamma (sourceBlockColorLabel (j, s) A) :=
      donor_normalized_eq_active_source_axis j s A
    _ = sourceGammaRealLinear (sourceBlockColorAxis (j, s) A) :=
      (sourceGammaRealLinear_axis j s A).symm

#print axioms donor_paired_label_eq_active_source_axis
#print axioms donor_normalized_eq_active_source_axis
#print axioms donor_real_gamma_eq_active_on_source_axis

end
end FCP.BFSSOP3AOriginalGeneratorAxisCrosswalk
