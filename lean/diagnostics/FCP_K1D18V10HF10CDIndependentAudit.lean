import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CDContinuousNativeModel
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSPairedSpin9Clifford
noncomputable section

-- Use the accepted class-definition reducibility style from the BZ audit.
@[instance_reducible] private def auditStandardMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
@[instance_reducible] private def auditStandardParameterTopology :
    TopologicalSpace (Fin 36 → ℝ) := inferInstance
open scoped Matrix.Norms.Elementwise

attribute [local instance 100] LieRing.ofAssociativeRing

-- Independently derive the required structures through standard submodule instances.
example : IsTopologicalAddGroup (LieAlgebra.Orthogonal.so SpaceIndex ℝ) :=
  inferInstanceAs (IsTopologicalAddGroup
    ↥((LieAlgebra.Orthogonal.so SpaceIndex ℝ).toSubmodule))
example : ContinuousSMul ℝ (LieAlgebra.Orthogonal.so SpaceIndex ℝ) :=
  inferInstanceAs (ContinuousSMul ℝ
    ↥((LieAlgebra.Orthogonal.so SpaceIndex ℝ).toSubmodule))

example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditStandardMatrixTopology := rfl
example : (inferInstance : TopologicalSpace (Fin 36 → ℝ)) =
    auditStandardParameterTopology := rfl
example : (inferInstance : TopologicalSpace (LieAlgebra.Orthogonal.so SpaceIndex ℝ)) =
    TopologicalSpace.induced
      (fun A : LieAlgebra.Orthogonal.so SpaceIndex ℝ => A.val)
      auditStandardMatrixTopology := rfl
example : (inferInstance : TopologicalSpace (LieAlgebra.Orthogonal.so SpaceIndex ℝ)) =
    TopologicalSpace.induced
      (fun A : LieAlgebra.Orthogonal.so SpaceIndex ℝ => A.val)
      (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) :=
  source9NativeSkewTopology_induced
example : FiniteDimensional ℝ (Fin 36 → ℝ) := inferInstance
example : FiniteDimensional ℝ (LieAlgebra.Orthogonal.so SpaceIndex ℝ) :=
  source9OrderedStrictPlaneModelEquiv.finiteDimensional
example : (Fin 36 → ℝ) ≃L[ℝ] LieAlgebra.Orthogonal.so SpaceIndex ℝ :=
  source9OrderedStrictPlaneModelContinuousEquiv
example : source9OrderedStrictPlaneModelContinuousEquiv.toLinearEquiv =
    source9OrderedStrictPlaneModelEquiv :=
  source9OrderedStrictPlaneModelContinuousEquiv_toLinearEquiv
example (v : Fin 36 → ℝ) :
    source9OrderedStrictPlaneModelContinuousEquiv v =
      source9StrictPlaneModelEquiv (source9StrictPlaneParameterEquiv v) := rfl
example : Continuous source9OrderedStrictPlaneModelContinuousEquiv :=
  source9OrderedStrictPlaneModelContinuousEquiv_continuous
example : Continuous source9OrderedStrictPlaneModelContinuousEquiv.symm :=
  source9OrderedStrictPlaneModelContinuousEquiv_symm_continuous
example (A : LieAlgebra.Orthogonal.so SpaceIndex ℝ) (i : Fin 36) :
    source9OrderedStrictPlaneModelContinuousEquiv.symm A i =
      A.val (source9StrictPlaneRow i) (source9StrictPlaneColumn i) :=
  source9OrderedStrictPlaneModelContinuousEquiv_symm_apply A i
example (v : Fin 36 → ℝ) :
    (fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinVectorOrthogonalHom (source9OrderedStrictPlaneWord t)) :
        Matrix SpaceIndex SpaceIndex ℝ)) 0) v =
      (source9OrderedStrictPlaneModelContinuousEquiv v : Matrix SpaceIndex SpaceIndex ℝ) :=
  source9OrderedStrictPlaneWord_matrix_fderiv_zero_continuousModel v
example (A : LieAlgebra.Orthogonal.so SpaceIndex ℝ) :
    source9OrderedStrictPlaneModelContinuousEquiv
      (source9OrderedStrictPlaneModelContinuousEquiv.symm A) = A :=
  source9OrderedStrictPlaneModelContinuousEquiv.apply_symm_apply A

#print axioms FCP.BFSSPairedSpin9Clifford.source9NativeSkewTopology_induced
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneModelContinuousEquiv
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneModelContinuousEquiv_toLinearEquiv
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneModelContinuousEquiv_continuous
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneModelContinuousEquiv_symm_continuous
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneWord_matrix_fderiv_zero_continuousModel
#print axioms FCP.BFSSPairedSpin9Clifford.source9OrderedStrictPlaneModelContinuousEquiv_symm_apply
end
