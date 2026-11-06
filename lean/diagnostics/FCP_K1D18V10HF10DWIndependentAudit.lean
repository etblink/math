import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DWNativeRepresentationDifferentiability

set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSGamma9
open scoped Topology ContDiff BigOperators Matrix.Norms.Elementwise
attribute [local instance 100] LieRing.ofAssociativeRing

local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditDWPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditDWPBWCoordinates.toAddMonoidHom auditDWPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditDWPBWCoordinates

@[instance_reducible] private def auditDWSpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditDWParameterTopology :
    TopologicalSpace (Fin 36 → ℝ) := inferInstance
@[instance_reducible] private def auditDWCliffordTopology :
    TopologicalSpace (CliffordAlgebra source9Quadratic) := inferInstance
@[instance_reducible] private def auditDWMatrixTopology :
    TopologicalSpace GammaMatrix := inferInstance
local instance f10dwAuditChartedSpace :
    ChartedSpace (Fin 36 → ℝ) (spinGroup source9Quadratic) := source9SpinTranslatedChartedSpace
local instance f10dwAuditMatrixChartedSpace :
    ChartedSpace GammaMatrix GammaMatrix := chartedSpaceSelf GammaMatrix

local instance f10dwAuditNativeSkewIsTopologicalAddGroup :
    IsTopologicalAddGroup (LieAlgebra.Orthogonal.so SpinIndex ℝ) :=
  inferInstanceAs (IsTopologicalAddGroup
    ↥((LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule))
local instance f10dwAuditNativeSkewContinuousSMul :
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

private abbrev A : Q →L[ℝ] M := gamma16StrictPlaneAmbientCLM
private abbrev U : Set Q := gamma16CayleySource
private abbrev SO := Matrix.specialOrthogonalGroup SpinIndex ℝ
private abbrev CM : Q → M := gamma16CayleyMatrix

private abbrev V : Set SO := gamma16CayleyTarget
private abbrev BM : SO → M := gamma16CayleyBackwardMatrix
private abbrev BC : V → Q := gamma16CayleyBackwardCoordinates

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
example : source9PBWCoordinates = auditDWPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    C (Finset SpaceIndex → ℝ)
    auditDWPBWCoordinates.toAddMonoidHom auditDWPBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    C (Finset SpaceIndex → ℝ) auditDWPBWCoordinates := rfl
example : (inferInstance : TopologicalSpace G) = auditDWSpinTopology := rfl
example : (inferInstance : TopologicalSpace P) = auditDWParameterTopology := rfl
example : (inferInstance : TopologicalSpace C) = auditDWCliffordTopology := rfl
example : (inferInstance : TopologicalSpace M) = auditDWMatrixTopology := rfl
example : (inferInstance : TopologicalSpace G) =
    TopologicalSpace.induced (Subtype.val : G → C) auditDWCliffordTopology := rfl
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
    TopologicalSpace.induced (fun A : S16 => A.val) auditDWMatrixTopology := rfl
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

-- Literal forward formula and all fifteen new interfaces on the actual original target.
example : U = {c : Q | (1 - A c).det ≠ 0} := rfl
example (c : Q) : CM c = (1 + A c) * (1 - A c)⁻¹ := rfl
example (c : Q) : (A c).transpose = -A c := gamma16CayleyModel_transpose c
example (c : Q) : (1 - A c).transpose = 1 + A c := gamma16CayleyDenominator_transpose c
example (c : Q) : (1 + A c).transpose = 1 - A c := gamma16CayleyNumerator_transpose c
example (c : Q) : (1 + A c).det = (1 - A c).det := gamma16CayleyNumerator_det c
example : IsOpen U := gamma16CayleySource_isOpen
example : (0 : Q) ∈ U := gamma16CayleySource_zero
example : CM (0 : Q) = 1 := gamma16CayleyMatrix_zero
example (c : Q) (hc : c ∈ U) : (CM c).transpose * CM c = 1 :=
  gamma16CayleyMatrix_orthogonal c hc
example (c : Q) (hc : c ∈ U) : (CM c).det = 1 := gamma16CayleyMatrix_det c hc
example (c : Q) (hc : c ∈ U) : CM c ∈ SO := gamma16CayleyMatrix_mem_so c hc
example : U → SO := gamma16CayleySO
example (c : U) : (gamma16CayleySO c : M) = CM c.val := gamma16CayleySO_apply c
example : Continuous (gamma16CayleySO : U → SO) := gamma16CayleySO_continuous

-- Both subtypes retain the original induced topologies; zero maps to the actual identity matrix.
example : (inferInstance : TopologicalSpace SO) =
    TopologicalSpace.induced (fun g : SO => (g : M)) auditDWMatrixTopology := rfl
example : (inferInstance : TopologicalSpace U) =
    TopologicalSpace.induced (Subtype.val : U → Q) (inferInstance : TopologicalSpace Q) := rfl
example : (gamma16CayleySO ⟨0, gamma16CayleySource_zero⟩ : M) = 1 :=
  (gamma16CayleySO_apply _).trans gamma16CayleyMatrix_zero
example (c : U) : (gamma16CayleySO c : M).det = 1 :=
  gamma16CayleyMatrix_det c.val c.property

-- Full original group target, literal backward matrix, and all seventeen new interfaces.
example : V = {r : SO | ((r : M) + 1).det ≠ 0} := rfl
example (r : SO) : BM r = ((r : M) - 1) * ((r : M) + 1)⁻¹ := rfl
example : IsOpen V := gamma16CayleyTarget_isOpen
example : (1 : SO) ∈ V := gamma16CayleyTarget_one
example : BM (1 : SO) = 0 := gamma16CayleyBackwardMatrix_one
example (r : SO) : (r : M).transpose * (r : M) = 1 := gamma16CayleyTarget_orthogonal r
example (r : SO) (hr : r ∈ V) : (BM r).transpose = -BM r :=
  gamma16CayleyBackwardMatrix_transpose r hr
example (r : SO) (hr : r ∈ V) : BM r ∈ LieAlgebra.Orthogonal.so SpinIndex ℝ :=
  gamma16CayleyBackwardMatrix_mem_so r hr
example : V → S16 := gamma16CayleyBackwardSkew
example (r : V) : (gamma16CayleyBackwardSkew r : M) = BM r.val :=
  gamma16CayleyBackwardSkew_apply r
example : Continuous (fun r : V => BM r.val) := gamma16CayleyBackwardMatrix_continuous
example : Continuous (gamma16CayleyBackwardSkew : V → S16) := gamma16CayleyBackwardSkew_continuous
example (r : V) : BC r = gamma16StrictPlaneModelContinuousEquiv.symm (gamma16CayleyBackwardSkew r) := rfl
example (r : V) (p : gamma16StrictPlaneIndex) : BC r p = BM r.val p.val.1 p.val.2 :=
  gamma16CayleyBackwardCoordinates_apply r p
example (r : V) : A (BC r) = BM r.val := gamma16CayleyBackwardCoordinates_reconstruct r
example : Continuous BC := gamma16CayleyBackwardCoordinates_continuous
example : BC ⟨1, gamma16CayleyTarget_one⟩ = 0 := gamma16CayleyBackwardCoordinates_one

example : (inferInstance : TopologicalSpace V) =
    TopologicalSpace.induced (Subtype.val : V → SO) (inferInstance : TopologicalSpace SO) := rfl

-- Exact membership, two-sided inverse laws, and the homeomorphism of the original open subtypes.
example : Function.Injective A := gamma16CayleyModel_injective
example : (1 + 1 : M).det ≠ 0 := gamma16CayleyTwo_det_ne_zero
example (c : U) : CM c.val + 1 = (1 + 1 : M) * (1 - A c.val)⁻¹ :=
  gamma16CayleyForward_add_one c
example (c : U) : CM c.val - 1 = ((1 + 1 : M) * A c.val) * (1 - A c.val)⁻¹ :=
  gamma16CayleyForward_sub_one c
example (c : U) : (CM c.val + 1).det ≠ 0 := gamma16CayleyForward_add_one_det_ne_zero c
example (c : U) : gamma16CayleySO c ∈ V := gamma16CayleyForward_mem_target c
example (c : U) : gamma16CayleyForwardTarget c = ⟨gamma16CayleySO c, gamma16CayleyForward_mem_target c⟩ := rfl
example (c : U) : BM (gamma16CayleySO c) = A c.val := gamma16CayleyBackwardMatrix_forward c
example (c : U) : BC (gamma16CayleyForwardTarget c) = c.val :=
  gamma16CayleyBackwardCoordinates_forward c
example (r : V) : 1 - BM r.val = (1 + 1 : M) * ((r.val : M) + 1)⁻¹ :=
  gamma16CayleyBackward_one_sub r
example (r : V) : 1 + BM r.val = ((1 + 1 : M) * (r.val : M)) * ((r.val : M) + 1)⁻¹ :=
  gamma16CayleyBackward_one_add r
example (r : V) : (1 - BM r.val).det ≠ 0 := gamma16CayleyBackward_one_sub_det_ne_zero r
example (r : V) : BC r ∈ U := gamma16CayleyBackward_mem_source r
example (r : V) : gamma16CayleyBackwardSource r = ⟨BC r, gamma16CayleyBackward_mem_source r⟩ := rfl
example (r : V) : CM (BC r) = (r.val : M) := gamma16CayleyForwardMatrix_backward r
example (r : V) : gamma16CayleySO (gamma16CayleyBackwardSource r) = r.val :=
  gamma16CayleyForwardSO_backward r
example (c : U) : gamma16CayleyBackwardSource (gamma16CayleyForwardTarget c) = c :=
  gamma16CayleyBackward_forward c
example (r : V) : gamma16CayleyForwardTarget (gamma16CayleyBackwardSource r) = r :=
  gamma16CayleyForward_backward r
example : Continuous (gamma16CayleyForwardTarget : U → V) := gamma16CayleyForwardTarget_continuous
example : Continuous (gamma16CayleyBackwardSource : V → U) := gamma16CayleyBackwardSource_continuous
example : U ≃ₜ V := gamma16CayleyDomainHomeomorph
example (c : U) : gamma16CayleyDomainHomeomorph c = gamma16CayleyForwardTarget c :=
  gamma16CayleyDomainHomeomorph_apply c
example (r : V) : gamma16CayleyDomainHomeomorph.symm r = gamma16CayleyBackwardSource r :=
  gamma16CayleyDomainHomeomorph_symm_apply r
example : gamma16CayleyDomainHomeomorph ⟨0, gamma16CayleySource_zero⟩ = ⟨1, gamma16CayleyTarget_one⟩ :=
  gamma16CayleyDomainHomeomorph_zero


-- Consume every new interface in the original native group and coordinate topology.
private abbrev CH : OpenPartialHomeomorph SO Q := gamma16CayleyOpenPartialHomeomorph

example : SO → Q := gamma16CayleyChart
example : Q → SO := gamma16CayleyChartInv
example (r : SO) (hr : r ∈ V) : gamma16CayleyChart r = BC ⟨r, hr⟩ :=
  gamma16CayleyChart_apply r hr
example (c : Q) (hc : c ∈ U) : gamma16CayleyChartInv c = gamma16CayleySO ⟨c, hc⟩ :=
  gamma16CayleyChartInv_apply c hc
example (r : SO) (hr : r ∈ V) : gamma16CayleyChart r ∈ U :=
  gamma16CayleyChart_mem_target r hr
example (c : Q) (hc : c ∈ U) : gamma16CayleyChartInv c ∈ V :=
  gamma16CayleyChartInv_mem_source c hc
example (r : SO) (hr : r ∈ V) : gamma16CayleyChartInv (gamma16CayleyChart r) = r :=
  gamma16CayleyChart_left_inv r hr
example (c : Q) (hc : c ∈ U) : gamma16CayleyChart (gamma16CayleyChartInv c) = c :=
  gamma16CayleyChart_right_inv c hc
example : ContinuousOn gamma16CayleyChart V := gamma16CayleyChart_continuousOn
example : ContinuousOn gamma16CayleyChartInv U := gamma16CayleyChartInv_continuousOn
example : gamma16CayleyChart (1 : SO) = 0 := gamma16CayleyChart_one
example : gamma16CayleyChartInv (0 : Q) = 1 := gamma16CayleyChartInv_zero
example : OpenPartialHomeomorph (Matrix.specialOrthogonalGroup SpinIndex ℝ)
    (gamma16StrictPlaneIndex → ℝ) := gamma16CayleyOpenPartialHomeomorph
example : CH.source = V := gamma16CayleyOpenPartialHomeomorph_source
example : CH.target = U := gamma16CayleyOpenPartialHomeomorph_target
example (r : SO) : CH r = gamma16CayleyChart r := gamma16CayleyOpenPartialHomeomorph_apply r
example (c : Q) : CH.symm c = gamma16CayleyChartInv c :=
  gamma16CayleyOpenPartialHomeomorph_symm_apply c
example : CH (1 : SO) = 0 := gamma16CayleyOpenPartialHomeomorph_one
example : CH.symm (0 : Q) = 1 := gamma16CayleyOpenPartialHomeomorph_symm_zero
example : (1 : SO) ∈ CH.source := gamma16CayleyOpenPartialHomeomorph_source_one
example : (0 : Q) ∈ CH.target := gamma16CayleyOpenPartialHomeomorph_target_zero

-- Literal domain/formula controls and the bundled fields, rather than only named aliases.
example : CH.source = {r : SO | ((r : M) + 1).det ≠ 0} := rfl
example : CH.target = {c : Q | (1 - A c).det ≠ 0} := rfl
example (r : SO) (hr : r ∈ V) (p : gamma16StrictPlaneIndex) :
    gamma16CayleyChart r p = (((r : M) - 1) * ((r : M) + 1)⁻¹) p.val.1 p.val.2 := by
  rw [gamma16CayleyChart_apply r hr, gamma16CayleyBackwardCoordinates_apply]
  rfl
example (c : Q) (hc : c ∈ U) :
    (gamma16CayleyChartInv c : M) = (1 + A c) * (1 - A c)⁻¹ := by
  rw [gamma16CayleyChartInv_apply c hc, gamma16CayleySO_apply]
  rfl
example (r : SO) (hr : r ∈ V) : CH.symm (CH r) = r := CH.left_inv hr
example (c : Q) (hc : c ∈ U) : CH (CH.symm c) = c := CH.right_inv hc
example : ContinuousOn CH V := CH.continuousOn
example : ContinuousOn CH.symm U := CH.continuousOn_symm
example : IsOpen CH.source := CH.open_source
example : IsOpen CH.target := CH.open_target

-- Consume every new target interface in the unchanged, original matrix-subtype topology.
example (g : SO) : ((g⁻¹ : SO) : M) = (g : M).transpose := gamma16SO_inv_coe_eq_transpose g
example : Continuous (fun g : SO => g⁻¹) := gamma16SO_inv_continuous
example : Continuous (fun gh : SO × SO => gh.1 * gh.2) := gamma16SO_mul_continuous
example : IsTopologicalGroup SO := gamma16SO_isTopologicalGroup
example : (inferInstance : TopologicalSpace SO) =
    TopologicalSpace.induced (Subtype.val : SO → M) (inferInstance : TopologicalSpace M) := rfl
example (g h : SO) : ((g * h : SO) : M) = (g : M) * (h : M) := rfl
example (g : SO) : OpenPartialHomeomorph SO Q := gamma16SOLeftTranslatedChart g
example (g : SO) : (gamma16SOLeftTranslatedChart g).source =
    (fun h : SO => g⁻¹ * h) ⁻¹' V := gamma16SOLeftTranslatedChart_source g
example (g : SO) : (gamma16SOLeftTranslatedChart g).target = U :=
  gamma16SOLeftTranslatedChart_target g
example (g h : SO) : gamma16SOLeftTranslatedChart g h = CH (g⁻¹ * h) :=
  gamma16SOLeftTranslatedChart_apply g h
example (g : SO) (c : Q) : (gamma16SOLeftTranslatedChart g).symm c =
    g * gamma16CayleyChartInv c := gamma16SOLeftTranslatedChart_symm_apply g c
example (g : SO) : g ∈ (gamma16SOLeftTranslatedChart g).source :=
  gamma16SOLeftTranslatedChart_self_mem_source g
example (g : SO) : gamma16SOLeftTranslatedChart g g = 0 := gamma16SOLeftTranslatedChart_self g
example : ChartedSpace Q SO := gamma16SOTranslatedChartedSpace
example (g h : SO) (c : Q) :
    gamma16SOLeftTranslatedChart g ((gamma16SOLeftTranslatedChart h).symm c) =
      CH (g⁻¹ * (h * gamma16CayleyChartInv c)) :=
  gamma16SOLeftTranslatedChart_transition_apply g h c
example (g h : SO) :
    ((gamma16SOLeftTranslatedChart h).symm.trans (gamma16SOLeftTranslatedChart g)).source =
      U ∩ (fun c : Q => g⁻¹ * (h * gamma16CayleyChartInv c)) ⁻¹' V :=
  gamma16SOLeftTranslatedChart_transition_source g h

-- Install only the named target atlas locally and inspect its actual bundled fields.
local instance f10dwAuditSOChartedSpace : ChartedSpace Q SO := gamma16SOTranslatedChartedSpace
example : (inferInstance : ChartedSpace Q SO) = gamma16SOTranslatedChartedSpace := rfl
example : atlas Q SO = Set.range gamma16SOLeftTranslatedChart := rfl
example (g : SO) : chartAt Q g = gamma16SOLeftTranslatedChart g := rfl
example (g : SO) : g ∈ (chartAt Q g).source := mem_chart_source Q g
example (g : SO) : chartAt Q g ∈ atlas Q SO := chart_mem_atlas Q g
example (g : SO) : chartAt Q g g = 0 := gamma16SOLeftTranslatedChart_self g

-- Consume all ambient regularity interfaces without replacing any original matrix instance.
example (i j : SpinIndex) : M →L[ℝ] ℝ := gamma16MatrixEntryCLM i j
example (i j : SpinIndex) (B : M) : gamma16MatrixEntryCLM i j B = B i j :=
  gamma16MatrixEntryCLM_apply i j B
example (n : ℕ∞ω) : ContDiff ℝ n (Matrix.det : M → ℝ) := gamma16Matrix_det_contDiff n
example (n : ℕ∞ω) (j : SpinIndex) (row : SpinIndex → ℝ) :
    ContDiff ℝ n (fun B : M => B.updateRow j row) := gamma16Matrix_updateRow_contDiff n j row
example (n : ℕ∞ω) : ContDiff ℝ n (Matrix.adjugate : M → M) := gamma16Matrix_adjugate_contDiff n
example (n : ℕ∞ω) : ContDiff ℝ n (fun B : M × M => B.1 * B.2) := gamma16Matrix_mul_contDiff n
example (n : ℕ∞ω) (B : M) (hB : B.det ≠ 0) : ContDiffAt ℝ n (Inv.inv : M → M) B :=
  gamma16Matrix_inv_contDiffAt n B hB
example (n : ℕ∞ω) (c : Q) (hc : c ∈ U) : ContDiffAt ℝ n CM c :=
  gamma16CayleyMatrix_contDiffAt n c hc
example (n : ℕ∞ω) : ContDiffOn ℝ n CM U := gamma16CayleyMatrix_contDiffOn n
example : M → M := gamma16CayleyBackwardAmbientMatrix
example (r : SO) : gamma16CayleyBackwardAmbientMatrix (r : M) = BM r :=
  gamma16CayleyBackwardAmbientMatrix_eq_native r
example (n : ℕ∞ω) (B : M) (hB : (B + 1).det ≠ 0) :
    ContDiffAt ℝ n gamma16CayleyBackwardAmbientMatrix B :=
  gamma16CayleyBackwardAmbientMatrix_contDiffAt n B hB
example : M → Q := gamma16CayleyBackwardAmbientCoordinates
example (r : V) : gamma16CayleyBackwardAmbientCoordinates (r.val : M) = BC r :=
  gamma16CayleyBackwardAmbientCoordinates_eq_native r
example (n : ℕ∞ω) (B : M) (hB : (B + 1).det ≠ 0) :
    ContDiffAt ℝ n gamma16CayleyBackwardAmbientCoordinates B :=
  gamma16CayleyBackwardAmbientCoordinates_contDiffAt n B hB
example (n : ℕ∞ω) : ContDiffOn ℝ n gamma16CayleyBackwardAmbientCoordinates
    {B : M | (B + 1).det ≠ 0} := gamma16CayleyBackwardAmbientCoordinates_contDiffOn n

-- Bind the actual rational formulas, native coordinate bridge, base points and exact domains.
example (B : M) : gamma16CayleyBackwardAmbientMatrix B = (B - 1) * (B + 1)⁻¹ := rfl
example (B : M) (p : gamma16StrictPlaneIndex) : gamma16CayleyBackwardAmbientCoordinates B p =
    ((B - 1) * (B + 1)⁻¹) p.val.1 p.val.2 := rfl
example (n : ℕ∞ω) : ContDiffAt ℝ n CM (0 : Q) :=
  gamma16CayleyMatrix_contDiffAt n 0 gamma16CayleySource_zero
example (n : ℕ∞ω) : ContDiffAt ℝ n gamma16CayleyBackwardAmbientMatrix (1 : M) := by
  have h1 : (1 + 1 : M).det ≠ 0 := gamma16CayleyTarget_one
  exact gamma16CayleyBackwardAmbientMatrix_contDiffAt n 1 h1
example (n : ℕ∞ω) : ContDiffAt ℝ n gamma16CayleyBackwardAmbientCoordinates (1 : M) := by
  have h1 : (1 + 1 : M).det ≠ 0 := gamma16CayleyTarget_one
  exact gamma16CayleyBackwardAmbientCoordinates_contDiffAt n 1 h1
example (r : V) (p : gamma16StrictPlaneIndex) :
    gamma16CayleyBackwardAmbientCoordinates (r.val : M) p = BC r p :=
  congrFun (gamma16CayleyBackwardAmbientCoordinates_eq_native r) p
example (n : ℕ∞ω) : ContDiffOn ℝ n (fun c : Q => (1 + A c) * (1 - A c)⁻¹)
    {c : Q | (1 - A c).det ≠ 0} := gamma16CayleyMatrix_contDiffOn n
example (n : ℕ∞ω) : ContDiffOn ℝ n
    (fun B : M => fun p : gamma16StrictPlaneIndex => ((B - 1) * (B + 1)⁻¹) p.val.1 p.val.2)
    {B : M | (B + 1).det ≠ 0} := gamma16CayleyBackwardAmbientCoordinates_contDiffOn n

-- Bind every new interface to the original native target and its actual chart overlaps.
private abbrev overlapDT (g h : SO) : Set Q :=
  ((gamma16SOLeftTranslatedChart h).symm.trans (gamma16SOLeftTranslatedChart g)).source

example (c : Q) (hc : c ∈ U) : (gamma16CayleyChartInv c : M) = CM c :=
  gamma16CayleyChartInv_coe_on_source c hc
example (r : SO) (hr : r ∈ V) : CH r = gamma16CayleyBackwardAmbientCoordinates (r : M) :=
  gamma16CayleyChart_eq_ambient_on_target r hr
example (g h : SO) : Q → M := gamma16CayleyTransitionMatrix g h
example (g h : SO) (c : Q) (hc : c ∈ U) : gamma16CayleyTransitionMatrix g h c =
    ((g⁻¹ * (h * gamma16CayleyChartInv c) : SO) : M) :=
  gamma16CayleyTransitionMatrix_eq_native g h c hc
example (n : ℕ∞ω) (g h : SO) (c : Q) (hc : c ∈ U) :
    ContDiffAt ℝ n (gamma16CayleyTransitionMatrix g h) c :=
  gamma16CayleyTransitionMatrix_contDiffAt n g h c hc
example (g h : SO) (c : Q) (hc : c ∈ overlapDT g h) :
    c ∈ U ∧ g⁻¹ * (h * gamma16CayleyChartInv c) ∈ V :=
  gamma16CayleyTransition_overlap_conditions g h c hc
example (g h : SO) : Set.MapsTo (gamma16CayleyTransitionMatrix g h) (overlapDT g h)
    {B : M | (B + 1).det ≠ 0} := gamma16CayleyTransitionMatrix_mapsTo_backwardDomain g h
example (g h : SO) (c : Q) (hc : c ∈ overlapDT g h) :
    gamma16SOLeftTranslatedChart g ((gamma16SOLeftTranslatedChart h).symm c) =
      gamma16CayleyBackwardAmbientCoordinates (gamma16CayleyTransitionMatrix g h c) :=
  gamma16SOLeftTranslatedChart_transition_eq_ambient g h c hc
example (n : ℕ∞ω) (g h : SO) : ContDiffOn ℝ n
    (gamma16CayleyBackwardAmbientCoordinates ∘ gamma16CayleyTransitionMatrix g h)
    (overlapDT g h) := gamma16CayleyTransitionAmbient_contDiffOn n g h
example (n : ℕ∞ω) (g h : SO) : ContDiffOn ℝ n
    (fun c : Q => gamma16SOLeftTranslatedChart g ((gamma16SOLeftTranslatedChart h).symm c))
    (overlapDT g h) := gamma16SOLeftTranslatedChart_transition_contDiffOn n g h
example (n : ℕ∞ω) (e e' : OpenPartialHomeomorph SO Q)
    (he : e ∈ atlas Q SO) (he' : e' ∈ atlas Q SO) :
    ContDiffOn ℝ n (fun c : Q => e' (e.symm c)) (e.symm.trans e').source :=
  gamma16SOTranslatedAtlas_contDiffOn n e e' he he'
example (n : ℕ∞ω) : IsManifold (modelWithCornersSelf ℝ Q) n SO :=
  gamma16SOTranslatedAtlas_isManifold n
example (n : ℕ∞ω) : HasGroupoid SO (contDiffGroupoid n (modelWithCornersSelf ℝ Q)) :=
  gamma16SOTranslatedAtlas_hasGroupoid n

-- Literal native casts, scalar denominator conditions, coordinate values and bundled controls.
example (g h : SO) (c : Q) : gamma16CayleyTransitionMatrix g h c =
    ((g⁻¹ : SO) : M) * ((h : M) * ((1 + A c) * (1 - A c)⁻¹)) := rfl
example (g h : SO) (c : Q) (i j : SpinIndex) : gamma16CayleyTransitionMatrix g h c i j =
    (((g⁻¹ : SO) : M) * ((h : M) * CM c)) i j := rfl
example (g h : SO) (c : Q) (hc : c ∈ overlapDT g h) : (1 - A c).det ≠ 0 :=
  (gamma16CayleyTransition_overlap_conditions g h c hc).1
example (g h : SO) (c : Q) (hc : c ∈ overlapDT g h) :
    (gamma16CayleyTransitionMatrix g h c + 1).det ≠ 0 :=
  gamma16CayleyTransitionMatrix_mapsTo_backwardDomain g h hc
example (g h : SO) (c : Q) (hc : c ∈ overlapDT g h) (p : gamma16StrictPlaneIndex) :
    gamma16SOLeftTranslatedChart g ((gamma16SOLeftTranslatedChart h).symm c) p =
      ((gamma16CayleyTransitionMatrix g h c - 1) *
        (gamma16CayleyTransitionMatrix g h c + 1)⁻¹) p.val.1 p.val.2 :=
  congrFun (gamma16SOLeftTranslatedChart_transition_eq_ambient g h c hc) p
example (g : SO) : gamma16SOLeftTranslatedChart g ((gamma16SOLeftTranslatedChart g).symm 0) = 0 := by
  rw [gamma16SOLeftTranslatedChart_transition_apply, gamma16CayleyChartInv_zero,
    mul_one, inv_mul_cancel]
  exact gamma16CayleyOpenPartialHomeomorph_one
example (g : SO) (c : Q) (hc : c ∈ U) :
    gamma16SOLeftTranslatedChart g ((gamma16SOLeftTranslatedChart g).symm c) = c := by
  have ht : c ∈ (gamma16SOLeftTranslatedChart g).target := by
    rw [gamma16SOLeftTranslatedChart_target, gamma16CayleyOpenPartialHomeomorph_target]
    exact hc
  exact (gamma16SOLeftTranslatedChart g).right_inv ht
example (g : SO) : chartAt Q g = gamma16SOLeftTranslatedChart g := rfl
example (g : SO) : g ∈ (chartAt Q g).source := mem_chart_source Q g
example (n : ℕ∞ω) (g h : SO) : ContDiffOn ℝ n
    (fun c : Q => gamma16SOLeftTranslatedChart h ((gamma16SOLeftTranslatedChart g).symm c))
    (overlapDT h g) := gamma16SOLeftTranslatedChart_transition_contDiffOn n h g
example : IsManifold (modelWithCornersSelf ℝ Q) ∞ SO := gamma16SOTranslatedAtlas_isManifold ∞

-- Consume the actual full forward derivative and every continuously bundled product interface.
private abbrev CD : Q →L[ℝ] M := fderiv ℝ gamma16CayleyMatrix 0
private abbrev planeDU : gamma16StrictPlaneIndex := ⟨(0, 1), by decide⟩
private abbrev basisDU : Q := Pi.single planeDU 1

example (a : M) : M →L[ℝ] M := gamma16MatrixLeftMulCLM a
example : M →L[ℝ] M →L[ℝ] M := gamma16MatrixMulCLM
example (a b : M) : gamma16MatrixMulCLM a b = a * b := gamma16MatrixMulCLM_apply a b
example (f g : Q → M) (F G : Q →L[ℝ] M)
    (hf : HasFDerivAt f F 0) (hg : HasFDerivAt g G 0) (hf0 : f 0 = 1) (hg0 : g 0 = 1) :
    HasFDerivAt (fun c : Q => f c * g c) (F + G) 0 :=
  gamma16MatrixProduct_hasFDerivAt_one f g F G hf hg hf0 hg0
example (c : Q) (hc : c ∈ U) : CM c * (1 - A c) = 1 + A c :=
  gamma16CayleyMatrix_mul_denominator c hc
example : CD = (2 : ℝ) • A := gamma16CayleyMatrix_fderiv_zero
example : HasFDerivAt CM ((2 : ℝ) • A) 0 := gamma16CayleyMatrix_hasFDerivAt_zero
example : HasStrictFDerivAt CM ((2 : ℝ) • A) 0 := gamma16CayleyMatrix_hasStrictFDerivAt_zero
example (v : Q) : CD v = (2 : ℝ) • A v := gamma16CayleyMatrix_fderiv_zero_apply v
example (v : Q) (p : gamma16StrictPlaneIndex) : CD v p.val.1 p.val.2 = (2 : ℝ) * v p :=
  gamma16CayleyMatrix_fderiv_zero_upper v p
example : Function.Injective CD := gamma16CayleyMatrix_fderiv_zero_injective

-- Literal multiplication, operator values, half-normalization and negative normalization controls.
example (a b : M) : gamma16MatrixLeftMulCLM a b = a * b := rfl
example : HasFDerivAt (fun c : Q => (1 + A c) * (1 + A c)) (A + A) 0 := by
  have ha : HasFDerivAt (fun c : Q => 1 + A c) A 0 := A.hasFDerivAt.const_add 1
  have h0 : (fun c : Q => 1 + A c) 0 = 1 := by simp only [map_zero, add_zero]
  exact gamma16MatrixProduct_hasFDerivAt_one _ _ A A ha ha h0 h0
example (v : Q) (i j : SpinIndex) : CD v i j = (2 : ℝ) * A v i j :=
  congrArg (fun X : M => X i j) (gamma16CayleyMatrix_fderiv_zero_apply v)
example (v : Q) : CD v = (2 : ℝ) • gamma16StrictPlaneMatrix v :=
  (gamma16CayleyMatrix_fderiv_zero_apply v).trans
    (congrArg (fun X : M => (2 : ℝ) • X) (gamma16StrictPlaneAmbientCLM_apply v))
example : CD (0 : Q) = 0 := map_zero CD
example (p : gamma16StrictPlaneIndex) : CD (Pi.single p 1) p.val.1 p.val.2 = 2 := by
  simpa only [Pi.single_eq_same, mul_one] using
    (gamma16CayleyMatrix_fderiv_zero_upper (Pi.single p 1) p)
example : CD ≠ 0 := by
  intro h
  have htwo : CD basisDU planeDU.val.1 planeDU.val.2 = 2 := by
    simpa only [basisDU, Pi.single_eq_same, mul_one] using
      (gamma16CayleyMatrix_fderiv_zero_upper basisDU planeDU)
  have hzero : CD basisDU planeDU.val.1 planeDU.val.2 = 0 :=
    congrArg (fun L : Q →L[ℝ] M => L basisDU planeDU.val.1 planeDU.val.2) h
  have hbad : (2 : ℝ) = 0 := htwo.symm.trans hzero
  norm_num at hbad
example : CD ≠ A := by
  intro h
  have htwo : CD basisDU planeDU.val.1 planeDU.val.2 = 2 := by
    simpa only [basisDU, Pi.single_eq_same, mul_one] using
      (gamma16CayleyMatrix_fderiv_zero_upper basisDU planeDU)
  have hone : A basisDU planeDU.val.1 planeDU.val.2 = 1 := by
    rw [gamma16StrictPlaneAmbientCLM_apply]
    simp only [gamma16StrictPlaneMatrix, dite_eq_left planeDU.property, basisDU, Pi.single_eq_same]
  have hvalue : CD basisDU planeDU.val.1 planeDU.val.2 = A basisDU planeDU.val.1 planeDU.val.2 :=
    congrArg (fun L : Q →L[ℝ] M => L basisDU planeDU.val.1 planeDU.val.2) h
  have hbad : (2 : ℝ) = 1 := htwo.symm.trans (hvalue.trans hone)
  norm_num at hbad
example : HasStrictFDerivAt (fun c : Q => (1 + A c) * (1 - A c)⁻¹) ((2 : ℝ) • A) 0 :=
  gamma16CayleyMatrix_hasStrictFDerivAt_zero
example (c : Q) (hc : (1 - A c).det ≠ 0) :
    ((1 + A c) * (1 - A c)⁻¹) * (1 - A c) = 1 + A c :=
  gamma16CayleyMatrix_mul_denominator c hc
example (v : Q) : (CD v).transpose = -CD v := by
  rw [gamma16CayleyMatrix_fderiv_zero_apply, gamma16StrictPlaneAmbientCLM_apply,
    Matrix.transpose_smul, gamma16StrictPlaneMatrix_transpose, smul_neg]
example (v : Q) : (1 / 2 : ℝ) • CD v = A v := by
  rw [gamma16CayleyMatrix_fderiv_zero_apply, smul_smul]
  have hcancel : (1 / 2 : ℝ) * 2 = 1 := by norm_num
  rw [hcancel, one_smul]
example (v : Q) (hv : CD v = 0) : v = 0 :=
  gamma16CayleyMatrix_fderiv_zero_injective (hv.trans (map_zero CD).symm)

-- Bind the actual native target identity tangent, separately from the original source tangent T.
private abbrev SOI := modelWithCornersSelf ℝ Q
private abbrev SOT := TangentSpace SOI (1 : SO)
private abbrev SOIncl : SO → M := Subtype.val
private abbrev SOD : SOT →L[ℝ] M := gamma16SOIdentityInclusionDifferential
private abbrev SOE : SOT ≃ₗ[ℝ] S16 := gamma16SOIdentityNativeSkewLinearEquiv

example : extChartAt SOI (1 : SO) (1 : SO) = 0 := gamma16SOIdentity_extChartAt_center
example (c : Q) : (extChartAt SOI (1 : SO)).symm c = gamma16CayleyChartInv c :=
  gamma16SOIdentity_extChartAt_symm c
example : writtenInExtChartAt SOI K (1 : SO) SOIncl =
    (fun c : Q => (gamma16CayleyChartInv c : M)) := gamma16SOIdentityInclusion_writtenInExtChartAt
example : HasFDerivAt (writtenInExtChartAt SOI K (1 : SO) SOIncl) ((2 : ℝ) • A) 0 :=
  gamma16SOIdentityInclusion_written_hasFDerivAt_zero
example : MDifferentiableAt SOI K SOIncl (1 : SO) := gamma16SOIdentityInclusion_mdifferentiableAt
example : TangentSpace (modelWithCornersSelf ℝ (gamma16StrictPlaneIndex → ℝ))
    (1 : Matrix.specialOrthogonalGroup SpinIndex ℝ) →L[ℝ] Matrix SpinIndex SpinIndex ℝ :=
  gamma16SOIdentityInclusionDifferential
example : Function.Injective SOD := gamma16SOIdentityInclusionDifferential_injective
example (v : SOT) : SOD v ∈ LieAlgebra.Orthogonal.so SpinIndex ℝ :=
  gamma16SOIdentityInclusionDifferential_mem_so v
example : LinearMap.range SOD.toLinearMap =
    (LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule := gamma16SOIdentityInclusionDifferential_range
example : TangentSpace (modelWithCornersSelf ℝ (gamma16StrictPlaneIndex → ℝ))
    (1 : Matrix.specialOrthogonalGroup SpinIndex ℝ) ≃ₗ[ℝ] LieAlgebra.Orthogonal.so SpinIndex ℝ :=
  gamma16SOIdentityNativeSkewLinearEquiv
example (v : SOT) : (SOE v : M) = SOD v := gamma16SOIdentityNativeSkewLinearEquiv_apply v
example (X : S16) : SOD (SOE.symm X) = (X : M) := gamma16SOIdentityNativeSkewLinearEquiv_symm_apply X
example : Module.finrank ℝ SOT = 120 := gamma16SOIdentityTangent_finrank

-- Actual native mfderiv, original chart/domain bindings and differential-induced inverse controls.
example : SOD = (NormedSpace.fromTangentSpace (𝕜 := ℝ) (SOIncl (1 : SO))).toContinuousLinearMap.comp
    (mfderiv SOI K SOIncl (1 : SO)) := rfl
example : HasMFDerivAt SOI K SOIncl (1 : SO) (mfderiv SOI K SOIncl (1 : SO)) :=
  gamma16SOIdentityInclusion_mdifferentiableAt.hasMFDerivAt
example : ContinuousAt SOIncl (1 : SO) := gamma16SOIdentityInclusion_mdifferentiableAt.continuousAt
example : SOIncl (1 : SO) = (1 : M) := rfl
example (c : Q) : (chartAt Q (1 : SO)).symm c = gamma16CayleyChartInv c := by
  exact (gamma16SOLeftTranslatedChart_symm_apply (1 : SO) c).trans (one_mul _)
example (c : Q) (hc : c ∈ U) : writtenInExtChartAt SOI K (1 : SO) SOIncl c = CM c :=
  (congrFun gamma16SOIdentityInclusion_writtenInExtChartAt c).trans
    (gamma16CayleyChartInv_coe_on_source c hc)
example (v : SOT) (i j : SpinIndex) : (SOE v : M) i j = SOD v i j :=
  congrArg (fun X : M => X i j) (gamma16SOIdentityNativeSkewLinearEquiv_apply v)
example (X : S16) (i j : SpinIndex) : SOD (SOE.symm X) i j = X.val i j :=
  congrArg (fun Y : M => Y i j) (gamma16SOIdentityNativeSkewLinearEquiv_symm_apply X)
example (v : SOT) : SOE.symm (SOE v) = v := SOE.symm_apply_apply v
example (X : S16) : SOE (SOE.symm X) = X := SOE.apply_symm_apply X
example (X : M) (hX : X ∈ LieAlgebra.Orthogonal.so SpinIndex ℝ) : ∃ v : SOT, SOD v = X :=
  ⟨SOE.symm ⟨X, hX⟩, gamma16SOIdentityNativeSkewLinearEquiv_symm_apply ⟨X, hX⟩⟩
example (v : SOT) (hv : SOD v = 0) : v = 0 :=
  gamma16SOIdentityInclusionDifferential_injective (hv.trans (map_zero SOD).symm)
example : SOD.toLinearMap = (LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule.subtype.comp
    SOE.toLinearMap := by
  apply LinearMap.ext
  intro v
  exact (gamma16SOIdentityNativeSkewLinearEquiv_apply v).symm
example (v : SOT) : (SOD v).transpose = -SOD v := by
  have hv := gamma16SOIdentityInclusionDifferential_mem_so v
  rw [LieAlgebra.Orthogonal.mem_so] at hv
  exact hv
example : fderiv ℝ (writtenInExtChartAt SOI K (1 : SO) SOIncl) 0 = (2 : ℝ) • A :=
  gamma16SOIdentityInclusion_written_hasFDerivAt_zero.fderiv

-- Literal F10BC representation between the unchanged native source and target atlases.
private abbrev rep : G → SO := source9SpinGammaSpecialOrthogonalHom
private abbrev chartMatrix : P → M := source9SpinGammaIdentityChartMatrix
private abbrev writtenRep : P → Q := writtenInExtChartAt I SOI (1 : G) rep
private abbrev backCoordinates : M → Q := gamma16CayleyBackwardAmbientCoordinates

example (r : SO) (hr : r ∈ V) : extChartAt SOI (1 : SO) r = backCoordinates (r : M) :=
  gamma16SOIdentity_extChartAt_apply_on_target r hr
example (t : P) : chartMatrix t = (rep (source9SpinIdentityLocalChart.symm t) : M) := rfl
example : chartMatrix = (gammaCLM : C → M) ∘
    (fun t : P => (source9SpinIdentityLocalChart.symm t : C)) :=
  source9SpinGammaIdentityChartMatrix_eq_eval
example : chartMatrix (0 : P) = 1 := source9SpinGammaIdentityChartMatrix_zero
example (n : ℕ∞ω) : ContDiff ℝ n chartMatrix := source9SpinGammaIdentityChartMatrix_contDiff n
example : ∀ᶠ t : P in 𝓝 (0 : P), rep (source9SpinIdentityLocalChart.symm t) ∈ V :=
  source9SpinGammaIdentityChartTarget_mem_eventually
example : writtenRep =ᶠ[𝓝 (0 : P)] backCoordinates ∘ chartMatrix :=
  source9SpinGamma_written_eventuallyEq
example (n : ℕ∞ω) : ContDiffAt ℝ n writtenRep (0 : P) :=
  source9SpinGamma_written_contDiffAt_zero n
example : DifferentiableAt ℝ writtenRep (0 : P) := source9SpinGamma_written_differentiableAt_zero
example : MDifferentiableAt I SOI rep (1 : G) :=
  source9SpinGammaSpecialOrthogonalHom_mdifferentiableAt_one
example : HasMFDerivAt I SOI rep (1 : G) (mfderiv I SOI rep (1 : G)) :=
  source9SpinGammaSpecialOrthogonalHom_hasMFDerivAt_one

-- Carrier, domain, continuity and actual differential controls without a derivative premise.
example : MDifferentiableAt (modelWithCornersSelf ℝ (Fin 36 → ℝ))
    (modelWithCornersSelf ℝ (gamma16StrictPlaneIndex → ℝ))
    (source9SpinGammaSpecialOrthogonalHom : spinGroup source9Quadratic →
      Matrix.specialOrthogonalGroup SpinIndex ℝ) (1 : spinGroup source9Quadratic) :=
  source9SpinGammaSpecialOrthogonalHom_mdifferentiableAt_one
example : ContinuousAt rep (1 : G) := by
  have hnative : MDifferentiableAt I SOI rep (1 : G) :=
    source9SpinGammaSpecialOrthogonalHom_mdifferentiableAt_one
  exact hnative.continuousAt
example : rep (1 : G) = (1 : SO) := source9SpinGammaSpecialOrthogonalHom.map_one
example : chartMatrix = matrixMap ∘ source9SpinIdentityLocalChart.symm := rfl
example (t : P) : chartMatrix t = source9GammaCliffordAlgHom
    (source9SpinIdentityLocalChart.symm t : C) :=
  source9SpinGammaSpecialOrthogonalHom_apply (source9SpinIdentityLocalChart.symm t)
example : (chartMatrix (0 : P) + 1).det ≠ 0 := by
  have hzero : chartMatrix (0 : P) = (1 : M) := source9SpinGammaIdentityChartMatrix_zero
  rw [hzero]
  exact gamma16CayleyTwo_det_ne_zero
example : ContDiffAt ℝ ∞ writtenRep (0 : P) := source9SpinGamma_written_contDiffAt_zero ∞
example : DifferentiableWithinAt ℝ writtenRep (Set.range I)
    (extChartAt I (1 : G) (1 : G)) := by
  have hcenter : extChartAt I (1 : G) (1 : G) = (0 : P) := source9SpinIdentity_extChartAt_center
  have hdiff : DifferentiableAt ℝ writtenRep (0 : P) := source9SpinGamma_written_differentiableAt_zero
  rw [hcenter]
  exact hdiff.differentiableWithinAt
example : writtenRep (0 : P) = (backCoordinates ∘ chartMatrix) (0 : P) :=
  source9SpinGamma_written_eventuallyEq.eq_of_nhds
example : writtenRep (0 : P) = 0 := by
  change extChartAt SOI (rep (1 : G)) (rep ((extChartAt I (1 : G)).symm (0 : P))) = 0
  have hzero : (extChartAt I (1 : G)).symm (0 : P) = (1 : G) :=
    (source9SpinIdentity_extChartAt_symm (0 : P)).trans
      ((congrFun source9SpinIdentityLocalChart_symm_coe (0 : P)).trans source9OrderedStrictPlaneWord_zero)
  rw [hzero, show rep (1 : G) = (1 : SO) from source9SpinGammaSpecialOrthogonalHom.map_one]
  exact gamma16SOIdentity_extChartAt_center
example : TangentSpace I (1 : G) →L[ℝ] TangentSpace SOI (rep (1 : G)) :=
  mfderiv I SOI rep (1 : G)
example (r : SO) (hr : r ∈ V) (p : gamma16StrictPlaneIndex) :
    extChartAt SOI (1 : SO) r p = gamma16CayleyBackwardAmbientMatrix (r : M) p.val.1 p.val.2 :=
  congrFun (gamma16SOIdentity_extChartAt_apply_on_target r hr) p
example : ContinuousAt writtenRep (0 : P) :=
  source9SpinGamma_written_differentiableAt_zero.continuousAt

#print axioms gamma16SOIdentity_extChartAt_apply_on_target
#print axioms source9SpinGammaIdentityChartMatrix
#print axioms source9SpinGammaIdentityChartMatrix_eq_eval
#print axioms source9SpinGammaIdentityChartMatrix_zero
#print axioms source9SpinGammaIdentityChartMatrix_contDiff
#print axioms source9SpinGammaIdentityChartTarget_mem_eventually
#print axioms source9SpinGamma_written_eventuallyEq
#print axioms source9SpinGamma_written_contDiffAt_zero
#print axioms source9SpinGamma_written_differentiableAt_zero
#print axioms source9SpinGammaSpecialOrthogonalHom_mdifferentiableAt_one
#print axioms source9SpinGammaSpecialOrthogonalHom_hasMFDerivAt_one
end
end FCP.BFSSPairedSpin9Clifford
