import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D10OriginalGammaPhaseLinearFinFour
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1C1OriginalGammaCoordinateQuadraticPositivity
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C2COriginalGammaRelationalPhasePartialIsometry

/-!
# RHOPF-P9C3D2G1D11 — original Gamma9 phase preserves transported real-four metric

Source-exact JᵀJ=P, P-fixed vectors, and the accepted E: im(P) ≃L[ℝ] R⁴
imply that the transported complex structure J₄ preserves
Q(x) = dot(E⁻¹ x, E⁻¹ x) on Fin 4 → ℝ.

E is noncanonical and need not be an isometry for the standard Euclidean
metric on Fin 4 → ℝ. This is preservation of the ORIGINAL metric Q.

No new Gamma9 entries, preferred orthonormal basis, Hopf quotient,
Fock implementer, Hamiltonian covariance or topological charge.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D11
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C1B1
open FCP.RHOPFP9C2A
open FCP.RHOPFP9C2C
open FCP.RHOPFP9C3D2G1C0
open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D9
open FCP.RHOPFP9C3D2G1D10

/-- On the original projector image, source Gamma9 J preserves
the exact original real Euclidean spinor dot-self. -/
theorem relationalPhaseJ_mulVec_dot_self_on_projector_image
    (v : SpinIndex → ℝ) (hv : relationalProjector.mulVec v = v) :
    (relationalPhaseJ.mulVec v) ⬝ᵥ (relationalPhaseJ.mulVec v) =
      v ⬝ᵥ v := by
  calc
    (relationalPhaseJ.mulVec v) ⬝ᵥ (relationalPhaseJ.mulVec v) =
        (Matrix.vecMul (relationalPhaseJ.mulVec v) relationalPhaseJ) ⬝ᵥ v := by
          rw [Matrix.dotProduct_mulVec]
    _ = ((relationalPhaseJ.transpose * relationalPhaseJ).mulVec v) ⬝ᵥ v := by
          rw [← Matrix.mulVec_transpose, Matrix.mulVec_mulVec]
    _ = v ⬝ᵥ v := by
          rw [relationalPhaseJ_transpose_mul_self, hv]

/-- The conjugated original phase J₄ preserves the same original
positive-definite quadratic form transported through E. -/
theorem relationalPhaseJFourLinear_preserves_original_quadratic
    (x : Fin 4 → ℝ) :
    relationalRangeCoordinateDotSelf (relationalPhaseJFourLinear x) =
      relationalRangeCoordinateDotSelf x := by
  let E := relationalRangeContinuousLinearEquivFinFour
  let w : LinearMap.range (Matrix.toLin' relationalProjector) := E.symm x
  have hProj : LinearMap.IsProj
      (LinearMap.range (Matrix.toLin' relationalProjector))
      (Matrix.toLin' relationalProjector) :=
    (LinearMap.isProj_range_iff_isIdempotentElem
      (Matrix.toLin' relationalProjector)).2
        relationalProjector_toLin_idempotent
  have hw : relationalProjector.mulVec w.1 = w.1 :=
    hProj.map_id w.1 w.2
  have heq : E.symm (relationalPhaseJFourLinear x) =
      relationalPhaseJRangeLinear w := by
    change E.symm (E (relationalPhaseJRangeLinear (E.symm x))) =
      relationalPhaseJRangeLinear w
    rw [E.symm_apply_apply]
  change (E.symm (relationalPhaseJFourLinear x)).1 ⬝ᵥ
      (E.symm (relationalPhaseJFourLinear x)).1 = w.1 ⬝ᵥ w.1
  rw [heq]
  change (relationalPhaseJ.mulVec w.1) ⬝ᵥ
    (relationalPhaseJ.mulVec w.1) = w.1 ⬝ᵥ w.1
  exact relationalPhaseJ_mulVec_dot_self_on_projector_image w.1 hw

#print axioms relationalPhaseJ_mulVec_dot_self_on_projector_image
#print axioms relationalPhaseJFourLinear_preserves_original_quadratic

end
end FCP.RHOPFP9C3D2G1D11
