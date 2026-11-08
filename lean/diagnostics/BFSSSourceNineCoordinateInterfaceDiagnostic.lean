import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Basic.Real.Basic
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Data.Matrix.Diagonal
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.SuccPred
import Mathlib.Algebra.BigOperators.Fin

/-!
Bounded **exploratory** Mathlib-only diagnostic for the original SO(9) coordinate
restriction source failure, run #42454470502. This does NOT prove a BFSS source
theorem: the original candidate source, its 14 declarations, independent
consumer, manifest and workflow are intentionally unchanged.

Test the exact Fin 9/Fin 8 and Matrix APIs responsible for the first source
diagnostics before another expensive 134-ancestor strict compilation.
-/
set_option autoImplicit false

namespace FCP.BFSSSourceNineCoordinateInterfaceDiagnostic
noncomputable section
open Matrix

private abbrev V9 := Fin 9 → ℝ
private abbrev M9 := Matrix (Fin 9) (Fin 9) ℝ
private abbrev M8 := Matrix (Fin 8) (Fin 8) ℝ
private abbrev axis : V9 := Pi.single (8 : Fin 9) (1 : ℝ)

/-- Explicit bridge between the source literal coordinate 8 and Fin.last. -/
theorem last_index_eq : (Fin.last 8 : Fin 9) = (8 : Fin 9) := by decide

/-- Exact fixed-column proof at an arbitrary source-labelled matrix. -/
theorem last_column (A : M9) (hfix : A.mulVec axis = axis) (i : Fin 9) :
    A i (Fin.last 8) = axis i := by
  have h : A i (8 : Fin 9) = axis i := by
    simpa only [axis, Matrix.mulVec_single_one, Matrix.col_apply] using congrFun hfix i
  simpa only [last_index_eq] using h

/-- Explicitly typed Pi.single avoids the inferred dependent-family error. -/
theorem upper_column_zero (A : M9) (hfix : A.mulVec axis = axis) (i : Fin 8) :
    A i.castSucc (Fin.last 8) = 0 := by
  rw [last_column A hfix]
  change (Pi.single (8 : Fin 9) (1 : ℝ) : V9) i.castSucc = 0
  have hn : (i.castSucc : Fin 9) ≠ (8 : Fin 9) := by
    intro h
    apply Fin.castSucc_ne_last i
    exact h.trans last_index_eq.symm
  rw [Pi.single_apply, if_neg hn]

/-- Transpose-times-matrix and the fixed column recover the original last row. -/
theorem last_row (A : M9) (hfix : A.mulVec axis = axis)
    (horth : Aᵀ * A = 1) (j : Fin 9) :
    A (Fin.last 8) j = axis j := by
  have hsum : (∑ k : Fin 9, axis k * A k j) = (1 : M9) (Fin.last 8) j := by
    simpa only [Matrix.mul_apply, Matrix.transpose_apply, last_column A hfix] using
      (congrArg (fun T : M9 => T (Fin.last 8) j) horth)
  calc
    A (Fin.last 8) j = (axis ⬝ᵥ fun k : Fin 9 => A k j) := by
      simp only [axis, single_one_dotProduct, last_index_eq]
    _ = (1 : M9) (Fin.last 8) j := by
      change (∑ k : Fin 9, axis k * A k j) = (1 : M9) (Fin.last 8) j
      exact hsum
    _ = axis j := by
      rw [last_index_eq]
      simp [axis, Matrix.one_apply, Pi.single_apply, eq_comm]

theorem upper_row_zero (A : M9) (hfix : A.mulVec axis = axis)
    (horth : Aᵀ * A = 1) (j : Fin 8) :
    A (Fin.last 8) j.castSucc = 0 := by
  rw [last_row A hfix horth]
  change (Pi.single (8 : Fin 9) (1 : ℝ) : V9) j.castSucc = 0
  have hn : (j.castSucc : Fin 9) ≠ (8 : Fin 9) := by
    intro h
    exact Fin.castSucc_ne_last j (h.trans last_index_eq.symm)
  rw [Pi.single_apply, if_neg hn]

/-- The explicit identity-entry transport avoided by an inferred simp. -/
theorem identity_entry (i j : Fin 8) :
    (1 : M9) i.castSucc j.castSucc = (1 : M8) i j := by
  simp only [Matrix.one_apply, Fin.castSucc_inj]

/-- Pinned Matrix.submatrix_one provides a structural map_one proof. -/
theorem identity_block :
    (1 : M9).submatrix Fin.castSucc Fin.castSucc = (1 : M8) :=
  Matrix.submatrix_one Fin.castSucc (Fin.castSucc_injective 8)

/-- The eight-block's orthogonality is a checked nine-index sum decomposition. -/
theorem orthogonal_block (A : M9) (hfix : A.mulVec axis = axis)
    (horth : Aᵀ * A = 1) :
    (A.submatrix Fin.castSucc Fin.castSucc)ᵀ *
      A.submatrix Fin.castSucc Fin.castSucc = (1 : M8) := by
  ext i j
  have h := congrArg (fun T : M9 => T i.castSucc j.castSucc) horth
  change (∑ k : Fin 9, A k i.castSucc * A k j.castSucc) =
    (1 : M9) i.castSucc j.castSucc at h
  rw [Fin.sum_univ_castSucc (fun k : Fin 9 => A k i.castSucc * A k j.castSucc),
    upper_row_zero A hfix horth, zero_mul, add_zero] at h
  change (∑ k : Fin 8, A k.castSucc i.castSucc * A k.castSucc j.castSucc) =
    (1 : M8) i j
  exact h.trans (identity_entry i j)

/-- The last-column determinant expansion has the exact ordered 8x8 minor. -/
theorem det_eq_block (A : M9) (hfix : A.mulVec axis = axis) :
    A.det = (A.submatrix Fin.castSucc Fin.castSucc).det := by
  have hminor : A.submatrix (Fin.last 8).succAbove (Fin.last 8).succAbove =
      A.submatrix Fin.castSucc Fin.castSucc := by
    simp only [Fin.succAbove_last]
  calc
    A.det = (-1 : ℝ) ^ ((Fin.last 8 : Fin 9) + (Fin.last 8 : Fin 9) : ℕ) *
        A (Fin.last 8) (Fin.last 8) *
        (A.submatrix (Fin.last 8).succAbove (Fin.last 8).succAbove).det := by
      rw [Matrix.det_succ_column A (Fin.last 8)]
      apply Finset.sum_eq_single (Fin.last 8)
      · intro b _ hb
        have hb8 : b ≠ (8 : Fin 9) := by
          intro h
          exact hb (h.trans last_index_eq.symm)
        have hz : A b (Fin.last 8) = 0 := by
          rw [last_column A hfix]
          change (Pi.single (8 : Fin 9) (1 : ℝ) : V9) b = 0
          rw [Pi.single_apply, if_neg hb8]
        simp only [hz, mul_zero, zero_mul]
      · intro hnot
        exact False.elim (hnot (Finset.mem_univ (Fin.last 8)))
    _ = (A.submatrix Fin.castSucc Fin.castSucc).det := by
      rw [hminor, last_column A hfix]
      norm_num [axis, Pi.single_apply, last_index_eq]

#print axioms FCP.BFSSSourceNineCoordinateInterfaceDiagnostic.last_index_eq
#print axioms FCP.BFSSSourceNineCoordinateInterfaceDiagnostic.last_column
#print axioms FCP.BFSSSourceNineCoordinateInterfaceDiagnostic.upper_column_zero
#print axioms FCP.BFSSSourceNineCoordinateInterfaceDiagnostic.last_row
#print axioms FCP.BFSSSourceNineCoordinateInterfaceDiagnostic.upper_row_zero
#print axioms FCP.BFSSSourceNineCoordinateInterfaceDiagnostic.identity_entry
#print axioms FCP.BFSSSourceNineCoordinateInterfaceDiagnostic.identity_block
#print axioms FCP.BFSSSourceNineCoordinateInterfaceDiagnostic.orthogonal_block
#print axioms FCP.BFSSSourceNineCoordinateInterfaceDiagnostic.det_eq_block
#eval IO.println "BFSS_SOURCE_NINE_COORDINATE_INTERFACE_DIAGNOSTIC_COMPLETE"

end
end FCP.BFSSSourceNineCoordinateInterfaceDiagnostic
