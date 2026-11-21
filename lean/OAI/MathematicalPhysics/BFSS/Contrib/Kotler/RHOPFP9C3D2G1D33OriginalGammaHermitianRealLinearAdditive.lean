import Mathlib.Tactic.Ring
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D32OriginalGammaComplexModuleHermitianBinding

/-!
# RHOPF-P9C3D2G1D33 — original Gamma9 Hermitian real-linearity and additivity

D32 binds exact original Gamma9 source H to its isolated Module ℂ
carrier. D22 proves original transported Q dot real bilinearity,
and D10 makes original J4 real-linear. This bounded gate proves
additivity and real homogeneity for H in its first argument, then
transfers source additivity to the isolated complex carrier.

It does not claim full complex-scalar sesquilinearity, a
complex-inner-product-space/norm instance, Hopf quotient or original
physical BFSS Fock and soliton properties.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D33
noncomputable section

open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D20
open FCP.RHOPFP9C3D2G1D22
open FCP.RHOPFP9C3D2G1D23
open FCP.RHOPFP9C3D2G1D24
open FCP.RHOPFP9C3D2G1D26
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D32

/-- Exact original Gamma9 Hermitian candidate is additive in its
first real coordinate variable, inherited from source Q bilinearity. -/
theorem relationalSourceHermitianCandidate_add_left
    (x y z : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate (x + y) z =
      relationalSourceHermitianCandidate x z +
        relationalSourceHermitianCandidate y z := by
  apply Complex.ext
  · change relationalSourceInnerCore.inner (x + y) z =
        relationalSourceInnerCore.inner x z +
          relationalSourceInnerCore.inner y z
    simp only [relationalSourceInnerCore_inner_apply,
      relationalSourceBilinForm_apply]
    exact relationalSourceTransportedDot_add_left x y z
  · change -relationalSourceInnerCore.inner
        (relationalPhaseJFourLinear (x + y)) z =
        -relationalSourceInnerCore.inner (relationalPhaseJFourLinear x) z +
          -relationalSourceInnerCore.inner (relationalPhaseJFourLinear y) z
    rw [map_add]
    simp only [relationalSourceInnerCore_inner_apply,
      relationalSourceBilinForm_apply]
    rw [relationalSourceTransportedDot_add_left]
    ring

/-- Exact original Gamma9 Hermitian candidate is homogeneous
for real scalars in its first variable; no complex-module
instance on the original real-coordinate carrier is assumed. -/
theorem relationalSourceHermitianCandidate_real_smul_left
    (a : ℝ) (x y : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate (a • x) y =
      (a : ℂ) * relationalSourceHermitianCandidate x y := by
  apply Complex.ext
  · change relationalSourceInnerCore.inner (a • x) y =
        a * relationalSourceInnerCore.inner x y
    simp only [relationalSourceInnerCore_inner_apply,
      relationalSourceBilinForm_apply]
    exact relationalSourceTransportedDot_smul_left a x y
  · change -relationalSourceInnerCore.inner
        (relationalPhaseJFourLinear (a • x)) y =
        a * (-relationalSourceInnerCore.inner
          (relationalPhaseJFourLinear x) y)
    rw [map_smul]
    simp only [relationalSourceInnerCore_inner_apply,
      relationalSourceBilinForm_apply]
    rw [relationalSourceTransportedDot_smul_left]
    ring

/-- Transfer source Q-Hermitian left additivity through the
D31 isolated complex carrier's exact additive equivalence. -/
theorem relationalSourceComplexFourHermitian_add_left
    (x y z : RelationalSourceComplexFour) :
    relationalSourceComplexFourHermitian (x + y) z =
      relationalSourceComplexFourHermitian x z +
        relationalSourceComplexFourHermitian y z := by
  change relationalSourceHermitianCandidate
      (x.coordinates + y.coordinates) z.coordinates =
    relationalSourceHermitianCandidate x.coordinates z.coordinates +
      relationalSourceHermitianCandidate y.coordinates z.coordinates
  exact relationalSourceHermitianCandidate_add_left _ _ _

#print axioms relationalSourceHermitianCandidate_add_left
#print axioms relationalSourceHermitianCandidate_real_smul_left
#print axioms relationalSourceComplexFourHermitian_add_left

end
end FCP.RHOPFP9C3D2G1D33
