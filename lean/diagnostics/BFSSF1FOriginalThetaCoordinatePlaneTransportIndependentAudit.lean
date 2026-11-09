import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FOriginalThetaCoordinatePlaneTransportBridgeDiagnostic

/-!
C1b independent consumer: exact F1E source plane, exact Source48Label,
genuine Fermion 2 continuous-linear operators, original ordered theta
family, and the real 1/2 coefficient.

The compact generic half-map plane statement is a DIAGNOSTIC ONLY;
this audit does not equate it to the old fully expanded production F1F
map, the concrete source map alias, or a physical Spin/Hamiltonian result.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FOriginalThetaCoordinatePlaneTransportIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open FCP.BFSSF1EOriginalThetaCoordinatePlane
open FCP.BFSSF1FAbstractCoefficient
open FCP.BFSSF1FOriginalThetaCompactCandidate
open FCP.BFSSF1FOriginalThetaCoordinatePlaneTransport

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

-- The first independent consumer checks the source plane matrix identity
-- without inviting a Fock-operator definitional equality.
example (p q : Source48Label) :
    originalSource48CoordinatePlane p q =
      Matrix.single p q (1 : ℝ) - Matrix.single q p (1 : ℝ) :=
  originalF1EPlane_eq_singleSub p q

-- The second consumer tests exactly the source-operator statement.
example (p q : Source48Label) :
    halfCoefficientLinearMap originalSourceThetaPairFamily
        (originalSource48CoordinatePlane p q) =
      (1 / 2 : ℝ) •
        (originalSourceThetaPairFamily p q -
          originalSourceThetaPairFamily q p) :=
  originalThetaFamily_halfMap_sourcePlane_transport p q

#print axioms FCP.BFSSF1FOriginalThetaCoordinatePlaneTransport.originalF1EPlane_eq_singleSub
#print axioms FCP.BFSSF1FOriginalThetaCoordinatePlaneTransport.originalThetaFamily_halfMap_sourcePlane_transport

end
end FCP.BFSSF1FOriginalThetaCoordinatePlaneTransportIndependentAudit
