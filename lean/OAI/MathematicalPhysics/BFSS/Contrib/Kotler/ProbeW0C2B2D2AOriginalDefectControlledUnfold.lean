import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2AOriginalBivectorLieDefectTraceBridge

/-!
# BFSS W0C2B2 D2A — controlled original W0C2A source-defect unfolding

One source-equation microgate, deliberately separated from gamma covariance,
commutator-subtraction, all-48 centrality, and K Lie bracket.
Directly reuse the EXACT qualified W0C2A proof tactic, explicit unfold, rather
than D1's failed bare reflexivity on two additional named source definitions.

No new definition, no alternate K representation, no proof resource increase.
The genuine 48-label real matrix and Fermion 2 complex Fock operator remain.
-/

set_option autoImplicit false

namespace FCP.BFSSW0C2B2D2AOriginalDefectControlledUnfold
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4W0C2AOriginalBivectorLieDefectTraceBridge

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev Mat := Matrix Source48Label Source48Label ℝ

/-- The literal original W0C2A defect equation, proved by the same
controlled explicit unfold that was already qualified in the W0C2A trace
proof. This is a definition certificate, not a centrality identity. -/
theorem originalSource48K_lieDefect_unfoldD2A (A B : Mat) :
    originalSource48K_lieDefect A B =
      (originalSource48BivectorK A * originalSource48BivectorK B -
        originalSource48BivectorK B * originalSource48BivectorK A) -
        originalSource48BivectorK (A * B - B * A) := by
  unfold originalSource48K_lieDefect
  exact Eq.refl _

#print axioms originalSource48K_lieDefect_unfoldD2A

end
end FCP.BFSSW0C2B2D2AOriginalDefectControlledUnfold
