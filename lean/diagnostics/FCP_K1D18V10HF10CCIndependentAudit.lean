import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CCOrderedDerivativeNativeModel
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSPairedSpin9Plane
open scoped BigOperators Matrix.Norms.Elementwise
noncomputable section

example : (Fin 36 → ℝ) ≃ₗ[ℝ] (source9StrictPlaneIndex → ℝ) :=
  source9StrictPlaneParameterEquiv
example (v : Fin 36 → ℝ) (p : source9StrictPlaneIndex) :
    source9StrictPlaneParameterEquiv v p = v (source9StrictPlaneEnumeration.symm p) :=
  source9StrictPlaneParameterEquiv_apply v p
example : (Fin 36 → ℝ) ≃ₗ[ℝ] LieAlgebra.Orthogonal.so SpaceIndex ℝ :=
  source9OrderedStrictPlaneModelEquiv
example (v : Fin 36 → ℝ) :
    source9OrderedStrictPlaneModelEquiv v =
      source9StrictPlaneModelEquiv (source9StrictPlaneParameterEquiv v) := rfl
example (v : Fin 36 → ℝ) :
    ((List.finRange 36).map (fun i =>
      v i • coordinatePlane9 (source9StrictPlaneRow i) (source9StrictPlaneColumn i))).sum =
      (source9OrderedStrictPlaneModelEquiv v : Matrix SpaceIndex SpaceIndex ℝ) :=
  source9OrderedStrictPlane_sum_eq_model v

-- Use literal CA reconstruction as the codomain of the actual fderiv equality.
example (v : Fin 36 → ℝ) :
    (fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
        Matrix SpaceIndex SpaceIndex ℝ)) 0) v =
      (source9StrictPlaneModelEquiv
        (fun p : source9StrictPlaneIndex => v (source9StrictPlaneEnumeration.symm p)) :
          Matrix SpaceIndex SpaceIndex ℝ) :=
  source9OrderedStrictPlaneWord_matrix_fderiv_zero_model v
example (v : Fin 36 → ℝ) (i : Fin 36) :
    ((fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
        Matrix SpaceIndex SpaceIndex ℝ)) 0) v)
      (source9StrictPlaneRow i) (source9StrictPlaneColumn i) = v i :=
  source9OrderedStrictPlaneWord_matrix_fderiv_zero_upper v i
example : Function.Injective (fun v : Fin 36 → ℝ =>
    (fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
        Matrix SpaceIndex SpaceIndex ℝ)) 0) v) :=
  source9OrderedStrictPlaneWord_matrix_fderiv_zero_injective

-- Range is canonical skew matrices, not a surjectivity claim onto all matrices.
example (A : LieAlgebra.Orthogonal.so SpaceIndex ℝ) :
    ∃ v : Fin 36 → ℝ,
      (fderiv ℝ (fun t : Fin 36 → ℝ =>
        ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
          Matrix SpaceIndex SpaceIndex ℝ)) 0) v = A.val := by
  refine ⟨source9OrderedStrictPlaneModelEquiv.symm A, ?_⟩
  exact (source9OrderedStrictPlaneWord_matrix_fderiv_zero_model _).trans
    (congrArg (fun B : LieAlgebra.Orthogonal.so SpaceIndex ℝ => B.val)
      (source9OrderedStrictPlaneModelEquiv.apply_symm_apply A))

#print axioms FCP.BFSSPairedSpin9Clifford.source9StrictPlaneParameterEquiv
#print axioms FCP.BFSSPairedSpin9Clifford.source9StrictPlaneParameterEquiv_apply
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneModelEquiv
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlane_sum_eq_model
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWord_matrix_fderiv_zero_model
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWord_matrix_fderiv_zero_upper
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWord_matrix_fderiv_zero_injective
end
