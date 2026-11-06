import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DUCayleyForwardDerivativeNormalization
import Mathlib.Geometry.Manifold.MFDeriv.Basic

/-! F10DV: native identity tangent identification by the actual SO(16) inclusion differential.
Reuse DJ's checked preferred-chart/native-mfderiv construction with DU's factor-two operator.
The chart inverse agrees with the forward matrix only on U; use that actual neighborhood.
Prove the differential is injective with image exactly the original native so(16), then
induce the linear equivalence from that differential and its proved range. Technical chart
casts are used only in proofs after the native coordinate formula is established.
No intrinsic representation differential comparison, smooth group operations, bracket
compatibility or physical/spectral conclusion is asserted. Candidate until the strict gate. -/
set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped Topology ContDiff Matrix.Norms.Elementwise
attribute [local instance 100] LieRing.ofAssociativeRing

local instance f10dvLocalSOChartedSpace :
    ChartedSpace (gamma16StrictPlaneIndex → ℝ) (Matrix.specialOrthogonalGroup SpinIndex ℝ) :=
  gamma16SOTranslatedChartedSpace
local instance f10dvLocalMatrixChartedSpace : ChartedSpace GammaMatrix GammaMatrix :=
  chartedSpaceSelf GammaMatrix

private abbrev M := GammaMatrix
private abbrev Q := gamma16StrictPlaneIndex → ℝ
private abbrev SO := Matrix.specialOrthogonalGroup SpinIndex ℝ
private abbrev S16 := LieAlgebra.Orthogonal.so SpinIndex ℝ
private abbrev I := modelWithCornersSelf ℝ Q
private abbrev K : ModelWithCorners ℝ M M := modelWithCornersSelf ℝ M
private abbrev inclusion : SO → M := Subtype.val
private abbrev T := TangentSpace I (1 : SO)
private abbrev A : Q →L[ℝ] M := gamma16StrictPlaneAmbientCLM
private abbrev U : Set Q := gamma16CayleySource

theorem gamma16SOIdentity_extChartAt_center : extChartAt I (1 : SO) (1 : SO) = 0 := by
  have h : extChartAt I (1 : SO) (1 : SO) = chartAt Q (1 : SO) (1 : SO) := by
    simpa only [modelWithCornersSelf_coe, Function.id_comp] using
      congrFun (extChartAt_coe (I := I) (1 : SO)) (1 : SO)
  exact h.trans (gamma16SOLeftTranslatedChart_self (1 : SO))

theorem gamma16SOIdentity_extChartAt_symm (c : Q) :
    (extChartAt I (1 : SO)).symm c = gamma16CayleyChartInv c := by
  calc
    (extChartAt I (1 : SO)).symm c = (chartAt Q (1 : SO)).symm c := by
      simpa only [modelWithCornersSelf_coe_symm, Function.comp_id] using
        congrFun (extChartAt_coe_symm (I := I) (1 : SO)) c
    _ = (1 : SO) * gamma16CayleyChartInv c := gamma16SOLeftTranslatedChart_symm_apply (1 : SO) c
    _ = gamma16CayleyChartInv c := one_mul _

/-- Exact total coordinate expression for the literal native subtype inclusion. -/
theorem gamma16SOIdentityInclusion_writtenInExtChartAt :
    writtenInExtChartAt I K (1 : SO) inclusion = (fun c : Q => (gamma16CayleyChartInv c : M)) := by
  funext c
  calc
    writtenInExtChartAt I K (1 : SO) inclusion c =
        extChartAt K (inclusion (1 : SO)) (inclusion ((extChartAt I (1 : SO)).symm c)) := rfl
    _ = inclusion ((extChartAt I (1 : SO)).symm c) :=
      ext_chart_model_space_apply (𝕜 := ℝ) (x := inclusion (1 : SO))
        (y := inclusion ((extChartAt I (1 : SO)).symm c))
    _ = (gamma16CayleyChartInv c : M) :=
      congrArg (fun g : SO => (g : M)) (gamma16SOIdentity_extChartAt_symm c)

/-- The actual native coordinate expression inherits DU's derivative on the neighborhood U. -/
theorem gamma16SOIdentityInclusion_written_hasFDerivAt_zero :
    HasFDerivAt (writtenInExtChartAt I K (1 : SO) inclusion) ((2 : ℝ) • A) 0 := by
  have hU : ∀ᶠ c : Q in 𝓝 (0 : Q), c ∈ U :=
    gamma16CayleySource_isOpen.mem_nhds gamma16CayleySource_zero
  have hevent : writtenInExtChartAt I K (1 : SO) inclusion =ᶠ[𝓝 (0 : Q)] gamma16CayleyMatrix :=
    Filter.Eventually.mono hU (fun c hc =>
      (congrFun gamma16SOIdentityInclusion_writtenInExtChartAt c).trans
        (gamma16CayleyChartInv_coe_on_source c hc))
  exact gamma16CayleyMatrix_hasFDerivAt_zero.congr_of_eventuallyEq hevent

theorem gamma16SOIdentityInclusion_mdifferentiableAt :
    MDifferentiableAt I K inclusion (1 : SO) := by
  apply (mdifferentiableAt_iff (I := I) (I' := K) inclusion (1 : SO)).2
  constructor
  · exact continuous_subtype_val.continuousAt
  · rw [gamma16SOIdentity_extChartAt_center]
    exact gamma16SOIdentityInclusion_written_hasFDerivAt_zero.differentiableAt.differentiableWithinAt

/-- Native mfderiv of the literal inclusion, with the canonical normed-matrix target identification. -/
noncomputable def gamma16SOIdentityInclusionDifferential : T →L[ℝ] M :=
  (NormedSpace.fromTangentSpace (𝕜 := ℝ) (inclusion (1 : SO))).toContinuousLinearMap.comp
    (mfderiv I K inclusion (1 : SO))

-- Technical preferred-chart evaluation after the actual native coordinate expression was proved.
private theorem gamma16SOIdentityInclusionDifferential_coordinates (v : T) :
    gamma16SOIdentityInclusionDifferential v = (2 : ℝ) • A (tangentSpaceCastModel I (1 : SO) v) := by
  have hfd : fderivWithin ℝ (writtenInExtChartAt I K (1 : SO) inclusion) (Set.range I)
      (extChartAt I (1 : SO) (1 : SO)) = (2 : ℝ) • A := by
    rw [gamma16SOIdentity_extChartAt_center, modelWithCornersSelf_coe, Set.range_id,
      fderivWithin_univ]
    exact gamma16SOIdentityInclusion_written_hasFDerivAt_zero.fderiv
  have hm : mfderiv I K inclusion (1 : SO) =
      (tangentSpaceCastModel K (inclusion (1 : SO))).symm.toContinuousLinearMap.comp
        ((fderivWithin ℝ (writtenInExtChartAt I K (1 : SO) inclusion) (Set.range I)
          (extChartAt I (1 : SO) (1 : SO))).comp
            (tangentSpaceCastModel I (1 : SO)).toContinuousLinearMap) :=
    gamma16SOIdentityInclusion_mdifferentiableAt.mfderiv
  rw [hfd] at hm
  have hv : mfderiv I K inclusion (1 : SO) v =
      (tangentSpaceCastModel K (inclusion (1 : SO))).symm
        (((2 : ℝ) • A) (tangentSpaceCastModel I (1 : SO) v)) :=
    congrArg (fun L : T →L[ℝ] TangentSpace K (inclusion (1 : SO)) => L v) hm
  calc
    gamma16SOIdentityInclusionDifferential v =
        tangentSpaceCastModel K (inclusion (1 : SO)) (mfderiv I K inclusion (1 : SO) v) := rfl
    _ = tangentSpaceCastModel K (inclusion (1 : SO))
        ((tangentSpaceCastModel K (inclusion (1 : SO))).symm
          (((2 : ℝ) • A) (tangentSpaceCastModel I (1 : SO) v))) :=
      congrArg (tangentSpaceCastModel K (inclusion (1 : SO))) hv
    _ = (2 : ℝ) • A (tangentSpaceCastModel I (1 : SO) v) :=
      (tangentSpaceCastModel K (inclusion (1 : SO))).apply_symm_apply _

theorem gamma16SOIdentityInclusionDifferential_injective :
    Function.Injective gamma16SOIdentityInclusionDifferential := by
  intro v w hvw
  apply (tangentSpaceCastModel I (1 : SO)).injective
  have hi : Function.Injective ((2 : ℝ) • A) := by
    rw [← gamma16CayleyMatrix_fderiv_zero]
    exact gamma16CayleyMatrix_fderiv_zero_injective
  exact hi ((gamma16SOIdentityInclusionDifferential_coordinates v).symm.trans
    (hvw.trans (gamma16SOIdentityInclusionDifferential_coordinates w)))

/-- The actual inclusion differential takes values in the original native skew matrices. -/
theorem gamma16SOIdentityInclusionDifferential_mem_so (v : T) :
    gamma16SOIdentityInclusionDifferential v ∈ LieAlgebra.Orthogonal.so SpinIndex ℝ := by
  have hs : (2 : ℝ) • A (tangentSpaceCastModel I (1 : SO) v) ∈
      LieAlgebra.Orthogonal.so SpinIndex ℝ := by
    rw [LieAlgebra.Orthogonal.mem_so, Matrix.transpose_smul, gamma16CayleyModel_transpose, smul_neg]
  exact (gamma16SOIdentityInclusionDifferential_coordinates v).symm ▸ hs

/-- The image of the actual native inclusion differential is exactly the original so(16) submodule. -/
theorem gamma16SOIdentityInclusionDifferential_range :
    LinearMap.range gamma16SOIdentityInclusionDifferential.toLinearMap =
      (LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule := by
  ext X
  constructor
  · rintro ⟨v, rfl⟩
    exact gamma16SOIdentityInclusionDifferential_mem_so v
  · intro hX
    let x : S16 := ⟨X, hX⟩
    let q : Q := (1 / 2 : ℝ) • gamma16StrictPlaneModelEquiv.symm x
    have hA : A (gamma16StrictPlaneModelEquiv.symm x) = X :=
      (gamma16StrictPlaneAmbientCLM_apply _).trans
        ((gamma16StrictPlaneModelEquiv_apply _).symm.trans
          (congrArg (fun y : S16 => (y : M)) (gamma16StrictPlaneModelEquiv.apply_symm_apply x)))
    have h2A : (2 : ℝ) • A q = X := by
      dsimp only [q]
      rw [map_smul, smul_smul]
      have hcancel : (2 : ℝ) * (1 / 2) = 1 := by norm_num
      rw [hcancel, one_smul, hA]
    refine ⟨(tangentSpaceCastModel I (1 : SO)).symm q, ?_⟩
    calc
      gamma16SOIdentityInclusionDifferential ((tangentSpaceCastModel I (1 : SO)).symm q) =
          (2 : ℝ) • A ((tangentSpaceCastModel I (1 : SO))
            ((tangentSpaceCastModel I (1 : SO)).symm q)) :=
        gamma16SOIdentityInclusionDifferential_coordinates _
      _ = (2 : ℝ) • A q := congrArg (fun c : Q => (2 : ℝ) • A c)
        ((tangentSpaceCastModel I (1 : SO)).apply_symm_apply q)
      _ = X := h2A

/-- The identification is induced by the actual inclusion differential and its proved image. -/
noncomputable def gamma16SOIdentityNativeSkewLinearEquiv : T ≃ₗ[ℝ] S16 :=
  (LinearEquiv.ofInjective gamma16SOIdentityInclusionDifferential.toLinearMap
    gamma16SOIdentityInclusionDifferential_injective).trans
      (LinearEquiv.ofEq _ _ gamma16SOIdentityInclusionDifferential_range)

theorem gamma16SOIdentityNativeSkewLinearEquiv_apply (v : T) :
    (gamma16SOIdentityNativeSkewLinearEquiv v : M) = gamma16SOIdentityInclusionDifferential v := rfl

theorem gamma16SOIdentityNativeSkewLinearEquiv_symm_apply (X : S16) :
    gamma16SOIdentityInclusionDifferential (gamma16SOIdentityNativeSkewLinearEquiv.symm X) =
      (X : M) :=
  (gamma16SOIdentityNativeSkewLinearEquiv_apply _).symm.trans
    (congrArg (fun y : S16 => (y : M)) (gamma16SOIdentityNativeSkewLinearEquiv.apply_symm_apply X))

theorem gamma16SOIdentityTangent_finrank : Module.finrank ℝ T = 120 :=
  gamma16SOIdentityNativeSkewLinearEquiv.finrank_eq.trans gamma16NativeSkew_finrank

#print axioms gamma16SOIdentity_extChartAt_center
#print axioms gamma16SOIdentity_extChartAt_symm
#print axioms gamma16SOIdentityInclusion_writtenInExtChartAt
#print axioms gamma16SOIdentityInclusion_written_hasFDerivAt_zero
#print axioms gamma16SOIdentityInclusion_mdifferentiableAt
#print axioms gamma16SOIdentityInclusionDifferential
#print axioms gamma16SOIdentityInclusionDifferential_injective
#print axioms gamma16SOIdentityInclusionDifferential_mem_so
#print axioms gamma16SOIdentityInclusionDifferential_range
#print axioms gamma16SOIdentityNativeSkewLinearEquiv
#print axioms gamma16SOIdentityNativeSkewLinearEquiv_apply
#print axioms gamma16SOIdentityNativeSkewLinearEquiv_symm_apply
#print axioms gamma16SOIdentityTangent_finrank
end
end FCP.BFSSPairedSpin9Clifford
