import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineLipschitzRepresentation
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BRSourceVectorOrthogonalHom
import Mathlib.LinearAlgebra.CliffordAlgebra.Inversion
import Mathlib.LinearAlgebra.Matrix.SchurComplement
import Mathlib.LinearAlgebra.Matrix.RowCol

/-!
C0-A2 candidate: determinant +1 of the ACTUAL original nine-vector action.
Identify invertible Clifford-vector generators with their source-normalized
rank-one matrices. Their determinant is +1 in dimension NINE, in contrast
to dimension 48. Propagate the actual determinant-unit character through
the algebraic Lipschitz closure, then use the accepted exact Spin restriction.
No volume transport, even-word assumption, connectedness or compactness.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineOrientation
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineLipschitz
open Matrix

/-- Exact polarization of the original all-one nine-coordinate source quadratic form. -/
theorem source9Quadratic_polar_dot (a z : SpaceIndex → ℝ) :
    QuadraticMap.polar source9Quadratic a z = 2 * (a ⬝ᵥ z) := by
  simp only [QuadraticMap.polar, source9Quadratic_eq_dot, add_dotProduct, dotProduct_add]
  rw [dotProduct_comm z a]
  ring

/-- Original normalized polar row, using inverseOf on the source quadratic value. -/
noncomputable def source9NormalizedPolarRow
    (a : SpaceIndex → ℝ) [Invertible (source9Quadratic a)] : SpaceIndex → ℝ :=
  fun j => (2 * ⅟(source9Quadratic a)) * a j

/-- The actual coordinate row evaluates to normalized source polarization on every vector. -/
theorem source9NormalizedPolarRow_dot
    (a z : SpaceIndex → ℝ) [Invertible (source9Quadratic a)] :
    source9NormalizedPolarRow a ⬝ᵥ z =
      ⅟(source9Quadratic a) * QuadraticMap.polar source9Quadratic a z := by
  calc
    _ = (2 * ⅟(source9Quadratic a)) * (a ⬝ᵥ z) := by
      simp only [source9NormalizedPolarRow, dotProduct, Finset.mul_sum, mul_assoc]
    _ = _ := by
      rw [source9Quadratic_polar_dot]
      ring

/-- Source normalization ell(a)=2 is proved, not assumed for the actual generator row. -/
theorem source9NormalizedPolarRow_dot_self
    (a : SpaceIndex → ℝ) [Invertible (source9Quadratic a)] :
    source9NormalizedPolarRow a ⬝ᵥ a = (2 : ℝ) := by
  rw [source9NormalizedPolarRow_dot, QuadraticMap.polar_self, two_smul, mul_add,
    invOf_mul_self]
  norm_num

/-- Source-nine coordinate matrix of the line reflection with row ell. -/
noncomputable def source9RankOneConjugationMatrix
    (a ell : SpaceIndex → ℝ) : Matrix SpaceIndex SpaceIndex ℝ :=
  -(1 + Matrix.replicateCol (Fin 1) a * Matrix.replicateRow (Fin 1) (-ell))

/-- The exact rank-one matrix acts by ell(z) a - z on the original nine-vector carrier. -/
theorem source9RankOneConjugationMatrix_mulVec (a ell z : SpaceIndex → ℝ) :
    source9RankOneConjugationMatrix a ell *ᵥ z = (ell ⬝ᵥ z) • a - z := by
  have hprod :
      (Matrix.replicateCol (Fin 1) a * Matrix.replicateRow (Fin 1) (-ell)) *ᵥ z =
        (MulOpposite.op ((-ell) ⬝ᵥ z)) • a := by
    have hmatrix :
        Matrix.replicateCol (Fin 1) a * Matrix.replicateRow (Fin 1) (-ell) =
          Matrix.vecMulVec a (-ell) :=
      (Matrix.vecMulVec_eq (ι := Fin 1) a (-ell)).symm
    rw [hmatrix]
    exact Matrix.vecMulVec_mulVec a (-ell) z
  have hscalar :
      (MulOpposite.op ((-ell) ⬝ᵥ z)) • a = -((ell ⬝ᵥ z) • a) := by
    ext j
    change a j * ((-ell) ⬝ᵥ z) = -((ell ⬝ᵥ z) * a j)
    rw [neg_dotProduct]
    ring
  calc
    _ = -(z + (Matrix.replicateCol (Fin 1) a *
        Matrix.replicateRow (Fin 1) (-ell)) *ᵥ z) := by
      simp only [source9RankOneConjugationMatrix, Matrix.neg_mulVec,
        Matrix.add_mulVec, Matrix.one_mulVec]
    _ = -(z + (MulOpposite.op ((-ell) ⬝ᵥ z)) • a) := by rw [hprod]
    _ = _ := by rw [hscalar]; abel

/-- In dimension NINE a normalized line reflection has determinant +1. -/
theorem source9RankOneConjugationMatrix_det_one
    (a ell : SpaceIndex → ℝ) (h : ell ⬝ᵥ a = (2 : ℝ)) :
    (source9RankOneConjugationMatrix a ell).det = (1 : ℝ) := by
  unfold source9RankOneConjugationMatrix
  have hmatrix :
      (1 + Matrix.replicateCol (Fin 1) a * Matrix.replicateRow (Fin 1) (-ell)).det =
        1 + (-ell) ⬝ᵥ a :=
    Matrix.det_one_add_replicateCol_mul_replicateRow (ι := Fin 1) a (-ell)
  calc
    _ = (-1 : ℝ) ^ Fintype.card SpaceIndex *
        (1 + Matrix.replicateCol (Fin 1) a * Matrix.replicateRow (Fin 1) (-ell)).det :=
      Matrix.det_neg _
    _ = (-1 : ℝ) ^ Fintype.card SpaceIndex * (1 + (-ell) ⬝ᵥ a) := by rw [hmatrix]
    _ = 1 := by
      rw [neg_dotProduct, h]
      norm_num [SpaceIndex]

/-- Every invertible original Clifford vector is an actual generator of the source Lipschitz group. -/
theorem source9GeneratorUnit_mem_lipschitz
    (a : SpaceIndex → ℝ) [Invertible (CliffordAlgebra.ι source9Quadratic a)] :
    unitOfInvertible (CliffordAlgebra.ι source9Quadratic a) ∈
      lipschitzGroup source9Quadratic := by
  unfold lipschitzGroup
  apply Subgroup.subset_closure
  exact ⟨a, rfl⟩

/-- The original Clifford-vector unit in the literal Lipschitz subgroup, not asserted Spin-even. -/
noncomputable def source9GeneratorLipschitzUnit
    (a : SpaceIndex → ℝ) [Invertible (CliffordAlgebra.ι source9Quadratic a)] :
    lipschitzGroup source9Quadratic :=
  ⟨unitOfInvertible (CliffordAlgebra.ι source9Quadratic a),
    source9GeneratorUnit_mem_lipschitz a⟩

private noncomputable def source9GeneratorPolarRow
    (a : SpaceIndex → ℝ) [Invertible (CliffordAlgebra.ι source9Quadratic a)] :
    SpaceIndex → ℝ :=
  letI : Invertible (source9Quadratic a) :=
    CliffordAlgebra.invertibleOfInvertibleι source9Quadratic a
  source9NormalizedPolarRow a

/-- The ACTUAL Lipschitz linear action of a generator is exactly the source-normalized matrix. -/
theorem source9GeneratorLinearMap_eq_rankOne
    (a : SpaceIndex → ℝ) [Invertible (CliffordAlgebra.ι source9Quadratic a)] :
    (source9LipschitzVectorLinearEquiv (source9GeneratorLipschitzUnit a) :
        (SpaceIndex → ℝ) →ₗ[ℝ] (SpaceIndex → ℝ)) =
      Matrix.toLin' (source9RankOneConjugationMatrix a (source9GeneratorPolarRow a)) := by
  let : Invertible (source9Quadratic a) :=
    CliffordAlgebra.invertibleOfInvertibleι source9Quadratic a
  apply LinearMap.ext
  intro z
  change source9LipschitzVectorLinearMap (source9GeneratorLipschitzUnit a) z =
    Matrix.toLin' (source9RankOneConjugationMatrix a (source9NormalizedPolarRow a)) z
  rw [Matrix.toLin'_apply]
  apply source9CliffordVectorEmbedding_injective
  rw [source9LipschitzVectorLinearMap_ι, source9RankOneConjugationMatrix_mulVec,
    source9NormalizedPolarRow_dot]
  change ConjAct.toConjAct
      (unitOfInvertible (CliffordAlgebra.ι source9Quadratic a)) •
      CliffordAlgebra.ι source9Quadratic z = _
  rw [ConjAct.units_smul_def, ConjAct.ofConjAct_toConjAct]
  change CliffordAlgebra.ι source9Quadratic a * CliffordAlgebra.ι source9Quadratic z *
      ⅟(CliffordAlgebra.ι source9Quadratic a) =
    CliffordAlgebra.ι source9Quadratic
      ((⅟(source9Quadratic a) * QuadraticMap.polar source9Quadratic a z) • a - z)
  exact CliffordAlgebra.ι_mul_ι_mul_invOf_ι source9Quadratic a z

/-- The actual determinant UNIT character is one on every invertible source-vector generator. -/
theorem source9GeneratorDeterminantCharacter_one
    (a : SpaceIndex → ℝ) [Invertible (CliffordAlgebra.ι source9Quadratic a)] :
    source9LipschitzDeterminantCharacter (source9GeneratorLipschitzUnit a) = 1 := by
  let : Invertible (source9Quadratic a) :=
    CliffordAlgebra.invertibleOfInvertibleι source9Quadratic a
  apply Units.ext
  change ((LinearEquiv.det
    (source9LipschitzVectorLinearEquiv (source9GeneratorLipschitzUnit a)) : ℝˣ) : ℝ) = 1
  rw [LinearEquiv.coe_det, source9GeneratorLinearMap_eq_rankOne, LinearMap.det_toLin']
  change (source9RankOneConjugationMatrix a (source9NormalizedPolarRow a)).det = 1
  exact source9RankOneConjugationMatrix_det_one a (source9NormalizedPolarRow a)
    (source9NormalizedPolarRow_dot_self a)

/-- Algebraic closure propagation: the actual determinant character is one on the ENTIRE subgroup. -/
theorem source9LipschitzDeterminantCharacter_eq_one
    (s : lipschitzGroup source9Quadratic) : source9LipschitzDeterminantCharacter s = 1 := by
  have h_all (u : (CliffordAlgebra source9Quadratic)ˣ)
      (hu : u ∈ lipschitzGroup source9Quadratic) :
      source9LipschitzDeterminantCharacter (⟨u, hu⟩ : lipschitzGroup source9Quadratic) = 1 := by
    unfold lipschitzGroup at hu
    induction hu using Subgroup.closure_induction'' with
    | mem u hu =>
      have huL : u ∈ lipschitzGroup source9Quadratic := Subgroup.subset_closure hu
      obtain ⟨a, ha⟩ := hu
      let : Invertible (CliffordAlgebra.ι source9Quadratic a) := by
        rw [ha]
        exact u.invertible
      have heq : u = unitOfInvertible (CliffordAlgebra.ι source9Quadratic a) := by
        apply Units.ext
        exact ha.symm
      have hsub : (⟨u, huL⟩ : lipschitzGroup source9Quadratic) =
          source9GeneratorLipschitzUnit a := by
        apply Subtype.ext
        exact heq
      rw [hsub]
      exact source9GeneratorDeterminantCharacter_one a
    | inv_mem u hu =>
      have huL : u ∈ lipschitzGroup source9Quadratic := Subgroup.subset_closure hu
      obtain ⟨a, ha⟩ := hu
      let : Invertible (CliffordAlgebra.ι source9Quadratic a) := by
        rw [ha]
        exact u.invertible
      have heq : u = unitOfInvertible (CliffordAlgebra.ι source9Quadratic a) := by
        apply Units.ext
        exact ha.symm
      have hsub :
          (⟨u⁻¹, (lipschitzGroup source9Quadratic).inv_mem huL⟩ :
            lipschitzGroup source9Quadratic) = (source9GeneratorLipschitzUnit a)⁻¹ := by
        apply Subtype.ext
        exact congrArg Inv.inv heq
      rw [hsub, map_inv, source9GeneratorDeterminantCharacter_one, inv_one]
    | one => exact map_one source9LipschitzDeterminantCharacter
    | mul u v hu hv ih_u ih_v =>
      change source9LipschitzDeterminantCharacter
        ((⟨u, hu⟩ : lipschitzGroup source9Quadratic) *
          (⟨v, hv⟩ : lipschitzGroup source9Quadratic)) = 1
      rw [map_mul, ih_u, ih_v, mul_one]
  exact h_all (s : (CliffordAlgebra source9Quadratic)ˣ) s.property

/-- Determinant +1 for the original F10BP nine-vector action, using its exact accepted restriction. -/
theorem source9SpinVectorRepresentation_det_one (g : spinGroup source9Quadratic) :
    LinearMap.det (source9SpinVectorRepresentation g) = (1 : ℝ) := by
  have h := congrArg (fun u : ℝˣ => (u : ℝ))
    (source9LipschitzDeterminantCharacter_eq_one (source9SpinToLipschitz g))
  change ((LinearEquiv.det
    (source9LipschitzVectorLinearEquiv (source9SpinToLipschitz g)) : ℝˣ) : ℝ) = 1 at h
  have heq : (source9LipschitzVectorLinearEquiv (source9SpinToLipschitz g) :
      (SpaceIndex → ℝ) →ₗ[ℝ] (SpaceIndex → ℝ)) = source9SpinVectorRepresentation g := by
    apply LinearMap.ext
    intro z
    change source9LipschitzVectorRepresentation (source9SpinToLipschitz g) z =
      source9SpinVectorRepresentation g z
    exact source9LipschitzVectorRepresentation_restrict_spin g z
  rw [LinearEquiv.coe_det, heq] at h
  exact h

/-- The ORIGINAL native nine-vector matrix homomorphism has determinant +1 on every source element. -/
theorem source9SpinVectorMatrixHom_det_one (g : spinGroup source9Quadratic) :
    (source9SpinVectorMatrixHom g).det = (1 : ℝ) := by
  have heq : source9SpinVectorRepresentation g =
      Matrix.toLin' (source9SpinVectorMatrixHom g) := by
    apply LinearMap.ext
    intro z
    rw [Matrix.toLin'_apply]
    exact (source9SpinVectorMatrixHom_mulVec g z).symm
  have h := source9SpinVectorRepresentation_det_one g
  rw [heq, LinearMap.det_toLin'] at h
  exact h

/-- Global ALGEBRAIC SO(9)-valued packaging of the original actual nine-vector action. -/
noncomputable def source9SpinVectorSpecialOrthogonalHom :
    spinGroup source9Quadratic →* Matrix.specialOrthogonalGroup SpaceIndex ℝ where
  toFun g := ⟨source9SpinVectorMatrixHom g, by
    rw [Matrix.mem_specialOrthogonalGroup_iff]
    exact ⟨source9SpinVectorMatrixHom_mem_orthogonalGroup g,
      source9SpinVectorMatrixHom_det_one g⟩⟩
  map_one' := by
    apply Subtype.ext
    change source9SpinVectorMatrixHom (1 : spinGroup source9Quadratic) = 1
    exact map_one source9SpinVectorMatrixHom
  map_mul' := by
    intro g h
    apply Subtype.ext
    change source9SpinVectorMatrixHom (g * h) =
      source9SpinVectorMatrixHom g * source9SpinVectorMatrixHom h
    exact map_mul source9SpinVectorMatrixHom g h

/-- The new SO(9) value is the SAME original source-vector action on every original vector. -/
theorem source9SpinVectorSpecialOrthogonalHom_mulVec
    (g : spinGroup source9Quadratic) (z : SpaceIndex → ℝ) :
    ((source9SpinVectorSpecialOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ).mulVec z =
      source9SpinVectorRepresentation g z :=
  source9SpinVectorMatrixHom_mulVec g z

#print axioms FCP.BFSSSourceNineOrientation.source9Quadratic_polar_dot
#print axioms FCP.BFSSSourceNineOrientation.source9NormalizedPolarRow
#print axioms FCP.BFSSSourceNineOrientation.source9NormalizedPolarRow_dot
#print axioms FCP.BFSSSourceNineOrientation.source9NormalizedPolarRow_dot_self
#print axioms FCP.BFSSSourceNineOrientation.source9RankOneConjugationMatrix
#print axioms FCP.BFSSSourceNineOrientation.source9RankOneConjugationMatrix_mulVec
#print axioms FCP.BFSSSourceNineOrientation.source9RankOneConjugationMatrix_det_one
#print axioms FCP.BFSSSourceNineOrientation.source9GeneratorUnit_mem_lipschitz
#print axioms FCP.BFSSSourceNineOrientation.source9GeneratorLipschitzUnit
#print axioms FCP.BFSSSourceNineOrientation.source9GeneratorLinearMap_eq_rankOne
#print axioms FCP.BFSSSourceNineOrientation.source9GeneratorDeterminantCharacter_one
#print axioms FCP.BFSSSourceNineOrientation.source9LipschitzDeterminantCharacter_eq_one
#print axioms FCP.BFSSSourceNineOrientation.source9SpinVectorRepresentation_det_one
#print axioms FCP.BFSSSourceNineOrientation.source9SpinVectorMatrixHom_det_one
#print axioms FCP.BFSSSourceNineOrientation.source9SpinVectorSpecialOrthogonalHom
#print axioms FCP.BFSSSourceNineOrientation.source9SpinVectorSpecialOrthogonalHom_mulVec
#eval IO.println "SPECTRAL_SOURCE_NINE_ORIENTATION_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineOrientation
