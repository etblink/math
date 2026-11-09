import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1EOriginalThetaCoordinatePlaneMatrixAction

/-!
F1F source-matrix-only identity extracted from C1b red run
#42648725215. Keep exact original F1E Source48Label and real matrix
input. This file does not state an operator-valued equality and does
not import the failed Fock-plane bridge module.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FOriginalSourcePlaneMatrixIdentity
noncomputable section

open FCP.BFSSS1V0
open FCP.BFSSF1EOriginalThetaCoordinatePlane

/-- The accepted F1E source plane has precisely the skew matrix-unit
entries, before applying any Fock operator or coefficient map. -/
theorem originalSourcePlane_eq_skewSingles (p q : Source48Label) :
    originalSource48CoordinatePlane p q =
      Matrix.single p q (1 : ℝ) - Matrix.single q p (1 : ℝ) := rfl

#print axioms originalSourcePlane_eq_skewSingles

end
end FCP.BFSSF1FOriginalSourcePlaneMatrixIdentity
