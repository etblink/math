import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FAbstractCoefficientModuleDiagnostic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1EOriginalThetaCoordinatePlaneMatrixAction

/-!
# F1F B0 — original Fock operator / 48-label instance synthesis

Diagnostic only. Check the concrete typeclass synthesis and the
*partially specialized* generic theorem before forming any source
Majorana products or a full equality of expanded sums.

No new instances, axioms, proof limits, model substitutions or F1F
production changes.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FAbstractFockInstanceBoundary
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open FCP.BFSSF1FAbstractCoefficient

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

-- These are isolated queries, not new mathematical assertions.
#synth Fintype Source48Label
#synth AddCommMonoid FockOp
#synth Module ℝ FockOp

-- Is the generic theorem itself safely instantiable at the exact carrier,
-- before an explicit family, matrix argument, or the literal double sum?
#check (halfCoefficientLinearMap_apply_expanded (ι := Source48Label) (M := FockOp))

#eval IO.println "F1F_B0_ORIGINAL_FOCK_INSTANCES_AND_PARTIAL_SPECIALIZATION_COMPLETE"

end
end FCP.BFSSF1FAbstractFockInstanceBoundary
