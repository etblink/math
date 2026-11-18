import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C1OriginalCommutatorTraceWitnessR2
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4CT0OriginalSkewBivectorTrace
import Mathlib.Tactic

/-!
# W0C2A — original skew bivector Lie-defect trace and centralizer reduction

Source-exact ORIGINAL Fermion 2 Fock operators and Source48Label Majoranas.
This stage reduces the full [K(A),K(B)] = K(AB-BA) claim to the
unproved condition that its defect commutes with each original gamma.
It DOES NOT prove that condition. No physical Spin9 or spectral claims.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0C2AOriginalBivectorLieDefectTraceBridge
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSST1OriginalFockTraceInvariance
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4CT0OriginalSkewBivectorTrace
open FCP.BFSSP3M4W0C1OriginalCommutatorTraceWitnessR2

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev Mat := Matrix Source48Label Source48Label ℝ

/-- The precise defect, with actual original K(A) and the ordinary
real source48 matrix commutator, not a substitute representation. -/
noncomputable def originalSource48K_lieDefect (A B : Mat) : Op :=
  (originalSource48BivectorK A * originalSource48BivectorK B -
    originalSource48BivectorK B * originalSource48BivectorK A) -
    originalSource48BivectorK (A * B - B * A)

/-- The real source48 matrix commutator remains transpose-skew. -/
theorem originalSource48_matrix_commutator_skew
    (A B : Mat) (hA : A.transpose = -A) (hB : B.transpose = -B) :
    (A * B - B * A).transpose = -(A * B - B * A) := by
  rw [Matrix.transpose_sub, Matrix.transpose_mul, Matrix.transpose_mul,
    hA, hB]
  simp only [neg_mul_neg]
  abel

/-- The exact original Fock trace eliminates the scalar part of the
bivector bracket defect. This does NOT establish gamma centrality. -/
theorem originalSource48K_lieDefect_trace_zero
    (A B : Mat) (hA : A.transpose = -A) (hB : B.transpose = -B) :
    originalFockTrace (originalSource48K_lieDefect A B) = 0 := by
  have hcyc :
      originalFockTrace (originalSource48BivectorK A *
        originalSource48BivectorK B) =
      originalFockTrace (originalSource48BivectorK B *
        originalSource48BivectorK A) :=
    originalFockTrace_mul_comm _ _
  have htarget :
      originalFockTrace (originalSource48BivectorK (A * B - B * A)) = 0 :=
    originalSource48BivectorK_skew_trace_zero (A * B - B * A)
      (originalSource48_matrix_commutator_skew A B hA hB)
  unfold originalSource48K_lieDefect
  rw [map_sub, map_sub, hcyc, sub_self, htarget]
  simp

/-- Source-exact conditional Lie bracket: if the original defect
commutes with all 48 genuine gamma operators, then W0C1's qualified
zero-kernel theorem and CT0 trace force the original bracket identity.
The gamma-centralizer premise is the open W0C2B obligation. -/
theorem originalSource48K_lieBracket_of_defect_central
    (A B : Mat) (hA : A.transpose = -A) (hB : B.transpose = -B)
    (hcentral : ∀ k : Source48Label,
      Commute (originalSource48K_lieDefect A B) (sourceNormalizedGamma k)) :
    originalSource48BivectorK A * originalSource48BivectorK B -
      originalSource48BivectorK B * originalSource48BivectorK A =
      originalSource48BivectorK (A * B - B * A) := by
  have hzero : originalSource48K_lieDefect A B = 0 :=
    originalFockWitness_kernel_zero (originalSource48K_lieDefect A B)
      hcentral (originalSource48K_lieDefect_trace_zero A B hA hB)
  exact sub_eq_zero.mp hzero

#print axioms originalSource48_matrix_commutator_skew
#print axioms originalSource48K_lieDefect_trace_zero
#print axioms originalSource48K_lieBracket_of_defect_central

end
end FCP.BFSSP3M4W0C2AOriginalBivectorLieDefectTraceBridge
