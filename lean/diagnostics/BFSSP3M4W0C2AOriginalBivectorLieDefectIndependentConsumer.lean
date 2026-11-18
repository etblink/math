import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2AOriginalBivectorLieDefectTraceBridge

/-!
# W0C2A — independent original Fock Lie-defect bridge consumer
No source substitutes; conditional gamma-centralizer premise retained.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0C2AOriginalBivectorLieDefectIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSST1OriginalFockTraceInvariance
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4W0C2AOriginalBivectorLieDefectTraceBridge

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev Mat := Matrix Source48Label Source48Label ℝ

theorem originalSource48_matrix_commutator_skew_consumer
    (A B : Mat) (hA : A.transpose = -A) (hB : B.transpose = -B) :
    (A * B - B * A).transpose = -(A * B - B * A) :=
  originalSource48_matrix_commutator_skew A B hA hB

theorem originalSource48K_lieDefect_trace_zero_consumer
    (A B : Mat) (hA : A.transpose = -A) (hB : B.transpose = -B) :
    originalFockTrace (originalSource48K_lieDefect A B) = 0 :=
  originalSource48K_lieDefect_trace_zero A B hA hB

theorem originalSource48K_lieBracket_of_defect_central_consumer
    (A B : Mat) (hA : A.transpose = -A) (hB : B.transpose = -B)
    (hcentral : ∀ k : Source48Label,
      Commute (originalSource48K_lieDefect A B) (sourceNormalizedGamma k)) :
    originalSource48BivectorK A * originalSource48BivectorK B -
      originalSource48BivectorK B * originalSource48BivectorK A =
      originalSource48BivectorK (A * B - B * A) :=
  originalSource48K_lieBracket_of_defect_central A B hA hB hcentral

-- Control 1: actual source48 matrix skewness under genuine hypotheses.
example (A B : Mat) (hA : A.transpose = -A)
    (hB : B.transpose = -B) :
    (A * B - B * A).transpose = -(A * B - B * A) :=
  originalSource48_matrix_commutator_skew_consumer A B hA hB

-- Control 2: original Fermion 2 trace vanishes on the true source defect.
example (A B : Mat) (hA : A.transpose = -A)
    (hB : B.transpose = -B) :
    originalFockTrace (originalSource48K_lieDefect A B) = 0 :=
  originalSource48K_lieDefect_trace_zero_consumer A B hA hB

-- Control 3: explicit original Source48Label gamma centrality remains
-- a premise; no unconditional source Lie-bracket theorem is claimed.
example (A B : Mat) (hA : A.transpose = -A)
    (hB : B.transpose = -B)
    (hcentral : ∀ k : Source48Label,
      Commute (originalSource48K_lieDefect A B) (sourceNormalizedGamma k)) :
    originalSource48BivectorK A * originalSource48BivectorK B -
      originalSource48BivectorK B * originalSource48BivectorK A =
      originalSource48BivectorK (A * B - B * A) :=
  originalSource48K_lieBracket_of_defect_central_consumer A B hA hB hcentral

#print axioms originalSource48_matrix_commutator_skew_consumer
#print axioms originalSource48K_lieDefect_trace_zero_consumer
#print axioms originalSource48K_lieBracket_of_defect_central_consumer

end
end FCP.BFSSP3M4W0C2AOriginalBivectorLieDefectIndependentConsumer
