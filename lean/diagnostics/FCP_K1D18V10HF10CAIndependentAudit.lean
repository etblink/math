import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CANativeStrictPlaneModel
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSPairedSpin9Plane
open scoped BigOperators
noncomputable section

example : source9StrictPlaneIndex =
    {p : SpaceIndex × SpaceIndex // p.1 < p.2} := rfl

example : Fintype.card source9StrictPlaneIndex = 36 := source9StrictPlaneIndex_card

example (c : source9StrictPlaneIndex → ℝ) : Matrix SpaceIndex SpaceIndex ℝ :=
  source9StrictPlaneMatrix c

example (c : source9StrictPlaneIndex → ℝ) :
    (source9StrictPlaneMatrix c).transpose = -source9StrictPlaneMatrix c :=
  source9StrictPlaneMatrix_transpose c

example : (source9StrictPlaneIndex → ℝ) ≃ₗ[ℝ]
    LieAlgebra.Orthogonal.so SpaceIndex ℝ := source9StrictPlaneModelEquiv

example (c : source9StrictPlaneIndex → ℝ) (p : source9StrictPlaneIndex) :
    (source9StrictPlaneModelEquiv c).val p.val.1 p.val.2 = c p :=
  congrFun (source9StrictPlaneModelEquiv.symm_apply_apply c) p

example (A : LieAlgebra.Orthogonal.so SpaceIndex ℝ) (p : source9StrictPlaneIndex) :
    source9StrictPlaneModelEquiv.symm A p = A.val p.val.1 p.val.2 :=
  source9StrictPlaneModelEquiv_symm_apply A p

example (A : LieAlgebra.Orthogonal.so SpaceIndex ℝ) :
    (source9StrictPlaneModelEquiv
      (fun p : source9StrictPlaneIndex => A.val p.val.1 p.val.2) :
        Matrix SpaceIndex SpaceIndex ℝ) = A.val :=
  congrArg (fun B : LieAlgebra.Orthogonal.so SpaceIndex ℝ => B.val)
    (source9StrictPlaneModelEquiv.apply_symm_apply A)

example (p : source9StrictPlaneIndex) :
    (source9StrictPlaneModelEquiv (Pi.single p (1 : ℝ)) :
      Matrix SpaceIndex SpaceIndex ℝ) = coordinatePlane9 p.val.1 p.val.2 :=
  source9StrictPlaneModelEquiv_plane p

-- Check literal E_rs - E_sr normalization separately from the reconstruction wrapper.
example (p : source9StrictPlaneIndex) :
    (source9StrictPlaneModelEquiv (Pi.single p (1 : ℝ)) :
      Matrix SpaceIndex SpaceIndex ℝ) =
      Matrix.single p.val.1 p.val.2 (1 : ℝ) - Matrix.single p.val.2 p.val.1 (1 : ℝ) :=
  (source9StrictPlaneModelEquiv_plane p).trans
    (coordinatePlane9_eq_single_sub_single p.val.1 p.val.2)

example (c : source9StrictPlaneIndex → ℝ) :
    (source9StrictPlaneModelEquiv c : Matrix SpaceIndex SpaceIndex ℝ) =
      ∑ p : source9StrictPlaneIndex, c p • coordinatePlane9 p.val.1 p.val.2 :=
  source9StrictPlaneModelEquiv_apply_sum c

-- Literal native-plane sums have unique coefficients in this nonredundant index.
example (c d : source9StrictPlaneIndex → ℝ)
    (h : (∑ p : source9StrictPlaneIndex, c p • coordinatePlane9 p.val.1 p.val.2) =
      ∑ p : source9StrictPlaneIndex, d p • coordinatePlane9 p.val.1 p.val.2) : c = d := by
  apply source9StrictPlaneModelEquiv.injective
  apply Subtype.ext
  exact (source9StrictPlaneModelEquiv_apply_sum c).trans
    (h.trans (source9StrictPlaneModelEquiv_apply_sum d).symm)

#print axioms FCP.BFSSPairedSpin9Clifford.source9StrictPlaneIndex_card
#print axioms FCP.BFSSPairedSpin9Clifford.source9StrictPlaneMatrix
#print axioms FCP.BFSSPairedSpin9Clifford.source9StrictPlaneMatrix_transpose
#print axioms FCP.BFSSPairedSpin9Clifford.source9StrictPlaneModelEquiv
#print axioms FCP.BFSSPairedSpin9Clifford.source9StrictPlaneModelEquiv_symm_apply
#print axioms FCP.BFSSPairedSpin9Clifford.source9StrictPlaneModelEquiv_plane
#print axioms FCP.BFSSPairedSpin9Clifford.source9StrictPlaneModelEquiv_apply_sum

end
