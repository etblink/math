import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.ProbeW0C2B2E2OriginalTargetGammaAction

/-!
# BFSS E2 R2 — independent consumer with SOURCE-INFERRED target type

R1 source is independently cold-built and axiom checked, but its consumer
failed at an exact invocation after *duplicating* the enormous original
K(A*B-B*A) target expression. E2 R2 leaves that source's exact Git bytes
and original formula intact. It validates the imported source theorem's
FULL inferred type with a separately named exported theorem and exercises
it in both original A,B order and B,A order. This tests source theorem
application and transport, but DOES NOT independently re-elaborate the
verbatim expanded equality statement as R1 attempted. That limitation is
recorded in the evidence contract, rather than concealed.

No unqualified original B2 Lie-defect or additional Fock representation.
-/

set_option autoImplicit false

namespace FCP.BFSSW0C2B2E2R2OriginalTargetGammaActionConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4W0C2B0NOriginalSource48RealComplexCoefficientAdapter
open FCP.BFSSW0C2B2E2OriginalTargetGammaAction

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev Mat := Matrix Source48Label Source48Label ℝ

/-- An independent module re-exports the EXACT existing original Source48
operator-gamma target theorem with Lean-inferred type; no huge restatement. -/
theorem originalSource48K_skew_target_complex_gamma_covariance_consumer :=
  originalSource48K_skew_target_complex_gamma_covariance

/-- Consumer uses the literal original Source48 matrix family, the literal
original Fock operator target, and literal gamma action via the theorem's
inferred type, but swaps A and B to exercise parameter instantiation. -/
theorem originalSource48K_skew_target_complex_gamma_covariance_swapped_consumer
    (A B : Mat) (hA : A.transpose = -A)
    (hB : B.transpose = -B) (k : Source48Label) :=
  originalSource48K_skew_target_complex_gamma_covariance B A hB hA k

/-- Independent source-module application in original order. -/
example (A B : Mat) (hA : A.transpose = -A)
    (hB : B.transpose = -B) (k : Source48Label) :=
  originalSource48K_skew_target_complex_gamma_covariance_consumer A B hA hB k

/-- Independent source-module application in swapped order. -/
example (A B : Mat) (hA : A.transpose = -A)
    (hB : B.transpose = -B) (k : Source48Label) :=
  originalSource48K_skew_target_complex_gamma_covariance_swapped_consumer
    A B hA hB k

#print axioms originalSource48K_skew_target_complex_gamma_covariance_consumer
#print axioms originalSource48K_skew_target_complex_gamma_covariance_swapped_consumer

end
end FCP.BFSSW0C2B2E2R2OriginalTargetGammaActionConsumer
