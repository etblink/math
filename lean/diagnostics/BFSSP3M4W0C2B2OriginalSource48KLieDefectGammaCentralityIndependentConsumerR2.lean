import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2B2OriginalSource48KLieDefectGammaCentralityR2

/-!
# B2 R2 — independent import of original all-48 Source48 K Lie-defect centrality
Four distinct source-exact consumer roots and four original-gamma controls.
No unproved original K Lie bracket or new physical group claim.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0C2B2OriginalSource48KLieDefectGammaCentralityIndependentConsumerR2
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4W0C2B0NOriginalSource48RealComplexCoefficientAdapter
open FCP.BFSSP3M4W0C2AOriginalBivectorLieDefectTraceBridge
open FCP.BFSSP3M4W0C2B2OriginalSource48KLieDefectGammaCentralityR2

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev Mat := Matrix Source48Label Source48Label ℝ

theorem originalSource48K_skew_complex_gamma_covariance_consumer
    (A : Mat) (hA : A.transpose = -A) (k : Source48Label) :
    originalSource48BivectorK A * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48BivectorK A =
      ∑ p : Source48Label,
        (originalSource48_complexify A) p k • sourceNormalizedGamma p :=
  originalSource48K_skew_complex_gamma_covariance A hA k

theorem originalSource48K_skew_bracket_complex_gamma_covariance_consumer
    (A B : Mat) (hA : A.transpose = -A)
    (hB : B.transpose = -B) (k : Source48Label) :
    (originalSource48BivectorK A * originalSource48BivectorK B -
       originalSource48BivectorK B * originalSource48BivectorK A) *
         sourceNormalizedGamma k -
      sourceNormalizedGamma k *
        (originalSource48BivectorK A * originalSource48BivectorK B -
         originalSource48BivectorK B * originalSource48BivectorK A) =
      ∑ q : Source48Label,
        ((originalSource48_complexify A * originalSource48_complexify B -
          originalSource48_complexify B * originalSource48_complexify A) q k) •
          sourceNormalizedGamma q :=
  originalSource48K_skew_bracket_complex_gamma_covariance A B hA hB k

theorem originalSource48K_lieDefect_gamma_commutator_zero_consumer
    (A B : Mat) (hA : A.transpose = -A)
    (hB : B.transpose = -B) (k : Source48Label) :
    originalSource48K_lieDefect A B * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48K_lieDefect A B = 0 :=
  originalSource48K_lieDefect_gamma_commutator_zero A B hA hB k

theorem originalSource48K_lieDefect_gamma_central_consumer
    (A B : Mat) (hA : A.transpose = -A)
    (hB : B.transpose = -B) :
    ∀ k : Source48Label,
      Commute (originalSource48K_lieDefect A B) (sourceNormalizedGamma k) :=
  originalSource48K_lieDefect_gamma_central A B hA hB

-- Four independently checked original Fock/Source48 controls.
example (A : Mat) (hA : A.transpose = -A) (k : Source48Label) :
    originalSource48BivectorK A * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48BivectorK A =
      ∑ p : Source48Label,
        (originalSource48_complexify A) p k • sourceNormalizedGamma p :=
  originalSource48K_skew_complex_gamma_covariance_consumer A hA k

example (A B : Mat) (hA : A.transpose = -A)
    (hB : B.transpose = -B) (k : Source48Label) :
    (originalSource48BivectorK A * originalSource48BivectorK B -
       originalSource48BivectorK B * originalSource48BivectorK A) *
         sourceNormalizedGamma k -
      sourceNormalizedGamma k *
        (originalSource48BivectorK A * originalSource48BivectorK B -
         originalSource48BivectorK B * originalSource48BivectorK A) =
      ∑ q : Source48Label,
        ((originalSource48_complexify A * originalSource48_complexify B -
          originalSource48_complexify B * originalSource48_complexify A) q k) •
          sourceNormalizedGamma q :=
  originalSource48K_skew_bracket_complex_gamma_covariance_consumer A B hA hB k

example (A B : Mat) (hA : A.transpose = -A)
    (hB : B.transpose = -B) (k : Source48Label) :
    originalSource48K_lieDefect A B * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48K_lieDefect A B = 0 :=
  originalSource48K_lieDefect_gamma_commutator_zero_consumer A B hA hB k

example (A B : Mat) (hA : A.transpose = -A)
    (hB : B.transpose = -B) :
    ∀ k : Source48Label,
      Commute (originalSource48K_lieDefect A B) (sourceNormalizedGamma k) :=
  originalSource48K_lieDefect_gamma_central_consumer A B hA hB

#print axioms originalSource48K_skew_complex_gamma_covariance_consumer
#print axioms originalSource48K_skew_bracket_complex_gamma_covariance_consumer
#print axioms originalSource48K_lieDefect_gamma_commutator_zero_consumer
#print axioms originalSource48K_lieDefect_gamma_central_consumer

end
end FCP.BFSSP3M4W0C2B2OriginalSource48KLieDefectGammaCentralityIndependentConsumerR2
