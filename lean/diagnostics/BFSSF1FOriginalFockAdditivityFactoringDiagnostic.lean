import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1EOriginalThetaCoordinatePlaneMatrixAction
import Mathlib.Algebra.Module.BigOperators

/-!
Exploratory exact-original-Fock diagnostic after F1F final assembly reaches the
recursion limit. No budget override. Test opaque proof cuts separately before
another full F1F retry. This module does not qualify the production LinearMap.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FOriginalFockAdditivityFactoringDiagnostic
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open scoped BigOperators

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

/-- Same literal formula as production, duplicated only because production F1F does not compile. -/
private noncomputable def literalOriginalLift
    (A : Matrix Source48Label Source48Label ℝ) : FockOp :=
  (1 / 2 : ℝ) •
    ∑ p : Source48Label, ∑ q : Source48Label,
      (A p q) • (majoranaCandidate p * majoranaCandidate q)

/-- First cut: exact real one-half distribution on the actual original Fock operators. -/
theorem originalFock_half_smul_add (X Y : FockOp) :
    (1 / 2 : ℝ) • (X + Y) = (1 / 2 : ℝ) • X + (1 / 2 : ℝ) • Y :=
  smul_add (1 / 2 : ℝ) X Y

#print axioms FCP.BFSSF1FOriginalFockAdditivityFactoringDiagnostic.originalFock_half_smul_add
#eval IO.println "F1F_FACTORING_SCALAR_COMPLETE"

/-- Second cut: symbolic unscaled double sum, with the exact original source labels and operators. -/
theorem originalSource48_doubleSum_add
    (A B : Matrix Source48Label Source48Label ℝ) :
    (∑ p : Source48Label, ∑ q : Source48Label,
      ((A + B) p q) • (majoranaCandidate p * majoranaCandidate q)) =
      (∑ p : Source48Label, ∑ q : Source48Label,
        (A p q) • (majoranaCandidate p * majoranaCandidate q)) +
      (∑ p : Source48Label, ∑ q : Source48Label,
        (B p q) • (majoranaCandidate p * majoranaCandidate q)) := by
  have hentry (p q : Source48Label) :
      ((A + B) p q) • (majoranaCandidate p * majoranaCandidate q) =
        (A p q) • (majoranaCandidate p * majoranaCandidate q) +
          (B p q) • (majoranaCandidate p * majoranaCandidate q) :=
    (congrArg (fun a : ℝ => a • (majoranaCandidate p * majoranaCandidate q))
      (show (A + B) p q = A p q + B p q from rfl)).trans
      (add_smul (A p q) (B p q) (majoranaCandidate p * majoranaCandidate q))
  have hrow (p : Source48Label) :
      (∑ q : Source48Label, ((A + B) p q) • (majoranaCandidate p * majoranaCandidate q)) =
        (∑ q : Source48Label, (A p q) • (majoranaCandidate p * majoranaCandidate q)) +
          (∑ q : Source48Label, (B p q) • (majoranaCandidate p * majoranaCandidate q)) :=
    (Finset.sum_congr rfl (fun q _ => hentry p q)).trans Finset.sum_add_distrib
  have hsum :
      (∑ p : Source48Label, ∑ q : Source48Label,
        ((A + B) p q) • (majoranaCandidate p * majoranaCandidate q)) =
        (∑ p : Source48Label, ∑ q : Source48Label,
          (A p q) • (majoranaCandidate p * majoranaCandidate q)) +
        (∑ p : Source48Label, ∑ q : Source48Label,
          (B p q) • (majoranaCandidate p * majoranaCandidate q)) :=
    (Finset.sum_congr rfl (fun p _ => hrow p)).trans Finset.sum_add_distrib
  exact hsum

#print axioms FCP.BFSSF1FOriginalFockAdditivityFactoringDiagnostic.originalSource48_doubleSum_add
#eval IO.println "F1F_FACTORING_DOUBLE_SUM_COMPLETE"

/-- A typed name for precisely the existing unscaled original-operator sum. -/
private noncomputable def originalSource48RawSum
    (A : Matrix Source48Label Source48Label ℝ) : FockOp :=
  ∑ p : Source48Label, ∑ q : Source48Label,
    (A p q) • (majoranaCandidate p * majoranaCandidate q)

private theorem originalSource48RawSum_add
    (A B : Matrix Source48Label Source48Label ℝ) :
    originalSource48RawSum (A + B) = originalSource48RawSum A + originalSource48RawSum B :=
  originalSource48_doubleSum_add A B

private theorem originalSource48RawSum_half_add
    (A B : Matrix Source48Label Source48Label ℝ) :
    (1 / 2 : ℝ) • originalSource48RawSum (A + B) =
      (1 / 2 : ℝ) • originalSource48RawSum A + (1 / 2 : ℝ) • originalSource48RawSum B :=
  (congrArg (fun T : FockOp => (1 / 2 : ℝ) • T) (originalSource48RawSum_add A B)).trans
    (originalFock_half_smul_add (originalSource48RawSum A) (originalSource48RawSum B))

/-- Third cut: combine the two separately checked opaque identities at the unchanged limits. -/
theorem originalSource48_half_doubleSum_add
    (A B : Matrix Source48Label Source48Label ℝ) :
    (1 / 2 : ℝ) • (∑ p : Source48Label, ∑ q : Source48Label,
      ((A + B) p q) • (majoranaCandidate p * majoranaCandidate q)) =
      (1 / 2 : ℝ) • (∑ p : Source48Label, ∑ q : Source48Label,
        (A p q) • (majoranaCandidate p * majoranaCandidate q)) +
      (1 / 2 : ℝ) • (∑ p : Source48Label, ∑ q : Source48Label,
        (B p q) • (majoranaCandidate p * majoranaCandidate q)) := by
  calc
    (1 / 2 : ℝ) • (∑ p : Source48Label, ∑ q : Source48Label,
        ((A + B) p q) • (majoranaCandidate p * majoranaCandidate q)) =
        (1 / 2 : ℝ) • originalSource48RawSum (A + B) := rfl
    _ = (1 / 2 : ℝ) • originalSource48RawSum A + (1 / 2 : ℝ) • originalSource48RawSum B :=
      originalSource48RawSum_half_add A B
    _ = _ := rfl

#print axioms FCP.BFSSF1FOriginalFockAdditivityFactoringDiagnostic.originalSource48_half_doubleSum_add
#eval IO.println "F1F_FACTORING_SCALED_SUM_COMPLETE"

/-- Fourth cut: the literal production formula's folding boundary, still without a LinearMap. -/
theorem literalOriginalLift_add (A B : Matrix Source48Label Source48Label ℝ) :
    literalOriginalLift (A + B) = literalOriginalLift A + literalOriginalLift B := by
  calc
    literalOriginalLift (A + B) = (1 / 2 : ℝ) • originalSource48RawSum (A + B) := rfl
    _ = (1 / 2 : ℝ) • originalSource48RawSum A + (1 / 2 : ℝ) • originalSource48RawSum B :=
      originalSource48RawSum_half_add A B
    _ = literalOriginalLift A + literalOriginalLift B := rfl

#print axioms FCP.BFSSF1FOriginalFockAdditivityFactoringDiagnostic.literalOriginalLift_add
#eval IO.println "F1F_FACTORING_LITERAL_LIFT_COMPLETE"
#eval IO.println "F1F_FACTORED_ORIGINAL_FOCK_ADDITIVITY_DIAGNOSTIC_COMPLETE"

end
end FCP.BFSSF1FOriginalFockAdditivityFactoringDiagnostic
