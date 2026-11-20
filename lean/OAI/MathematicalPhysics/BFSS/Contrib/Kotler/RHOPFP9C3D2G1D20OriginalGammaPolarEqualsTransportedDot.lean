import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D19OriginalGammaPolarQuadraticJInvariant

/-!
# RHOPF-P9C3D2G1D20 — polarized Q equals the original transported dot

The accepted original Gamma9 quadratic Q is the original real-16-spinor
Euclidean dot-self pulled back through the already qualified E⁻¹.
D19 defined its symmetric polarization B_Q(x,y).

This bounded source-exact gate shows B_Q is literally the original
Euclidean dot-product pulled back on two separate real-four arguments.
It supplies the concrete source bilinear-form formula for later
orthonormal complex-coordinate construction. No surrogate coordinate
Euclidean dot, ad hoc Gamma9 entries or claimed Hopf quotient.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D20
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2G1C0
open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D19

/-- Original source 16-real-spinor Euclidean dot product
transported through the accepted noncanonical E⁻¹ on both arguments. -/
noncomputable def relationalSourceTransportedDot
    (x y : Fin 4 → ℝ) : ℝ :=
  (relationalRangeContinuousLinearEquivFinFour.symm x).1 ⬝ᵥ
    (relationalRangeContinuousLinearEquivFinFour.symm y).1

/-- Exact source original Gamma9 quadratic polarization B_Q
equals the original 16-real-spinor dot product pulled back via E⁻¹. -/
theorem relationalSourcePolarQuadratic_eq_transported_dot
    (x y : Fin 4 → ℝ) :
    relationalSourcePolarQuadratic x y =
      relationalSourceTransportedDot x y := by
  let E := relationalRangeContinuousLinearEquivFinFour
  let u : LinearMap.range (Matrix.toLin' relationalProjector) := E.symm x
  let v : LinearMap.range (Matrix.toLin' relationalProjector) := E.symm y
  have hadd : E.symm (x + y) = u + v := by
    change E.symm (x + y) = E.symm x + E.symm y
    exact map_add E.symm x y
  change (((E.symm (x + y)).1 ⬝ᵥ (E.symm (x + y)).1 -
    (E.symm x).1 ⬝ᵥ (E.symm x).1 -
    (E.symm y).1 ⬝ᵥ (E.symm y).1) / 2) =
    (E.symm x).1 ⬝ᵥ (E.symm y).1
  rw [hadd]
  change (((u.1 + v.1) ⬝ᵥ (u.1 + v.1) -
    u.1 ⬝ᵥ u.1 - v.1 ⬝ᵥ v.1) / 2) = u.1 ⬝ᵥ v.1
  change (((∑ i : SpinIndex, (u.1 i + v.1 i) *
    (u.1 i + v.1 i)) -
    (∑ i : SpinIndex, u.1 i * u.1 i) -
    (∑ i : SpinIndex, v.1 i * v.1 i)) / 2) =
      ∑ i : SpinIndex, u.1 i * v.1 i
  have hcross : (∑ i : SpinIndex, v.1 i * u.1 i) =
      ∑ i : SpinIndex, u.1 i * v.1 i := by
    apply Finset.sum_congr rfl
    intro i hi
    exact mul_comm _ _
  simp only [add_mul, mul_add, Finset.sum_add_distrib]
  rw [hcross]
  ring

#print axioms relationalSourceTransportedDot
#print axioms relationalSourcePolarQuadratic_eq_transported_dot

end
end FCP.RHOPFP9C3D2G1D20
