import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPhysicalDomainS1V52K1D18IOriginalLipschitzGeneratorParityProbe

/-!
K1D18J — actual Lipschitz inverse-generator boundary of determinant
and grade-sign agreement, using original source48Quadratic, actual
Clifford ι, real-linear determinant character and the pinned Clifford
involute map.

Only inverse ORIGINAL generator units. No general closure induction,
Spin-even determinant theorem, SO48, covering, global Spin9, or BFSS
spectral existence claim. Candidate until strict source compiler and
declaration-level axiom audit.
-/

set_option autoImplicit false

namespace FCP.BFSSS1V52K1D18J
noncomputable section

open FCP.BFSSS1V0
open CliffordAlgebra

private abbrev Q : QuadraticForm ℝ Source48Vector := source48Quadratic
private abbrev C := CliffordAlgebra Q
private abbrev L := lipschitzGroup Q
private abbrev generator
    (a : Source48Vector) [Invertible (CliffordAlgebra.ι Q a)] : L :=
  FCP.BFSSS1V52K1D18I.originalSourceGeneratorLipschitzUnit a

/-- The real unit determinant character of the actual inverse
original Clifford-vector generator equals -1. No arbitrary source
Spin word factorization is introduced. -/
theorem originalSourceGeneratorInverse_det_neg_one
    (a : Source48Vector) [Invertible (CliffordAlgebra.ι Q a)] :
    ((FCP.BFSSS1V52K1D18H.originalSourceLipschitzDeterminantCharacter
      (generator a)⁻¹ : ℝˣ) : ℝ) = -1 := by
  rw [map_inv, Units.val_inv_eq_inv_val,
    FCP.BFSSS1V52K1D18I.originalSourceGeneratorLipschitzDeterminant_neg_one]
  norm_num

/-- The genuine source Clifford grade involution negates the inverse
of an actual original invertible Clifford-generator unit. We use
pinned `map_invOf`, `invOf_neg`, and the exact original generator
grade sign, without assuming an even Spin element. -/
theorem originalSourceGeneratorInverse_involute_neg
    (a : Source48Vector) [Invertible (CliffordAlgebra.ι Q a)] :
    CliffordAlgebra.involute
      ((((generator a)⁻¹ : L) : Cˣ) : C) =
      -((((generator a)⁻¹ : L) : Cˣ) : C) := by
  let u : Cˣ := (generator a : Cˣ)
  let : Invertible (u : C) := u.invertible
  let : Invertible (CliffordAlgebra.involute (u : C)) :=
    Invertible.map (CliffordAlgebra.involute (Q := Q)) (u : C)
  let : Invertible (-(u : C)) := invertibleNeg (u : C)
  have hu : CliffordAlgebra.involute (u : C) = -(u : C) :=
    FCP.BFSSS1V52K1D18I.originalSourceGeneratorLipschitzUnit_involute_neg a
  change CliffordAlgebra.involute ((u⁻¹ : Cˣ) : C) =
    -((u⁻¹ : Cˣ) : C)
  rw [← invOf_units u, map_invOf, hu, invOf_neg]

/-- Grade sign and the genuine source Lipschitz determinant character
AGREE on inverse generator units. This is a quantified mathematical
identity on the actual Clifford algebra; extending it to arbitrary
products and the entire subgroup closure remains separate. -/
theorem originalSourceGeneratorInverse_grade_det_agreement
    (a : Source48Vector) [Invertible (CliffordAlgebra.ι Q a)] :
    CliffordAlgebra.involute
      ((((generator a)⁻¹ : L) : Cˣ) : C) =
    (((FCP.BFSSS1V52K1D18H.originalSourceLipschitzDeterminantCharacter
      (generator a)⁻¹ : ℝˣ) : ℝ)) •
      ((((generator a)⁻¹ : L) : Cˣ) : C) := by
  rw [originalSourceGeneratorInverse_det_neg_one,
    originalSourceGeneratorInverse_involute_neg]
  simp

#print axioms originalSourceGeneratorInverse_det_neg_one
#print axioms originalSourceGeneratorInverse_involute_neg
#print axioms originalSourceGeneratorInverse_grade_det_agreement

end
end FCP.BFSSS1V52K1D18J
