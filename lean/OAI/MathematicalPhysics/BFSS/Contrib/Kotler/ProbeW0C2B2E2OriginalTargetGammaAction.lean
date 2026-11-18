import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2B0NOriginalSource48RealComplexCoefficientAdapter
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2AOriginalBivectorLieDefectTraceBridge

/-!
# BFSS W0C2B2 E2 — actual original K(AB-BA) gamma action

Prove ONLY the independently sourced target gamma action on the genuine
original 48 Majoranas and original Fermion 2 bounded Fock operator carrier.
Import accepted W0C2A's matrix-commutator skewness and B0N/LB1C1's
original real-to-complex covariance column; do NOT import the stopped B2,
its unqualified defect subtraction, or its original B2 R2 source module.

No actual centrality or K Lie-bracket theorem is claimed.
-/

set_option autoImplicit false

namespace FCP.BFSSW0C2B2E2OriginalTargetGammaAction
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4LB1C1OriginalSource48SkewKMajoranaCovariance
open FCP.BFSSP3M4W0C2B0NOriginalSource48RealComplexCoefficientAdapter
open FCP.BFSSP3M4W0C2AOriginalBivectorLieDefectTraceBridge

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev Mat := Matrix Source48Label Source48Label ℝ

/-- The real matrix commutator remains transpose-skew on the exact original
Source48 labels. The operator action of its ORIGINAL K is the same
complexified commutator column that E1 finds for the bracket K(A),K(B).
This is an independently proved target equation, NOT the bracket theorem. -/
theorem originalSource48K_skew_target_complex_gamma_covariance
    (A B : Mat) (hA : A.transpose = -A)
    (hB : B.transpose = -B) (k : Source48Label) :
    originalSource48BivectorK (A * B - B * A) * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48BivectorK (A * B - B * A) =
      ∑ q : Source48Label,
        ((originalSource48_complexify A * originalSource48_complexify B -
          originalSource48_complexify B * originalSource48_complexify A) q k) •
          sourceNormalizedGamma q := by
  have hC : (A * B - B * A).transpose = -(A * B - B * A) :=
    originalSource48_matrix_commutator_skew A B hA hB
  calc
    _ = ∑ q : Source48Label,
          ((A * B - B * A) q k : ℝ) • sourceNormalizedGamma q :=
      originalSource48BivectorK_skew_commutator_gamma_of_transpose
        (A * B - B * A) hC k
    _ = ∑ q : Source48Label,
          ((originalSource48_complexify A * originalSource48_complexify B -
            originalSource48_complexify B * originalSource48_complexify A) q k) •
              sourceNormalizedGamma q :=
      originalSource48Fock_real_commutator_column_to_complex
        A B sourceNormalizedGamma k

#print axioms originalSource48K_skew_target_complex_gamma_covariance

end
end FCP.BFSSW0C2B2E2OriginalTargetGammaAction
