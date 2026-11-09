import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FOriginalSourcePlaneMatrixIdentityDiagnostic

/-!
Independent exact-source real-matrix consumer. Neither proof nor
statement invokes original Fock operator equality, the old literal
production F1F source, or the blocked C1/C1b concrete transports.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FOriginalSourcePlaneMatrixIdentityIndependentAudit
noncomputable section

open FCP.BFSSS1V0
open FCP.BFSSF1EOriginalThetaCoordinatePlane
open FCP.BFSSF1FOriginalSourcePlaneMatrixIdentity

example (p q : Source48Label) :
    originalSource48CoordinatePlane p q =
      Matrix.single p q (1 : ℝ) - Matrix.single q p (1 : ℝ) :=
  originalSourcePlane_eq_skewSingles p q

#print axioms FCP.BFSSF1FOriginalSourcePlaneMatrixIdentity.originalSourcePlane_eq_skewSingles

end
end FCP.BFSSF1FOriginalSourcePlaneMatrixIdentityIndependentAudit
