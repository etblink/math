import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1b1OriginalS1JAxisMulVecSource
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSSource48RealLinearGammaProbe

/-!
# C48-1A1c0 — original 48-Majorana gamma map preserves the exact S1J axis column

One new, independent linear-interface obligation on the ORIGINAL Source48Vector
and ORIGINAL Fermion 2 bounded Fock operators. Source S1J matrix-axis and
sourceGammaRealLinear are already separately qualified; do not expand CAR,
change the real/complex scalar, or introduce a substitute gauge implementer.

This is a source Gamma linearity result, not the G4E Fock-gauge intertwiner.
-/
set_option autoImplicit false

namespace FCP.BFSSC48C1A1c0OriginalS1JAxisGammaColorSum
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V5
open FCP.BFSSSource48RealLinearGamma

/-- Push the qualified original S1J color-column action through the
existing real-linear normalized Gamma map without reinterpreting the
source 48 vector, changing output-input color order, or dropping sqrt(2). -/
theorem originalS1J_axis_gamma_color_sum
    (q : GaugeGroup 2) (j : Fin 8) (s : Fin 2)
    (A : ColorIndex 2) :
    sourceGammaRealLinear
        ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
          (sourceBlockColorAxis (j,s) A)) =
      ∑ B : ColorIndex 2,
        (FCP.BFSSSU2GaugeG3A.adjointColorMatrix q B A) •
          sourceGammaRealLinear (sourceBlockColorAxis (j,s) B) := by
  rw [FCP.BFSSC48C1A1b1OriginalS1JAxisMulVecSource.originalS1J_mulVec_sourceBlockColorAxis]
  simp only [map_sum, map_smul]

#print axioms originalS1J_axis_gamma_color_sum

end
end FCP.BFSSC48C1A1c0OriginalS1JAxisGammaColorSum
