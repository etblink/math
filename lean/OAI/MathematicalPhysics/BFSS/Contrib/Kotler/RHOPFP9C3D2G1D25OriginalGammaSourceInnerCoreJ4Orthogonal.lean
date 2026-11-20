import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D24OriginalGammaSourceInnerCore
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D19OriginalGammaPolarQuadraticJInvariant

/-!
# RHOPF-P9C3D2G1D25 — original Gamma9 J4 is orthogonal and skew for source Q

D24 strictly qualified the original-source real inner-product core
constructed from the exact Gamma9 16-real-spinor dot via E⁻¹, with
no global norm change. D19 qualified Q-polarization J4-invariance.
D10 qualified J4²=-I. Here we explicitly connect these source results:
J4 is an isometry of the *original* core and is skew-adjoint for it.

This does NOT identify Q with ordinary coordinate Euclidean dot,
install duplicate global normed instances, select a complex basis,
conjugate to scalar Hopf Circle on ℂ², or prove quotient/Chern charge.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D25
noncomputable section

open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D19
open FCP.RHOPFP9C3D2G1D20
open FCP.RHOPFP9C3D2G1D22
open FCP.RHOPFP9C3D2G1D23
open FCP.RHOPFP9C3D2G1D24

/-- The original source Gamma9 complex-structure J4 preserves the
actual E-transported inner product, not ordinary coordinate dot. -/
theorem relationalSourceInnerCore_J4_invariant
    (x y : Fin 4 → ℝ) :
    relationalSourceInnerCore.inner
      (relationalPhaseJFourLinear x)
      (relationalPhaseJFourLinear y) =
    relationalSourceInnerCore.inner x y := by
  calc
    relationalSourceInnerCore.inner
      (relationalPhaseJFourLinear x)
      (relationalPhaseJFourLinear y) =
        relationalSourceBilinForm
          (relationalPhaseJFourLinear x)
          (relationalPhaseJFourLinear y) :=
            relationalSourceInnerCore_inner_apply _ _
    _ = relationalSourceTransportedDot
          (relationalPhaseJFourLinear x)
          (relationalPhaseJFourLinear y) :=
            relationalSourceBilinForm_apply _ _
    _ = relationalSourcePolarQuadratic
          (relationalPhaseJFourLinear x)
          (relationalPhaseJFourLinear y) :=
            (relationalSourcePolarQuadratic_eq_transported_dot _ _).symm
    _ = relationalSourcePolarQuadratic x y :=
          relationalSourcePolarQuadratic_J4_invariant x y
    _ = relationalSourceTransportedDot x y :=
          relationalSourcePolarQuadratic_eq_transported_dot x y
    _ = relationalSourceBilinForm x y :=
          (relationalSourceBilinForm_apply x y).symm
    _ = relationalSourceInnerCore.inner x y :=
          (relationalSourceInnerCore_inner_apply x y).symm

/-- Because the source J4 squares to minus identity and preserves
the original source inner product, it is skew-adjoint relative to Q. -/
theorem relationalSourceInnerCore_J4_skew
    (x y : Fin 4 → ℝ) :
    relationalSourceInnerCore.inner
      (relationalPhaseJFourLinear x) y =
      - relationalSourceInnerCore.inner
          x (relationalPhaseJFourLinear y) := by
  have h := relationalSourceInnerCore_J4_invariant
    (relationalPhaseJFourLinear x) y
  rw [relationalPhaseJFourLinear_square] at h
  calc
    relationalSourceInnerCore.inner
        (relationalPhaseJFourLinear x) y =
      relationalSourceInnerCore.inner (-x)
        (relationalPhaseJFourLinear y) := h.symm
    _ = - relationalSourceInnerCore.inner
        x (relationalPhaseJFourLinear y) := by
          rw [relationalSourceInnerCore_inner_apply,
            relationalSourceInnerCore_inner_apply,
            relationalSourceBilinForm_apply,
            relationalSourceBilinForm_apply]
          simpa only [neg_one_smul, neg_one_mul] using
            (relationalSourceTransportedDot_smul_left
              (-1 : ℝ) x (relationalPhaseJFourLinear y))

#print axioms relationalSourceInnerCore_J4_invariant
#print axioms relationalSourceInnerCore_J4_skew

end
end FCP.RHOPFP9C3D2G1D25
