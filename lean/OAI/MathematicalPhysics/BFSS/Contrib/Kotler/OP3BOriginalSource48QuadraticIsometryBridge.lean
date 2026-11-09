import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10RSourceSpinOriginalPaired48SOHomProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSSource48QuadraticUnitAxesProbe
import Mathlib.LinearAlgebra.UnitaryGroup

/-!
# OP3-B1 — exact original paired-48 Spin(9) quadratic preservation

Use the historical source-exact F10R Spin(9) → SO(48) matrix
homomorphism and the original positive unit-weight quadratic form
on Source48Vector. The source48Quadratic = dotProduct identity is
independently proved in the original source-axis quadratic module.

First derive a small original-carrier matrix lemma from the pinned
orthogonalGroup predicate; then specialize ONLY the accepted exact
original G1A paired-label SO(48) map. Do not reimplement the source
gamma group representation or change the 48-label packing.

This is a quadratic-preservation interface, not yet a CliffordAlgEquiv
automorphism or original Spin(9) continuous/star-preserving action.
Neither physical gauge/domain compatibility nor spectrum is asserted.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3BOriginalSource48Quadratic
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48QuadraticUnitAxes
open FCP.BFSSPairedSpin9Clifford
open Matrix

/-- Every actual source-48 orthogonal matrix preserves precisely the
original source48Quadratic, not a rescaled or reordered surrogate.
The calculation is a one-step dot-product transport using AᵀA=I. -/
theorem orthogonal_matrix_preserves_source48Quadratic
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : A ∈ Matrix.orthogonalGroup Source48Label ℝ)
    (v : Source48Vector) :
    source48Quadratic (A.mulVec v) = source48Quadratic v := by
  have horth : A.transpose * A =
      (1 : Matrix Source48Label Source48Label ℝ) :=
    (Matrix.mem_orthogonalGroup_iff' Source48Label ℝ).mp hA
  simp only [source48Quadratic_eq_dot]
  calc
    dotProduct (A.mulVec v) (A.mulVec v) =
        dotProduct v (A.transpose.mulVec (A.mulVec v)) :=
      (Matrix.dotProduct_transpose_mulVec A v (A.mulVec v)).symm
    _ = dotProduct v ((A.transpose * A).mulVec v) := by
      rw [Matrix.mulVec_mulVec]
    _ = dotProduct v v := by
      rw [horth, Matrix.one_mulVec]

/-- Exact source Spin(9) to SO(48) action preserves the actual
48-real Clifford quadratic form on every original source vector.
No new action or assumed source isometry is introduced. -/
theorem source9SpinOriginalPaired48_preserves_source48Quadratic
    (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source48Quadratic
        (((source9SpinOriginalPaired48SpecialOrthogonalHom g :
          Matrix.specialOrthogonalGroup Source48Label ℝ) :
          Matrix Source48Label Source48Label ℝ).mulVec v) =
      source48Quadratic v := by
  have hmem :
      ((source9SpinOriginalPaired48OrthogonalHom g :
        Matrix.orthogonalGroup Source48Label ℝ) :
        Matrix Source48Label Source48Label ℝ) ∈
          Matrix.orthogonalGroup Source48Label ℝ :=
    (source9SpinOriginalPaired48OrthogonalHom g).property
  rw [source9SpinOriginalPaired48SpecialOrthogonalHom_apply]
  exact orthogonal_matrix_preserves_source48Quadratic
    (source9SpinOriginalPaired48OrthogonalHom g :
      Matrix Source48Label Source48Label ℝ) hmem v

#print axioms orthogonal_matrix_preserves_source48Quadratic
#print axioms source9SpinOriginalPaired48_preserves_source48Quadratic

end
end FCP.BFSSOP3BOriginalSource48Quadratic
