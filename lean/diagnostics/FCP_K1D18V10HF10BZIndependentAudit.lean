import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10BZFullNaturalMatrixWordDerivative
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSPairedSpin9Plane
noncomputable section

-- Capture the standard matrix product topology before enabling the scoped norm.
private def auditNaturalMatrixProductTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance

open scoped Matrix.Norms.Elementwise

example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditNaturalMatrixProductTopology := rfl

example {k : ℕ} (r s : Fin k → SpaceIndex) (l : List (Fin k)) :
    (Fin k → ℝ) →L[ℝ] Matrix SpaceIndex SpaceIndex ℝ :=
  source9PlaneWordMatrixVelocity r s l

-- Every assembled entry is the accepted original-vector derivative on its literal column.
example {k : ℕ} (r s : Fin k → SpaceIndex) (l : List (Fin k))
    (v : Fin k → ℝ) (i j : SpaceIndex) :
    source9PlaneWordMatrixVelocity r s l v i j =
      source9PlaneWordVectorVelocity r s (source9CoordinateVector j) l v i := rfl

example {k : ℕ} (r s : Fin k → SpaceIndex) (l : List (Fin k)) (v : Fin k → ℝ) :
    source9PlaneWordMatrixVelocity r s l v =
      (l.map (fun a => v a • coordinatePlane9 (r a) (s a))).sum :=
  source9PlaneWordMatrixVelocity_apply r s l v

example {k : ℕ} (r s : Fin k → SpaceIndex) :
    source9PlaneWordMatrixVelocity r s [] = 0 := by
  apply ContinuousLinearMap.ext
  intro v
  apply Matrix.ext
  intro i j
  rfl

-- An explicit repeated-index control retains both full matrix contributions.
example (r s : Fin 1 → SpaceIndex) (v : Fin 1 → ℝ) :
    source9PlaneWordMatrixVelocity r s [0, 0] v =
      v 0 • coordinatePlane9 (r 0) (s 0) +
        v 0 • coordinatePlane9 (r 0) (s 0) := by
  rw [source9PlaneWordMatrixVelocity_apply]
  simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero]

example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ a, r a ≠ s a)
    (l : List (Fin k)) (i j : SpaceIndex) :
    HasFDerivAt
      (fun t : Fin k → ℝ => source9SpinVectorMatrixHom (source9PlaneSpinWord r s hrs t l) i j)
      ((ContinuousLinearMap.proj i : (SpaceIndex → ℝ) →L[ℝ] ℝ).comp
        (source9PlaneWordVectorVelocity r s (source9CoordinateVector j) l)) 0 :=
  source9PlaneSpinWord_vectorMatrix_entry_hasFDerivAt_zero r s hrs l i j

example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ a, r a ≠ s a) (l : List (Fin k)) :
    HasFDerivAt
      (fun t : Fin k → ℝ =>
        ((source9SpinVectorOrthogonalHom (source9PlaneSpinWord r s hrs t l)) :
          Matrix SpaceIndex SpaceIndex ℝ))
      (source9PlaneWordMatrixVelocity r s l) 0 :=
  source9PlaneSpinWord_vectorOrthogonalMatrix_hasFDerivAt_zero r s hrs l

example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ a, r a ≠ s a) (l : List (Fin k)) :
    fderiv ℝ
      (fun t : Fin k → ℝ =>
        ((source9SpinVectorOrthogonalHom (source9PlaneSpinWord r s hrs t l)) :
          Matrix SpaceIndex SpaceIndex ℝ)) 0 =
      source9PlaneWordMatrixVelocity r s l :=
  source9PlaneSpinWord_vectorOrthogonalMatrix_fderiv_zero r s hrs l

-- Final actual fderiv control uses the literal matrix sum without its velocity wrapper.
example {k : ℕ} (r s : Fin k → SpaceIndex) (hrs : ∀ a, r a ≠ s a)
    (l : List (Fin k)) (v : Fin k → ℝ) :
    (fderiv ℝ
      (fun t : Fin k → ℝ =>
        ((source9SpinVectorOrthogonalHom (source9PlaneSpinWord r s hrs t l)) :
          Matrix SpaceIndex SpaceIndex ℝ)) 0) v =
      (l.map (fun a => v a • coordinatePlane9 (r a) (s a))).sum :=
  source9PlaneSpinWord_vectorOrthogonalMatrix_fderiv_zero_apply r s hrs l v

example (r s : SpaceIndex) :
    coordinatePlane9 r s =
      (Matrix.single r s (1 : ℝ) - Matrix.single s r (1 : ℝ)) :=
  coordinatePlane9_eq_single_sub_single r s

#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneWordMatrixVelocity
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneWordMatrixVelocity_apply
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWord_vectorMatrix_entry_hasFDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWord_vectorOrthogonalMatrix_hasFDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWord_vectorOrthogonalMatrix_fderiv_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9PlaneSpinWord_vectorOrthogonalMatrix_fderiv_zero_apply

end
