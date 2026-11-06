import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DJIdentityInclusionTangentRange
import Mathlib.Geometry.Manifold.MFDeriv.SpecificFunctions

/-! F10DK: native identity differential of the actual F10BC map in the original matrix carrier.
Apply the native chain rule to the accepted continuous-linear gamma evaluation and actual
source inclusion. The public differential is native mfderiv of the literal F10BC matrix map.
Target identifications are canonical normed-space identifications. No source tangent cast,
source Lie-group/bracket claim or special-orthogonal tangent identification is used.
Candidate until complete strict compilation and independent consumer audit pass. -/
set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped Topology ContDiff Matrix.Norms.Elementwise

local instance f10dkLocalNormedAddCommGroup :
    NormedAddCommGroup (CliffordAlgebra source9Quadratic) := source9PBWNormedAddCommGroup
local instance f10dkLocalNormedSpace :
    NormedSpace ℝ (CliffordAlgebra source9Quadratic) := source9PBWNormedSpace
local instance f10dkLocalChartedSpace :
    ChartedSpace (Fin 36 → ℝ) (spinGroup source9Quadratic) := source9SpinTranslatedChartedSpace

private abbrev P := Fin 36 → ℝ
private abbrev G := spinGroup source9Quadratic
private abbrev C := CliffordAlgebra source9Quadratic
private abbrev M := GammaMatrix
private abbrev I := modelWithCornersSelf ℝ P
private abbrev J := modelWithCornersSelf ℝ C
private abbrev K := modelWithCornersSelf ℝ M
private abbrev T := TangentSpace I (1 : G)
private abbrev R := source9IdentityChartDerivativeRange
private abbrev inclusion : G → C := Subtype.val
private abbrev gammaCLM : C →L[ℝ] M := source9OriginalGammaEvaluationCLM
private abbrev inclusionD : T →L[ℝ] C := source9SpinIdentityInclusionDifferential
private abbrev rangeEquiv : T ≃ₗ[ℝ] R := source9SpinIdentityTangentRangeEquiv
private abbrev matrixMap : G → M := fun g => ((source9SpinGammaSpecialOrthogonalHom g) : M)

/-- The literal existing group map in its original ambient matrix carrier is the exact evaluation. -/
theorem source9SpinGammaAmbient_eq_eval : matrixMap = (gammaCLM : C → M) ∘ inclusion := by
  funext g
  calc
    matrixMap g = source9GammaCliffordAlgHom (g : C) := source9SpinGammaSpecialOrthogonalHom_apply g
    _ = gammaCLM (inclusion g) := (source9OriginalGammaEvaluationCLM_apply (inclusion g)).symm
    _ = ((gammaCLM : C → M) ∘ inclusion) g := rfl

theorem source9SpinGammaAmbient_mdifferentiableAt :
    MDifferentiableAt I K matrixMap (1 : G) := by
  have hGamma : MDifferentiableAt J K (gammaCLM : C → M) (inclusion (1 : G)) :=
    gammaCLM.mdifferentiableAt
  have hInclusion : MDifferentiableAt I J inclusion (1 : G) :=
    source9SpinIdentityInclusion_mdifferentiableAt
  rw [source9SpinGammaAmbient_eq_eval]
  exact hGamma.comp (1 : G) hInclusion

/-- Actual native manifold differential, with only the canonical normed-matrix target identification. -/
noncomputable def source9SpinIdentityGammaDifferential : T →L[ℝ] M :=
  (NormedSpace.fromTangentSpace (𝕜 := ℝ) (matrixMap (1 : G))).toContinuousLinearMap.comp
    (mfderiv I K matrixMap (1 : G))

-- For normed vector spaces these two target/source tangent identifications are canonical.
private theorem source9GammaCLM_mfderiv_apply (x : C) (v : TangentSpace J x) :
    NormedSpace.fromTangentSpace (𝕜 := ℝ) (gammaCLM x)
      (mfderiv J K (gammaCLM : C → M) x v) =
        gammaCLM (NormedSpace.fromTangentSpace (𝕜 := ℝ) x v) := by
  have hGamma : mfderiv J K (gammaCLM : C → M) x = gammaCLM :=
    ContinuousLinearMap.mfderiv_eq gammaCLM
  have hv := congrArg
    (fun L : TangentSpace J x →L[ℝ] TangentSpace K (gammaCLM x) => L v) hGamma
  calc
    NormedSpace.fromTangentSpace (𝕜 := ℝ) (gammaCLM x)
        (mfderiv J K (gammaCLM : C → M) x v) =
        NormedSpace.fromTangentSpace (𝕜 := ℝ) (gammaCLM x) (gammaCLM v) :=
      congrArg (NormedSpace.fromTangentSpace (𝕜 := ℝ) (gammaCLM x)) hv
    _ = gammaCLM (NormedSpace.fromTangentSpace (𝕜 := ℝ) x v) := rfl

/-- Full native operator factorization, proved by the native chain rule and checked naming equality. -/
theorem source9SpinIdentityGammaDifferential_factor :
    source9SpinIdentityGammaDifferential = gammaCLM.comp inclusionD := by
  have hGamma : MDifferentiableAt J K (gammaCLM : C → M) (inclusion (1 : G)) :=
    gammaCLM.mdifferentiableAt
  have hInclusion : MDifferentiableAt I J inclusion (1 : G) :=
    source9SpinIdentityInclusion_mdifferentiableAt
  have hChain : mfderiv I K ((gammaCLM : C → M) ∘ inclusion) (1 : G) =
      (mfderiv J K (gammaCLM : C → M) (inclusion (1 : G))).comp
        (mfderiv I J inclusion (1 : G)) :=
    mfderiv_comp (1 : G) hGamma hInclusion
  have hName : source9SpinIdentityGammaDifferential =
      (NormedSpace.fromTangentSpace (𝕜 := ℝ) (gammaCLM (inclusion (1 : G)))).toContinuousLinearMap.comp
        (mfderiv I K ((gammaCLM : C → M) ∘ inclusion) (1 : G)) :=
    congrArg (fun f : G → M =>
      (NormedSpace.fromTangentSpace (𝕜 := ℝ) (f (1 : G))).toContinuousLinearMap.comp
        (mfderiv I K f (1 : G))) source9SpinGammaAmbient_eq_eval
  apply ContinuousLinearMap.ext
  intro v
  have hValue := congrArg
    (fun L : T →L[ℝ] TangentSpace K (gammaCLM (inclusion (1 : G))) => L v) hChain
  calc
    source9SpinIdentityGammaDifferential v =
        NormedSpace.fromTangentSpace (𝕜 := ℝ) (gammaCLM (inclusion (1 : G)))
          (mfderiv I K ((gammaCLM : C → M) ∘ inclusion) (1 : G) v) :=
      congrArg (fun L : T →L[ℝ] M => L v) hName
    _ = NormedSpace.fromTangentSpace (𝕜 := ℝ) (gammaCLM (inclusion (1 : G)))
        (mfderiv J K (gammaCLM : C → M) (inclusion (1 : G))
          (mfderiv I J inclusion (1 : G) v)) :=
      congrArg (NormedSpace.fromTangentSpace (𝕜 := ℝ) (gammaCLM (inclusion (1 : G)))) hValue
    _ = gammaCLM (NormedSpace.fromTangentSpace (𝕜 := ℝ) (inclusion (1 : G))
        (mfderiv I J inclusion (1 : G) v)) := source9GammaCLM_mfderiv_apply _ _
    _ = (gammaCLM.comp inclusionD) v := rfl

theorem source9SpinIdentityGammaDifferential_apply (v : T) :
    source9SpinIdentityGammaDifferential v = source9GammaCliffordAlgHom (inclusionD v) :=
  (congrArg (fun L : T →L[ℝ] M => L v) source9SpinIdentityGammaDifferential_factor).trans
    (source9OriginalGammaEvaluationCLM_apply (inclusionD v))

theorem source9SpinIdentityGammaDifferential_range_apply (x : R) :
    source9SpinIdentityGammaDifferential (rangeEquiv.symm x) = source9GammaCliffordAlgHom (x : C) := by
  have hx : inclusionD (rangeEquiv.symm x) = (x : C) :=
    (source9SpinIdentityTangentRangeEquiv_apply _).symm.trans
      (congrArg (fun y : R => (y : C)) (rangeEquiv.apply_symm_apply x))
  exact (source9SpinIdentityGammaDifferential_apply _).trans (congrArg source9GammaCliffordAlgHom hx)

theorem source9SpinIdentityGammaDifferential_native_apply
    (A : LieAlgebra.Orthogonal.so SpaceIndex ℝ) :
    source9SpinIdentityGammaDifferential (rangeEquiv.symm (source9NativeSkewDerivativeRangeEquiv A)) =
      (coordinateToOriginalGammaSkewLieHom A : M) :=
  (source9SpinIdentityGammaDifferential_range_apply _).trans
    (source9NativeSkewDerivativeRangeEquiv_originalGamma A)

theorem source9SpinIdentityGammaDifferential_mem_so (v : T) :
    source9SpinIdentityGammaDifferential v ∈ LieAlgebra.Orthogonal.so SpinIndex ℝ := by
  have hv : source9SpinIdentityGammaDifferential v =
      source9GammaCliffordAlgHom (rangeEquiv v : C) :=
    (source9SpinIdentityGammaDifferential_apply v).trans
      (congrArg source9GammaCliffordAlgHom (source9SpinIdentityTangentRangeEquiv_apply v).symm)
  have hs : source9GammaCliffordAlgHom (rangeEquiv v : C) ∈
      LieAlgebra.Orthogonal.so SpinIndex ℝ :=
    (source9DerivativeRange_originalGamma (rangeEquiv v)).symm ▸
      (coordinateToOriginalGammaSkewLieHom (source9NativeSkewDerivativeRangeEquiv.symm (rangeEquiv v))).property
  exact hv.symm ▸ hs

theorem source9SpinIdentityGammaDifferential_factor_linear :
    source9SpinIdentityGammaDifferential.toLinearMap =
      ((LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule.subtype.comp
        coordinateToOriginalGammaSkewLieHom.toLinearMap).comp
          (source9NativeSkewDerivativeRangeEquiv.symm.toLinearMap.comp rangeEquiv.toLinearMap) := by
  apply LinearMap.ext
  intro v
  exact (source9SpinIdentityGammaDifferential_apply v).trans
    ((congrArg source9GammaCliffordAlgHom (source9SpinIdentityTangentRangeEquiv_apply v).symm).trans
      (source9DerivativeRange_originalGamma (rangeEquiv v)))

#print axioms source9SpinGammaAmbient_eq_eval
#print axioms source9SpinGammaAmbient_mdifferentiableAt
#print axioms source9SpinIdentityGammaDifferential
#print axioms source9SpinIdentityGammaDifferential_factor
#print axioms source9SpinIdentityGammaDifferential_apply
#print axioms source9SpinIdentityGammaDifferential_range_apply
#print axioms source9SpinIdentityGammaDifferential_native_apply
#print axioms source9SpinIdentityGammaDifferential_mem_so
#print axioms source9SpinIdentityGammaDifferential_factor_linear
end
end FCP.BFSSPairedSpin9Clifford
