import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10CZOriginalGammaDerivativeRangeComparison
import Mathlib.Tactic.NormNum
set_option autoImplicit false
open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.BFSSPairedSpin9Plane
open FCP.BFSSPairedSpin9Clifford
noncomputable section

-- Reconstruct the accepted PBW norm independently, preserving the original Clifford carrier.
local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _
private def auditGammaPBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))
local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditGammaPBWCoordinates.toAddMonoidHom auditGammaPBWCoordinates.injective
local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditGammaPBWCoordinates

@[instance_reducible] private def auditGammaSpinTopology :
    TopologicalSpace (spinGroup source9Quadratic) := inferInstance
@[instance_reducible] private def auditGammaMatrixTopology :
    TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ) := inferInstance
@[instance_reducible] private def auditGammaParameterTopology :
    TopologicalSpace (Fin 36 → ℝ) := inferInstance
@[instance_reducible] private def auditGammaTargetTopology :
    TopologicalSpace GammaMatrix := inferInstance
open scoped BigOperators Topology Matrix.Norms.Elementwise

example : source9PBWCoordinates = auditGammaPBWCoordinates := rfl
example : source9PBWNormedAddCommGroup = NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ)
    auditGammaPBWCoordinates.toAddMonoidHom auditGammaPBWCoordinates.injective := rfl
example : source9PBWNormedSpace = NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic) (Finset SpaceIndex → ℝ) auditGammaPBWCoordinates := rfl
example : NormedSpace ℝ (CliffordAlgebra source9Quadratic) := inferInstance
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    auditGammaSpinTopology := rfl
example : (inferInstance : TopologicalSpace (Matrix SpaceIndex SpaceIndex ℝ)) =
    auditGammaMatrixTopology := rfl
example : (inferInstance : TopologicalSpace (spinGroup source9Quadratic)) =
    TopologicalSpace.induced (Subtype.val : spinGroup source9Quadratic → CliffordAlgebra source9Quadratic)
      (inferInstance : TopologicalSpace (CliffordAlgebra source9Quadratic)) := rfl
example : source9SpinNaturalMatrixRecoveryNeighborhood ∈ 𝓝 (1 : spinGroup source9Quadratic) :=
  source9SpinNaturalMatrixRecoveryNeighborhood_mem_nhds_one_pbw





-- Fix the original real gamma carrier and its unchanged standard product topology.
example : GammaMatrix = Matrix SpinIndex SpinIndex ℝ := rfl
example : Fintype.card SpinIndex = 16 := by decide
example : Fintype.card SpaceIndex = 9 := by decide
example : (inferInstance : TopologicalSpace GammaMatrix) = auditGammaTargetTopology := rfl
example : (inferInstance : TopologicalSpace (Fin 36 → ℝ)) = auditGammaParameterTopology := rfl
example : NormedSpace ℝ GammaMatrix := inferInstance
example : Module ℝ (LieAlgebra.Orthogonal.so SpinIndex ℝ) := inferInstance
example : (0 : Fin 36 → ℝ) ∈ source9SpinIdentityLocalChart.target :=
  source9SpinIdentityLocalChart_zero_mem_target
example (g : spinGroup source9Quadratic) :
    ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) ∈
      Matrix.specialOrthogonalGroup SpinIndex ℝ :=
  (source9SpinGammaSpecialOrthogonalHom g).property
example (v : Fin 36 → ℝ) :
    source9GammaCliffordAlgHom (source9IdentityChartDerivative v) =
      coordinateToOriginalGammaLinearMap
        (source9OrderedStrictPlaneModelEquiv v : Matrix SpaceIndex SpaceIndex ℝ) :=
  source9IdentityChartDerivative_originalGamma v
example (A : LieAlgebra.Orthogonal.so SpaceIndex ℝ) :
    source9GammaCliffordAlgHom
      (source9NativeSkewDerivativeRangeEquiv A : CliffordAlgebra source9Quadratic) =
        (coordinateToOriginalGammaSkewLieHom A : GammaMatrix) :=
  source9NativeSkewDerivativeRangeEquiv_originalGamma A
example (x : source9IdentityChartDerivativeRange) :
    source9GammaCliffordAlgHom (x : CliffordAlgebra source9Quadratic) =
      (coordinateToOriginalGammaSkewLieHom (source9NativeSkewDerivativeRangeEquiv.symm x) : GammaMatrix) :=
  source9DerivativeRange_originalGamma x
example (A : LieAlgebra.Orthogonal.so SpaceIndex ℝ) :
    source9GammaCliffordAlgHom
      (source9NativeSkewDerivativeRangeEquiv A : CliffordAlgebra source9Quadratic) ∈
        LieAlgebra.Orthogonal.so SpinIndex ℝ :=
  source9NativeSkewDerivativeRangeEquiv_gamma_mem_so A
example (x : source9IdentityChartDerivativeRange) :
    source9GammaCliffordAlgHom (x : CliffordAlgebra source9Quadratic) ∈
      LieAlgebra.Orthogonal.so SpinIndex ℝ :=
  (source9DerivativeRange_originalGamma x).symm ▸
    (coordinateToOriginalGammaSkewLieHom (source9NativeSkewDerivativeRangeEquiv.symm x)).property

-- Explicit original coefficient normalization, independently retaining all original source labels.
example (A : LieAlgebra.Orthogonal.so SpaceIndex ℝ) :
    source9GammaCliffordAlgHom
      (source9NativeSkewDerivativeRangeEquiv A : CliffordAlgebra source9Quadratic) =
      (1 / 4 : ℝ) • ∑ r : SpaceIndex, ∑ s : SpaceIndex, A.val r s • (gamma r * gamma s) := by
  have hnative : source9GammaCliffordAlgHom
      (source9NativeSkewDerivativeRangeEquiv A : CliffordAlgebra source9Quadratic) =
        coordinateToOriginalGammaLinearMap A.val :=
    source9NativeSkewDerivativeRangeEquiv_originalGamma A
  exact hnative.trans (coordinateToOriginalGammaLinearMap_apply A.val)
example (r s : SpaceIndex) (hrs : r ≠ s) :
    source9GammaCliffordAlgHom
      (source9NativeSkewDerivativeRangeEquiv (source9CoordinatePlaneInSo r s) :
        CliffordAlgebra source9Quadratic) = (1 / 2 : ℝ) • (gamma r * gamma s) :=
  (source9NativeSkewDerivativeRangeEquiv_originalGamma (source9CoordinatePlaneInSo r s)).trans
    (coordinateToOriginalGammaSkewLieHom_coordinatePlane_apply r s hrs)
example (A : LieAlgebra.Orthogonal.so SpaceIndex ℝ) (a b : SpinIndex) :
    source9GammaCliffordAlgHom
      (source9NativeSkewDerivativeRangeEquiv A : CliffordAlgebra source9Quadratic) a b =
        (coordinateToOriginalGammaSkewLieHom A : GammaMatrix) a b :=
  congrArg (fun M : GammaMatrix => M a b) (source9NativeSkewDerivativeRangeEquiv_originalGamma A)
example : CliffordAlgebra source9Quadratic →L[ℝ] GammaMatrix := source9OriginalGammaEvaluationCLM
example (x : CliffordAlgebra source9Quadratic) :
    source9OriginalGammaEvaluationCLM x = source9GammaCliffordAlgHom x :=
  source9OriginalGammaEvaluationCLM_apply x
example : source9OriginalGammaEvaluationCLM.toLinearMap = source9GammaCliffordAlgHom.toLinearMap := rfl
example : Continuous (fun x : CliffordAlgebra source9Quadratic => source9GammaCliffordAlgHom x) := by
  let E : CliffordAlgebra source9Quadratic →L[ℝ] GammaMatrix := source9OriginalGammaEvaluationCLM
  exact E.continuous

-- Bind operators at full audit consumer types before forming the derivative composition.
example :
    let E : CliffordAlgebra source9Quadratic →L[ℝ] GammaMatrix := source9OriginalGammaEvaluationCLM
    let D : (Fin 36 → ℝ) →L[ℝ] CliffordAlgebra source9Quadratic := source9IdentityChartDerivative
    HasFDerivAt (fun t : Fin 36 → ℝ =>
      ((source9SpinGammaSpecialOrthogonalHom (source9SpinIdentityLocalChart.symm t)) : GammaMatrix))
      (E.comp D) 0 := source9IdentityChartInverse_originalGamma_hasFDerivAt_zero
example (v : Fin 36 → ℝ) :
    (fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinGammaSpecialOrthogonalHom (source9SpinIdentityLocalChart.symm t)) : GammaMatrix)) 0) v =
      (coordinateToOriginalGammaSkewLieHom (source9OrderedStrictPlaneModelEquiv v) : GammaMatrix) :=
  source9IdentityChartInverse_originalGamma_fderiv_zero_apply v
example :
    let rho : LieAlgebra.Orthogonal.so SpaceIndex ℝ →ₗ[ℝ] GammaMatrix :=
      (LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule.subtype.comp
        coordinateToOriginalGammaSkewLieHom.toLinearMap
    let M : (Fin 36 → ℝ) →ₗ[ℝ] LieAlgebra.Orthogonal.so SpaceIndex ℝ :=
      source9OrderedStrictPlaneModelEquiv.toLinearMap
    (fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinGammaSpecialOrthogonalHom (source9SpinIdentityLocalChart.symm t)) : GammaMatrix)) 0).toLinearMap =
      rho.comp M := source9IdentityChartInverse_originalGamma_fderiv_zero_factor
example (v : Fin 36 → ℝ) :
    (fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinGammaSpecialOrthogonalHom (source9SpinIdentityLocalChart.symm t)) : GammaMatrix)) 0) v =
        source9GammaCliffordAlgHom (source9IdentityChartDerivative v) :=
  congrArg (fun L : (Fin 36 → ℝ) →L[ℝ] GammaMatrix => L v)
    source9IdentityChartInverse_originalGamma_hasFDerivAt_zero.fderiv
example (v : Fin 36 → ℝ) :
    (fderiv ℝ (fun t : Fin 36 → ℝ =>
      ((source9SpinGammaSpecialOrthogonalHom (source9SpinIdentityLocalChart.symm t)) : GammaMatrix)) 0) v ∈
      LieAlgebra.Orthogonal.so SpinIndex ℝ :=
  (source9IdentityChartInverse_originalGamma_fderiv_zero_apply v).symm ▸
    (coordinateToOriginalGammaSkewLieHom (source9OrderedStrictPlaneModelEquiv v)).property
example (g : spinGroup source9Quadratic) :
    ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) =
      source9OriginalGammaEvaluationCLM (g : CliffordAlgebra source9Quadratic) :=
  source9SpinGammaSpecialOrthogonalHom_apply g
example (g : spinGroup source9Quadratic) (hg : g ∈ source9SpinIdentityLocalChart.source) :
    source9SpinIdentityLocalChart.symm (source9SpinIdentityLocalChart g) = g :=
  source9SpinIdentityLocalChart.left_inv hg

-- The original gamma evaluation is unital and cannot be the zero linear map.
example : source9OriginalGammaEvaluationCLM (1 : CliffordAlgebra source9Quadratic) = 1 :=
  map_one source9GammaCliffordAlgHom
example : source9OriginalGammaEvaluationCLM ≠ 0 := by
  intro h
  have hvalue : source9OriginalGammaEvaluationCLM (1 : CliffordAlgebra source9Quadratic) = 0 :=
    congrArg (fun L : CliffordAlgebra source9Quadratic →L[ℝ] GammaMatrix => L 1) h
  have hone : (1 : GammaMatrix) = 0 := (map_one source9GammaCliffordAlgHom).symm.trans hvalue
  have hentry := congrArg (fun M : GammaMatrix => M (0 : SpinIndex) 0) hone
  norm_num at hentry
example : ((source9SpinGammaSpecialOrthogonalHom
    (source9SpinIdentityLocalChart.symm (0 : Fin 36 → ℝ))) : GammaMatrix) = 1 := by
  have hg : source9SpinIdentityLocalChart.symm (0 : Fin 36 → ℝ) = 1 := source9OrderedStrictPlaneWord_zero
  have hm := congrArg (fun g : spinGroup source9Quadratic =>
    ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix)) hg
  have hone : ((source9SpinGammaSpecialOrthogonalHom (1 : spinGroup source9Quadratic)) : GammaMatrix) = 1 :=
    congrArg (fun M : Matrix.specialOrthogonalGroup SpinIndex ℝ => (M : GammaMatrix))
      (map_one source9SpinGammaSpecialOrthogonalHom)
  exact hm.trans hone
example : ¬ Function.Injective (fun g : spinGroup source9Quadratic =>
    ((source9SpinVectorOrthogonalHom g) : Matrix SpaceIndex SpaceIndex ℝ)) :=
  source9NaturalMatrix_not_injective

#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartDerivative_originalGamma
#print axioms FCP.BFSSPairedSpin9Clifford.source9NativeSkewDerivativeRangeEquiv_originalGamma
#print axioms FCP.BFSSPairedSpin9Clifford.source9DerivativeRange_originalGamma
#print axioms FCP.BFSSPairedSpin9Clifford.source9NativeSkewDerivativeRangeEquiv_gamma_mem_so
#print axioms FCP.BFSSPairedSpin9Clifford.source9OriginalGammaEvaluationCLM
#print axioms FCP.BFSSPairedSpin9Clifford.source9OriginalGammaEvaluationCLM_apply
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartInverse_originalGamma_hasFDerivAt_zero
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartInverse_originalGamma_fderiv_zero_apply
#print axioms FCP.BFSSPairedSpin9Clifford.source9IdentityChartInverse_originalGamma_fderiv_zero_factor
end
