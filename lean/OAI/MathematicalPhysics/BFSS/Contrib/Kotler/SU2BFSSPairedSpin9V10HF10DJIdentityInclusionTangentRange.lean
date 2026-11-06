import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DITranslatedAtlasManifold
import Mathlib.Geometry.Manifold.MFDeriv.Basic

/-! F10DJ: identify the source identity tangent by the actual ambient inclusion differential.
Check the preferred extended chart and the literal inclusion in its coordinates first.
The map used for injectivity, image and range equivalence is native mfderiv, with the
canonical normed-space target identification. Technical source casts occur only in proofs
after checking the native coordinate formula, not as a proposed geometric identification.
No source Lie-group structure, tangent bracket or full representation differential is asserted.
Candidate until the complete strict source and independent consumer audit pass. -/
set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped Topology ContDiff Matrix.Norms.Elementwise

local instance f10djLocalNormedAddCommGroup :
    NormedAddCommGroup (CliffordAlgebra source9Quadratic) := source9PBWNormedAddCommGroup
local instance f10djLocalNormedSpace :
    NormedSpace ℝ (CliffordAlgebra source9Quadratic) := source9PBWNormedSpace
local instance f10djLocalChartedSpace :
    ChartedSpace (Fin 36 → ℝ) (spinGroup source9Quadratic) := source9SpinTranslatedChartedSpace

private abbrev P := Fin 36 → ℝ
private abbrev G := spinGroup source9Quadratic
private abbrev C := CliffordAlgebra source9Quadratic
private abbrev I := modelWithCornersSelf ℝ P
private abbrev J := modelWithCornersSelf ℝ C
private abbrev inclusion : G → C := Subtype.val
private abbrev T := TangentSpace I (1 : G)

theorem source9SpinIdentity_extChartAt_center : extChartAt I (1 : G) (1 : G) = 0 := by
  have h : extChartAt I (1 : G) (1 : G) = chartAt P (1 : G) (1 : G) := by
    simpa only [modelWithCornersSelf_coe] using
      congrFun (extChartAt_coe (I := I) (1 : G)) (1 : G)
  exact h.trans (source9SpinLeftTranslatedChart_self (1 : G))

theorem source9SpinIdentity_extChartAt_symm (t : P) :
    (extChartAt I (1 : G)).symm t = source9SpinIdentityLocalChart.symm t := by
  calc
    (extChartAt I (1 : G)).symm t = (chartAt P (1 : G)).symm t := by
      simpa only [modelWithCornersSelf_coe_symm] using
        congrFun (extChartAt_coe_symm (I := I) (1 : G)) t
    _ = (1 : G) * source9OrderedStrictPlaneWord t :=
      source9SpinLeftTranslatedChart_symm_apply (1 : G) t
    _ = source9OrderedStrictPlaneWord t := one_mul _
    _ = source9SpinIdentityLocalChart.symm t :=
      (congrFun source9SpinIdentityLocalChart_symm_coe t).symm

/-- The native chart expression of the literal subtype inclusion is the accepted actual inverse. -/
theorem source9SpinIdentityInclusion_writtenInExtChartAt :
    writtenInExtChartAt I J (1 : G) inclusion =
      (fun t : P => ((source9SpinIdentityLocalChart.symm t) : C)) := by
  funext t
  calc
    writtenInExtChartAt I J (1 : G) inclusion t =
        extChartAt J (inclusion (1 : G)) (inclusion ((extChartAt I (1 : G)).symm t)) := rfl
    _ = inclusion ((extChartAt I (1 : G)).symm t) := by
      rw [extChartAt_model_space_eq_id ℝ (inclusion (1 : G))]
    _ = ((source9SpinIdentityLocalChart.symm t) : C) :=
      congrArg (fun g : G => (g : C)) (source9SpinIdentity_extChartAt_symm t)

theorem source9SpinIdentityInclusion_written_hasFDerivAt_zero :
    HasFDerivAt (writtenInExtChartAt I J (1 : G) inclusion) source9IdentityChartDerivative 0 := by
  rw [source9SpinIdentityInclusion_writtenInExtChartAt]
  have hD : source9IdentityChartDerivative =
      source9PlaneSpinWordVelocity source9StrictPlaneRow source9StrictPlaneColumn (List.finRange 36) :=
    source9IdentityChartInverse_clifford_fderiv_zero
  exact hD.symm ▸ source9IdentityChartInverse_clifford_hasFDerivAt_zero

theorem source9SpinIdentityInclusion_mdifferentiableAt :
    MDifferentiableAt I J inclusion (1 : G) := by
  apply (mdifferentiableAt_iff (I := I) (I' := J) inclusion (1 : G)).2
  constructor
  · exact continuous_subtype_val.continuousAt
  · rw [source9SpinIdentity_extChartAt_center]
    exact source9SpinIdentityInclusion_written_hasFDerivAt_zero.differentiableAt.differentiableWithinAt

/-- Native manifold differential of the actual inclusion, with its canonical ambient target. -/
noncomputable def source9SpinIdentityInclusionDifferential : T →L[ℝ] C :=
  (NormedSpace.fromTangentSpace (𝕜 := ℝ) (inclusion (1 : G))).toContinuousLinearMap.comp
    (mfderiv I J inclusion (1 : G))

-- This technical cast is used only to evaluate a checked native differential in its preferred chart.
private theorem source9SpinIdentityInclusionDifferential_coordinates (v : T) :
    source9SpinIdentityInclusionDifferential v =
      source9IdentityChartDerivative (tangentSpaceCastModel I (1 : G) v) := by
  have hfd : fderivWithin ℝ (writtenInExtChartAt I J (1 : G) inclusion) (Set.range I)
      (extChartAt I (1 : G) (1 : G)) = source9IdentityChartDerivative := by
    rw [source9SpinIdentity_extChartAt_center, modelWithCornersSelf_coe, Set.range_id,
      fderivWithin_univ]
    exact source9SpinIdentityInclusion_written_hasFDerivAt_zero.fderiv
  have hm : mfderiv I J inclusion (1 : G) =
      (tangentSpaceCastModel J (inclusion (1 : G))).symm.toContinuousLinearMap.comp
        ((fderivWithin ℝ (writtenInExtChartAt I J (1 : G) inclusion) (Set.range I)
          (extChartAt I (1 : G) (1 : G))).comp
            (tangentSpaceCastModel I (1 : G)).toContinuousLinearMap) :=
    source9SpinIdentityInclusion_mdifferentiableAt.mfderiv
  rw [hfd] at hm
  have hv : mfderiv I J inclusion (1 : G) v =
      (tangentSpaceCastModel J (inclusion (1 : G))).symm
        (source9IdentityChartDerivative (tangentSpaceCastModel I (1 : G) v)) :=
    congrArg (fun L : T →L[ℝ] TangentSpace J (inclusion (1 : G)) => L v) hm
  calc
    source9SpinIdentityInclusionDifferential v =
        tangentSpaceCastModel J (inclusion (1 : G)) (mfderiv I J inclusion (1 : G) v) := rfl
    _ = tangentSpaceCastModel J (inclusion (1 : G))
        ((tangentSpaceCastModel J (inclusion (1 : G))).symm
          (source9IdentityChartDerivative (tangentSpaceCastModel I (1 : G) v))) :=
      congrArg (tangentSpaceCastModel J (inclusion (1 : G))) hv
    _ = source9IdentityChartDerivative (tangentSpaceCastModel I (1 : G) v) :=
      (tangentSpaceCastModel J (inclusion (1 : G))).apply_symm_apply _

theorem source9SpinIdentityInclusionDifferential_injective :
    Function.Injective source9SpinIdentityInclusionDifferential := by
  intro v w hvw
  apply (tangentSpaceCastModel I (1 : G)).injective
  have hi : Function.Injective source9IdentityChartDerivative :=
    source9IdentityChartInverse_clifford_fderiv_zero_injective
  exact hi ((source9SpinIdentityInclusionDifferential_coordinates v).symm.trans
    (hvw.trans (source9SpinIdentityInclusionDifferential_coordinates w)))

theorem source9SpinIdentityInclusionDifferential_range :
    LinearMap.range source9SpinIdentityInclusionDifferential.toLinearMap =
      source9IdentityChartDerivativeRange := by
  change LinearMap.range source9SpinIdentityInclusionDifferential.toLinearMap =
    LinearMap.range source9IdentityChartDerivative.toLinearMap
  ext x
  constructor
  · rintro ⟨v, rfl⟩
    exact ⟨tangentSpaceCastModel I (1 : G) v,
      (source9SpinIdentityInclusionDifferential_coordinates v).symm⟩
  · rintro ⟨p, hp⟩
    refine ⟨(tangentSpaceCastModel I (1 : G)).symm p, ?_⟩
    exact (source9SpinIdentityInclusionDifferential_coordinates _).trans
      ((congrArg source9IdentityChartDerivative
        ((tangentSpaceCastModel I (1 : G)).apply_symm_apply p)).trans hp)

/-- The identification is induced by the actual injective inclusion differential and its proved image. -/
noncomputable def source9SpinIdentityTangentRangeEquiv : T ≃ₗ[ℝ] source9IdentityChartDerivativeRange :=
  (LinearEquiv.ofInjective source9SpinIdentityInclusionDifferential.toLinearMap
    source9SpinIdentityInclusionDifferential_injective).trans
      (LinearEquiv.ofEq _ _ source9SpinIdentityInclusionDifferential_range)

theorem source9SpinIdentityTangentRangeEquiv_apply (v : T) :
    (source9SpinIdentityTangentRangeEquiv v : C) = source9SpinIdentityInclusionDifferential v := rfl

#print axioms source9SpinIdentity_extChartAt_center
#print axioms source9SpinIdentity_extChartAt_symm
#print axioms source9SpinIdentityInclusion_writtenInExtChartAt
#print axioms source9SpinIdentityInclusion_written_hasFDerivAt_zero
#print axioms source9SpinIdentityInclusion_mdifferentiableAt
#print axioms source9SpinIdentityInclusionDifferential
#print axioms source9SpinIdentityInclusionDifferential_injective
#print axioms source9SpinIdentityInclusionDifferential_range
#print axioms source9SpinIdentityTangentRangeEquiv
#print axioms source9SpinIdentityTangentRangeEquiv_apply
end
end FCP.BFSSPairedSpin9Clifford
