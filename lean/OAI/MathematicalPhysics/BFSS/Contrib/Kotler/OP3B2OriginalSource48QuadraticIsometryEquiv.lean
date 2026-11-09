import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3BOriginalSource48QuadraticIsometryBridge
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.QuadraticForm.IsometryEquiv

/-!
# OP3-B2 — package the exact original source48 quadratic isometry

OP3-B1 independently qualified that the ACTUAL F10R original
paired-48 Spin(9) matrix action preserves source48Quadratic.
Now package that same action as a QuadraticForm.IsometryEquiv.

An orthogonal matrix A has the explicit inverse A.transpose on
Source48Vector, with no assumed Spin(48) lift or surrogate operator.
This is a prerequisite for CliffordAlgebra.equivOfIsometry.

Do not assert that this one-source-element isometry construction
already establishes a continuous group homomorphism or the global
Clifford / Fock operator action, star/central parity, gauge-physical
domains or spectral consequences.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3B2OriginalSource48Isometry
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3BOriginalSource48Quadratic
open Matrix

/-- First construct ONLY the real-linear equivalence on the
actual original Source48Vector. This source-equivalent matrix
interface avoids asking Lean to elaborate a nested 48-dimensional
quadratic isometry and linear equivalence simultaneously. -/
noncomputable def orthogonalMatrix_source48LinearEquiv
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : A ∈ Matrix.orthogonalGroup Source48Label ℝ) :
    Source48Vector ≃ₗ[ℝ] Source48Vector := by
  have hTA : A.transpose * A =
      (1 : Matrix Source48Label Source48Label ℝ) :=
    (Matrix.mem_orthogonalGroup_iff' Source48Label ℝ).mp hA
  have hAT : A * A.transpose =
      (1 : Matrix Source48Label Source48Label ℝ) :=
    (Matrix.mem_orthogonalGroup_iff Source48Label ℝ).mp hA
  exact
    { A.mulVecLin with
      invFun := A.transpose.mulVec
      left_inv := by
        intro v
        change A.transpose.mulVec (A.mulVec v) = v
        rw [Matrix.mulVec_mulVec, hTA, Matrix.one_mulVec]
      right_inv := by
        intro v
        change A.mulVec (A.transpose.mulVec v) = v
        rw [Matrix.mulVec_mulVec, hAT, Matrix.one_mulVec] }

/-- An original linear equivalence becomes an isometry of the
exact source48Quadratic using ONLY the already-qualified OP3-B1
quadratic-preservation theorem. No new quadratic form, matrix
representation or unverified operator-action interface is added. -/
noncomputable def orthogonalMatrix_source48IsometryEquiv
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : A ∈ Matrix.orthogonalGroup Source48Label ℝ) :
    source48Quadratic.IsometryEquiv source48Quadratic :=
  { orthogonalMatrix_source48LinearEquiv A hA with
    map_app' := orthogonal_matrix_preserves_source48Quadratic A hA }

/-- The ACTUAL original F10R Spin(9) paired-label action, without
any change of index equivalence, gives a source48Quadratic isometry. -/
noncomputable def source9SpinOriginalPaired48IsometryEquiv
    (g : spinGroup source9Quadratic) :
    source48Quadratic.IsometryEquiv source48Quadratic :=
  orthogonalMatrix_source48IsometryEquiv
    ((source9SpinOriginalPaired48OrthogonalHom g) :
      Matrix Source48Label Source48Label ℝ)
    (source9SpinOriginalPaired48OrthogonalHom g).property

/-- The packaged isometry evaluates to EXACTLY the historical
original paired 48-label Spin matrix action on all source vectors. -/
theorem source9SpinOriginalPaired48IsometryEquiv_apply
    (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source9SpinOriginalPaired48IsometryEquiv g v =
      ((source9SpinOriginalPaired48SpecialOrthogonalHom g :
        Matrix.specialOrthogonalGroup Source48Label ℝ) :
        Matrix Source48Label Source48Label ℝ).mulVec v := by
  rw [source9SpinOriginalPaired48SpecialOrthogonalHom_apply]
  rfl

#print axioms orthogonalMatrix_source48LinearEquiv
#print axioms orthogonalMatrix_source48IsometryEquiv
#print axioms source9SpinOriginalPaired48IsometryEquiv
#print axioms source9SpinOriginalPaired48IsometryEquiv_apply

end
end FCP.BFSSOP3B2OriginalSource48Isometry
