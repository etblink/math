import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10DKAmbientGammaManifoldDifferential
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10AIOriginalGammaAllOrderedPairsLinearIndependentBridge
import Mathlib.LinearAlgebra.Dimension.Constructions

/-! F10DL: injectivity and rank of the actual identity differential into the original matrix carrier.
Use accepted full ordered-pair coefficient uniqueness, the existing native skew model and F10DK.
The new tangent equivalence is real-linear. No source tangent bracket, intrinsic SO(16) atlas,
global group injectivity or physical conclusion is asserted. Candidate until complete strict CI. -/
set_option autoImplicit false
namespace FCP.BFSSPairedSpin9Clifford
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.BFSSPairedSpin9Plane
open scoped Topology BigOperators Matrix.Norms.Elementwise
attribute [local instance 100] LieRing.ofAssociativeRing

local instance f10dlLocalNormedAddCommGroup :
    NormedAddCommGroup (CliffordAlgebra source9Quadratic) := source9PBWNormedAddCommGroup
local instance f10dlLocalNormedSpace :
    NormedSpace ℝ (CliffordAlgebra source9Quadratic) := source9PBWNormedSpace
local instance f10dlLocalChartedSpace :
    ChartedSpace (Fin 36 → ℝ) (spinGroup source9Quadratic) := source9SpinTranslatedChartedSpace

private abbrev P := Fin 36 → ℝ
private abbrev G := spinGroup source9Quadratic
private abbrev M := GammaMatrix
private abbrev I := modelWithCornersSelf ℝ P
private abbrev T := TangentSpace I (1 : G)
private abbrev S := LieAlgebra.Orthogonal.so SpaceIndex ℝ
private abbrev D : T →L[ℝ] M := source9SpinIdentityGammaDifferential
private abbrev E := source9SpinIdentityTangentRangeEquiv
private abbrev rho : S →ₗ[ℝ] M :=
  (LieAlgebra.Orthogonal.so SpinIndex ℝ).toSubmodule.subtype.comp
    coordinateToOriginalGammaSkewLieHom.toLinearMap

/-- Every native skew input uses all original increasing gamma pairs with the accepted half factor. -/
theorem coordinateToOriginalGammaSkewLieHom_orderedPair_sum (A : S) :
    (coordinateToOriginalGammaSkewLieHom A : M) =
      ∑ p : Source9OrderedGammaPairIndex,
        (A.val p.val.1 p.val.2 * (1 / 2 : ℝ)) • source9OrderedGammaPairMatrix p := by
  classical
  have hA : (A : Matrix SpaceIndex SpaceIndex ℝ) =
      ∑ p : source9StrictPlaneIndex,
        A.val p.val.1 p.val.2 • coordinatePlane9 p.val.1 p.val.2 := by
    have h := source9StrictPlaneModelEquiv_apply_sum (source9StrictPlaneModelEquiv.symm A)
    rw [source9StrictPlaneModelEquiv.apply_symm_apply] at h
    simpa only [source9StrictPlaneModelEquiv_symm_apply] using h
  calc
    (coordinateToOriginalGammaSkewLieHom A : M) =
        coordinateToOriginalGammaLinearMap (A : Matrix SpaceIndex SpaceIndex ℝ) := rfl
    _ = coordinateToOriginalGammaLinearMap
        (∑ p : source9StrictPlaneIndex,
          A.val p.val.1 p.val.2 • coordinatePlane9 p.val.1 p.val.2) :=
      congrArg coordinateToOriginalGammaLinearMap hA
    _ = ∑ p : source9StrictPlaneIndex,
        coordinateToOriginalGammaLinearMap
          (A.val p.val.1 p.val.2 • coordinatePlane9 p.val.1 p.val.2) := by rw [map_sum]
    _ = ∑ p : Source9OrderedGammaPairIndex,
        (A.val p.val.1 p.val.2 * (1 / 2 : ℝ)) • source9OrderedGammaPairMatrix p := by
      apply Finset.sum_congr rfl
      intro p _
      rw [map_smul, coordinateToOriginalGammaLinearMap_coordinatePlane,
        dite_eq_right (ne_of_lt p.property), smul_smul]

/-- F10BB is injective even after inclusion into the literal original matrix carrier. -/
theorem coordinateToOriginalGammaSkewLieHom_matrix_injective :
    Function.Injective (fun A : S => (coordinateToOriginalGammaSkewLieHom A : M)) := by
  intro A B h
  have hc : (fun p : Source9OrderedGammaPairIndex => A.val p.val.1 p.val.2 * (1 / 2 : ℝ)) =
      (fun p : Source9OrderedGammaPairIndex => B.val p.val.1 p.val.2 * (1 / 2 : ℝ)) :=
    source9OriginalGamma_all_ordered_pairs_coeff_unique _ _
      ((coordinateToOriginalGammaSkewLieHom_orderedPair_sum A).symm.trans
        (h.trans (coordinateToOriginalGammaSkewLieHom_orderedPair_sum B)))
  apply source9StrictPlaneModelEquiv.symm.injective
  funext p
  change A.val p.val.1 p.val.2 = B.val p.val.1 p.val.2
  have hp : A.val p.val.1 p.val.2 * (1 / 2 : ℝ) =
      B.val p.val.1 p.val.2 * (1 / 2 : ℝ) := congrFun hc p
  linarith only [hp]

/-- Actual identity tangent to native so(9) as a real-linear equivalence only. -/
noncomputable def source9SpinIdentityNativeSkewLinearEquiv : T ≃ₗ[ℝ] S :=
  E.trans source9NativeSkewDerivativeRangeEquiv.symm

/-- Full value factorization on every actual tangent input, using the accepted native differential. -/
theorem source9SpinIdentityGammaDifferential_native_factor (v : T) :
    D v = (coordinateToOriginalGammaSkewLieHom (source9SpinIdentityNativeSkewLinearEquiv v) : M) := by
  have h := congrArg (fun L : T →ₗ[ℝ] M => L v)
    source9SpinIdentityGammaDifferential_factor_linear
  exact h

theorem source9SpinIdentityGammaDifferential_injective : Function.Injective D := by
  intro v w h
  apply source9SpinIdentityNativeSkewLinearEquiv.injective
  apply coordinateToOriginalGammaSkewLieHom_matrix_injective
  exact (source9SpinIdentityGammaDifferential_native_factor v).symm.trans
    (h.trans (source9SpinIdentityGammaDifferential_native_factor w))

theorem source9SpinIdentityGammaDifferential_ker : D.toLinearMap.ker = ⊥ :=
  LinearMap.ker_eq_bot.mpr source9SpinIdentityGammaDifferential_injective

/-- The actual native differential has exactly F10BB's original ambient matrix image. -/
theorem source9SpinIdentityGammaDifferential_range : D.toLinearMap.range = rho.range := by
  ext X
  constructor
  · rintro ⟨v, rfl⟩
    exact ⟨source9SpinIdentityNativeSkewLinearEquiv v,
      (source9SpinIdentityGammaDifferential_native_factor v).symm⟩
  · rintro ⟨A, rfl⟩
    refine ⟨source9SpinIdentityNativeSkewLinearEquiv.symm A, ?_⟩
    exact (source9SpinIdentityGammaDifferential_native_factor _).trans
      (congrArg (fun B : S => (coordinateToOriginalGammaSkewLieHom B : M))
        (source9SpinIdentityNativeSkewLinearEquiv.apply_symm_apply A))

theorem source9SpinIdentityTangent_finrank : Module.finrank ℝ T = 36 := by
  calc
    Module.finrank ℝ T = Module.finrank ℝ P :=
      (source9SpinIdentityNativeSkewLinearEquiv.trans
        source9OrderedStrictPlaneModelEquiv.symm).finrank_eq
    _ = 36 := Module.finrank_fin_fun ℝ

theorem source9SpinIdentityGammaDifferential_range_finrank :
    Module.finrank ℝ D.toLinearMap.range = 36 :=
  (LinearMap.finrank_range_of_inj (f := D.toLinearMap)
    source9SpinIdentityGammaDifferential_injective).trans
    source9SpinIdentityTangent_finrank

#print axioms coordinateToOriginalGammaSkewLieHom_orderedPair_sum
#print axioms coordinateToOriginalGammaSkewLieHom_matrix_injective
#print axioms source9SpinIdentityNativeSkewLinearEquiv
#print axioms source9SpinIdentityGammaDifferential_native_factor
#print axioms source9SpinIdentityGammaDifferential_injective
#print axioms source9SpinIdentityGammaDifferential_ker
#print axioms source9SpinIdentityGammaDifferential_range
#print axioms source9SpinIdentityTangent_finrank
#print axioms source9SpinIdentityGammaDifferential_range_finrank
end
end FCP.BFSSPairedSpin9Clifford
