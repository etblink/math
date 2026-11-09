import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FAbstractCoefficientModuleDiagnostic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1EOriginalThetaCoordinatePlaneMatrixAction

/-!
# F1F B1a — compact original-Fock named-sum interface

Use the exact accepted original 24-mode Fermion 2 continuous-linear
operators and genuine Source48Label. Keep T and A arbitrary.

The tested proposition intentionally retains rawCoefficientSum as a
named definition. The prior fully expanded twofold finite sum reached
recursion depth at the same concrete operator type, even without a
Majorana product. This is a discrimination of elaboration costs, not
a replacement formula or a physical F1F qualification.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FAbstractFockCompactBoundary
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open FCP.BFSSF1FAbstractCoefficient

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

/-- The same *fully applied* generic term, without restating its result type. -/
#check (fun (T : Source48Label → Source48Label → FockOp)
    (A : Matrix Source48Label Source48Label ℝ) =>
    halfCoefficientLinearMap_apply (ι := Source48Label) (M := FockOp) T A)

/-- The exact original Fock carrier and source index type, but no
    literal expansion, representation substitution or Majorana products. -/
theorem arbitraryFockFamily_apply_compact
    (T : Source48Label → Source48Label → FockOp)
    (A : Matrix Source48Label Source48Label ℝ) :
    halfCoefficientLinearMap T A =
      (1 / 2 : ℝ) • rawCoefficientSum T A :=
  halfCoefficientLinearMap_apply (ι := Source48Label) (M := FockOp) T A

#print axioms arbitraryFockFamily_apply_compact

end
end FCP.BFSSF1FAbstractFockCompactBoundary
