import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D20OriginalGammaPolarEqualsTransportedDot

/-!
# RHOPF-P9C3D2G1D21 — native transported source dot symmetry and definiteness

D20 proved that the original Gamma9 transported quadratic polarization
is EXACTLY the original 16-real-spinor Euclidean dot pulled back by E⁻¹.
This bounded gate establishes its symmetry and positive-definite diagonal,
using only the accepted source original dot, original E, and G1C1
source quadratic positivity.

This is preparatory: complete bilinearity and a bundled real inner
product are still separate gates. Do not assume E is a coordinate
Euclidean isometry, select a complex basis, or assert Hopf quotient.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D21
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2G1C0
open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D20

/-- The exact original Gamma9 transported dot is symmetric. -/
theorem relationalSourceTransportedDot_symm
    (x y : Fin 4 → ℝ) :
    relationalSourceTransportedDot x y =
      relationalSourceTransportedDot y x := by
  let E := relationalRangeContinuousLinearEquivFinFour
  change (∑ i : SpinIndex,
      (E.symm x).1 i * (E.symm y).1 i) =
    ∑ i : SpinIndex, (E.symm y).1 i * (E.symm x).1 i
  apply Finset.sum_congr rfl
  intro i hi
  exact mul_comm _ _

/-- The transported original spinor dot diagonal is the original Q. -/
theorem relationalSourceTransportedDot_self_eq_quadratic
    (x : Fin 4 → ℝ) :
    relationalSourceTransportedDot x x =
      relationalRangeCoordinateDotSelf x := by
  rfl

/-- Nonnegative diagonal of the source transported dot,
without a choice of source image basis. -/
theorem relationalSourceTransportedDot_self_nonneg
    (x : Fin 4 → ℝ) :
    0 ≤ relationalSourceTransportedDot x x := by
  let E := relationalRangeContinuousLinearEquivFinFour
  change 0 ≤ ∑ i : SpinIndex,
    (E.symm x).1 i * (E.symm x).1 i
  exact Finset.sum_nonneg
    (fun i _ => mul_self_nonneg ((E.symm x).1 i))

/-- Strictly positive diagonal for nonzero real-four coordinates. -/
theorem relationalSourceTransportedDot_self_pos_of_ne_zero
    (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    0 < relationalSourceTransportedDot x x := by
  rw [relationalSourceTransportedDot_self_eq_quadratic]
  exact relationalRangeCoordinateDotSelf_pos_of_ne_zero x hx

#print axioms relationalSourceTransportedDot_symm
#print axioms relationalSourceTransportedDot_self_eq_quadratic
#print axioms relationalSourceTransportedDot_self_nonneg
#print axioms relationalSourceTransportedDot_self_pos_of_ne_zero

end
end FCP.RHOPFP9C3D2G1D21
