import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FOriginalThetaCoordinatePlaneCompactBridgeDiagnostic

/-!
Independent source-carrier consumer of the original F1E skew-plane
specialization. The formula is only for the accepted named generic map
and source theta-product family, NOT an equality to the frozen literal
production F1F formula or a Spin/gauge/physical-spectrum claim.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FOriginalThetaCoordinatePlaneCompactBridgeIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open FCP.BFSSF1EOriginalThetaCoordinatePlane
open FCP.BFSSF1FAbstractCoefficient
open FCP.BFSSF1FOriginalThetaCompactCandidate
open FCP.BFSSF1FOriginalThetaCoordinatePlaneCompactBridge

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

example (p q : Source48Label) :
    halfCoefficientLinearMap originalSourceThetaPairFamily
        (originalSource48CoordinatePlane p q) =
      (1 / 2 : ℝ) •
        (originalSourceThetaPairFamily p q -
          originalSourceThetaPairFamily q p) :=
  originalThetaFamily_halfMap_sourcePlane p q

#print axioms FCP.BFSSF1FOriginalThetaCoordinatePlaneCompactBridge.originalThetaFamily_halfMap_sourcePlane

end
end FCP.BFSSF1FOriginalThetaCoordinatePlaneCompactBridgeIndependentAudit
