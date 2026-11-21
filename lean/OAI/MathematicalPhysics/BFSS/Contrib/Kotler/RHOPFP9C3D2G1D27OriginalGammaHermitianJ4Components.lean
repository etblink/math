import Mathlib.Tactic.Linarith
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D26OriginalGammaSourceHermitianCandidate

/-!
# RHOPF-P9C3D2G1D27 — original Gamma9 Hermitian J4 component action

D26 strictly qualified the source Hermitian candidate H from the real
source inner-product core and original J4. This narrow adapter proves
the exact real/imaginary identities under J4 on either argument.

The resulting components are those of H(J4 x,y)=i H(x,y) and
H(x,J4 y)=-i H(x,y), but the scalar multiplication and full
complex sesquilinearity are separate proof gates. No extra norm,
synthetic Gamma9, complex module instance or Hopf quotient claim.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D27
noncomputable section

open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D20
open FCP.RHOPFP9C3D2G1D22
open FCP.RHOPFP9C3D2G1D23
open FCP.RHOPFP9C3D2G1D24
open FCP.RHOPFP9C3D2G1D25
open FCP.RHOPFP9C3D2G1D26

/-- Real component of H(J4 x,y) is minus imaginary component of H(x,y). -/
theorem relationalSourceHermitianCandidate_J4_left_re
    (x y : Fin 4 → ℝ) :
    (relationalSourceHermitianCandidate (relationalPhaseJFourLinear x) y).re =
      -(relationalSourceHermitianCandidate x y).im := by
  change relationalSourceInnerCore.inner (relationalPhaseJFourLinear x) y =
    -(-relationalSourceInnerCore.inner (relationalPhaseJFourLinear x) y)
  simp only [neg_neg]

/-- Imaginary component of H(J4 x,y) is real component of H(x,y). -/
theorem relationalSourceHermitianCandidate_J4_left_im
    (x y : Fin 4 → ℝ) :
    (relationalSourceHermitianCandidate (relationalPhaseJFourLinear x) y).im =
      (relationalSourceHermitianCandidate x y).re := by
  have hneg :
      relationalSourceInnerCore.inner (-x) y =
        -relationalSourceInnerCore.inner x y := by
    rw [relationalSourceInnerCore_inner_apply,
      relationalSourceInnerCore_inner_apply,
      relationalSourceBilinForm_apply,
      relationalSourceBilinForm_apply]
    simpa only [neg_one_smul, neg_one_mul] using
      (relationalSourceTransportedDot_smul_left (-1 : ℝ) x y)
  change -relationalSourceInnerCore.inner
      (relationalPhaseJFourLinear (relationalPhaseJFourLinear x)) y =
        relationalSourceInnerCore.inner x y
  rw [relationalPhaseJFourLinear_square, hneg]
  simp only [neg_neg]

/-- Real component of H(x,J4 y) is the imaginary component of H(x,y). -/
theorem relationalSourceHermitianCandidate_J4_right_re
    (x y : Fin 4 → ℝ) :
    (relationalSourceHermitianCandidate x (relationalPhaseJFourLinear y)).re =
      (relationalSourceHermitianCandidate x y).im := by
  change relationalSourceInnerCore.inner x (relationalPhaseJFourLinear y) =
    -relationalSourceInnerCore.inner (relationalPhaseJFourLinear x) y
  have h := relationalSourceInnerCore_J4_skew x y
  linarith

/-- Imaginary component of H(x,J4 y) is minus real component H(x,y). -/
theorem relationalSourceHermitianCandidate_J4_right_im
    (x y : Fin 4 → ℝ) :
    (relationalSourceHermitianCandidate x (relationalPhaseJFourLinear y)).im =
      -(relationalSourceHermitianCandidate x y).re := by
  change -relationalSourceInnerCore.inner
    (relationalPhaseJFourLinear x) (relationalPhaseJFourLinear y) =
      -relationalSourceInnerCore.inner x y
  rw [relationalSourceInnerCore_J4_invariant]

#print axioms relationalSourceHermitianCandidate_J4_left_re
#print axioms relationalSourceHermitianCandidate_J4_left_im
#print axioms relationalSourceHermitianCandidate_J4_right_re
#print axioms relationalSourceHermitianCandidate_J4_right_im

end
end FCP.RHOPFP9C3D2G1D27
