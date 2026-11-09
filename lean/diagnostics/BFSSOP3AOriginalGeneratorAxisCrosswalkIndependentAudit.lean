import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3AOriginalCliffordFockGeneratorAxisCrosswalk

/-!
# OP3-A1 independent source-axis consumer

Import the candidate as a separate Lean module and check its original
Fock continuous-linear-operator type, original block/color index types,
positive sqrt(2) normalization and two donor/active equality roots.

No full linear-map identity, M3I operator-action transport, star
automorphism, global Spin(9) action or spectral theorem is claimed.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3AOriginalGeneratorAxisIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSSource48RealLinearGamma

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

example (j : Fin 8) (s : Fin 2) (A : ColorIndex 2) :
    FCP.BFSSSU2GaugeG1A.pairedLabelEquiv
        (FCP.BFSSSU2GaugeG1A.spinPairEquiv.symm (j, s), A) =
      FCP.BFSSPairedThetaLabelCrosswalk.pairedLabelEquiv
        (FCP.BFSSPairedThetaLabelCrosswalk.spinPairEquiv.symm (j, s), A) :=
  FCP.BFSSOP3AOriginalGeneratorAxisCrosswalk.donor_paired_label_eq_active_source_axis j s A

example (j : Fin 8) (s : Fin 2) (A : ColorIndex 2) :
    FCP.BFSSS1V52L9E2.originalNormalizedFockMajorana (j, s) A =
      sourceNormalizedGamma (sourceBlockColorLabel (j, s) A) :=
  FCP.BFSSOP3AOriginalGeneratorAxisCrosswalk.donor_normalized_eq_active_source_axis j s A

example (j : Fin 8) (s : Fin 2) (A : ColorIndex 2) :
    FCP.BFSSS1V52L9E4.originalFockGammaRealLinear
        (sourceBlockColorAxis (j, s) A) =
      sourceGammaRealLinear (sourceBlockColorAxis (j, s) A) :=
  FCP.BFSSOP3AOriginalGeneratorAxisCrosswalk.donor_real_gamma_eq_active_on_source_axis j s A

example (j : Fin 8) (s : Fin 2) (A : ColorIndex 2) : FockOp :=
  sourceNormalizedGamma (sourceBlockColorLabel (j, s) A)

#print axioms FCP.BFSSOP3AOriginalGeneratorAxisCrosswalk.donor_paired_label_eq_active_source_axis
#print axioms FCP.BFSSOP3AOriginalGeneratorAxisCrosswalk.donor_normalized_eq_active_source_axis
#print axioms FCP.BFSSOP3AOriginalGeneratorAxisCrosswalk.donor_real_gamma_eq_active_on_source_axis

end
end FCP.BFSSOP3AOriginalGeneratorAxisIndependentAudit
