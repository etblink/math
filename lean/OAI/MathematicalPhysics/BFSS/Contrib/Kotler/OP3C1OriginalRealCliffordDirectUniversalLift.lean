import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C0OriginalRealCliffordGeneratorSquare

/-!
# OP3-C1 — source-exact real Clifford universal-property endomorphism

Use the strictly qualified OP3-C0 source generator linear map and its
original 48-real quadratic-square theorem in the pinned Mathlib
CliffordAlgebra.lift. This is the historically successful L9E5C1
construction pattern, but with the actual Spin9 paired-48 source
matrix action as the generator linear map.

The only new construction is an AlgHom for each original Spin9 element,
and the equality it induces on original Clifford generators.

No source IsometryEquiv package; no new Clifford model; no group law,
inverse, complexification, M3I Fock transport, physical adjoint/star,
continuity, center, gauge-physical compatibility or spectral theorem.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C1OriginalRealCliffordDirectLift
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C0OriginalRealCliffordSquare

/-- Direct real Clifford algebra homomorphism from the original
Spin(9) paired-48 source matrix and the accepted quadratic-square
input. At this stage the *family* has no accepted group law. -/
noncomputable def source9Spin_originalRealCliffordAlgHom
    (g : spinGroup source9Quadratic) :
    CliffordAlgebra source48Quadratic →ₐ[ℝ]
      CliffordAlgebra source48Quadratic :=
  CliffordAlgebra.lift source48Quadratic
    ⟨source9Spin_originalClifford_generatorLinearMap g,
      source9Spin_originalClifford_generatorLinearMap_square g⟩

/-- The universal lift sends each genuine original source generator
to the already-qualified original real-linear generator map. -/
theorem source9Spin_originalRealCliffordAlgHom_generator
    (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source9Spin_originalRealCliffordAlgHom g
        (CliffordAlgebra.ι source48Quadratic v) =
      source9Spin_originalClifford_generatorLinearMap g v := by
  unfold source9Spin_originalRealCliffordAlgHom
  rw [CliffordAlgebra.lift_ι_apply]

/-- The direct universal lift is explicitly covariant on the
original Source48Vector under the exact source paired-48 matrix
action. This is pointwise generator covariance, NOT a group action. -/
theorem source9Spin_originalRealCliffordAlgHom_generator_covariance
    (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source9Spin_originalRealCliffordAlgHom g
        (CliffordAlgebra.ι source48Quadratic v) =
      CliffordAlgebra.ι source48Quadratic
        (((source9SpinOriginalPaired48OrthogonalHom g :
          Matrix.orthogonalGroup Source48Label ℝ) :
          Matrix Source48Label Source48Label ℝ).mulVec v) := by
  calc
    source9Spin_originalRealCliffordAlgHom g
        (CliffordAlgebra.ι source48Quadratic v) =
      source9Spin_originalClifford_generatorLinearMap g v :=
        source9Spin_originalRealCliffordAlgHom_generator g v
    _ = CliffordAlgebra.ι source48Quadratic
          (((source9SpinOriginalPaired48OrthogonalHom g :
            Matrix.orthogonalGroup Source48Label ℝ) :
            Matrix Source48Label Source48Label ℝ).mulVec v) :=
        source9Spin_originalClifford_generatorLinearMap_apply g v

#print axioms source9Spin_originalRealCliffordAlgHom
#print axioms source9Spin_originalRealCliffordAlgHom_generator
#print axioms source9Spin_originalRealCliffordAlgHom_generator_covariance

end
end FCP.BFSSOP3C1OriginalRealCliffordDirectLift
