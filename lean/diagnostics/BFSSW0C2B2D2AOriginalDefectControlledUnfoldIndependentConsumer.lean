import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.ProbeW0C2B2D2AOriginalDefectControlledUnfold

/-!
Independent consumer of the exact original W0C2A defect equation. Separately
tests congruence under left and right multiplication by the original
normalized source Majorana. Neither context identity proves commutation.
-/

set_option autoImplicit false

namespace FCP.BFSSW0C2B2D2AOriginalDefectControlledUnfoldConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4W0C2AOriginalBivectorLieDefectTraceBridge
open FCP.BFSSW0C2B2D2AOriginalDefectControlledUnfold

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev Mat := Matrix Source48Label Source48Label ℝ

theorem originalSource48K_lieDefect_unfoldD2A_consumer (A B : Mat) :
    originalSource48K_lieDefect A B =
      (originalSource48BivectorK A * originalSource48BivectorK B -
        originalSource48BivectorK B * originalSource48BivectorK A) -
        originalSource48BivectorK (A * B - B * A) :=
  originalSource48K_lieDefect_unfoldD2A A B

/-- Original-gamma right multiplication transports the same exact source
defect equality; does not prove the two sides of a commutator are equal. -/
theorem originalSource48K_lieDefect_unfold_right_gammaD2A
    (A B : Mat) (k : Source48Label) :
    originalSource48K_lieDefect A B * sourceNormalizedGamma k =
      ((originalSource48BivectorK A * originalSource48BivectorK B -
        originalSource48BivectorK B * originalSource48BivectorK A) -
        originalSource48BivectorK (A * B - B * A)) * sourceNormalizedGamma k := by
  exact congrArg (fun (T : Op) => T * sourceNormalizedGamma k)
    (originalSource48K_lieDefect_unfoldD2A A B)

/-- Original-gamma left multiplication transports the same source equality.
Still only congruence, not centrality or unconditional bracket closure. -/
theorem originalSource48K_lieDefect_unfold_left_gammaD2A
    (A B : Mat) (k : Source48Label) :
    sourceNormalizedGamma k * originalSource48K_lieDefect A B =
      sourceNormalizedGamma k *
        ((originalSource48BivectorK A * originalSource48BivectorK B -
          originalSource48BivectorK B * originalSource48BivectorK A) -
          originalSource48BivectorK (A * B - B * A)) := by
  exact congrArg (fun (T : Op) => sourceNormalizedGamma k * T)
    (originalSource48K_lieDefect_unfoldD2A A B)

#print axioms originalSource48K_lieDefect_unfoldD2A_consumer
#print axioms originalSource48K_lieDefect_unfold_right_gammaD2A
#print axioms originalSource48K_lieDefect_unfold_left_gammaD2A

end
end FCP.BFSSW0C2B2D2AOriginalDefectControlledUnfoldConsumer
