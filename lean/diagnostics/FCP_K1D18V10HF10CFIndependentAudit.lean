import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CFSmoothStrictUpperCoordinateMap
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section
@[instance_reducible] private def auditSmoothParameterTopology :
    TopologicalSpace (Fin 36 → ℝ) := inferInstance
@[instance_reducible] private def auditSmoothMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
open scoped ContDiff Matrix.Norms.Elementwise

example : (inferInstance : TopologicalSpace (Fin 36 → ℝ)) =
    auditSmoothParameterTopology := rfl
example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditSmoothMatrixTopology := rfl
example (g : spinGroup source9Quadratic) (i j : SpaceIndex) :
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ) i j =
      source9SpinVectorConjugation g (source9CoordinateVector j) i :=
  source9NaturalMatrix_entry_eq_vectorConjugation g i j
example (n : ℕ∞ω) (j : SpaceIndex) :
    ContDiff ℝ n (fun t : Fin 36 → ℝ =>
      source9SpinVectorConjugation (source9OrderedStrictPlaneWord t)
        (source9CoordinateVector j)) := source9OrderedStrictPlaneWord_column_contDiff n j
example (n : ℕ∞ω) (i j : SpaceIndex) :
    ContDiff ℝ n (fun t : Fin 36 → ℝ =>
      ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
        Matrix SpaceIndex SpaceIndex ℝ) i j) :=
  source9OrderedStrictPlaneWord_matrix_entry_contDiff n i j
example (n : ℕ∞ω) :
    ContDiff ℝ n (fun t : Fin 36 → ℝ =>
      ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
        Matrix SpaceIndex SpaceIndex ℝ)) := source9OrderedStrictPlaneWord_matrix_contDiff n

-- Preserve the CE repair: prove a literal-function equality through the typed projection API.
private theorem auditSmoothActualUpperCoordinateMap_eq :
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

example (n : ℕ∞ω) : ContDiff ℝ n source9OrderedUpperCoordinateMap :=
  source9OrderedUpperCoordinateMap_contDiff n
example (n : ℕ∞ω) : ContDiff ℝ n
    (fun t : Fin 36 → ℝ => fun i : Fin 36 =>
      ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
        Matrix SpaceIndex SpaceIndex ℝ) (source9StrictPlaneRow i)
          (source9StrictPlaneColumn i)) := by
  have h := source9OrderedUpperCoordinateMap_contDiff n
  rw [auditSmoothActualUpperCoordinateMap_eq] at h
  exact h
example : ContDiffAt ℝ (1 : ℕ∞ω) source9OrderedUpperCoordinateMap 0 :=
  source9OrderedUpperCoordinateMap_contDiffAt_one_zero
example : HasStrictFDerivAt source9OrderedUpperCoordinateMap
    (ContinuousLinearMap.id ℝ (Fin 36 → ℝ)) 0 :=
  source9OrderedUpperCoordinateMap_hasStrictFDerivAt_zero
example : HasStrictFDerivAt
    (fun t : Fin 36 → ℝ => fun i : Fin 36 =>
      ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
        Matrix SpaceIndex SpaceIndex ℝ) (source9StrictPlaneRow i)
          (source9StrictPlaneColumn i))
    (ContinuousLinearMap.id ℝ (Fin 36 → ℝ)) 0 := by
  have h := source9OrderedUpperCoordinateMap_hasStrictFDerivAt_zero
  rw [auditSmoothActualUpperCoordinateMap_eq] at h
  exact h
example : HasFDerivAt source9OrderedUpperCoordinateMap
    (ContinuousLinearMap.id ℝ (Fin 36 → ℝ)) 0 :=
  source9OrderedUpperCoordinateMap_hasStrictFDerivAt_zero.hasFDerivAt

#print axioms FCP.BFSSPairedSpin9Clifford.source9NaturalMatrix_entry_eq_vectorConjugation
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWord_column_contDiff
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWord_matrix_entry_contDiff
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWord_matrix_contDiff
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateMap_contDiff
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateMap_contDiffAt_one_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedUpperCoordinateMap_hasStrictFDerivAt_zero
end
