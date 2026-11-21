import Mathlib.Analysis.InnerProductSpace.Defs
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D36OriginalGammaHermitianComplexScalarRight

/-!
# RHOPF-P9C3D2G1D37 — original Gamma9 compatible complex InnerProductSpace.Core

D24–D36 qualify the exact original Gamma9 source Q, J4 complex
module, positive Hermitian H and full complex sesquilinearity.
Pinned Mathlib InnerProductSpace uses CONJUGATE-linearity in its
FIRST argument, while source H is LINEAR in its first argument.

Construct the matching *swapped* inner x y := H y x as a
Mathlib InnerProductSpace.Core ℂ on the isolated D31 carrier.
NO norm, topology, or InnerProductSpace instance is installed.
Especially, do not replace original source Q with ordinary
four-real-coordinate Euclidean dot.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D37
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D26
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D32
open FCP.RHOPFP9C3D2G1D34
open FCP.RHOPFP9C3D2G1D35
open FCP.RHOPFP9C3D2G1D36

/-- The original Gamma9 Q-Hermitian form vanishes on the isolated
complex carrier's zero vector. -/
theorem relationalSourceComplexFourHermitian_zero_self :
    relationalSourceComplexFourHermitian
      (0 : RelationalSourceComplexFour) 0 = 0 := by
  simpa using
    (relationalSourceComplexFourHermitian_smul_left
      (0 : ℂ) (0 : RelationalSourceComplexFour)
      (0 : RelationalSourceComplexFour))

/-- The original Gamma9-Q diagonal is nonnegative everywhere, by
strict source positivity for nonzero vectors and H(0,0)=0. -/
theorem relationalSourceComplexFourHermitian_self_re_nonneg
    (x : RelationalSourceComplexFour) :
    0 ≤ (relationalSourceComplexFourHermitian x x).re := by
  by_cases hx : x = 0
  · subst x
    rw [relationalSourceComplexFourHermitian_zero_self]
    exact le_refl _
  · exact le_of_lt
      (relationalSourceComplexFourHermitian_self_re_pos_of_ne_zero x hx)

/-- Source-Q-exact positive complex inner-product CORE in pinned
Mathlib convention (conjugate-linear FIRST variable), by swapping
arguments of source H (linear FIRST variable).

A Core is only a standalone value, NOT a global instance; thus no
norm or topological structure changes and original source Q remains
distinguished from the default R4 Euclidean coordinate dot. -/
@[instance_reducible]
noncomputable def relationalSourceComplexFourInnerProductCore :
    InnerProductSpace.Core ℂ RelationalSourceComplexFour where
  inner := fun x y => relationalSourceComplexFourHermitian y x
  conj_inner_symm := by
    intro x y
    change star (relationalSourceComplexFourHermitian x y) =
      relationalSourceComplexFourHermitian y x
    exact relationalSourceComplexFourHermitian_conj_symm y x
  re_inner_nonneg := by
    intro x
    change 0 ≤ (relationalSourceComplexFourHermitian x x).re
    exact relationalSourceComplexFourHermitian_self_re_nonneg x
  add_left := by
    intro x y z
    change relationalSourceComplexFourHermitian z (x + y) =
      relationalSourceComplexFourHermitian z x +
        relationalSourceComplexFourHermitian z y
    exact relationalSourceComplexFourHermitian_add_right z x y
  smul_left := by
    intro x y r
    change relationalSourceComplexFourHermitian y (r • x) =
      star r * relationalSourceComplexFourHermitian y x
    exact relationalSourceComplexFourHermitian_smul_right r y x
  definite := by
    intro x h
    change relationalSourceComplexFourHermitian x x = 0 at h
    by_contra hx
    have hp := relationalSourceComplexFourHermitian_self_re_pos_of_ne_zero x hx
    have hz : (relationalSourceComplexFourHermitian x x).re = 0 := by
      rw [h]
      rfl
    exact (ne_of_gt hp) hz

/-- Bundle is source-exact: only Mathlib argument convention changes. -/
theorem relationalSourceComplexFourInnerProductCore_inner
    (x y : RelationalSourceComplexFour) :
    relationalSourceComplexFourInnerProductCore.inner x y =
      relationalSourceComplexFourHermitian y x := by
  rfl

/-- Mathlib-compatible complex core still has the original Gamma9
Q as squared norm candidate, NOT the coordinate Euclidean dot. -/
theorem relationalSourceComplexFourInnerProductCore_self_re_quadratic
    (x : RelationalSourceComplexFour) :
    (relationalSourceComplexFourInnerProductCore.inner x x).re =
      relationalRangeCoordinateDotSelf x.coordinates := by
  exact relationalSourceComplexFourHermitian_self_re_quadratic x

#print axioms relationalSourceComplexFourHermitian_zero_self
#print axioms relationalSourceComplexFourHermitian_self_re_nonneg
#print axioms relationalSourceComplexFourInnerProductCore
#print axioms relationalSourceComplexFourInnerProductCore_inner
#print axioms relationalSourceComplexFourInnerProductCore_self_re_quadratic

end
end FCP.RHOPFP9C3D2G1D37
