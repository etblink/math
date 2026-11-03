import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CHInverseRegularityLocalInjectivity
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section
@[instance_reducible] private def auditRegularityParameterTopology :
    TopologicalSpace (Fin 36 → ℝ) := inferInstance
open scoped Topology ContDiff Matrix.Norms.Elementwise

example : (inferInstance : TopologicalSpace (Fin 36 → ℝ)) =
    auditRegularityParameterTopology := rfl
example : CompleteSpace (Fin 36 → ℝ) := inferInstance
example : source9OrderedUpperCoordinateLocalHomeomorph.symm (0 : Fin 36 → ℝ) = 0 :=
  source9OrderedUpperCoordinateLocalHomeomorph_symm_zero
example : HasStrictFDerivAt source9OrderedUpperCoordinateLocalHomeomorph.symm
    (ContinuousLinearMap.id ℝ (Fin 36 → ℝ)) 0 :=
  source9OrderedUpperCoordinateLocalHomeomorph_symm_hasStrictFDerivAt_zero
example : HasFDerivAt source9OrderedUpperCoordinateLocalHomeomorph.symm
    (ContinuousLinearMap.id ℝ (Fin 36 → ℝ)) 0 :=
  source9OrderedUpperCoordinateLocalHomeomorph_symm_hasFDerivAt_zero
example : fderiv ℝ source9OrderedUpperCoordinateLocalHomeomorph.symm 0 =
    ContinuousLinearMap.id ℝ (Fin 36 → ℝ) :=
  source9OrderedUpperCoordinateLocalHomeomorph_symm_fderiv_zero
example (v : Fin 36 → ℝ) (i : Fin 36) :
    (fderiv ℝ source9OrderedUpperCoordinateLocalHomeomorph.symm 0) v i = v i :=
  congrArg (fun L : (Fin 36 → ℝ) →L[ℝ] (Fin 36 → ℝ) => L v i)
    source9OrderedUpperCoordinateLocalHomeomorph_symm_fderiv_zero
example (n : ℕ∞ω) : ContDiffAt ℝ n source9OrderedUpperCoordinateLocalHomeomorph.symm 0 :=
  source9OrderedUpperCoordinateLocalHomeomorph_symm_contDiffAt_zero n
example : Set.InjOn source9OrderedUpperCoordinateMap
    source9OrderedUpperCoordinateLocalHomeomorph.source :=
  source9OrderedUpperCoordinateMap_injOn_source

private theorem auditRegularityActualUpperCoordinateMap_eq :
    source9OrderedUpperCoordinateMap =
      (fun t : Fin 36 → ℝ => fun i : Fin 36 =>
        ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
          Matrix SpaceIndex SpaceIndex ℝ) (source9StrictPlaneRow i)
            (source9StrictPlaneColumn i)) := by
  funext t i
  unfold source9OrderedUpperCoordinateMap
  exact source9OrderedUpperProjection_apply
    ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
      Matrix SpaceIndex SpaceIndex ℝ) i
example : Set.InjOn (fun t : Fin 36 → ℝ => fun i : Fin 36 =>
    ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
      Matrix SpaceIndex SpaceIndex ℝ) (source9StrictPlaneRow i)
        (source9StrictPlaneColumn i))
    source9OrderedUpperCoordinateLocalHomeomorph.source := by
  rw [← auditRegularityActualUpperCoordinateMap_eq]
  exact source9OrderedUpperCoordinateMap_injOn_source
example : Set.InjOn (fun t : Fin 36 → ℝ =>
    ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
      Matrix SpaceIndex SpaceIndex ℝ))
    source9OrderedUpperCoordinateLocalHomeomorph.source :=
  source9OrderedStrictPlaneWord_matrix_injOn_source
example (t u : Fin 36 → ℝ)
    (ht : t ∈ source9OrderedUpperCoordinateLocalHomeomorph.source)
    (hu : u ∈ source9OrderedUpperCoordinateLocalHomeomorph.source)
    (h : ∀ i j : SpaceIndex,
      ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
        Matrix SpaceIndex SpaceIndex ℝ) i j =
      ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord u)) :
        Matrix SpaceIndex SpaceIndex ℝ) i j) : t = u := by
  apply source9OrderedStrictPlaneWord_matrix_injOn_source ht hu
  funext i j
  exact h i j
example : Set.InjOn source9OrderedStrictPlaneWord
    source9OrderedUpperCoordinateLocalHomeomorph.source :=
  source9OrderedStrictPlaneWord_injOn_source
example : Set.InjOn (fun t : Fin 36 → ℝ =>
    source9PlaneSpinWord source9StrictPlaneRow source9StrictPlaneColumn
      source9StrictPlaneEnumeration_ne t (List.finRange 36))
    source9OrderedUpperCoordinateLocalHomeomorph.source := by
  change Set.InjOn source9OrderedStrictPlaneWord
    source9OrderedUpperCoordinateLocalHomeomorph.source
  exact source9OrderedStrictPlaneWord_injOn_source
example (t : Fin 36 → ℝ)
    (ht : t ∈ source9OrderedUpperCoordinateLocalHomeomorph.source)
    (h : source9OrderedStrictPlaneWord t = (1 : spinGroup source9Quadratic)) : t = 0 :=
  source9OrderedStrictPlaneWord_injOn_source ht
    source9OrderedUpperCoordinateLocalHomeomorph_zero_mem_source
    (h.trans source9OrderedStrictPlaneWord_zero.symm)

#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateLocalHomeomorph_symm_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateLocalHomeomorph_symm_hasStrictFDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateLocalHomeomorph_symm_hasFDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateLocalHomeomorph_symm_fderiv_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateLocalHomeomorph_symm_contDiffAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateMap_injOn_source
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWord_matrix_injOn_source
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWord_injOn_source
end
