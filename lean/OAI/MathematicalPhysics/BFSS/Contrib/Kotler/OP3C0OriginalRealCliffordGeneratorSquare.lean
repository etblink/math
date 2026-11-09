import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3BOriginalSource48QuadraticIsometryBridge
import Mathlib.LinearAlgebra.CliffordAlgebra.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin

/-!
# OP3-C0 — direct original real Clifford generator square

Use the exact original 48-label Spin(9) orthogonal matrix action and
the strictly qualified OP3-B1 preservation of source48Quadratic.

This is the smallest input needed by the existing Mathlib
CliffordAlgebra.lift universal property. No IsometryEquiv packaging,
no larger finite-sum definitional reduction, no replacement 48-space,
and no change to physical Clifford/Majorana normalization.

This file deliberately does NOT construct a Clifford AlgHom, an
AlgEquiv, a group action, a complexified/Fock action, a star action,
or any BFSS physical or spectral theorem.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C0OriginalRealCliffordSquare
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3BOriginalSource48Quadratic

/-- The EXACT original source Clifford generator, after applying a
genuine orthogonal 48-by-48 source matrix, obeys the original
Clifford square relation with source48Quadratic of the input. -/
theorem orthogonal_source48_clifford_generator_square
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : A ∈ Matrix.orthogonalGroup Source48Label ℝ)
    (v : Source48Vector) :
    (CliffordAlgebra.ι source48Quadratic (A.mulVec v)) *
        (CliffordAlgebra.ι source48Quadratic (A.mulVec v)) =
      algebraMap ℝ (CliffordAlgebra source48Quadratic)
        (source48Quadratic v) := by
  rw [CliffordAlgebra.ι_sq_scalar]
  rw [orthogonal_matrix_preserves_source48Quadratic A hA v]

/-- A small named linear-map interface: the original source
Clifford generator evaluated after the preexisting F10R paired
48-label Spin(9) matrix. This is NOT an algebra homomorphism. -/
noncomputable def source9Spin_originalClifford_generatorLinearMap
    (g : spinGroup source9Quadratic) :
    Source48Vector →ₗ[ℝ] CliffordAlgebra source48Quadratic :=
  (CliffordAlgebra.ι source48Quadratic).comp
    (((source9SpinOriginalPaired48OrthogonalHom g :
      Matrix.orthogonalGroup Source48Label ℝ) :
      Matrix Source48Label Source48Label ℝ).mulVecLin)

/-- Exact original generator action of the small real-linear map.
This equality is intentionally pointwise, not a whole-map
definitional identification with an independently named map. -/
theorem source9Spin_originalClifford_generatorLinearMap_apply
    (g : spinGroup source9Quadratic)
    (v : Source48Vector) :
    source9Spin_originalClifford_generatorLinearMap g v =
      CliffordAlgebra.ι source48Quadratic
        (((source9SpinOriginalPaired48OrthogonalHom g :
          Matrix.orthogonalGroup Source48Label ℝ) :
          Matrix Source48Label Source48Label ℝ).mulVec v) := by
  simp only [source9Spin_originalClifford_generatorLinearMap,
    LinearMap.comp_apply, Matrix.mulVecLin_apply]

/-- The source Spin(9) generator map squares to the exact original
source48Quadratic scalar. This is the universal-lift prerequisite,
not the construction or qualification of that lift. -/
theorem source9Spin_originalClifford_generatorLinearMap_square
    (g : spinGroup source9Quadratic)
    (v : Source48Vector) :
    source9Spin_originalClifford_generatorLinearMap g v *
        source9Spin_originalClifford_generatorLinearMap g v =
      algebraMap ℝ (CliffordAlgebra source48Quadratic)
        (source48Quadratic v) := by
  simp only [source9Spin_originalClifford_generatorLinearMap_apply]
  exact orthogonal_source48_clifford_generator_square
    ((source9SpinOriginalPaired48OrthogonalHom g :
      Matrix.orthogonalGroup Source48Label ℝ) :
      Matrix Source48Label Source48Label ℝ)
    (source9SpinOriginalPaired48OrthogonalHom g).property v

#print axioms orthogonal_source48_clifford_generator_square
#print axioms source9Spin_originalClifford_generatorLinearMap
#print axioms source9Spin_originalClifford_generatorLinearMap_apply
#print axioms source9Spin_originalClifford_generatorLinearMap_square

end
end FCP.BFSSOP3C0OriginalRealCliffordSquare
