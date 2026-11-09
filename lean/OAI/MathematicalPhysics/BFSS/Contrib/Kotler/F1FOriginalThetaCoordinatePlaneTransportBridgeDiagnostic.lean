import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FAbstractCoefficientMatrixUnitDiagnostic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FOriginalThetaCompactCoefficientLinearMapCandidate

/-!
F1F C1b — source-faithful F1E coordinate-plane TRANSPORT diagnostic.

The prior C1 gate #42645848109 reached recursion depth at
`change` while asking Lean to compare a named F1E plane and its
expanded matrix representation inside the concrete original-Fock
coefficient-map equality.

Do not reattempt that large definitional equality. Prove the SMALL
original matrix identity first, transport it through the exact source
real-linear map with `congrArg`, then compose the already accepted
ABSTRACT skew-plane theorem. The source theta family, order, index
carrier, real coefficient and external 1/2 are all unchanged.

This is a diagnostic. No equality to the frozen literal production F1F
definition or any Hamiltonian, Spin or spectral claim is asserted.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FOriginalThetaCoordinatePlaneTransport
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open FCP.BFSSF1EOriginalThetaCoordinatePlane
open FCP.BFSSF1FAbstractCoefficient
open FCP.BFSSF1FAbstractMatrixUnits
open FCP.BFSSF1FOriginalThetaCompactCandidate

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

/-- Pure matrix identity. Keep the genuine original F1E name, and
do not mention any Fock operators, `FiniteSum` or module instances. -/
theorem originalF1EPlane_eq_singleSub
    (p q : Source48Label) :
    originalSource48CoordinatePlane p q =
      Matrix.single p q (1 : ℝ) - Matrix.single q p (1 : ℝ) := rfl

-- The fully applied generic theorem is already well typed at the
-- exact carrier. This #check makes that fact visible as a separate
-- diagnostic instead of using it for large definitional conversion.
#check (fun (p q : Source48Label) =>
  halfCoefficientLinearMap_skewPlane (ι := Source48Label) (M := FockOp)
    originalSourceThetaPairFamily p q)

/-- Transport only the small source-plane identity through the
original-Fock generic coefficient map; then use the abstract plane
formula. No `change`, `simpa`, or fully unfolded finite sum. -/
theorem originalThetaFamily_halfMap_sourcePlane_transport
    (p q : Source48Label) :
    halfCoefficientLinearMap originalSourceThetaPairFamily
        (originalSource48CoordinatePlane p q) =
      (1 / 2 : ℝ) •
        (originalSourceThetaPairFamily p q -
          originalSourceThetaPairFamily q p) := by
  calc
    halfCoefficientLinearMap originalSourceThetaPairFamily
        (originalSource48CoordinatePlane p q) =
        halfCoefficientLinearMap originalSourceThetaPairFamily
          (Matrix.single p q (1 : ℝ) - Matrix.single q p (1 : ℝ)) :=
      congrArg
        (fun A : Matrix Source48Label Source48Label ℝ =>
          halfCoefficientLinearMap originalSourceThetaPairFamily A)
        (originalF1EPlane_eq_singleSub p q)
    _ = (1 / 2 : ℝ) •
          (originalSourceThetaPairFamily p q -
            originalSourceThetaPairFamily q p) :=
      halfCoefficientLinearMap_skewPlane (ι := Source48Label)
        (M := FockOp) originalSourceThetaPairFamily p q

#print axioms originalF1EPlane_eq_singleSub
#print axioms originalThetaFamily_halfMap_sourcePlane_transport

end
end FCP.BFSSF1FOriginalThetaCoordinatePlaneTransport
