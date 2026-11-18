import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.ProbeW0C2B2D1NamedSourceDefectBoundary

/-! Independent D1 consumer of genuine original named Source48 defect split.
No result is an unconditional centrality or K(A) Lie bracket theorem. -/

set_option autoImplicit false

namespace FCP.BFSSW0C2B2D1NamedSourceDefectBoundaryConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4W0C2AOriginalBivectorLieDefectTraceBridge
open FCP.BFSSW0C2B2D1NamedSourceDefectBoundary

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev Mat := Matrix Source48Label Source48Label ℝ

theorem originalSource48_defect_named_certificateD1_consumer (A B : Mat) :
    originalSource48K_lieDefect A B =
      originalSource48BracketOperandD1 A B -
        originalSource48TargetOperandD1 A B :=
  originalSource48_defect_named_certificateD1 A B

theorem originalFockAdD1_sub_consumer (X P Q : Op) :
    originalFockAdD1 X (P - Q) =
      originalFockAdD1 X P - originalFockAdD1 X Q :=
  originalFockAdD1_sub X P Q

theorem originalSource48_defect_named_ad_splitD1_consumer
    (A B : Mat) (k : Source48Label) :
    originalFockAdD1 (sourceNormalizedGamma k)
      (originalSource48K_lieDefect A B) =
    originalFockAdD1 (sourceNormalizedGamma k)
      (originalSource48BracketOperandD1 A B) -
    originalFockAdD1 (sourceNormalizedGamma k)
      (originalSource48TargetOperandD1 A B) :=
  originalSource48_defect_named_ad_splitD1 A B k

theorem originalSource48_defect_named_ad_zero_of_equalD1_consumer
    (A B : Mat) (k : Source48Label)
    (h : originalFockAdD1 (sourceNormalizedGamma k)
            (originalSource48BracketOperandD1 A B) =
          originalFockAdD1 (sourceNormalizedGamma k)
            (originalSource48TargetOperandD1 A B)) :
    originalFockAdD1 (sourceNormalizedGamma k)
      (originalSource48K_lieDefect A B) = 0 :=
  originalSource48_defect_named_ad_zero_of_equalD1 A B k h

/-- Original source identity survives independent import. -/
example (A B : Mat) :
    originalSource48BracketOperandD1 A B =
      originalSource48BivectorK A * originalSource48BivectorK B -
        originalSource48BivectorK B * originalSource48BivectorK A := rfl

/-- Original gamma used directly; no substitute or replacement gamma. -/
example (k : Source48Label) :
    originalFockAdD1 (sourceNormalizedGamma k) (0 : Op) = 0 := by
  simp

#print axioms originalSource48_defect_named_certificateD1_consumer
#print axioms originalFockAdD1_sub_consumer
#print axioms originalSource48_defect_named_ad_splitD1_consumer
#print axioms originalSource48_defect_named_ad_zero_of_equalD1_consumer

end
end FCP.BFSSW0C2B2D1NamedSourceDefectBoundaryConsumer
