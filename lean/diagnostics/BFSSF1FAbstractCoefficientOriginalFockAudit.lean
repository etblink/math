import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FAbstractCoefficientModuleDiagnostic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1EOriginalThetaCoordinatePlaneMatrixAction

/-!
F1F independent diagnostic — instantiate the generic real-module
coefficient LinearMap on the EXACT original 48-label Fermion 2 Fock
operator carrier, preserving the source Majorana products and factor 1/2.

This does not import the uncompiled production F1F module and does not
assert physical Spin(9), gauge, Hamiltonian, or spectral conclusions.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FAbstractOriginalFockAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open FCP.BFSSF1FAbstractCoefficient
open scoped BigOperators

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

/-- Real-linear specialization; no normalized-gamma surrogate. -/
noncomputable def originalFockHalfCoefficientMap :
    Matrix Source48Label Source48Label ℝ →ₗ[ℝ] FockOp :=
  halfCoefficientLinearMap
    (fun p q : Source48Label => majoranaCandidate p * majoranaCandidate q)

/-- First boundary: the abstract linear-map law on the actual FockOp type. -/
theorem originalFockHalfCoefficientMap_add
    (A B : Matrix Source48Label Source48Label ℝ) :
    originalFockHalfCoefficientMap (A + B) =
      originalFockHalfCoefficientMap A +
        originalFockHalfCoefficientMap B :=
  map_add originalFockHalfCoefficientMap A B

/-- Second boundary: original-Fock real scalar homogeneity. -/
theorem originalFockHalfCoefficientMap_smul
    (c : ℝ) (A : Matrix Source48Label Source48Label ℝ) :
    originalFockHalfCoefficientMap (c • A) =
      c • originalFockHalfCoefficientMap A :=
  map_smul originalFockHalfCoefficientMap c A

/-- Third boundary: pointwise equality with the literal source F1F formula. -/
theorem originalFockHalfCoefficientMap_apply
    (A : Matrix Source48Label Source48Label ℝ) :
    originalFockHalfCoefficientMap A =
      (1 / 2 : ℝ) •
        ∑ p : Source48Label, ∑ q : Source48Label,
          (A p q) • (majoranaCandidate p * majoranaCandidate q) := by
  -- Rewrite only the named interface; avoid implicit reduction of FockOp.
  simpa only [originalFockHalfCoefficientMap] using
    (halfCoefficientLinearMap_apply_expanded
      (fun p q : Source48Label => majoranaCandidate p * majoranaCandidate q) A)

#print axioms originalFockHalfCoefficientMap
#print axioms originalFockHalfCoefficientMap_add
#print axioms originalFockHalfCoefficientMap_smul
#print axioms originalFockHalfCoefficientMap_apply

end
end FCP.BFSSF1FAbstractOriginalFockAudit
