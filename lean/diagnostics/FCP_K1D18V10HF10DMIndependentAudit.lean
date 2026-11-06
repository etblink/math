import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DMNativeSO16ContinuousModel

set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSGamma9
open scoped Topology ContDiff BigOperators Matrix.Norms.Elementwise
attribute [local instance 100] LieRing.ofAssociativeRing

local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditDMPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditDMPBWCoordinates.toAddMonoidHom auditDMPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditDMPBWCoordinates

@[instance_reducible] private def auditDMSpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditDMParameterTopology :
    TopologicalSpace (Fin 36 → ℝ) := inferInstance
@[instance_reducible] private def auditDMCliffordTopology :
    TopologicalSpace (CliffordAlgebra source9Quadratic) := inferInstance
@[instance_reducible] private def auditDMMatrixTopology :
    TopologicalSpace GammaMatrix := inferInstance
local instance f10dmAuditChartedSpace :
    ChartedSpace (Fin 36 → ℝ) (spinGroup source9Quadratic) := source9SpinTranslatedChartedSpace
local instance f10dmAuditMatrixChartedSpace :
    ChartedSpace GammaMatrix GammaMatrix := chartedSpaceSelf GammaMatrix

local instance f10dmAuditNativeSkewIsTopologicalAddGroup :
    IsTopologicalAddGroup (LieAlgebra.Orthogonal.so SpinIndex ℝ) :=
  inferInstanceAs (IsTopologicalAddGroup
    ↥((LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule))
local instance f10dmAuditNativeSkewContinuousSMul :
    ContinuousSMul ℝ (LieAlgebra.Orthogonal.so SpinIndex ℝ) :=
  inferInstanceAs (ContinuousSMul ℝ
    ↥((LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule))

private abbrev P := Fin 36 → ℝ
private abbrev G := spinGroup source9Quadratic
private abbrev C := CliffordAlgebra source9Quadratic
private abbrev M := GammaMatrix
private abbrev I := modelWithCornersSelf ℝ P
private abbrev J := modelWithCornersSelf ℝ C
private abbrev K : ModelWithCorners ℝ M M := modelWithCornersSelf ℝ M
private abbrev T := TangentSpace I (1 : G)
private abbrev R := source9IdentityChartDerivativeRange
private abbrev gammaCLM : C →L[ℝ] M := source9OriginalGammaEvaluationCLM
private abbrev inclusionD : T →L[ℝ] C := source9SpinIdentityInclusionDifferential
private abbrev E : T ≃ₗ[ℝ] R := source9SpinIdentityTangentRangeEquiv
private abbrev D : T →L[ℝ] M := source9SpinIdentityGammaDifferential
private abbrev matrixMap : G → M := fun g => ((source9SpinGammaSpecialOrthogonalHom g) : M)
private abbrev S := LieAlgebra.Orthogonal.so SpaceIndex ℝ
private abbrev F : T ≃ₗ[ℝ] S := source9SpinIdentityNativeSkewLinearEquiv
private abbrev rho : S →ₗ[ℝ] M :=
  (LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule.subtype.comp
    coordinateToOriginalGammaSkewLieHom.toLinearMap

private abbrev S16 := LieAlgebra.Orthogonal.so SpinIndex ℝ
private abbrev Q := gamma16StrictPlaneIndex → ℝ
private abbrev nativeD : T →L[ℝ] S16 :=
  D.codRestrict (LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule
    source9SpinIdentityGammaDifferential_mem_so
private abbrev Y : T →L[ℝ] Q := source9SpinIdentityGammaTargetCoordinateCLM

-- Ground the canonical target data before consuming any native manifold interface.
example : ChartedSpace M M := inferInstance
example : (inferInstance : ChartedSpace M M) = chartedSpaceSelf M := rfl
example : chartAt M (0 : M) = OpenPartialHomeomorph.refl M := rfl
example : ModelWithCorners ℝ M M := K
example : LieRing M := inferInstance
example : LieAlgebra ℝ M := inferInstance
example (A B : M) : (⁅A, B⁆ : M) = A * B - B * A := rfl

example : M = Matrix SpinIndex SpinIndex ℝ := rfl
example : Fintype.card (Fin 36) = 36 := by decide
example : Fintype.card SpaceIndex = 9 := by decide
example : Fintype.card SpinIndex = 16 := by decide
example : NormedSpace ℝ C := inferInstance
example : source9PBWCoordinates = auditDMPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    C (Finset SpaceIndex → ℝ)
    auditDMPBWCoordinates.toAddMonoidHom auditDMPBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    C (Finset SpaceIndex → ℝ) auditDMPBWCoordinates := rfl
example : (inferInstance : TopologicalSpace G) = auditDMSpinTopology := rfl
example : (inferInstance : TopologicalSpace P) = auditDMParameterTopology := rfl
example : (inferInstance : TopologicalSpace C) = auditDMCliffordTopology := rfl
example : (inferInstance : TopologicalSpace M) = auditDMMatrixTopology := rfl
example : (inferInstance : TopologicalSpace G) =
    TopologicalSpace.induced (Subtype.val : G → C) auditDMCliffordTopology := rfl
example : (inferInstance : ChartedSpace P G) = source9SpinTranslatedChartedSpace := rfl
example : atlas P G = Set.range source9SpinLeftTranslatedChart := rfl
example (g : G) : chartAt P g = source9SpinLeftTranslatedChart g := rfl
example : IsManifold I ∞ G := source9SpinTranslatedAtlas_isManifold ∞
example (x : C) : gammaCLM x = source9GammaCliffordAlgHom x := source9OriginalGammaEvaluationCLM_apply x

-- Consume all nine public interfaces on the literal F10BC map and actual source tangent.
example : matrixMap = (gammaCLM : C → M) ∘ (Subtype.val : G → C) :=
  source9SpinGammaAmbient_eq_eval
example : MDifferentiableAt I K matrixMap (1 : G) := source9SpinGammaAmbient_mdifferentiableAt
example : D =
    (NormedSpace.fromTangentSpace (𝕜 := ℝ) (matrixMap (1 : G))).toContinuousLinearMap.comp
      (mfderiv I K matrixMap (1 : G)) := rfl
example : D = gammaCLM.comp inclusionD := source9SpinIdentityGammaDifferential_factor
example (v : T) : D v = source9GammaCliffordAlgHom (inclusionD v) :=
  source9SpinIdentityGammaDifferential_apply v
example (x : R) : D (E.symm x) = source9GammaCliffordAlgHom (x : C) :=
  source9SpinIdentityGammaDifferential_range_apply x
example (A : LieAlgebra.Orthogonal.so SpaceIndex ℝ) :
    D (E.symm (source9NativeSkewDerivativeRangeEquiv A)) =
      (coordinateToOriginalGammaSkewLieHom A : M) := source9SpinIdentityGammaDifferential_native_apply A
example (v : T) : D v ∈ LieAlgebra.Orthogonal.so SpinIndex ℝ :=
  source9SpinIdentityGammaDifferential_mem_so v
example : D.toLinearMap =
    ((LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule.subtype.comp
      coordinateToOriginalGammaSkewLieHom.toLinearMap).comp
        (source9NativeSkewDerivativeRangeEquiv.symm.toLinearMap.comp E.toLinearMap) :=
  source9SpinIdentityGammaDifferential_factor_linear

-- Bind imported witnesses at complete consumer types before applying native generic methods.
example : HasMFDerivAt I K matrixMap (1 : G) (mfderiv I K matrixMap (1 : G)) := by
  have hMap : MDifferentiableAt I K matrixMap (1 : G) := source9SpinGammaAmbient_mdifferentiableAt
  exact hMap.hasMFDerivAt
example : ContinuousAt matrixMap (1 : G) := by
  have hMap : MDifferentiableAt I K matrixMap (1 : G) := source9SpinGammaAmbient_mdifferentiableAt
  exact hMap.continuousAt
example (v : T) (a b : SpinIndex) : D v a b = source9GammaCliffordAlgHom (inclusionD v) a b :=
  congrArg (fun X : M => X a b) (source9SpinIdentityGammaDifferential_apply v)

-- Original scalar normalization on arbitrary native inputs and original coordinate planes.
example (A : LieAlgebra.Orthogonal.so SpaceIndex ℝ) :
    D (E.symm (source9NativeSkewDerivativeRangeEquiv A)) =
      (1 / 4 : ℝ) • ∑ r : SpaceIndex, ∑ s : SpaceIndex, A.val r s • (gamma r * gamma s) := by
  have hcoeff : (coordinateToOriginalGammaSkewLieHom A : M) =
      (1 / 4 : ℝ) • ∑ r : SpaceIndex, ∑ s : SpaceIndex, A.val r s • (gamma r * gamma s) :=
    coordinateToOriginalGammaLinearMap_apply A.val
  exact (source9SpinIdentityGammaDifferential_native_apply A).trans hcoeff
example (r s : SpaceIndex) (hrs : r ≠ s) :
    D (E.symm (source9NativeSkewDerivativeRangeEquiv (source9CoordinatePlaneInSo r s))) =
      (1 / 2 : ℝ) • (gamma r * gamma s) :=
  (source9SpinIdentityGammaDifferential_native_apply (source9CoordinatePlaneInSo r s)).trans
    (coordinateToOriginalGammaSkewLieHom_coordinatePlane_apply r s hrs)
example : matrixMap (1 : G) = 1 := by
  have h : source9SpinGammaSpecialOrthogonalHom (1 : G) = 1 :=
    map_one source9SpinGammaSpecialOrthogonalHom
  exact congrArg (fun A : Matrix.specialOrthogonalGroup SpinIndex ℝ => (A : M)) h
example : ¬ Function.Injective (fun g : G =>
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)) :=
  source9NaturalMatrix_not_injective

-- Consume every new interface on the actual tangent and original gamma matrix carrier.
example (A : S) : (coordinateToOriginalGammaSkewLieHom A : M) =
    ∑ p : Source9OrderedGammaPairIndex,
      (A.val p.val.1 p.val.2 * (1 / 2 : ℝ)) • source9OrderedGammaPairMatrix p :=
  coordinateToOriginalGammaSkewLieHom_orderedPair_sum A
example : Function.Injective (fun A : S => (coordinateToOriginalGammaSkewLieHom A : M)) :=
  coordinateToOriginalGammaSkewLieHom_matrix_injective
example : F = E.trans source9NativeSkewDerivativeRangeEquiv.symm := rfl
example (v : T) : D v = (coordinateToOriginalGammaSkewLieHom (F v) : M) :=
  source9SpinIdentityGammaDifferential_native_factor v
example : Function.Injective D := source9SpinIdentityGammaDifferential_injective
example : D.toLinearMap.ker = ⊥ := source9SpinIdentityGammaDifferential_ker
example : D.toLinearMap.range = rho.range := source9SpinIdentityGammaDifferential_range
example : Module.finrank ℝ T = 36 := source9SpinIdentityTangent_finrank
example : Module.finrank ℝ D.toLinearMap.range = 36 :=
  source9SpinIdentityGammaDifferential_range_finrank

-- Consequences distinguish infinitesimal injectivity from global group claims.
example (v : T) : D v = 0 ↔ v = 0 := by
  constructor
  · intro h
    apply source9SpinIdentityGammaDifferential_injective
    exact h.trans (map_zero D).symm
  · rintro rfl
    exact map_zero D
example (v w : T) : D v = D w ↔ v = w := by
  constructor
  · exact fun h => source9SpinIdentityGammaDifferential_injective h
  · exact fun h => congrArg D h

-- Exact target subtype topology and finite-dimensional model, independent of a group atlas.
example : IsTopologicalAddGroup S16 := inferInstance
example : ContinuousSMul ℝ S16 := inferInstance
example : (inferInstance : TopologicalSpace S16) =
    TopologicalSpace.induced (fun A : S16 => A.val) auditDMMatrixTopology := rfl
example : FiniteDimensional ℝ Q := inferInstance
example : FiniteDimensional ℝ S16 := gamma16StrictPlaneModelEquiv.finiteDimensional

-- Consume all fifteen new public interfaces at their complete original carrier types.
example : Fintype.card gamma16StrictPlaneIndex = 120 := gamma16StrictPlaneIndex_card
example (c : Q) (i j : SpinIndex) : gamma16StrictPlaneMatrix c i j =
    (if h : i < j then c ⟨(i, j), h⟩
      else if h : j < i then -c ⟨(j, i), h⟩ else 0) := rfl
example (c : Q) : (gamma16StrictPlaneMatrix c).transpose = -gamma16StrictPlaneMatrix c :=
  gamma16StrictPlaneMatrix_transpose c
example : Q ≃ₗ[ℝ] S16 := gamma16StrictPlaneModelEquiv
example (A : S16) (p : gamma16StrictPlaneIndex) :
    gamma16StrictPlaneModelEquiv.symm A p = A.val p.val.1 p.val.2 :=
  gamma16StrictPlaneModelEquiv_symm_apply A p
example (c : Q) : (gamma16StrictPlaneModelEquiv c : M) = gamma16StrictPlaneMatrix c :=
  gamma16StrictPlaneModelEquiv_apply c
example : gamma16StrictPlaneModelContinuousEquiv.toLinearEquiv =
    gamma16StrictPlaneModelEquiv := rfl
example : Module.finrank ℝ S16 = 120 := gamma16NativeSkew_finrank
example : gamma16StrictPlaneAmbientCLM =
    (LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule.subtypeL.comp
      gamma16StrictPlaneModelContinuousEquiv.toContinuousLinearMap := rfl
example (c : Q) : gamma16StrictPlaneAmbientCLM c = gamma16StrictPlaneMatrix c :=
  gamma16StrictPlaneAmbientCLM_apply c
example : Y = gamma16StrictPlaneModelContinuousEquiv.symm.toContinuousLinearMap.comp nativeD := rfl
example (v : T) (p : gamma16StrictPlaneIndex) : Y v p = D v p.val.1 p.val.2 :=
  source9SpinIdentityGammaTargetCoordinateCLM_apply v p
example : D = gamma16StrictPlaneAmbientCLM.comp Y := source9SpinIdentityGammaTargetCoordinateCLM_factor
example : Function.Injective Y := source9SpinIdentityGammaTargetCoordinateCLM_injective
example : Module.finrank ℝ Y.toLinearMap.range = 36 :=
  source9SpinIdentityGammaTargetCoordinateCLM_range_finrank

example : Continuous (gamma16StrictPlaneModelContinuousEquiv : Q → S16) :=
  gamma16StrictPlaneModelContinuousEquiv.continuous
example : Continuous (gamma16StrictPlaneModelContinuousEquiv.symm : S16 → Q) :=
  gamma16StrictPlaneModelContinuousEquiv.symm.continuous

#print axioms gamma16StrictPlaneIndex_card
#print axioms gamma16StrictPlaneMatrix
#print axioms gamma16StrictPlaneMatrix_transpose
#print axioms gamma16StrictPlaneModelEquiv
#print axioms gamma16StrictPlaneModelEquiv_symm_apply
#print axioms gamma16StrictPlaneModelEquiv_apply
#print axioms gamma16StrictPlaneModelContinuousEquiv
#print axioms gamma16NativeSkew_finrank
#print axioms gamma16StrictPlaneAmbientCLM
#print axioms gamma16StrictPlaneAmbientCLM_apply
#print axioms source9SpinIdentityGammaTargetCoordinateCLM
#print axioms source9SpinIdentityGammaTargetCoordinateCLM_apply
#print axioms source9SpinIdentityGammaTargetCoordinateCLM_factor
#print axioms source9SpinIdentityGammaTargetCoordinateCLM_injective
#print axioms source9SpinIdentityGammaTargetCoordinateCLM_range_finrank
end
end FCP.BFSSPairedSpin9Clifford
