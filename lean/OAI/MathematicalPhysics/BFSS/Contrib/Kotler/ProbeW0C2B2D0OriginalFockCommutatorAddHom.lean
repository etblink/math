import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2AOriginalBivectorLieDefectTraceBridge

/-!
# W0C2B2 D0 — independently scoped original Fock additive commutator probe

DIAGNOSTIC ONLY. Not a replacement or repair of the stopped B2 R1/R2 source.
Original Fermion 2 complex continuous-linear operators, original Source48
48-gamma family, original K(A) and W0C2A Lie defect, not surrogate matrices.
Test whether AddMonoidHom.map_sub can transport source-exact Lie-defect
subtraction without expanding the K operators inside abel.

No covariance hypothesis discharged here. No centrality/Lie bracket conclusion.
-/

set_option autoImplicit false

namespace FCP.BFSSProbeW0C2B2D0OriginalFockCommutatorAddHom
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4W0C2AOriginalBivectorLieDefectTraceBridge

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev Mat := Matrix Source48Label Source48Label ℝ

/-- Commutation with a fixed original complex Fock operator is additive.
All noncommutative products remain in opaque local variables. -/
noncomputable def originalFockAd (X : Op) : Op →+ Op where
  toFun := fun P => P * X - X * P
  map_zero' := by simp
  map_add' := by
    intro P Q
    simp only [add_mul, mul_add]
    abel

theorem originalFockAd_apply (X P : Op) :
    originalFockAd X P = P * X - X * P := rfl

theorem originalFockAd_sub (X P Q : Op) :
    originalFockAd X (P - Q) =
      originalFockAd X P - originalFockAd X Q := by
  exact map_sub (originalFockAd X) P Q

/-- Source-exact original K Lie-defect subtraction transported through the
additive commutator action. This is algebraic only, no skew hypotheses. -/
theorem originalSource48K_lieDefect_ad_split (A B : Mat) (k : Source48Label) :
    originalFockAd (sourceNormalizedGamma k) (originalSource48K_lieDefect A B) =
      originalFockAd (sourceNormalizedGamma k)
        (originalSource48BivectorK A * originalSource48BivectorK B -
          originalSource48BivectorK B * originalSource48BivectorK A) -
      originalFockAd (sourceNormalizedGamma k)
        (originalSource48BivectorK (A * B - B * A)) := by
  rw [originalSource48K_lieDefect]
  exact originalFockAd_sub
    (sourceNormalizedGamma k)
    (originalSource48BivectorK A * originalSource48BivectorK B -
      originalSource48BivectorK B * originalSource48BivectorK A)
    (originalSource48BivectorK (A * B - B * A))

/-- CONDITIONAL bridge only: equal original commutator actions imply that
the original Lie defect has zero commutator action at this gamma. It does
not establish equality of those actions, even for skew A and B. -/
theorem originalSource48K_lieDefect_ad_zero_of_equal
    (A B : Mat) (k : Source48Label)
    (h : originalFockAd (sourceNormalizedGamma k)
          (originalSource48BivectorK A * originalSource48BivectorK B -
            originalSource48BivectorK B * originalSource48BivectorK A) =
        originalFockAd (sourceNormalizedGamma k)
          (originalSource48BivectorK (A * B - B * A))) :
    originalFockAd (sourceNormalizedGamma k)
      (originalSource48K_lieDefect A B) = 0 := by
  rw [originalSource48K_lieDefect_ad_split A B k, h, sub_self]

#print axioms originalFockAd_apply
#print axioms originalFockAd_sub
#print axioms originalSource48K_lieDefect_ad_split
#print axioms originalSource48K_lieDefect_ad_zero_of_equal

end
end FCP.BFSSProbeW0C2B2D0OriginalFockCommutatorAddHom
