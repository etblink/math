import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CBOrderedStrictPlaneWord
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSPairedSpin9Plane
open scoped Matrix.Norms.Elementwise
noncomputable section

example : Fin 36 ≃ {p : SpaceIndex × SpaceIndex // p.1 < p.2} :=
  source9StrictPlaneEnumeration
example : Function.Bijective source9StrictPlaneEnumeration :=
  source9StrictPlaneEnumeration_bijective
example (p : source9StrictPlaneIndex) : ∃! i, source9StrictPlaneEnumeration i = p := by
  refine ⟨source9StrictPlaneEnumeration.symm p,
    source9StrictPlaneEnumeration.apply_symm_apply p, ?_⟩
  intro i hi
  exact source9StrictPlaneEnumeration.injective
    (hi.trans (source9StrictPlaneEnumeration.apply_symm_apply p).symm)
example (i : Fin 36) :
    source9StrictPlaneRow i = (source9StrictPlaneEnumeration i).val.1 := rfl
example (i : Fin 36) :
    source9StrictPlaneColumn i = (source9StrictPlaneEnumeration i).val.2 := rfl
example (i : Fin 36) : source9StrictPlaneRow i ≠ source9StrictPlaneColumn i :=
  source9StrictPlaneEnumeration_ne i
example : (List.finRange 36).length = 36 := by decide
example : (List.finRange 36).Nodup := by decide
example (i : Fin 36) : i ∈ List.finRange 36 := by simp
example (t : Fin 36 → ℝ) : spinGroup source9Quadratic := source9OrderedStrictPlaneWord t
example (t : Fin 36 → ℝ) :
    source9OrderedStrictPlaneWord t =
      ((List.finRange 36).map (fun i => source9PlaneSpinCurve
        (source9StrictPlaneRow i) (source9StrictPlaneColumn i)
        (source9StrictPlaneEnumeration_ne i) (t i))).prod :=
  source9PlaneSpinWord_eq_listProd source9StrictPlaneRow source9StrictPlaneColumn
    source9StrictPlaneEnumeration_ne t (List.finRange 36)
example : source9OrderedStrictPlaneWord 0 = 1 := source9OrderedStrictPlaneWord_zero
example : HasFDerivAt
    (fun t : Fin 36 → ℝ =>
      ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
        Matrix SpaceIndex SpaceIndex ℝ))
    (source9PlaneWordMatrixVelocity source9StrictPlaneRow source9StrictPlaneColumn
      (List.finRange 36)) 0 := source9OrderedStrictPlaneWord_matrix_hasFDerivAt_zero
example (v : Fin 36 → ℝ) :
    (fderiv ℝ
      (fun t : Fin 36 → ℝ =>
        ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
          Matrix SpaceIndex SpaceIndex ℝ)) 0) v =
      ((List.finRange 36).map (fun i =>
        v i • coordinatePlane9 (source9StrictPlaneRow i) (source9StrictPlaneColumn i))).sum :=
  source9OrderedStrictPlaneWord_matrix_fderiv_zero_apply v
example (i : Fin 36) :
    coordinatePlane9 (source9StrictPlaneRow i) (source9StrictPlaneColumn i) =
      Matrix.single (source9StrictPlaneRow i) (source9StrictPlaneColumn i) (1 : ℝ) -
        Matrix.single (source9StrictPlaneColumn i) (source9StrictPlaneRow i) (1 : ℝ) :=
  coordinatePlane9_eq_single_sub_single _ _

#print axioms FCP.BFSSPairedSpin9Clifford.source9StrictPlaneEnumeration
#print axioms FCP.BFSSPairedSpin9Clifford.source9StrictPlaneEnumeration_bijective
#print axioms FCP.BFSSPairedSpin9Clifford.source9StrictPlaneEnumeration_ne
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWord
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWord_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWord_matrix_hasFDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWord_matrix_fderiv_zero_apply
end
