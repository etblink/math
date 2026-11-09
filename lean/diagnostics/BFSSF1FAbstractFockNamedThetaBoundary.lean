import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FAbstractCoefficientModuleDiagnostic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1EOriginalThetaCoordinatePlaneMatrixAction

/-!
F1F staged interface discriminant on the exact original 24-mode Fock operator
carrier, full Source48Label, and literal real half-normalization.
Diagnostic only: does not qualify production F1F.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FAbstractFockBoundary
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open FCP.BFSSF1FAbstractCoefficient
open scoped BigOperators

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2


/-- Name exactly the original source's unnormalized Majorana products. -/
private noncomputable def originalThetaProductFamily :
    Source48Label → Source48Label → FockOp :=
  fun p q => majoranaCandidate p * majoranaCandidate q

/-- First specialize while the product family remains a named definition. -/
theorem namedOriginalThetaFamily_apply_expanded
    (A : Matrix Source48Label Source48Label ℝ) :
    halfCoefficientLinearMap originalThetaProductFamily A =
      (1 / 2 : ℝ) •
        ∑ p : Source48Label, ∑ q : Source48Label,
          (A p q) • originalThetaProductFamily p q :=
  halfCoefficientLinearMap_apply_expanded originalThetaProductFamily A

/-- Next isolate whether passing the literal theta-product lambda itself fails. -/
theorem inlineOriginalThetaFamily_apply_expanded
    (A : Matrix Source48Label Source48Label ℝ) :
    halfCoefficientLinearMap
        (fun p q : Source48Label => majoranaCandidate p * majoranaCandidate q) A =
      (1 / 2 : ℝ) •
        ∑ p : Source48Label, ∑ q : Source48Label,
          (A p q) • (majoranaCandidate p * majoranaCandidate q) :=
  halfCoefficientLinearMap_apply_expanded
    (fun p q : Source48Label => majoranaCandidate p * majoranaCandidate q) A

#print axioms namedOriginalThetaFamily_apply_expanded
#print axioms inlineOriginalThetaFamily_apply_expanded

end
end FCP.BFSSF1FAbstractFockBoundary
