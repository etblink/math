import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FOriginalThetaCompactCoefficientLinearMapCandidate

/-!
Independent exact-type consumer for the source-faithful compact F1F candidate.
Tests the genuine original Fermion 2 carrier, Source48Label, factor 1/2,
original ordered theta products and original F1E coordinate-plane inputs.
It deliberately DOES NOT identify the new named-sum map with the old
production module's fully expanded finite sum.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FOriginalThetaCompactIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open FCP.BFSSF1EOriginalThetaCoordinatePlane
open FCP.BFSSF1FAbstractCoefficient
open FCP.BFSSF1FOriginalThetaCompactCandidate

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

example (p q : Source48Label) :
    originalSourceThetaPairFamily p q =
      majoranaCandidate p * majoranaCandidate q :=
  originalSourceThetaPairFamily_apply p q

example :
    Matrix Source48Label Source48Label ℝ →ₗ[ℝ] FockOp :=
  originalSourceThetaCompactCoefficientLinearMap

-- Check a well-typed application to the genuine original F1E source
-- coordinate plane, without asserting an unaccepted map-evaluation identity.
example (p q : Source48Label) : FockOp :=
  originalSourceThetaCompactCoefficientLinearMap
    (originalSource48CoordinatePlane p q)

#print axioms originalSourceThetaPairFamily
#print axioms originalSourceThetaPairFamily_apply
#print axioms originalSourceThetaCompactCoefficientLinearMap

end
end FCP.BFSSF1FOriginalThetaCompactIndependentAudit
