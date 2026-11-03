import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CGUpperCoordinateLocalInverse
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section
@[instance_reducible] private def auditInverseParameterTopology :
    TopologicalSpace (Fin 36 → ℝ) := inferInstance
open scoped Topology Matrix.Norms.Elementwise

example : (inferInstance : TopologicalSpace (Fin 36 → ℝ)) =
    auditInverseParameterTopology := rfl
example : CompleteSpace (Fin 36 → ℝ) := inferInstance
example : ((ContinuousLinearEquiv.refl ℝ (Fin 36 → ℝ)) :
    (Fin 36 → ℝ) →L[ℝ] (Fin 36 → ℝ)) = ContinuousLinearMap.id ℝ (Fin 36 → ℝ) := rfl
example : HasStrictFDerivAt source9OrderedUpperCoordinateMap
    ((ContinuousLinearEquiv.refl ℝ (Fin 36 → ℝ)) :
      (Fin 36 → ℝ) →L[ℝ] (Fin 36 → ℝ)) 0 :=
  source9OrderedUpperCoordinateMap_hasStrictFDerivAt_refl
example : OpenPartialHomeomorph (Fin 36 → ℝ) (Fin 36 → ℝ) :=
  source9OrderedUpperCoordinateLocalHomeomorph
example : (source9OrderedUpperCoordinateLocalHomeomorph :
    (Fin 36 → ℝ) → (Fin 36 → ℝ)) = source9OrderedUpperCoordinateMap :=
  source9OrderedUpperCoordinateLocalHomeomorph_coe
example : (0 : Fin 36 → ℝ) ∈ source9OrderedUpperCoordinateLocalHomeomorph.source :=
  source9OrderedUpperCoordinateLocalHomeomorph_zero_mem_source
example : (0 : Fin 36 → ℝ) ∈ source9OrderedUpperCoordinateLocalHomeomorph.target :=
  source9OrderedUpperCoordinateLocalHomeomorph_zero_mem_target
example : source9OrderedUpperCoordinateLocalHomeomorph.source ∈ 𝓝 (0 : Fin 36 → ℝ) :=
  source9OrderedUpperCoordinateLocalHomeomorph.open_source.mem_nhds
    source9OrderedUpperCoordinateLocalHomeomorph_zero_mem_source
example : source9OrderedUpperCoordinateLocalHomeomorph.target ∈ 𝓝 (0 : Fin 36 → ℝ) :=
  source9OrderedUpperCoordinateLocalHomeomorph.open_target.mem_nhds
    source9OrderedUpperCoordinateLocalHomeomorph_zero_mem_target
example : ContinuousAt source9OrderedUpperCoordinateLocalHomeomorph.symm (0 : Fin 36 → ℝ) :=
  source9OrderedUpperCoordinateLocalHomeomorph.continuousAt_symm
    source9OrderedUpperCoordinateLocalHomeomorph_zero_mem_target
example (t : Fin 36 → ℝ) (ht : t ∈ source9OrderedUpperCoordinateLocalHomeomorph.source) :
    source9OrderedUpperCoordinateLocalHomeomorph.symm (source9OrderedUpperCoordinateMap t) = t :=
  source9OrderedUpperCoordinateLocalHomeomorph_left_inv t ht
example (y : Fin 36 → ℝ) (hy : y ∈ source9OrderedUpperCoordinateLocalHomeomorph.target) :
    source9OrderedUpperCoordinateMap (source9OrderedUpperCoordinateLocalHomeomorph.symm y) = y :=
  source9OrderedUpperCoordinateLocalHomeomorph_right_inv y hy
example : source9OrderedUpperCoordinateLocalHomeomorph.symm (0 : Fin 36 → ℝ) = 0 := by
  have h := source9OrderedUpperCoordinateLocalHomeomorph_left_inv 0
    source9OrderedUpperCoordinateLocalHomeomorph_zero_mem_source
  rw [source9OrderedUpperCoordinateMap_zero] at h
  exact h

-- Retain the accepted explicit actual-function bridge rather than deep normalization.
private theorem auditInverseActualUpperCoordinateMap_eq :
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
example (t : Fin 36 → ℝ) (i : Fin 36) :
    source9OrderedUpperCoordinateLocalHomeomorph t i =
      ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
        Matrix SpaceIndex SpaceIndex ℝ) (source9StrictPlaneRow i)
          (source9StrictPlaneColumn i) :=
  (congrFun (congrFun source9OrderedUpperCoordinateLocalHomeomorph_coe t) i).trans
    (congrFun (congrFun auditInverseActualUpperCoordinateMap_eq t) i)
example (t : Fin 36 → ℝ) (ht : t ∈ source9OrderedUpperCoordinateLocalHomeomorph.source) :
    source9OrderedUpperCoordinateLocalHomeomorph.symm
      (fun i : Fin 36 =>
        ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
          Matrix SpaceIndex SpaceIndex ℝ) (source9StrictPlaneRow i)
            (source9StrictPlaneColumn i)) = t := by
  have heq := congrFun auditInverseActualUpperCoordinateMap_eq t
  exact (congrArg (fun y : Fin 36 → ℝ =>
    source9OrderedUpperCoordinateLocalHomeomorph.symm y) heq).symm.trans
      (source9OrderedUpperCoordinateLocalHomeomorph_left_inv t ht)

example (y : Fin 36 → ℝ) (hy : y ∈ source9OrderedUpperCoordinateLocalHomeomorph.target)
    (i : Fin 36) :
    ((source9SpinVectorOrthogonalHom
      (source9OrderedStrictPlaneWord (source9OrderedUpperCoordinateLocalHomeomorph.symm y))) :
        Matrix SpaceIndex SpaceIndex ℝ) (source9StrictPlaneRow i)
          (source9StrictPlaneColumn i) = y i := by
  have heq := congrFun (congrFun auditInverseActualUpperCoordinateMap_eq
    (source9OrderedUpperCoordinateLocalHomeomorph.symm y)) i
  exact heq.symm.trans
    (congrFun (source9OrderedUpperCoordinateLocalHomeomorph_right_inv y hy) i)

#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateMap_hasStrictFDerivAt_refl
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateLocalHomeomorph
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateLocalHomeomorph_coe
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateLocalHomeomorph_zero_mem_source
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateLocalHomeomorph_zero_mem_target
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateLocalHomeomorph_left_inv
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateLocalHomeomorph_right_inv
end
