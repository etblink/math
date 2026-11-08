import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineOrientation
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralSourceNineReflectionPair
import Mathlib.LinearAlgebra.UnitaryGroup
import Mathlib.LinearAlgebra.Determinant

/-!
Candidate arbitrary-target bridge for the ACTUAL source-labelled matrix SO(9).
No target is assumed to be the image of any source Spin element. Transport
the exact original matrix action through the existing same-label Euclidean
equivalence, prove its norm and determinant laws, and retain the actual axis.
This constructs no source lift, stabilizer covering or physical spectrum.
-/

set_option autoImplicit false

namespace FCP.BFSSSourceNineTargetEuclideanBridge
noncomputable section

open OAI.BFSSQuantum FCP.BFSSPairedSpin9Clifford
open FCP.BFSSSourceNineOrientation FCP.BFSSSourceNineReflection
open Matrix

private abbrev V := SpaceIndex → ℝ
private abbrev Euc9 := EuclideanSpace ℝ SpaceIndex
private abbrev E : V ≃ₗ[ℝ] Euc9 := source9ToEuclidean
private abbrev SO9 := Matrix.specialOrthogonalGroup SpaceIndex ℝ
private abbrev M9 := Matrix SpaceIndex SpaceIndex ℝ

private abbrev targetOrthogonal (A : SO9) : Matrix.orthogonalGroup SpaceIndex ℝ :=
  ⟨(A : M9), (Matrix.mem_specialOrthogonalGroup_iff.mp A.property).1⟩

/-- The arbitrary actual SO(9) matrix gives a linear equivalence on the original nine labels. -/
noncomputable def source9TargetVectorLinearEquiv (A : SO9) : V ≃ₗ[ℝ] V :=
  Matrix.UnitaryGroup.toLinearEquiv (targetOrthogonal A)

/-- This equivalence acts by the SAME target matrix on the original source coordinates. -/
theorem source9TargetVectorLinearEquiv_apply (A : SO9) (z : V) :
    source9TargetVectorLinearEquiv A z = (A : M9).mulVec z := rfl

/-- Orthogonality preserves the actual original quadratic form, without a source preimage premise. -/
theorem source9TargetVectorLinearEquiv_preserves_quadratic (A : SO9) (z : V) :
    source9Quadratic (source9TargetVectorLinearEquiv A z) = source9Quadratic z := by
  have horth : (A : M9)ᵀ * (A : M9) = 1 :=
    (Matrix.mem_orthogonalGroup_iff' (A := (A : M9))).mp
      (Matrix.mem_specialOrthogonalGroup_iff.mp A.property).1
  simp only [source9Quadratic_eq_dot, source9TargetVectorLinearEquiv_apply]
  calc
    ((A : M9).mulVec z) ⬝ᵥ ((A : M9).mulVec z) =
        z ⬝ᵥ (((A : M9)ᵀ).mulVec ((A : M9).mulVec z)) :=
      (Matrix.dotProduct_transpose_mulVec (A : M9) z ((A : M9).mulVec z)).symm
    _ = z ⬝ᵥ z := by rw [Matrix.mulVec_mulVec, horth, Matrix.one_mulVec]

/-- Same-label Euclidean conjugate of an arbitrary original target matrix. -/
noncomputable def source9TargetEuclideanLinearEquiv (A : SO9) : Euc9 ≃ₗ[ℝ] Euc9 :=
  E.symm.trans ((source9TargetVectorLinearEquiv A).trans E)

/-- Preserve the L2 norm by the original Q identity, without identifying it with the Pi norm. -/
theorem source9TargetEuclideanLinearEquiv_norm_map (A : SO9) (x : Euc9) :
    ‖source9TargetEuclideanLinearEquiv A x‖ = ‖x‖ := by
  change ‖E (source9TargetVectorLinearEquiv A (E.symm x))‖ = ‖x‖
  have hsq : ‖E (source9TargetVectorLinearEquiv A (E.symm x))‖ ^ 2 = ‖x‖ ^ 2 := by
    rw [← source9Quadratic_eq_euclidean_norm_sq,
      source9TargetVectorLinearEquiv_preserves_quadratic,
      source9Quadratic_eq_euclidean_norm_sq, E.apply_symm_apply]
  nlinarith [norm_nonneg (E (source9TargetVectorLinearEquiv A (E.symm x))), norm_nonneg x]

/-- Genuine Euclidean linear isometry equivalence of ANY actual source-labelled SO(9) target. -/
noncomputable def source9TargetEuclideanIsometry (A : SO9) : Euc9 ≃ₗᵢ[ℝ] Euc9 :=
  { source9TargetEuclideanLinearEquiv A with
    norm_map' := source9TargetEuclideanLinearEquiv_norm_map A }

/-- Exact target matrix action on every original vector through the original Euclidean bridge. -/
theorem source9TargetEuclideanIsometry_apply_source (A : SO9) (z : V) :
    source9TargetEuclideanIsometry A (E z) = E ((A : M9).mulVec z) := by
  change E (source9TargetVectorLinearEquiv A (E.symm (E z))) = _
  rw [E.symm_apply_apply, source9TargetVectorLinearEquiv_apply]

/-- Determinant one for the transported ARBITRARY target, not only a source-attained rotation. -/
theorem source9TargetEuclideanIsometry_det_one (A : SO9) :
    LinearMap.det (source9TargetEuclideanIsometry A).toLinearMap = (1 : ℝ) := by
  have hsource : LinearEquiv.det (source9TargetVectorLinearEquiv A) = 1 := by
    apply Units.ext
    rw [LinearEquiv.coe_det, Units.val_one]
    change LinearMap.det (Matrix.toLin' (A : M9)) = (1 : ℝ)
    rw [LinearMap.det_toLin']
    exact (Matrix.mem_specialOrthogonalGroup_iff.mp A.property).2
  have hdet : LinearEquiv.det (source9TargetEuclideanIsometry A).toLinearEquiv = 1 := by
    change LinearEquiv.det (E.symm.trans ((source9TargetVectorLinearEquiv A).trans E)) = 1
    calc
      _ = LinearEquiv.det (source9TargetVectorLinearEquiv A) := LinearEquiv.det_conj _ E
      _ = 1 := hsource
  have hval := congrArg (fun u : ℝˣ => (u : ℝ)) hdet
  simpa only [LinearEquiv.coe_det, Units.val_one] using hval

/-- Fixed-axis target membership is transported exactly, in both directions. -/
theorem source9TargetEuclideanIsometry_fixesAxis_iff (A : SO9) :
    (A : M9).mulVec (source9CoordinateVector 8) = source9CoordinateVector 8 ↔
      source9TargetEuclideanIsometry A (E (source9CoordinateVector 8)) =
        E (source9CoordinateVector 8) := by
  rw [source9TargetEuclideanIsometry_apply_source]
  constructor
  · intro h
    exact congrArg E h
  · intro h
    exact E.injective h

#print axioms FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetVectorLinearEquiv
#print axioms FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetVectorLinearEquiv_apply
#print axioms FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetVectorLinearEquiv_preserves_quadratic
#print axioms FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetEuclideanLinearEquiv
#print axioms FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetEuclideanLinearEquiv_norm_map
#print axioms FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetEuclideanIsometry
#print axioms FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetEuclideanIsometry_apply_source
#print axioms FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetEuclideanIsometry_det_one
#print axioms FCP.BFSSSourceNineTargetEuclideanBridge.source9TargetEuclideanIsometry_fixesAxis_iff
#eval IO.println "SPECTRAL_SOURCE_NINE_TARGET_EUCLIDEAN_BRIDGE_SOURCE_COMPLETE"

end
end FCP.BFSSSourceNineTargetEuclideanBridge
