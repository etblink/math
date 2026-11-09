import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FAbstractCoefficientMatrixUnitDiagnostic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FOriginalThetaCompactCoefficientLinearMapCandidate

/-!
F1F original Fock coordinate-plane specialization — bounded candidate.

Source-faithful inputs: true Source48Label, actual original Fermion 2
continuous-linear operators, ordered unnormalized Majorana products,
and the F1E source's exact elementary skew plane E_pq - E_qp.

This diagnostic applies the accepted symbolic matrix-plane theorem
without rewriting any 48-by-48 double finite sum or claiming equality
with the frozen literal production F1F map. Its success or failure must
be established by cold strict CI and independent consumer.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FOriginalThetaCoordinatePlaneCompactBridge
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open FCP.BFSSF1EOriginalThetaCoordinatePlane
open FCP.BFSSF1FAbstractCoefficient
open FCP.BFSSF1FAbstractMatrixUnits
open FCP.BFSSF1FOriginalThetaCompactCandidate

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

-- First inspect the fully specialized accepted theorem without
-- restating a concrete Fock-operator equality.
#check (halfCoefficientLinearMap_skewPlane
  (ι := Source48Label) (M := FockOp) originalSourceThetaPairFamily)

/-- Concrete specialization only for the genuine original F1E skew plane.
The expression deliberately uses the generic named LinearMap, not the
repeated concrete map alias or an expanded original 48^2 sum. -/
theorem originalThetaFamily_halfMap_sourcePlane
    (p q : Source48Label) :
    halfCoefficientLinearMap originalSourceThetaPairFamily
        (originalSource48CoordinatePlane p q) =
      (1 / 2 : ℝ) •
        (originalSourceThetaPairFamily p q -
          originalSourceThetaPairFamily q p) := by
  change halfCoefficientLinearMap originalSourceThetaPairFamily
      (Matrix.single p q (1 : ℝ) - Matrix.single q p (1 : ℝ)) =
      (1 / 2 : ℝ) •
        (originalSourceThetaPairFamily p q -
          originalSourceThetaPairFamily q p)
  exact halfCoefficientLinearMap_skewPlane originalSourceThetaPairFamily p q

#print axioms originalThetaFamily_halfMap_sourcePlane

end
end FCP.BFSSF1FOriginalThetaCoordinatePlaneCompactBridge
