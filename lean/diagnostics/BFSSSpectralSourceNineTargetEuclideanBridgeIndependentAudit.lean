import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineTargetEuclideanBridge

/-! Independent arbitrary-target, source-action, determinant and fixed-axis bridge consumers. -/
set_option autoImplicit false

namespace FCP.BFSSSourceNineTargetEuclideanBridgeIndependentAudit
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSourceNineOrientation FCP.BFSSSourceNineReflection
open FCP.BFSSSourceNineTargetEuclideanBridge
open Submodule

private abbrev V := SpaceIndex → ℝ
private abbrev Euc9 := EuclideanSpace ℝ SpaceIndex
private abbrev E : V ≃ₗ[ℝ] Euc9 := source9ToEuclidean
private abbrev SO9 := Matrix.specialOrthogonalGroup SpaceIndex ℝ
private abbrev M9 := Matrix SpaceIndex SpaceIndex ℝ

private theorem source_image_action (g : spinGroup source9Quadratic) (z : V) :
    source9TargetEuclideanIsometry (source9SpinVectorSpecialOrthogonalHom g) (E z) =
      E (source9SpinVectorRepresentation g z) := by
  rw [source9TargetEuclideanIsometry_apply_source,
    source9SpinVectorSpecialOrthogonalHom_mulVec]

example (A : SO9) (z : V) : source9TargetVectorLinearEquiv A z = (A : M9).mulVec z :=
  source9TargetVectorLinearEquiv_apply A z

example (A : SO9) (z : V) :
    source9Quadratic (source9TargetVectorLinearEquiv A z) = source9Quadratic z :=
  source9TargetVectorLinearEquiv_preserves_quadratic A z

example (A : SO9) (x : Euc9) : ‖source9TargetEuclideanLinearEquiv A x‖ = ‖x‖ :=
  source9TargetEuclideanLinearEquiv_norm_map A x

example (A : Matrix.specialOrthogonalGroup (Fin 9) ℝ) :
    EuclideanSpace ℝ (Fin 9) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin 9) :=
  source9TargetEuclideanIsometry A

example (A : SO9) (z : V) :
    source9TargetEuclideanIsometry A (source9ToEuclidean z) =
      source9ToEuclidean ((A : M9).mulVec z) :=
  source9TargetEuclideanIsometry_apply_source A z

example (A : SO9) : LinearMap.det (source9TargetEuclideanIsometry A).toLinearMap = (1 : ℝ) :=
  source9TargetEuclideanIsometry_det_one A

example (A : SO9) :
    (A : M9).mulVec (source9CoordinateVector 8) = source9CoordinateVector 8 ↔
      source9TargetEuclideanIsometry A (E (source9CoordinateVector 8)) =
        E (source9CoordinateVector 8) :=
  source9TargetEuclideanIsometry_fixesAxis_iff A

example (A : SO9)
    (h : (A : M9).mulVec (source9CoordinateVector 8) = source9CoordinateVector 8) :
    source9TargetEuclideanIsometry A (E (source9CoordinateVector 8)) =
      E (source9CoordinateVector 8) :=
  (source9TargetEuclideanIsometry_fixesAxis_iff A).mp h

example (A : SO9)
    (h : (A : M9).mulVec (source9CoordinateVector 8) ≠ source9CoordinateVector 8) :
    source9TargetEuclideanIsometry A (E (source9CoordinateVector 8)) ≠
      E (source9CoordinateVector 8) :=
  fun he => h ((source9TargetEuclideanIsometry_fixesAxis_iff A).mpr he)

example (g : spinGroup source9Quadratic) (z : V) :
    source9TargetEuclideanIsometry (source9SpinVectorSpecialOrthogonalHom g) (E z) =
      E (source9SpinVectorRepresentation g z) := source_image_action g z

example (z : V) : source9TargetEuclideanIsometry (1 : SO9) (E z) = E z := by
  rw [source9TargetEuclideanIsometry_apply_source]
  change E ((1 : M9).mulVec z) = E z
  rw [Matrix.one_mulVec]

example (A : SO9) (x : Euc9) :
    source9TargetEuclideanIsometry A ((source9TargetEuclideanIsometry A).symm x) = x :=
  (source9TargetEuclideanIsometry A).apply_symm_apply x

example (u v z : V) (hu : source9Quadratic u = 1) (hv : source9Quadratic v = 1) :
    source9TargetEuclideanIsometry
      (source9SpinVectorSpecialOrthogonalHom (source9UnitVectorPairSpin u v hu hv)) (E z) =
      (ℝ ∙ E u)ᗮ.reflection ((ℝ ∙ E v)ᗮ.reflection (E z)) :=
  (source_image_action _ z).trans (source9UnitVectorPairSpin_eq_native_hyperplane_pair u v z hu hv)

example (A : SO9) (v : V) (hv : source9Quadratic v = 1) :
    ‖source9TargetEuclideanIsometry A (E v)‖ = 1 := by
  calc
    _ = ‖E v‖ := (source9TargetEuclideanIsometry A).norm_map _
    _ = 1 := source9Unit_euclidean_norm_one v hv

#print axioms FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetVectorLinearEquiv
#print axioms FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetVectorLinearEquiv_apply
#print axioms FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetVectorLinearEquiv_preserves_quadratic
#print axioms FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetEuclideanLinearEquiv
#print axioms FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetEuclideanLinearEquiv_norm_map
#print axioms FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetEuclideanIsometry
#print axioms FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetEuclideanIsometry_apply_source
#print axioms FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetEuclideanIsometry_det_one
#print axioms FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetEuclideanIsometry_fixesAxis_iff
#eval IO.println "SPECTRAL_SOURCE_NINE_TARGET_EUCLIDEAN_BRIDGE_CONSUMER_COMPLETE"

end
end FCP.BFSSSourceNineTargetEuclideanBridgeIndependentAudit
