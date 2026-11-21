import Mathlib.Tactic.Linarith
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D25OriginalGammaSourceInnerCoreJ4Orthogonal

/-!
# RHOPF-P9C3D2G1D26 — exact original Gamma9 source Hermitian candidate

D24 establishes a source-exact real positive inner-product core.
D25 proves the original J4 is Q-orthogonal and Q-skew-adjoint.
This gate defines the corresponding complex-valued Hermitian candidate
with the convention of linearity in its FIRST argument:

H(x,y) := B_Q(x,y) - i B_Q(J4 x,y).

Prove real and imaginary components, conjugate symmetry, vanishing
imaginary diagonal, original Q as real diagonal, and strict positivity.
This is a *candidate function*, not yet a complex module or bundled
Hermitian inner-product space. No canonical Euclidean coordinate metric,
global duplicate norm, standard Hopf quotient, physical BFSS or charge.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D26
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D23
open FCP.RHOPFP9C3D2G1D24
open FCP.RHOPFP9C3D2G1D25

/-- Complex Hermitian candidate from exact source Q and the source J4,
linear in the first variable when a compatible complex structure is built. -/
noncomputable def relationalSourceHermitianCandidate
    (x y : Fin 4 → ℝ) : ℂ :=
  ⟨relationalSourceInnerCore.inner x y,
    -relationalSourceInnerCore.inner (relationalPhaseJFourLinear x) y⟩

theorem relationalSourceHermitianCandidate_re
    (x y : Fin 4 → ℝ) :
    (relationalSourceHermitianCandidate x y).re =
      relationalSourceInnerCore.inner x y := by
  rfl

theorem relationalSourceHermitianCandidate_im
    (x y : Fin 4 → ℝ) :
    (relationalSourceHermitianCandidate x y).im =
      -relationalSourceInnerCore.inner (relationalPhaseJFourLinear x) y := by
  rfl

/-- The original J4 skew-adjointness produces the exact
Hermitian conjugate symmetry for this source-derived candidate. -/
theorem relationalSourceHermitianCandidate_conj_symm
    (x y : Fin 4 → ℝ) :
    Complex.conj (relationalSourceHermitianCandidate y x) =
      relationalSourceHermitianCandidate x y := by
  apply Complex.ext
  · change relationalSourceInnerCore.inner y x =
      relationalSourceInnerCore.inner x y
    rw [relationalSourceInnerCore_inner_apply,
      relationalSourceInnerCore_inner_apply]
    exact relationalSourceBilinForm_symm y x
  · change -(-relationalSourceInnerCore.inner
      (relationalPhaseJFourLinear y) x) =
        -relationalSourceInnerCore.inner
          (relationalPhaseJFourLinear x) y
    simp only [neg_neg]
    calc
      relationalSourceInnerCore.inner
          (relationalPhaseJFourLinear y) x =
        -relationalSourceInnerCore.inner
          y (relationalPhaseJFourLinear x) :=
            relationalSourceInnerCore_J4_skew y x
      _ = -relationalSourceInnerCore.inner
            (relationalPhaseJFourLinear x) y := by
          rw [relationalSourceInnerCore_inner_apply,
            relationalSourceInnerCore_inner_apply,
            relationalSourceBilinForm_symm
              y (relationalPhaseJFourLinear x)]

/-- The imaginary part on the diagonal vanishes by source
symmetry and source J4 skew-adjointness. -/
theorem relationalSourceHermitianCandidate_self_im_zero
    (x : Fin 4 → ℝ) :
    (relationalSourceHermitianCandidate x x).im = 0 := by
  have hs :
      relationalSourceInnerCore.inner
        (relationalPhaseJFourLinear x) x =
      -relationalSourceInnerCore.inner
        (relationalPhaseJFourLinear x) x := by
    calc
      relationalSourceInnerCore.inner
          (relationalPhaseJFourLinear x) x =
        -relationalSourceInnerCore.inner
          x (relationalPhaseJFourLinear x) :=
            relationalSourceInnerCore_J4_skew x x
      _ = -relationalSourceInnerCore.inner
            (relationalPhaseJFourLinear x) x := by
          rw [relationalSourceInnerCore_inner_apply,
            relationalSourceInnerCore_inner_apply,
            relationalSourceBilinForm_symm
              x (relationalPhaseJFourLinear x)]
  have hz : relationalSourceInnerCore.inner
      (relationalPhaseJFourLinear x) x = 0 := by
    linarith
  change -relationalSourceInnerCore.inner
    (relationalPhaseJFourLinear x) x = 0
  rw [hz]
  ring

/-- The real diagonal is exactly the original Gamma9
16-spinor quadratic Q transported through E^{-1}. -/
theorem relationalSourceHermitianCandidate_self_re_quadratic
    (x : Fin 4 → ℝ) :
    (relationalSourceHermitianCandidate x x).re =
      relationalRangeCoordinateDotSelf x := by
  change relationalSourceInnerCore.inner x x =
    relationalRangeCoordinateDotSelf x
  exact relationalSourceInnerCore_self_eq_quadratic x

/-- Strict positivity for every nonzero source coordinate vector. -/
theorem relationalSourceHermitianCandidate_self_re_pos_of_ne_zero
    (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    0 < (relationalSourceHermitianCandidate x x).re := by
  change 0 < relationalSourceInnerCore.inner x x
  rw [relationalSourceInnerCore_inner_apply]
  exact relationalSourceBilinForm_self_pos_of_ne_zero x hx

#print axioms relationalSourceHermitianCandidate
#print axioms relationalSourceHermitianCandidate_re
#print axioms relationalSourceHermitianCandidate_im
#print axioms relationalSourceHermitianCandidate_conj_symm
#print axioms relationalSourceHermitianCandidate_self_im_zero
#print axioms relationalSourceHermitianCandidate_self_re_quadratic
#print axioms relationalSourceHermitianCandidate_self_re_pos_of_ne_zero

end
end FCP.RHOPFP9C3D2G1D26
