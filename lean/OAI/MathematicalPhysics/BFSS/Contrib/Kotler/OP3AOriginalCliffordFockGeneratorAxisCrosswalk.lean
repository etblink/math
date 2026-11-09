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
open FCP.BFSSS1V0
open FCP.BFSSS1V5
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSSource48RealLinearGamma

/-- On the ACTUAL original 8 × 2 × 3 block/color labels, the
donor sqrt(2)-normalized Majorana is exactly the active normalized
source gamma. The needed label bridge is the proven G1A permutation,
not an assumption about Fintype.equivFin ordering. -/
theorem donor_normalized_eq_active_source_axis
    (j : Fin 8) (s : Fin 2) (A : ColorIndex 2) :
    FCP.BFSSS1V52L9E2.originalNormalizedFockMajorana (j, s) A =
      sourceNormalizedGamma (sourceBlockColorLabel (j, s) A) := by
  unfold FCP.BFSSS1V52L9E2.originalNormalizedFockMajorana
    sourceNormalizedGamma
  rw [FCP.BFSSSource48FockIndexBridge.sourceBlockColorMajorana_eq_G1APairedTheta]

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

#print axioms donor_normalized_eq_active_source_axis
#print axioms donor_real_gamma_eq_active_on_source_axis

end
end FCP.BFSSOP3AOriginalGeneratorAxisCrosswalk
