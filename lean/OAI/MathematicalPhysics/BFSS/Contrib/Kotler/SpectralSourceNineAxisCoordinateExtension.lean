import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisCoordinateRestriction
import Mathlib.Data.Fin.Tuple.Basic

/-!
Candidate noncircular extension of the actual original first eight coordinates.
Build the raw diag(B,+1), then prove raw orthogonality, determinant and axis
fixing before constructing any SO(9) or actual stabilizer membership certificate.
No topology equivalence, Spin(8) classification or physical claim is asserted.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisCoordinateExtension
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineAxisProjection
open FCP.BFSSSourceNineAxisCoordinateRestriction
open Matrix

private abbrev V := SpaceIndex → ℝ
private abbrev SO9 := Matrix.specialOrthogonalGroup SpaceIndex ℝ
private abbrev SO8 := Matrix.specialOrthogonalGroup (Fin 8) ℝ
private abbrev M9 := Matrix SpaceIndex SpaceIndex ℝ
private abbrev M8 := Matrix (Fin 8) (Fin 8) ℝ
private abbrev H := source9Axis8MatrixStabilizer

/-- Raw extension on the actual original labels, with +1 on the ninth axis. -/
noncomputable def source9Axis8CoordinateExtensionMatrix (B : M8) : M9 :=
  Fin.snoc (α := fun _ : SpaceIndex => SpaceIndex → ℝ)
    (fun i : Fin 8 => Fin.snoc (α := fun _ : SpaceIndex => ℝ) (B i) (0 : ℝ))
    (Fin.snoc (α := fun _ : SpaceIndex => ℝ) (fun _ : Fin 8 => (0 : ℝ)) (1 : ℝ))

/-- The first eight original rows and columns are exactly B. -/
theorem source9Axis8CoordinateExtensionMatrix_castSucc_castSucc (B : M8) (i j : Fin 8) :
    source9Axis8CoordinateExtensionMatrix B i.castSucc j.castSucc = B i j := by
  simp only [source9Axis8CoordinateExtensionMatrix, Fin.snoc_castSucc]

/-- The original upper-right cross entries vanish. -/
theorem source9Axis8CoordinateExtensionMatrix_castSucc_last (B : M8) (i : Fin 8) :
    source9Axis8CoordinateExtensionMatrix B i.castSucc (Fin.last 8) = 0 := by
  simp only [source9Axis8CoordinateExtensionMatrix, Fin.snoc_castSucc, Fin.snoc_last]

/-- The original lower-left cross entries vanish. -/
theorem source9Axis8CoordinateExtensionMatrix_last_castSucc (B : M8) (j : Fin 8) :
    source9Axis8CoordinateExtensionMatrix B (Fin.last 8) j.castSucc = 0 := by
  simp only [source9Axis8CoordinateExtensionMatrix, Fin.snoc_last, Fin.snoc_castSucc]

/-- This is the point stabilizer extension, with positive last entry. -/
theorem source9Axis8CoordinateExtensionMatrix_last_last (B : M8) :
    source9Axis8CoordinateExtensionMatrix B (Fin.last 8) (Fin.last 8) = 1 := by
  simp only [source9Axis8CoordinateExtensionMatrix, Fin.snoc_last]

/-- Raw orthogonality uses only the eight-coordinate matrix identity, not H membership. -/
theorem source9Axis8CoordinateExtensionMatrix_orthogonal (B : M8) (hB : Bᵀ * B = 1) :
    (source9Axis8CoordinateExtensionMatrix B)ᵀ *
      source9Axis8CoordinateExtensionMatrix B = 1 := by
  ext i j
  change (∑ k : SpaceIndex, source9Axis8CoordinateExtensionMatrix B k i *
    source9Axis8CoordinateExtensionMatrix B k j) = (1 : M9) i j
  rw [Fin.sum_univ_castSucc (fun k : SpaceIndex =>
    source9Axis8CoordinateExtensionMatrix B k i * source9Axis8CoordinateExtensionMatrix B k j)]
  rcases Fin.eq_castSucc_or_eq_last i with ⟨i, rfl⟩ | rfl
  · rcases Fin.eq_castSucc_or_eq_last j with ⟨j, rfl⟩ | rfl
    · have hij := congrArg (fun T : M8 => T i j) hB
      change (∑ k : Fin 8, B k i * B k j) = (1 : M8) i j at hij
      have hident : (1 : M9) i.castSucc j.castSucc = (1 : M8) i j := by
        simp only [Matrix.one_apply, Fin.castSucc_inj]
      simpa only [source9Axis8CoordinateExtensionMatrix_castSucc_castSucc,
        source9Axis8CoordinateExtensionMatrix_last_castSucc, zero_mul, add_zero] using
        hij.trans hident.symm
    · have hident : (1 : M9) i.castSucc (Fin.last 8) = 0 := by
        simpa only [Matrix.one_apply] using
          (ite_eq_right (Fin.castSucc_ne_last i) :
            (if (i.castSucc : SpaceIndex) = Fin.last 8 then (1 : ℝ) else 0) = 0)
      simpa only [source9Axis8CoordinateExtensionMatrix_castSucc_castSucc,
        source9Axis8CoordinateExtensionMatrix_castSucc_last,
        source9Axis8CoordinateExtensionMatrix_last_castSucc,
        source9Axis8CoordinateExtensionMatrix_last_last,
        mul_zero, zero_mul, Finset.sum_const_zero, zero_add] using hident.symm
  · rcases Fin.eq_castSucc_or_eq_last j with ⟨j, rfl⟩ | rfl
    · have hn : (Fin.last 8 : SpaceIndex) ≠ j.castSucc :=
        Ne.symm (Fin.castSucc_ne_last j)
      have hident : (1 : M9) (Fin.last 8) j.castSucc = 0 := by
        simpa only [Matrix.one_apply] using
          (ite_eq_right hn :
            (if (Fin.last 8 : SpaceIndex) = j.castSucc then (1 : ℝ) else 0) = 0)
      simpa only [source9Axis8CoordinateExtensionMatrix_castSucc_last,
        source9Axis8CoordinateExtensionMatrix_castSucc_castSucc,
        source9Axis8CoordinateExtensionMatrix_last_last,
        source9Axis8CoordinateExtensionMatrix_last_castSucc,
        zero_mul, mul_zero, Finset.sum_const_zero, zero_add] using hident.symm
    · have hident : (1 : M9) (Fin.last 8) (Fin.last 8) = 1 := by
        simpa only [Matrix.one_apply] using
          (ite_eq_left (rfl : (Fin.last 8 : SpaceIndex) = Fin.last 8) :
            (if (Fin.last 8 : SpaceIndex) = Fin.last 8 then (1 : ℝ) else 0) = 1)
      simpa only [source9Axis8CoordinateExtensionMatrix_castSucc_last,
        source9Axis8CoordinateExtensionMatrix_last_last, zero_mul,
        Finset.sum_const_zero, one_mul, zero_add] using hident.symm

/-- Raw last-column Laplace expansion, valid for every B before SO/H bundling. -/
theorem source9Axis8CoordinateExtensionMatrix_det (B : M8) :
    (source9Axis8CoordinateExtensionMatrix B).det = B.det := by
  have hminor : (source9Axis8CoordinateExtensionMatrix B).submatrix
      (Fin.last 8).succAbove (Fin.last 8).succAbove = B := by
    ext i j
    change source9Axis8CoordinateExtensionMatrix B
      ((Fin.last 8).succAbove i) ((Fin.last 8).succAbove j) = B i j
    simpa only [Fin.succAbove_last] using
      source9Axis8CoordinateExtensionMatrix_castSucc_castSucc B i j
  calc
    (source9Axis8CoordinateExtensionMatrix B).det =
        (-1 : ℝ) ^ ((Fin.last 8 : Fin 9) + (Fin.last 8 : Fin 9) : ℕ) *
          source9Axis8CoordinateExtensionMatrix B (Fin.last 8) (Fin.last 8) *
          ((source9Axis8CoordinateExtensionMatrix B).submatrix
            (Fin.last 8).succAbove (Fin.last 8).succAbove).det := by
      rw [Matrix.det_succ_column (source9Axis8CoordinateExtensionMatrix B) (Fin.last 8)]
      apply Finset.sum_eq_single (Fin.last 8)
      · intro b _ hb
        rcases Fin.eq_castSucc_or_eq_last b with ⟨i, rfl⟩ | rfl
        · simp only [source9Axis8CoordinateExtensionMatrix_castSucc_last, mul_zero, zero_mul]
        · exact False.elim (hb rfl)
      · intro hnot
        exact False.elim (hnot (Finset.mem_univ (Fin.last 8)))
    _ = B.det := by
      rw [hminor, source9Axis8CoordinateExtensionMatrix_last_last]
      norm_num

/-- Every raw positive-axis extension fixes the literal original coordinate vector. -/
theorem source9Axis8CoordinateExtensionMatrix_fixes (B : M8) :
    (source9Axis8CoordinateExtensionMatrix B).mulVec (source9CoordinateVector 8) =
      source9CoordinateVector 8 := by
  have hlast : (Fin.last 8 : SpaceIndex) = (8 : SpaceIndex) := by decide
  have hcol : ∀ i : SpaceIndex,
      source9Axis8CoordinateExtensionMatrix B i (Fin.last 8) =
        (Pi.single (Fin.last 8) (1 : ℝ) : V) i := by
    intro i
    rcases Fin.eq_castSucc_or_eq_last i with ⟨i, rfl⟩ | rfl
    · calc
        source9Axis8CoordinateExtensionMatrix B i.castSucc (Fin.last 8) = 0 :=
          source9Axis8CoordinateExtensionMatrix_castSucc_last B i
        _ = (Pi.single (Fin.last 8) (1 : ℝ) : V) i.castSucc :=
          ((Pi.single_apply (Fin.last 8) (1 : ℝ) i.castSucc).trans
            (ite_eq_right (Fin.castSucc_ne_last i))).symm
    · calc
        source9Axis8CoordinateExtensionMatrix B (Fin.last 8) (Fin.last 8) = 1 :=
          source9Axis8CoordinateExtensionMatrix_last_last B
        _ = (Pi.single (Fin.last 8) (1 : ℝ) : V) (Fin.last 8) :=
          ((Pi.single_apply (Fin.last 8) (1 : ℝ) (Fin.last 8)).trans
            (ite_eq_left rfl)).symm
  ext i
  simpa only [source9CoordinateVector, Matrix.mulVec_single_one, Matrix.col_apply, hlast] using hcol i

/-- Genuine SO(9) membership is discharged from raw identities before constructing H. -/
theorem source9Axis8CoordinateExtensionMatrix_mem_SO9 (B : SO8) :
    source9Axis8CoordinateExtensionMatrix (B : M8) ∈ Matrix.specialOrthogonalGroup SpaceIndex ℝ := by
  have hB : (B : M8)ᵀ * (B : M8) = 1 :=
    (Matrix.mem_orthogonalGroup_iff' (A := (B : M8))).mp
      ((Matrix.mem_specialOrthogonalGroup_iff (A := (B : M8))).mp B.property).1
  exact (Matrix.mem_specialOrthogonalGroup_iff
      (A := source9Axis8CoordinateExtensionMatrix (B : M8))).mpr
    ⟨(Matrix.mem_orthogonalGroup_iff'
        (A := source9Axis8CoordinateExtensionMatrix (B : M8))).mpr
        (source9Axis8CoordinateExtensionMatrix_orthogonal (B : M8) hB),
      (source9Axis8CoordinateExtensionMatrix_det (B : M8)).trans
        ((Matrix.mem_specialOrthogonalGroup_iff (A := (B : M8))).mp B.property).2⟩

/-- Canonical extension into the SAME actual original target point stabilizer. -/
noncomputable def source9Axis8CoordinateExtension (B : SO8) : H := by
  refine ⟨⟨source9Axis8CoordinateExtensionMatrix (B : M8),
    source9Axis8CoordinateExtensionMatrix_mem_SO9 B⟩, ?_⟩
  change (source9Axis8CoordinateExtensionMatrix (B : M8)).mulVec
    (source9CoordinateVector 8) = source9CoordinateVector 8
  exact source9Axis8CoordinateExtensionMatrix_fixes (B : M8)

/-- Exact original nine-coordinate carrier binding. -/
theorem source9Axis8CoordinateExtension_coe (B : SO8) :
    (((source9Axis8CoordinateExtension B : H) : SO9) : M9) =
      source9Axis8CoordinateExtensionMatrix (B : M8) := rfl

/-- Restricting the explicit extension recovers the arbitrary given SO(8) matrix. -/
theorem source9Axis8CoordinateRestriction_extension (B : SO8) :
    source9Axis8CoordinateRestrictionHom (source9Axis8CoordinateExtension B) = B := by
  apply Subtype.ext
  ext i j
  change source9Axis8CoordinateExtensionMatrix (B : M8) i.castSucc j.castSucc = (B : M8) i j
  exact source9Axis8CoordinateExtensionMatrix_castSucc_castSucc (B : M8) i j

/-- Extending a restriction recovers the actual original target element. -/
theorem source9Axis8CoordinateExtension_restriction (A : H) :
    source9Axis8CoordinateExtension (source9Axis8CoordinateRestrictionHom A) = A := by
  apply source9Axis8CoordinateRestrictionHom_injective
  exact source9Axis8CoordinateRestriction_extension (source9Axis8CoordinateRestrictionHom A)

/-- Surjectivity uses the explicit original-coordinate extension, with no source preimage premise. -/
theorem source9Axis8CoordinateRestrictionHom_surjective :
    Function.Surjective source9Axis8CoordinateRestrictionHom := by
  intro B
  exact ⟨source9Axis8CoordinateExtension B, source9Axis8CoordinateRestriction_extension B⟩

#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtensionMatrix
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtensionMatrix_castSucc_castSucc
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtensionMatrix_castSucc_last
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtensionMatrix_last_castSucc
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtensionMatrix_last_last
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtensionMatrix_orthogonal
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtensionMatrix_det
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtensionMatrix_fixes
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtensionMatrix_mem_SO9
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtension
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtension_coe
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateRestriction_extension
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateExtension_restriction
#print axioms FCP.BFSSSourceNineAxisCoordinateExtension.source9Axis8CoordinateRestrictionHom_surjective
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_COORDINATE_EXTENSION_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineAxisCoordinateExtension
