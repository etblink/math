import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DJIdentityInclusionTangentRange

set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped Topology ContDiff Matrix.Norms.Elementwise

local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditDJPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditDJPBWCoordinates.toAddMonoidHom auditDJPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditDJPBWCoordinates

@[instance_reducible] private def auditDJSpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditDJParameterTopology :
    TopologicalSpace (Fin 36 → ℝ) := inferInstance
@[instance_reducible] private def auditDJCliffordTopology :
    TopologicalSpace (CliffordAlgebra source9Quadratic) := inferInstance
local instance f10djAuditChartedSpace :
    ChartedSpace (Fin 36 → ℝ) (spinGroup source9Quadratic) := source9SpinTranslatedChartedSpace

private abbrev P := Fin 36 → ℝ
private abbrev G := spinGroup source9Quadratic
private abbrev C := CliffordAlgebra source9Quadratic
private abbrev I := modelWithCornersSelf ℝ P
private abbrev J := modelWithCornersSelf ℝ C
private abbrev T := TangentSpace I (1 : G)
private abbrev R := source9IdentityChartDerivativeRange
private abbrev D : T →L[ℝ] C := source9SpinIdentityInclusionDifferential
private abbrev E : T ≃ₗ[ℝ] R := source9SpinIdentityTangentRangeEquiv

example : Fintype.card (Fin 36) = 36 := by decide
example : Fintype.card SpaceIndex = 9 := by decide
example : Fintype.card SpinIndex = 16 := by decide
example : NormedSpace ℝ C := inferInstance
example : source9PBWCoordinates = auditDJPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    C (Finset SpaceIndex → ℝ)
    auditDJPBWCoordinates.toAddMonoidHom auditDJPBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    C (Finset SpaceIndex → ℝ) auditDJPBWCoordinates := rfl
example : (inferInstance : TopologicalSpace G) = auditDJSpinTopology := rfl
example : (inferInstance : TopologicalSpace P) = auditDJParameterTopology := rfl
example : (inferInstance : TopologicalSpace C) = auditDJCliffordTopology := rfl
example : (inferInstance : TopologicalSpace G) =
    TopologicalSpace.induced (Subtype.val : G → C) auditDJCliffordTopology := rfl
example : (inferInstance : ChartedSpace P G) = source9SpinTranslatedChartedSpace := rfl
example : atlas P G = Set.range source9SpinLeftTranslatedChart := rfl
example (g : G) : chartAt P g = source9SpinLeftTranslatedChart g := rfl
example : IsManifold I ∞ G := source9SpinTranslatedAtlas_isManifold ∞

-- Check all ten interfaces with the literal inclusion and native extended charts explicit.
example : extChartAt I (1 : G) (1 : G) = 0 := source9SpinIdentity_extChartAt_center
example (t : P) : (extChartAt I (1 : G)).symm t = source9SpinIdentityLocalChart.symm t :=
  source9SpinIdentity_extChartAt_symm t
example : writtenInExtChartAt I J (1 : G) (Subtype.val : G → C) =
    (fun t : P => ((source9SpinIdentityLocalChart.symm t) : C)) :=
  source9SpinIdentityInclusion_writtenInExtChartAt
example : HasFDerivAt (writtenInExtChartAt I J (1 : G) (Subtype.val : G → C))
    source9IdentityChartDerivative 0 := source9SpinIdentityInclusion_written_hasFDerivAt_zero
example : MDifferentiableAt I J (Subtype.val : G → C) (1 : G) :=
  source9SpinIdentityInclusion_mdifferentiableAt
example : D =
    (NormedSpace.fromTangentSpace (𝕜 := ℝ) ((1 : G) : C)).toContinuousLinearMap.comp
      (mfderiv I J (Subtype.val : G → C) (1 : G)) := rfl
example : Function.Injective D := source9SpinIdentityInclusionDifferential_injective
example : LinearMap.range D.toLinearMap = R := source9SpinIdentityInclusionDifferential_range
example : T ≃ₗ[ℝ] R := source9SpinIdentityTangentRangeEquiv
example (v : T) : (E v : C) = D v := source9SpinIdentityTangentRangeEquiv_apply v

-- Native differentiability includes continuity, not just a chosen derivative in model coordinates.
example : ContinuousAt (Subtype.val : G → C) (1 : G) := continuous_subtype_val.continuousAt
example : HasMFDerivAt I J (Subtype.val : G → C) (1 : G)
    (mfderiv I J (Subtype.val : G → C) (1 : G)) := by
  have hInclusion : MDifferentiableAt I J (Subtype.val : G → C) (1 : G) :=
    source9SpinIdentityInclusion_mdifferentiableAt
  exact hInclusion.hasMFDerivAt
example : R.subtype.comp E.toLinearMap = D.toLinearMap := by
  apply LinearMap.ext
  intro v
  exact source9SpinIdentityTangentRangeEquiv_apply v
example (v : T) : E.symm (E v) = v := E.symm_apply_apply v
example (x : R) : E (E.symm x) = x := E.apply_symm_apply x
example (x : R) : D (E.symm x) = (x : C) :=
  (source9SpinIdentityTangentRangeEquiv_apply (E.symm x)).symm.trans
    (congrArg (fun y : R => (y : C)) (E.apply_symm_apply x))

-- Positive half-bivector normalization and the original native skew parameterization survive.
example (i : Fin 36) :
    D (E.symm (source9IdentityChartDerivativeRangeEquiv (Pi.single i (1 : ℝ)))) =
      (1 / 2 : ℝ) •
        (CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (source9StrictPlaneRow i)) *
          CliffordAlgebra.ι source9Quadratic (source9CoordinateVector (source9StrictPlaneColumn i))) := by
  have hx : D (E.symm (source9IdentityChartDerivativeRangeEquiv (Pi.single i (1 : ℝ)))) =
      (source9IdentityChartDerivativeRangeEquiv (Pi.single i (1 : ℝ)) : C) :=
    (source9SpinIdentityTangentRangeEquiv_apply _).symm.trans
      (congrArg (fun y : R => (y : C)) (E.apply_symm_apply _))
  exact hx.trans ((source9IdentityChartDerivativeRangeEquiv_apply _).trans
    (source9IdentityChartDerivative_coordinate i))
example (A : LieAlgebra.Orthogonal.so SpaceIndex ℝ) :
    D (E.symm (source9NativeSkewDerivativeRangeEquiv A)) =
      source9IdentityChartDerivative (source9OrderedStrictPlaneModelEquiv.symm A) :=
  (source9SpinIdentityTangentRangeEquiv_apply _).symm.trans
    ((congrArg (fun y : R => (y : C)) (E.apply_symm_apply _)).trans
      (source9NativeSkewDerivativeRangeEquiv_apply A))
example : ¬ Function.Injective (fun g : G =>
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)) :=
  source9NaturalMatrix_not_injective

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
