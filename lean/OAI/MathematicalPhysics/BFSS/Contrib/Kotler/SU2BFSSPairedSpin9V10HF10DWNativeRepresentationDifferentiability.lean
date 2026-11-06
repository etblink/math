import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DVNativeSO16IdentityTangent

/-! F10DW: native identity differentiability of the original F10BC Spin(9) to SO(16) map.
Use the unchanged named source and target atlases. Identify the actual written expression
with the ambient backward coordinates only on a proved neighborhood of zero. The literal
matrix representation along the source inverse chart is smooth; accepted backward
regularity therefore proves coordinate smoothness at zero and native differentiability.
No derivative premise, global manifold instance, intrinsic differential comparison,
smooth group operation, bracket identification or physical/spectral conclusion is added.
Candidate until the complete strict source and independent consumer audit pass. -/
set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open scoped Topology ContDiff Matrix.Norms.Elementwise

local instance f10dwLocalNormedAddCommGroup :
    NormedAddCommGroup (CliffordAlgebra source9Quadratic) := source9PBWNormedAddCommGroup
local instance f10dwLocalNormedSpace :
    NormedSpace ℝ (CliffordAlgebra source9Quadratic) := source9PBWNormedSpace
local instance f10dwLocalSourceChartedSpace :
    ChartedSpace (Fin 36 → ℝ) (spinGroup source9Quadratic) := source9SpinTranslatedChartedSpace
local instance f10dwLocalTargetChartedSpace :
    ChartedSpace (gamma16StrictPlaneIndex → ℝ) (Matrix.specialOrthogonalGroup SpinIndex ℝ) :=
  gamma16SOTranslatedChartedSpace

private abbrev P := Fin 36 → ℝ
private abbrev Q := gamma16StrictPlaneIndex → ℝ
private abbrev C := CliffordAlgebra source9Quadratic
private abbrev G := spinGroup source9Quadratic
private abbrev SO := Matrix.specialOrthogonalGroup SpinIndex ℝ
private abbrev M := GammaMatrix
private abbrev I := modelWithCornersSelf ℝ P
private abbrev L := modelWithCornersSelf ℝ Q
private abbrev representation : G → SO := source9SpinGammaSpecialOrthogonalHom
private abbrev V : Set SO := gamma16CayleyTarget
private abbrev gammaCLM : C →L[ℝ] M := source9OriginalGammaEvaluationCLM

/-- The actual target extended chart is the ambient backward formula on its original domain. -/
theorem gamma16SOIdentity_extChartAt_apply_on_target (r : SO) (hr : r ∈ V) :
    extChartAt L (1 : SO) r = gamma16CayleyBackwardAmbientCoordinates (r : M) := by
  calc
    extChartAt L (1 : SO) r = chartAt Q (1 : SO) r := by
      simpa only [modelWithCornersSelf_coe, Function.id_comp] using
        congrFun (extChartAt_coe (I := L) (1 : SO)) r
    _ = gamma16CayleyOpenPartialHomeomorph ((1 : SO)⁻¹ * r) :=
      gamma16SOLeftTranslatedChart_apply (1 : SO) r
    _ = gamma16CayleyOpenPartialHomeomorph r := by rw [inv_one, one_mul]
    _ = gamma16CayleyBackwardAmbientCoordinates (r : M) :=
      gamma16CayleyChart_eq_ambient_on_target r hr

/-- Literal existing representation along the actual total source inverse chart, in matrices. -/
noncomputable def source9SpinGammaIdentityChartMatrix (t : P) : M :=
  (representation (source9SpinIdentityLocalChart.symm t) : M)

theorem source9SpinGammaIdentityChartMatrix_eq_eval :
    source9SpinGammaIdentityChartMatrix =
      (gammaCLM : C → M) ∘ (fun t : P => (source9SpinIdentityLocalChart.symm t : C)) := by
  funext t
  exact (source9SpinGammaSpecialOrthogonalHom_apply (source9SpinIdentityLocalChart.symm t)).trans
    (source9OriginalGammaEvaluationCLM_apply _).symm

theorem source9SpinGammaIdentityChartMatrix_zero : source9SpinGammaIdentityChartMatrix (0 : P) = 1 := by
  change (representation (source9SpinIdentityLocalChart.symm (0 : P)) : M) = 1
  have hzero : source9SpinIdentityLocalChart.symm (0 : P) = (1 : G) :=
    (congrFun source9SpinIdentityLocalChart_symm_coe (0 : P)).trans source9OrderedStrictPlaneWord_zero
  rw [hzero]
  exact congrArg (fun r : SO => (r : M)) source9SpinGammaSpecialOrthogonalHom.map_one

/-- Every-order ambient regularity of the literal representation along the inverse chart. -/
theorem source9SpinGammaIdentityChartMatrix_contDiff (n : ℕ∞ω) :
    ContDiff ℝ n source9SpinGammaIdentityChartMatrix := by
  rw [source9SpinGammaIdentityChartMatrix_eq_eval]
  exact gammaCLM.contDiff.comp (source9IdentityChartInverse_clifford_contDiff_pbw n)

/-- Continuity and the actual identity value keep the group-valued curve in the target chart. -/
theorem source9SpinGammaIdentityChartTarget_mem_eventually :
    ∀ᶠ t : P in 𝓝 (0 : P), representation (source9SpinIdentityLocalChart.symm t) ∈ V := by
  let f : P → SO := representation ∘ source9SpinIdentityLocalChart.symm
  have hinverse : Continuous (source9SpinIdentityLocalChart.symm : P → G) := by
    rw [source9SpinIdentityLocalChart_symm_coe]
    exact source9OrderedStrictPlaneWord_continuous_pbw
  have hcont : Continuous f := source9SpinGammaSpecialOrthogonalHom_continuous_pbw.comp hinverse
  have hzero : f (0 : P) = (1 : SO) := by
    change representation (source9SpinIdentityLocalChart.symm (0 : P)) = (1 : SO)
    have hinverse_zero : source9SpinIdentityLocalChart.symm (0 : P) = (1 : G) :=
      (congrFun source9SpinIdentityLocalChart_symm_coe (0 : P)).trans source9OrderedStrictPlaneWord_zero
    rw [hinverse_zero]
    exact source9SpinGammaSpecialOrthogonalHom.map_one
  have ht : Filter.Tendsto f (𝓝 (0 : P)) (𝓝 (f (0 : P))) := hcont.continuousAt
  rw [hzero] at ht
  have hV : V ∈ 𝓝 (1 : SO) := gamma16CayleyTarget_isOpen.mem_nhds gamma16CayleyTarget_one
  exact ht hV

/-- Neighborhood equality, without extending native chart laws outside their original domain. -/
theorem source9SpinGamma_written_eventuallyEq :
    writtenInExtChartAt I L (1 : G) representation =ᶠ[𝓝 (0 : P)]
      gamma16CayleyBackwardAmbientCoordinates ∘ source9SpinGammaIdentityChartMatrix := by
  exact Filter.Eventually.mono source9SpinGammaIdentityChartTarget_mem_eventually (fun t ht => by
    change extChartAt L (representation (1 : G))
      (representation ((extChartAt I (1 : G)).symm t)) =
        gamma16CayleyBackwardAmbientCoordinates (source9SpinGammaIdentityChartMatrix t)
    rw [show representation (1 : G) = (1 : SO) from source9SpinGammaSpecialOrthogonalHom.map_one,
      source9SpinIdentity_extChartAt_symm]
    exact gamma16SOIdentity_extChartAt_apply_on_target _ ht)

/-- Smoothness at zero of the actual native coordinate expression, at every regularity order. -/
theorem source9SpinGamma_written_contDiffAt_zero (n : ℕ∞ω) :
    ContDiffAt ℝ n (writtenInExtChartAt I L (1 : G) representation) (0 : P) := by
  have hden : (source9SpinGammaIdentityChartMatrix (0 : P) + 1).det ≠ 0 := by
    rw [source9SpinGammaIdentityChartMatrix_zero]
    exact gamma16CayleyTwo_det_ne_zero
  have houter : ContDiffAt ℝ n gamma16CayleyBackwardAmbientCoordinates
      (source9SpinGammaIdentityChartMatrix (0 : P)) :=
    gamma16CayleyBackwardAmbientCoordinates_contDiffAt n _ hden
  have hcomp : ContDiffAt ℝ n
      (gamma16CayleyBackwardAmbientCoordinates ∘ source9SpinGammaIdentityChartMatrix) (0 : P) :=
    houter.comp (0 : P) (source9SpinGammaIdentityChartMatrix_contDiff n).contDiffAt
  exact hcomp.congr_of_eventuallyEq source9SpinGamma_written_eventuallyEq

theorem source9SpinGamma_written_differentiableAt_zero :
    DifferentiableAt ℝ (writtenInExtChartAt I L (1 : G) representation) (0 : P) :=
  (source9SpinGamma_written_contDiffAt_zero 1).differentiableAt_one

/-- Native differentiability of the unchanged F10BC homomorphism into the actual SO(16) manifold. -/
theorem source9SpinGammaSpecialOrthogonalHom_mdifferentiableAt_one :
    MDifferentiableAt I L representation (1 : G) := by
  apply (mdifferentiableAt_iff (I := I) (I' := L) representation (1 : G)).2
  constructor
  · exact source9SpinGammaSpecialOrthogonalHom_continuous_pbw.continuousAt
  · rw [source9SpinIdentity_extChartAt_center]
    exact source9SpinGamma_written_differentiableAt_zero.differentiableWithinAt

theorem source9SpinGammaSpecialOrthogonalHom_hasMFDerivAt_one :
    HasMFDerivAt I L representation (1 : G) (mfderiv I L representation (1 : G)) :=
  source9SpinGammaSpecialOrthogonalHom_mdifferentiableAt_one.hasMFDerivAt

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
