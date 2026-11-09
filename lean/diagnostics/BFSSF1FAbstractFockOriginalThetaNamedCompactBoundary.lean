import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FAbstractCoefficientModuleDiagnostic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1EOriginalThetaCoordinatePlaneMatrixAction

/-!
F1F B1b — original theta products at a compact source-Fock interface.

Exact source labels: Source48Label. Exact source Fock operator:
Fermion 2 →L[ℂ] Fermion 2. Exact original unnormalized ordered
theta products, with external real 1/2 normalization.

Unlike the rejected B1/B2/B3, do not expose nested Finset.sum,
and do not require a large source-to-literal-expression conversion.
This checks ONLY the genuine source family and the already accepted
generic named-sum map; it does not qualify production F1F.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FAbstractFockOriginalThetaCompact
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open FCP.BFSSF1FAbstractCoefficient

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

/-- Name the actual, ordered original Majorana product, with NO
normalization inserted in the product itself. -/
noncomputable def originalThetaPairFamily :
    Source48Label → Source48Label → FockOp :=
  fun p q => majoranaCandidate p * majoranaCandidate q

/-- The named family is exactly the original source product pointwise. -/
theorem originalThetaPairFamily_apply (p q : Source48Label) :
    originalThetaPairFamily p q =
      majoranaCandidate p * majoranaCandidate q := rfl

/-- Source-faithful family plugged into the compact original-Fock map.
No expanded double sum or alternative Fock representation is used. -/
theorem originalThetaPairFamily_compact
    (A : Matrix Source48Label Source48Label ℝ) :
    halfCoefficientLinearMap originalThetaPairFamily A =
      (1 / 2 : ℝ) • rawCoefficientSum originalThetaPairFamily A :=
  halfCoefficientLinearMap_apply
    (ι := Source48Label) (M := FockOp) originalThetaPairFamily A

#print axioms originalThetaPairFamily_apply
#print axioms originalThetaPairFamily_compact

end
end FCP.BFSSF1FAbstractFockOriginalThetaCompact
