import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2B1OriginalFockJacobiCovarianceActionR2
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2B0NOriginalSource48RealComplexCoefficientAdapter

/-!
# BFSS W0C2B2 E1 — original source48 skew-bivector bracket gamma ACTION

Separately qualify the FIRST TWO previously source-clean roots of the
STOPPED B2 R2 file, without importing the unqualified file or attempting
the concrete Lie-defect subtraction, its definitional equality, or centrality.

The source is the genuine 48-label original normalized Majorana family and
the physical Fermion 2 bounded Fock operators K(A). Real transpose-skew
Source48 matrices and exact qualified B1/B0N/LB1C1 lemmas only.
The target K(AB-BA) action is a distinct later gate; not established here.
-/

set_option autoImplicit false

namespace FCP.BFSSW0C2B2E1OriginalSkewBracketGammaAction
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4LB1C1OriginalSource48SkewKMajoranaCovariance
open FCP.BFSSP3M4W0C2B0NOriginalSource48RealComplexCoefficientAdapter
open FCP.BFSSP3M4W0C2B1OriginalFockJacobiCovarianceActionR2

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev Mat := Matrix Source48Label Source48Label ℝ

/-- Original skew K(A) gamma covariance with original source real entries
lifted termwise to the true complex Fock operator carrier. -/
theorem originalSource48K_skew_complex_gamma_covariance
    (A : Mat) (hA : A.transpose = -A) (k : Source48Label) :
    originalSource48BivectorK A * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48BivectorK A =
      ∑ p : Source48Label,
        (originalSource48_complexify A) p k • sourceNormalizedGamma p := by
  calc
    _ = ∑ p : Source48Label,
          (A p k : ℝ) • sourceNormalizedGamma p :=
      originalSource48BivectorK_skew_commutator_gamma_of_transpose A hA k
    _ = ∑ p : Source48Label,
          (originalSource48_complexify A) p k • sourceNormalizedGamma p :=
      originalSource48Fock_real_column_to_complex A sourceNormalizedGamma k

/-- The commutator of two genuine original skew K(A) generators acts on
each of the 48 original gamma operators through the complexified real
source-matrix commutator. This uses the already qualified generic B1
conditional covariance theorem with BOTH genuine source hypotheses. -/
theorem originalSource48K_skew_bracket_complex_gamma_covariance
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
  have hK_A : ∀ j : Source48Label,
      originalSource48BivectorK A * sourceNormalizedGamma j -
        sourceNormalizedGamma j * originalSource48BivectorK A =
      ∑ p : Source48Label,
        (originalSource48_complexify A) p j • sourceNormalizedGamma p :=
    originalSource48K_skew_complex_gamma_covariance A hA
  have hK_B : ∀ j : Source48Label,
      originalSource48BivectorK B * sourceNormalizedGamma j -
        sourceNormalizedGamma j * originalSource48BivectorK B =
      ∑ p : Source48Label,
        (originalSource48_complexify B) p j • sourceNormalizedGamma p :=
    originalSource48K_skew_complex_gamma_covariance B hB
  exact originalFock_commutator_covariance_bracket
    (originalSource48BivectorK A) (originalSource48BivectorK B)
    sourceNormalizedGamma
    (originalSource48_complexify A) (originalSource48_complexify B)
    hK_A hK_B k

#print axioms originalSource48K_skew_complex_gamma_covariance
#print axioms originalSource48K_skew_bracket_complex_gamma_covariance

end
end FCP.BFSSW0C2B2E1OriginalSkewBracketGammaAction
