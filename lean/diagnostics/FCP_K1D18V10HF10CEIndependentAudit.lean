import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CEUpperCoordinateIdentityDerivative
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section
@[instance_reducible] private def auditStandardUpperParameterTopology :
    TopologicalSpace (Fin 36 → ℝ) := inferInstance
@[instance_reducible] private def auditStandardUpperMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
open scoped Matrix.Norms.Elementwise

example : (inferInstance : TopologicalSpace (Fin 36 → ℝ)) =
    auditStandardUpperParameterTopology := rfl
example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditStandardUpperMatrixTopology := rfl
example : Matrix SpaceIndex SpaceIndex ℝ →L[ℝ] (Fin 36 → ℝ) :=
  source9OrderedUpperProjection
example (A : Matrix SpaceIndex SpaceIndex ℝ) (i : Fin 36) :
    source9OrderedUpperProjection A i =
      A (source9StrictPlaneRow i) (source9StrictPlaneColumn i) :=
  source9OrderedUpperProjection_apply A i
example : source9OrderedUpperProjection (1 : Matrix SpaceIndex SpaceIndex ℝ) = 0 := by
  funext i
  change source9OrderedUpperProjection (1 : Matrix SpaceIndex SpaceIndex ℝ) i = (0 : ℝ)
  rw [source9OrderedUpperProjection_apply]
  simp only [Matrix.one_apply, ite_eq_right (source9StrictPlaneEnumeration_ne i)]

-- Expose only the map wrapper, then use the typed projection theorem on the actual matrix.
private theorem auditActualUpperCoordinateMap_eq :
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
    source9OrderedUpperCoordinateMap t i =
      ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
        Matrix SpaceIndex SpaceIndex ℝ) (source9StrictPlaneRow i)
          (source9StrictPlaneColumn i) :=
  congrFun (congrFun auditActualUpperCoordinateMap_eq t) i
example : source9OrderedUpperCoordinateMap 0 = 0 := source9OrderedUpperCoordinateMap_zero
example : source9OrderedUpperProjection.comp
    (source9PlaneWordMatrixVelocity source9StrictPlaneRow source9StrictPlaneColumn
      (List.finRange 36)) = ContinuousLinearMap.id ℝ (Fin 36 → ℝ) :=
  source9OrderedUpperProjection_wordVelocity

-- Exact literal actual-map derivative: no abstract model replaces the group word.
example : HasFDerivAt
    (fun t : Fin 36 → ℝ => fun i : Fin 36 =>
      ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
        Matrix SpaceIndex SpaceIndex ℝ) (source9StrictPlaneRow i)
          (source9StrictPlaneColumn i))
    (ContinuousLinearMap.id ℝ (Fin 36 → ℝ)) 0 := by
  have h := source9OrderedUpperCoordinateMap_hasFDerivAt_zero
  rw [auditActualUpperCoordinateMap_eq] at h
  exact h
example : fderiv ℝ source9OrderedUpperCoordinateMap 0 =
    ContinuousLinearMap.id ℝ (Fin 36 → ℝ) := source9OrderedUpperCoordinateMap_fderiv_zero
example (v : Fin 36 → ℝ) :
    (fderiv ℝ source9OrderedUpperCoordinateMap 0) v = v :=
  congrArg (fun L : (Fin 36 → ℝ) →L[ℝ] (Fin 36 → ℝ) => L v)
    source9OrderedUpperCoordinateMap_fderiv_zero

#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperProjection
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperProjection_apply
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateMap
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateMap_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperProjection_wordVelocity
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateMap_hasFDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateMap_fderiv_zero
end
