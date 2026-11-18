import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.ProbeW0C2B2E2OriginalTargetGammaAction

/-!
Independent original-Fock consumer of the E2 REAL source matrix commutator
target gamma-action theorem. Original Source48, true Fermion 2, literal K(A).
One theorem plus two independent applications, no defect subtraction or
Lie-bracket/centrality claim.
-/

set_option autoImplicit false

namespace FCP.BFSSW0C2B2E2OriginalTargetGammaActionConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4W0C2B0NOriginalSource48RealComplexCoefficientAdapter
open FCP.BFSSW0C2B2E2OriginalTargetGammaAction

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev Mat := Matrix Source48Label Source48Label ℝ

theorem originalSource48K_skew_target_complex_gamma_covariance_consumer
    (A B : Mat) (hA : A.transpose = -A)
    (hB : B.transpose = -B) (k : Source48Label) :
    originalSource48BivectorK (A * B - B * A) * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48BivectorK (A * B - B * A) =
      ∑ q : Source48Label,
        ((originalSource48_complexify A * originalSource48_complexify B -
          originalSource48_complexify B * originalSource48_complexify A) q k) •
          sourceNormalizedGamma q := by
  exact originalSource48K_skew_target_complex_gamma_covariance A B hA hB k

/-- Original K(A*B-B*A) and original gamma at any source label. -/
example (A B : Mat) (hA : A.transpose = -A)
    (hB : B.transpose = -B) (k : Source48Label) :
    originalSource48BivectorK (A * B - B * A) * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48BivectorK (A * B - B * A) =
      ∑ q : Source48Label,
        ((originalSource48_complexify A * originalSource48_complexify B -
          originalSource48_complexify B * originalSource48_complexify A) q k) •
          sourceNormalizedGamma q := by
  exact originalSource48K_skew_target_complex_gamma_covariance_consumer A B hA hB k

/-- Swapped source matrices remain on the original K target and true gamma. -/
example (A B : Mat) (hA : A.transpose = -A)
    (hB : B.transpose = -B) (k : Source48Label) :
    originalSource48BivectorK (B * A - A * B) * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48BivectorK (B * A - A * B) =
      ∑ q : Source48Label,
        ((originalSource48_complexify B * originalSource48_complexify A -
          originalSource48_complexify A * originalSource48_complexify B) q k) •
          sourceNormalizedGamma q := by
  exact originalSource48K_skew_target_complex_gamma_covariance_consumer B A hB hA k

#print axioms originalSource48K_skew_target_complex_gamma_covariance_consumer

end
end FCP.BFSSW0C2B2E2OriginalTargetGammaActionConsumer
