import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.ProbeW0C2B2D0OriginalFockCommutatorAddHom

/-! Independently imported proof interface: diagnostic only; source-exact
original Fock/Source48 and original W0C2A defect. Not B2 qualification. -/

set_option autoImplicit false

namespace FCP.BFSSW0C2B2D0CommutatorAddHomConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4W0C2AOriginalBivectorLieDefectTraceBridge
open FCP.BFSSProbeW0C2B2D0OriginalFockCommutatorAddHom

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev Mat := Matrix Source48Label Source48Label ℝ

theorem originalFockAd_apply_consumer (X P : Op) :
    originalFockAd X P = P * X - X * P :=
  originalFockAd_apply X P

theorem originalFockAd_sub_consumer (X P Q : Op) :
    originalFockAd X (P - Q) =
      originalFockAd X P - originalFockAd X Q :=
  originalFockAd_sub X P Q

theorem originalSource48K_lieDefect_ad_split_consumer
    (A B : Mat) (k : Source48Label) :
    originalFockAd (sourceNormalizedGamma k) (originalSource48K_lieDefect A B) =
      originalFockAd (sourceNormalizedGamma k)
        (originalSource48BivectorK A * originalSource48BivectorK B -
          originalSource48BivectorK B * originalSource48BivectorK A) -
      originalFockAd (sourceNormalizedGamma k)
        (originalSource48BivectorK (A * B - B * A)) :=
  originalSource48K_lieDefect_ad_split A B k

theorem originalSource48K_lieDefect_ad_zero_of_equal_consumer
    (A B : Mat) (k : Source48Label)
    (h : originalFockAd (sourceNormalizedGamma k)
          (originalSource48BivectorK A * originalSource48BivectorK B -
            originalSource48BivectorK B * originalSource48BivectorK A) =
        originalFockAd (sourceNormalizedGamma k)
          (originalSource48BivectorK (A * B - B * A))) :
    originalFockAd (sourceNormalizedGamma k)
      (originalSource48K_lieDefect A B) = 0 :=
  originalSource48K_lieDefect_ad_zero_of_equal A B k h

/-- Native original gamma control, not an artificial surrogate family. -/
example (k : Source48Label) :
    originalFockAd (sourceNormalizedGamma k) (0 : Op) = 0 := by
  simp

/-- Native original source K-expression in the generic difference law. -/
example (A B : Mat) (k : Source48Label) :
    originalFockAd (sourceNormalizedGamma k)
      (originalSource48BivectorK A - originalSource48BivectorK B) =
    originalFockAd (sourceNormalizedGamma k) (originalSource48BivectorK A) -
    originalFockAd (sourceNormalizedGamma k) (originalSource48BivectorK B) :=
  originalFockAd_sub _ _ _

#print axioms originalFockAd_apply_consumer
#print axioms originalFockAd_sub_consumer
#print axioms originalSource48K_lieDefect_ad_split_consumer
#print axioms originalSource48K_lieDefect_ad_zero_of_equal_consumer

end
end FCP.BFSSW0C2B2D0CommutatorAddHomConsumer
