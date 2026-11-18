import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.ProbeW0C2B2E1OriginalSkewBracketGammaAction

/-!
Independent original-source consumer for E1:
actual 48-label sourceNormalizedGamma and literal skew-matrix Fock
bivector K(A) actions. No W0C2A defect definition or centrality claim.
-/

set_option autoImplicit false

namespace FCP.BFSSW0C2B2E1OriginalSkewBracketGammaActionConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4W0C2B0NOriginalSource48RealComplexCoefficientAdapter
open FCP.BFSSW0C2B2E1OriginalSkewBracketGammaAction

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev Mat := Matrix Source48Label Source48Label ℝ

theorem originalSource48K_skew_complex_gamma_covariance_consumer
    (A : Mat) (hA : A.transpose = -A) (k : Source48Label) :
    originalSource48BivectorK A * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48BivectorK A =
      ∑ p : Source48Label,
        (originalSource48_complexify A) p k • sourceNormalizedGamma p := by
  exact originalSource48K_skew_complex_gamma_covariance A hA k

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
          sourceNormalizedGamma q := by
  exact originalSource48K_skew_bracket_complex_gamma_covariance A B hA hB k

example
    (A : Mat) (hA : A.transpose = -A) (k : Source48Label) :
    originalSource48BivectorK A * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48BivectorK A =
      ∑ p : Source48Label,
        (originalSource48_complexify A) p k • sourceNormalizedGamma p := by
  exact originalSource48K_skew_complex_gamma_covariance A hA k

example
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
          sourceNormalizedGamma q := by
  exact originalSource48K_skew_bracket_complex_gamma_covariance A B hA hB k

#print axioms originalSource48K_skew_complex_gamma_covariance_consumer
#print axioms originalSource48K_skew_bracket_complex_gamma_covariance_consumer

end
end FCP.BFSSW0C2B2E1OriginalSkewBracketGammaActionConsumer
