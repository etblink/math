import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1EOriginalThetaCoordinatePlaneMatrixAction

/-! Independent typed check on literal Source48-label real matrices and
the same original 24-mode Fermion 2 Hilbert operators. -/

set_option autoImplicit false

namespace FCP.BFSSF1EOriginalThetaCoordinatePlaneIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open FCP.BFSSF1EOriginalThetaCoordinatePlane

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

example (p q : Source48Label) :
    (originalSource48CoordinatePlane p q).transpose =
      -(originalSource48CoordinatePlane p q) :=
  originalSource48CoordinatePlane_transpose p q

example (p q r : Source48Label) (hpq : p ≠ q) :
    (majoranaCandidate p * majoranaCandidate q) * majoranaCandidate r -
      majoranaCandidate r * (majoranaCandidate p * majoranaCandidate q) =
      ((originalSource48CoordinatePlane p q) p r) • majoranaCandidate p +
      ((originalSource48CoordinatePlane p q) q r) • majoranaCandidate q :=
  originalThetaBivector_comm_coordinatePlane p q r hpq

#print axioms FCP.BFSSF1EOriginalThetaCoordinatePlane.originalSource48CoordinatePlane_transpose
#print axioms FCP.BFSSF1EOriginalThetaCoordinatePlane.originalThetaBivector_comm_coordinatePlane

end
end FCP.BFSSF1EOriginalThetaCoordinatePlaneIndependentAudit
