import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineAxisProjection
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Topology.Instances.Matrix
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Fin.SuccPred

/-!
Candidate coordinate-exact restriction of the ACTUAL fixed-axis SO(9) subgroup
to SO(8) on original labels 0 through 7. Prove both fixed row and column,
orthogonality, determinant one and multiplication before bundling the map.
No surjectivity, inverse block embedding, group equivalence, triality transport
or physical spectral statement is asserted in this first coordinate gate.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineAxisCoordinateRestriction
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford FCP.BFSSSourceNineAxisProjection
open Matrix

private abbrev V := SpaceIndex → ℝ
private abbrev SO9 := Matrix.specialOrthogonalGroup SpaceIndex ℝ
private abbrev SO8 := Matrix.specialOrthogonalGroup (Fin 8) ℝ
private abbrev M9 := Matrix SpaceIndex SpaceIndex ℝ
private abbrev M8 := Matrix (Fin 8) (Fin 8) ℝ
private abbrev H := source9Axis8MatrixStabilizer
private abbrev M (A : H) : M9 := ((A : SO9) : M9)

private theorem target_orthogonality (A : H) : (M A)ᵀ * M A = 1 :=
  (Matrix.mem_orthogonalGroup_iff' (A := M A)).mp
    (Matrix.mem_specialOrthogonalGroup_iff.mp (A : SO9).property).1

/-- Same original coordinate 8 and Fin.last 8; bridge explicitly, as in diagnostic. -/
private theorem axis_last_eq : (Fin.last 8 : SpaceIndex) = (8 : SpaceIndex) := by decide

/-- The actual last column is the original fixed ninth coordinate vector. -/
theorem source9Axis8Target_lastColumn (A : H) (i : SpaceIndex) :
    M A i (Fin.last 8) = source9CoordinateVector 8 i := by
  have hfix : (M A).mulVec (source9CoordinateVector 8) = source9CoordinateVector 8 :=
    A.property
  have h : M A i (8 : SpaceIndex) = source9CoordinateVector 8 i := by
    simpa only [source9CoordinateVector, Matrix.mulVec_single_one, Matrix.col_apply] using congrFun hfix i
  simpa only [axis_last_eq] using h

/-- Orthogonality and the actual last column force the corresponding last row. -/
theorem source9Axis8Target_lastRow (A : H) (j : SpaceIndex) :
    M A (Fin.last 8) j = source9CoordinateVector 8 j := by
  have hsum : (∑ k : SpaceIndex, source9CoordinateVector 8 k * M A k j) =
      (1 : M9) (Fin.last 8) j := by
    simpa only [Matrix.mul_apply, Matrix.transpose_apply, source9Axis8Target_lastColumn] using
      (congrArg (fun T : M9 => T (Fin.last 8) j) (target_orthogonality A))
  calc
    M A (Fin.last 8) j = (source9CoordinateVector 8 ⬝ᵥ fun k : SpaceIndex => M A k j) := by
      simp only [source9CoordinateVector, single_one_dotProduct, axis_last_eq]
    _ = (1 : M9) (Fin.last 8) j := by
      change (∑ k : SpaceIndex, source9CoordinateVector 8 k * M A k j) =
        (1 : M9) (Fin.last 8) j
      exact hsum
    _ = source9CoordinateVector 8 j := by
      rw [axis_last_eq]
      simp [source9CoordinateVector, Matrix.one_apply, Pi.single_apply, eq_comm]

/-- All upper entries of the last column vanish in the original ordered inclusion. -/
theorem source9Axis8Target_lastColumn_castSucc (A : H) (i : Fin 8) :
    M A i.castSucc (Fin.last 8) = 0 := by
  rw [source9Axis8Target_lastColumn]
  change (Pi.single (8 : SpaceIndex) (1 : ℝ) : V) i.castSucc = 0
  have hn : (i.castSucc : SpaceIndex) ≠ (8 : SpaceIndex) := by
    intro h
    apply Fin.castSucc_ne_last i
    exact h.trans axis_last_eq.symm
  rw [Pi.single_apply, ite_eq_right hn]

/-- All left entries of the last row vanish in the original ordered inclusion. -/
theorem source9Axis8Target_lastRow_castSucc (A : H) (j : Fin 8) :
    M A (Fin.last 8) j.castSucc = 0 := by
  rw [source9Axis8Target_lastRow]
  change (Pi.single (8 : SpaceIndex) (1 : ℝ) : V) j.castSucc = 0
  have hn : (j.castSucc : SpaceIndex) ≠ (8 : SpaceIndex) := by
    intro h
    exact Fin.castSucc_ne_last j (h.trans axis_last_eq.symm)
  rw [Pi.single_apply, ite_eq_right hn]

/-- Literal upper-left block on the unchanged ordered original coordinates. -/
noncomputable def source9Axis8CoordinateBlock (A : H) : M8 :=
  (M A).submatrix Fin.castSucc Fin.castSucc

/-- Orthogonality of the actual eight-coordinate block, using the vanishing last row. -/
theorem source9Axis8CoordinateBlock_orthogonal (A : H) :
    (source9Axis8CoordinateBlock A)ᵀ * source9Axis8CoordinateBlock A = 1 := by
  ext i j
  have h := congrArg (fun T : M9 => T i.castSucc j.castSucc) (target_orthogonality A)
  change (∑ k : SpaceIndex, M A k i.castSucc * M A k j.castSucc) =
    (1 : M9) i.castSucc j.castSucc at h
  rw [Fin.sum_univ_castSucc (fun k : SpaceIndex => M A k i.castSucc * M A k j.castSucc),
    source9Axis8Target_lastRow_castSucc, zero_mul, add_zero] at h
  change (∑ k : Fin 8, M A k.castSucc i.castSucc * M A k.castSucc j.castSucc) =
    (1 : M8) i j
  have hident : (1 : M9) i.castSucc j.castSucc = (1 : M8) i j := by
    simp only [Matrix.one_apply, Fin.castSucc_inj]
  exact h.trans hident

/-- Last-column Laplace expansion has exactly the original upper-left minor. -/
theorem source9Axis8Target_det_eq_coordinateBlock (A : H) :
    (M A).det = (source9Axis8CoordinateBlock A).det := by
  have hminor : (M A).submatrix (Fin.last 8).succAbove (Fin.last 8).succAbove =
      source9Axis8CoordinateBlock A := by
    simp only [Fin.succAbove_last]
    rfl
  calc
    (M A).det = (-1 : ℝ) ^ ((Fin.last 8 : Fin 9) + (Fin.last 8 : Fin 9) : ℕ) *
        M A (Fin.last 8) (Fin.last 8) *
        ((M A).submatrix (Fin.last 8).succAbove (Fin.last 8).succAbove).det := by
      rw [Matrix.det_succ_column (M A) (Fin.last 8)]
      apply Finset.sum_eq_single (Fin.last 8)
      · intro b _ hb
        have hb8 : b ≠ (8 : SpaceIndex) := by
          intro h
          exact hb (h.trans axis_last_eq.symm)
        have hz : M A b (Fin.last 8) = 0 := by
          rw [source9Axis8Target_lastColumn]
          change (Pi.single (8 : SpaceIndex) (1 : ℝ) : V) b = 0
          rw [Pi.single_apply, ite_eq_right hb8]
        simp only [hz, mul_zero, zero_mul]
      · intro hnot
        exact False.elim (hnot (Finset.mem_univ (Fin.last 8)))
    _ = (source9Axis8CoordinateBlock A).det := by
      rw [hminor, source9Axis8Target_lastColumn]
      norm_num [source9CoordinateVector, Pi.single_apply, axis_last_eq]

/-- The original determinant-one condition descends to the unchanged eight-coordinate minor. -/
theorem source9Axis8CoordinateBlock_det_one (A : H) :
    (source9Axis8CoordinateBlock A).det = 1 :=
  (source9Axis8Target_det_eq_coordinateBlock A).symm.trans
    (Matrix.mem_specialOrthogonalGroup_iff.mp (A : SO9).property).2

/-- Block multiplication is proved ONLY on the actual fixed-axis subgroup. -/
theorem source9Axis8CoordinateBlock_mul (A B : H) :
    source9Axis8CoordinateBlock (A * B) =
      source9Axis8CoordinateBlock A * source9Axis8CoordinateBlock B := by
  ext i j
  change (∑ k : SpaceIndex, M A i.castSucc k * M B k j.castSucc) =
    ∑ k : Fin 8, M A i.castSucc k.castSucc * M B k.castSucc j.castSucc
  rw [Fin.sum_univ_castSucc (fun k : SpaceIndex => M A i.castSucc k * M B k j.castSucc),
    source9Axis8Target_lastColumn_castSucc, zero_mul, add_zero]

/-- The actual matrix stabilizer restricts to the standard SO(8) on original coordinates 0..7. -/
noncomputable def source9Axis8CoordinateRestrictionHom : H →* SO8 where
  toFun A := ⟨source9Axis8CoordinateBlock A,
    Matrix.mem_specialOrthogonalGroup_iff.mpr
      ⟨(Matrix.mem_orthogonalGroup_iff' (A := source9Axis8CoordinateBlock A)).mpr
        (source9Axis8CoordinateBlock_orthogonal A), source9Axis8CoordinateBlock_det_one A⟩⟩
  map_one' := by
    apply Subtype.ext
    ext i j
    change (1 : M9) i.castSucc j.castSucc = (1 : M8) i j
    simp only [Matrix.one_apply, Fin.castSucc_inj]
  map_mul' A B := Subtype.ext (source9Axis8CoordinateBlock_mul A B)

/-- Exact entry binding; this is not an arbitrary equivalent eight-dimensional representation. -/
theorem source9Axis8CoordinateRestrictionHom_entry (A : H) (i j : Fin 8) :
    (source9Axis8CoordinateRestrictionHom A : M8) i j = M A i.castSucc j.castSucc := rfl

/-- The block and fixed row/column recover every original matrix entry. -/
theorem source9Axis8CoordinateRestrictionHom_injective :
    Function.Injective source9Axis8CoordinateRestrictionHom := by
  intro A B h
  have hblock : ∀ i j : Fin 8, M A i.castSucc j.castSucc = M B i.castSucc j.castSucc :=
    fun i j => congrArg (fun T : SO8 => (T : M8) i j) h
  apply Subtype.ext
  apply Subtype.ext
  ext i j
  rcases Fin.eq_castSucc_or_eq_last i with ⟨i, rfl⟩ | rfl
  · rcases Fin.eq_castSucc_or_eq_last j with ⟨j, rfl⟩ | rfl
    · exact hblock i j
    · simp only [source9Axis8Target_lastColumn_castSucc]
  · simp only [source9Axis8Target_lastRow]

/-- Standard original matrix subspace topologies make the exact restriction continuous. -/
theorem source9Axis8CoordinateRestrictionHom_continuous :
    Continuous (source9Axis8CoordinateRestrictionHom : H → SO8) := by
  have hm : Continuous (fun A : H => M A) :=
    continuous_subtype_val.comp continuous_subtype_val
  have hb : Continuous (fun A : H => source9Axis8CoordinateBlock A) :=
    hm.matrix_submatrix Fin.castSucc Fin.castSucc
  exact hb.subtype_mk (fun A => (source9Axis8CoordinateRestrictionHom A).property)

/-- Actual eight-coordinate vector action agrees for EVERY original nine-vector. -/
theorem source9Axis8CoordinateRestrictionHom_mulVec (A : H) (z : V) (i : Fin 8) :
    ((source9Axis8CoordinateRestrictionHom A : M8).mulVec
      (fun j : Fin 8 => z j.castSucc)) i = ((M A).mulVec z) i.castSucc := by
  change (∑ j : Fin 8, M A i.castSucc j.castSucc * z j.castSucc) =
    ∑ j : SpaceIndex, M A i.castSucc j * z j
  rw [Fin.sum_univ_castSucc (fun j : SpaceIndex => M A i.castSucc j * z j),
    source9Axis8Target_lastColumn_castSucc, zero_mul, add_zero]

#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8Target_lastColumn
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8Target_lastRow
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8Target_lastColumn_castSucc
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8Target_lastRow_castSucc
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8CoordinateBlock
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8CoordinateBlock_orthogonal
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8Target_det_eq_coordinateBlock
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8CoordinateBlock_det_one
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8CoordinateBlock_mul
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8CoordinateRestrictionHom
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8CoordinateRestrictionHom_entry
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8CoordinateRestrictionHom_injective
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8CoordinateRestrictionHom_continuous
#print axioms FCP.BFSSSourceNineAxisCoordinateRestriction.source9Axis8CoordinateRestrictionHom_mulVec
#eval IO.println "SPECTRAL_SOURCE_NINE_AXIS_COORDINATE_RESTRICTION_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineAxisCoordinateRestriction
