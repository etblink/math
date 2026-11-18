import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2AOriginalBivectorLieDefectTraceBridge

/-!
# BFSS W0C2B2 D1 — named source-exact Fock Lie-defect boundary diagnostic

NEW PROOF ARCHITECTURE after preserved B2 R1/R2 and D0 R2 native REDs.
Actual original Fermion 2 ->L[C] Fermion 2 operators, original 48 Majorana
gamma family, original K(A), original W0C2A Lie defect. NO alternate K.
The two giant source operands get separate *typed names* before applying
an additive map lemma; the definitional source equality is audited alone.
This module does not prove action equality, gamma centrality or K Lie closure.
-/

set_option autoImplicit false

namespace FCP.BFSSW0C2B2D1NamedSourceDefectBoundary
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4W0C2AOriginalBivectorLieDefectTraceBridge

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev Mat := Matrix Source48Label Source48Label ℝ

/-- A named original source bracket operand, not an assumed representation. -/
noncomputable def originalSource48BracketOperandD1 (A B : Mat) : Op :=
  originalSource48BivectorK A * originalSource48BivectorK B -
    originalSource48BivectorK B * originalSource48BivectorK A

/-- A named original target operand, preserving the real matrix order. -/
noncomputable def originalSource48TargetOperandD1 (A B : Mat) : Op :=
  originalSource48BivectorK (A * B - B * A)

/-- A SOURCE DEFINITION CERTIFICATE only: W0C2A's exact original defect is
the difference of the two named, still genuine original Fock operands. -/
theorem originalSource48_defect_named_certificateD1 (A B : Mat) :
    originalSource48K_lieDefect A B =
      originalSource48BracketOperandD1 A B -
        originalSource48TargetOperandD1 A B := by
  rfl

/-- Fixed original Fock commutator is an additive map. This uses an entirely
generic proof: no expanded original K(A) terms are passed as arguments. -/
noncomputable def originalFockAdD1 (X : Op) : Op →+ Op where
  toFun := fun P => P * X - X * P
  map_zero' := by simp
  map_add' := by
    intro P Q
    simp only [add_mul, mul_add]
    abel

theorem originalFockAdD1_sub (X P Q : Op) :
    originalFockAdD1 X (P - Q) =
      originalFockAdD1 X P - originalFockAdD1 X Q :=
  map_sub (originalFockAdD1 X) P Q

/-- Two independent local joins only: congrArg on the explicit original
source certificate, followed by map_sub on the *named* Op operands. No
elaboration of the K(A) product inside an exact commutator-sub application. -/
theorem originalSource48_defect_named_ad_splitD1
    (A B : Mat) (k : Source48Label) :
    originalFockAdD1 (sourceNormalizedGamma k)
      (originalSource48K_lieDefect A B) =
    originalFockAdD1 (sourceNormalizedGamma k)
      (originalSource48BracketOperandD1 A B) -
    originalFockAdD1 (sourceNormalizedGamma k)
      (originalSource48TargetOperandD1 A B) := by
  calc
    _ = originalFockAdD1 (sourceNormalizedGamma k)
          (originalSource48BracketOperandD1 A B -
            originalSource48TargetOperandD1 A B) :=
      congrArg (originalFockAdD1 (sourceNormalizedGamma k))
        (originalSource48_defect_named_certificateD1 A B)
    _ = _ :=
      originalFockAdD1_sub (sourceNormalizedGamma k)
        (originalSource48BracketOperandD1 A B)
        (originalSource48TargetOperandD1 A B)

/-- CONDITIONAL ONLY. The required original bracket/target equality is a
premise and remains an open obligation; no centrality is asserted here. -/
theorem originalSource48_defect_named_ad_zero_of_equalD1
    (A B : Mat) (k : Source48Label)
    (h : originalFockAdD1 (sourceNormalizedGamma k)
            (originalSource48BracketOperandD1 A B) =
          originalFockAdD1 (sourceNormalizedGamma k)
            (originalSource48TargetOperandD1 A B)) :
    originalFockAdD1 (sourceNormalizedGamma k)
      (originalSource48K_lieDefect A B) = 0 := by
  rw [originalSource48_defect_named_ad_splitD1 A B k, h, sub_self]

#print axioms originalSource48_defect_named_certificateD1
#print axioms originalFockAdD1_sub
#print axioms originalSource48_defect_named_ad_splitD1
#print axioms originalSource48_defect_named_ad_zero_of_equalD1

end
end FCP.BFSSW0C2B2D1NamedSourceDefectBoundary
