import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FAbstractCoefficientModuleDiagnostic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1EOriginalThetaCoordinatePlaneMatrixAction

/-!
F1F compact source-faithful coefficient candidate.

This module builds a genuine real LinearMap on the original BFSS
Fermion 2 continuous-linear-operator space using exactly Source48Label
and the source's ordered, unnormalized theta products. Its 1/2 factor
is outside the existing named finite coefficient sum.

A distinct *original production* F1F module still spells the entire
double sum out literally. No equality to that production definition
is claimed or silently assumed in this candidate.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FOriginalThetaCompactCandidate
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open FCP.BFSSF1FAbstractCoefficient

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

/-- Exact source-ordered theta product, on the genuine 48-label Fock carrier. -/
noncomputable def originalSourceThetaPairFamily :
    Source48Label → Source48Label → FockOp :=
  fun p q => majoranaCandidate p * majoranaCandidate q

theorem originalSourceThetaPairFamily_apply (p q : Source48Label) :
    originalSourceThetaPairFamily p q =
      majoranaCandidate p * majoranaCandidate q := rfl

/-- A genuine real LinearMap, defined using the already checked generic
coefficient construction rather than elaborating nested Fock sums again. -/
noncomputable def originalSourceThetaCompactCoefficientLinearMap :
    Matrix Source48Label Source48Label ℝ →ₗ[ℝ] FockOp :=
  halfCoefficientLinearMap originalSourceThetaPairFamily

/-!
The concrete `LinearMap` type already carries additivity and homogeneity.
Three attempted source-restatement theorems (add / smul / named-sum apply)
exceeded Lean's recursion depth in run #42597183416. Their full formulas
and the original production F1F remain preserved in research history.
Do not silently treat those failed statements as independently qualified.
-/

#print axioms originalSourceThetaPairFamily
#print axioms originalSourceThetaPairFamily_apply
#print axioms originalSourceThetaCompactCoefficientLinearMap

end
end FCP.BFSSF1FOriginalThetaCompactCandidate
