import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2B1OriginalFockJacobiCovarianceActionR2
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2B0NOriginalSource48RealComplexCoefficientAdapter
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2AOriginalBivectorLieDefectTraceBridge

/-!
# W0C2B2 R2 — exact original Source48 K Lie-defect all-gamma centrality

Real transpose-skew Source48 matrices, original normalized 48 Majoranas,
original skew bivector K(A) on the genuine Fermion 2 complex Fock operators.
The only algebra is accepted LB1C1 covariance + B0N real/complex transport +
B1 original Fock Jacobi conditional covariance + W0C2A skew commutator.
No replacement gamma, no representation change, no global Spin9 or physical
spectral claim. The separate unconditional K Lie-bracket closure remains B3.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0C2B2OriginalSource48KLieDefectGammaCentralityR2
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4LB1C1OriginalSource48SkewKMajoranaCovariance
open FCP.BFSSP3M4W0C2B0NOriginalSource48RealComplexCoefficientAdapter
open FCP.BFSSP3M4W0C2B1OriginalFockJacobiCovarianceActionR2
open FCP.BFSSP3M4W0C2AOriginalBivectorLieDefectTraceBridge

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev Mat := Matrix Source48Label Source48Label ℝ

/-- Small original Fock algebra commutator-subtraction identity. Keep P,Q,X
opaque so the kernel does not elaborate expanded Source48 K/gamma terms
during additive normalization. No operator products commute. -/
private theorem originalFock_commutator_sub (P Q X : Op) :
    (P - Q) * X - X * (P - Q) =
      (P * X - X * P) - (Q * X - X * Q) := by
  simp only [sub_mul, mul_sub]
  abel

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

/-- The *precise* W0C2A original K Lie defect commutes with every source
gamma in the commutator-zero formulation. This is a direct subtraction
of the two exact equal column actions, not a Clifford double-sum rewrite. -/
theorem originalSource48K_lieDefect_gamma_commutator_zero
    (A B : Mat) (hA : A.transpose = -A)
    (hB : B.transpose = -B) (k : Source48Label) :
    originalSource48K_lieDefect A B * sourceNormalizedGamma k -
      sourceNormalizedGamma k * originalSource48K_lieDefect A B = 0 := by
  have hbracket :
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
  have hC : (A * B - B * A).transpose = -(A * B - B * A) :=
    originalSource48_matrix_commutator_skew A B hA hB
  have htarget :
      originalSource48BivectorK (A * B - B * A) * sourceNormalizedGamma k -
        sourceNormalizedGamma k * originalSource48BivectorK (A * B - B * A) =
        ∑ q : Source48Label,
          ((originalSource48_complexify A * originalSource48_complexify B -
            originalSource48_complexify B * originalSource48_complexify A) q k) •
              sourceNormalizedGamma q := by
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
  calc
    _ =
      ((originalSource48BivectorK A * originalSource48BivectorK B -
        originalSource48BivectorK B * originalSource48BivectorK A) *
          sourceNormalizedGamma k -
        sourceNormalizedGamma k *
          (originalSource48BivectorK A * originalSource48BivectorK B -
           originalSource48BivectorK B * originalSource48BivectorK A)) -
      (originalSource48BivectorK (A * B - B * A) * sourceNormalizedGamma k -
        sourceNormalizedGamma k * originalSource48BivectorK (A * B - B * A)) := by
      exact originalFock_commutator_sub
        (originalSource48BivectorK A * originalSource48BivectorK B -
          originalSource48BivectorK B * originalSource48BivectorK A)
        (originalSource48BivectorK (A * B - B * A))
        (sourceNormalizedGamma k)
    _ = 0 := by rw [hbracket, htarget, sub_self]

/-- Previously open W0C2A source-exact all-48 original gamma centralizer
premise. Any unconditional full K bracket conclusion is a DIFFERENT
later proof gate, and is not asserted as a result of this file alone. -/
theorem originalSource48K_lieDefect_gamma_central
    (A B : Mat) (hA : A.transpose = -A)
    (hB : B.transpose = -B) :
    ∀ k : Source48Label,
      Commute (originalSource48K_lieDefect A B) (sourceNormalizedGamma k) := by
  intro k
  change originalSource48K_lieDefect A B * sourceNormalizedGamma k =
    sourceNormalizedGamma k * originalSource48K_lieDefect A B
  exact sub_eq_zero.mp
    (originalSource48K_lieDefect_gamma_commutator_zero A B hA hB k)

#print axioms originalSource48K_skew_complex_gamma_covariance
#print axioms originalSource48K_skew_bracket_complex_gamma_covariance
#print axioms originalSource48K_lieDefect_gamma_commutator_zero
#print axioms originalSource48K_lieDefect_gamma_central

end
end FCP.BFSSP3M4W0C2B2OriginalSource48KLieDefectGammaCentralityR2
