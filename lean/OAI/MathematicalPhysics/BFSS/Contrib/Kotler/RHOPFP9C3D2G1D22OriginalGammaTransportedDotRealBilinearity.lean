import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D21OriginalGammaTransportedDotSymmetryPositive

/-!
# RHOPF-P9C3D2G1D22 — real bilinearity of the original Gamma9 transported dot

D20 proved the source original Gamma9 Q-polarization equals the original
16-real-spinor dot transported by E⁻¹; D21 strictly qualified symmetry
and positive definite diagonal.

Prove real additivity and homogeneity in each argument of that exact
same source transported dot, using the accepted continuous real-linear
equivalence E and finite original spinor dot arithmetic. Do not
identify E with ordinary coordinate Euclidean isometry.

This gate does not yet bundle an inner product, select a complex
orthonormal basis, assert standard scalar Hopf equivalence or quotient,
or establish physical BFSS Fock, gauge, Hamiltonian or soliton claims.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D22
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C3D2G1C0
open FCP.RHOPFP9C3D2G1D20
open FCP.RHOPFP9C3D2G1D21

/-- Additivity of the accepted original-source transported dot in
its first real-four argument. -/
theorem relationalSourceTransportedDot_add_left
    (x y z : Fin 4 → ℝ) :
    relationalSourceTransportedDot (x + y) z =
      relationalSourceTransportedDot x z +
        relationalSourceTransportedDot y z := by
  let E := relationalRangeContinuousLinearEquivFinFour
  change (E.symm (x + y)).1 ⬝ᵥ (E.symm z).1 =
    (E.symm x).1 ⬝ᵥ (E.symm z).1 +
      (E.symm y).1 ⬝ᵥ (E.symm z).1
  rw [map_add]
  change (∑ i : SpinIndex,
    ((E.symm x).1 i + (E.symm y).1 i) * (E.symm z).1 i) =
      (∑ i : SpinIndex, (E.symm x).1 i * (E.symm z).1 i) +
        (∑ i : SpinIndex, (E.symm y).1 i * (E.symm z).1 i)
  simp only [add_mul, Finset.sum_add_distrib]

/-- Real homogeneity of the original-source transported dot in
its first real-four argument. -/
theorem relationalSourceTransportedDot_smul_left
    (a : ℝ) (x y : Fin 4 → ℝ) :
    relationalSourceTransportedDot (a • x) y =
      a * relationalSourceTransportedDot x y := by
  let E := relationalRangeContinuousLinearEquivFinFour
  change (E.symm (a • x)).1 ⬝ᵥ (E.symm y).1 =
    a * ((E.symm x).1 ⬝ᵥ (E.symm y).1)
  rw [map_smul]
  change (∑ i : SpinIndex,
    (a * (E.symm x).1 i) * (E.symm y).1 i) =
      a * (∑ i : SpinIndex,
        (E.symm x).1 i * (E.symm y).1 i)
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i hi
  ring

/-- Real additivity in the second argument, by the already
qualified source-dot symmetry and additivity on the first argument. -/
theorem relationalSourceTransportedDot_add_right
    (x y z : Fin 4 → ℝ) :
    relationalSourceTransportedDot x (y + z) =
      relationalSourceTransportedDot x y +
        relationalSourceTransportedDot x z := by
  calc
    relationalSourceTransportedDot x (y + z) =
        relationalSourceTransportedDot (y + z) x :=
          relationalSourceTransportedDot_symm x (y + z)
    _ = relationalSourceTransportedDot y x +
          relationalSourceTransportedDot z x :=
          relationalSourceTransportedDot_add_left y z x
    _ = relationalSourceTransportedDot x y +
          relationalSourceTransportedDot x z := by
          rw [relationalSourceTransportedDot_symm y x,
            relationalSourceTransportedDot_symm z x]

/-- Real homogeneity in the second argument, inherited from
source transported-dot symmetry and first-argument homogeneity. -/
theorem relationalSourceTransportedDot_smul_right
    (a : ℝ) (x y : Fin 4 → ℝ) :
    relationalSourceTransportedDot x (a • y) =
      a * relationalSourceTransportedDot x y := by
  calc
    relationalSourceTransportedDot x (a • y) =
        relationalSourceTransportedDot (a • y) x :=
          relationalSourceTransportedDot_symm x (a • y)
    _ = a * relationalSourceTransportedDot y x :=
          relationalSourceTransportedDot_smul_left a y x
    _ = a * relationalSourceTransportedDot x y := by
          rw [relationalSourceTransportedDot_symm y x]

#print axioms relationalSourceTransportedDot_add_left
#print axioms relationalSourceTransportedDot_smul_left
#print axioms relationalSourceTransportedDot_add_right
#print axioms relationalSourceTransportedDot_smul_right

end
end FCP.RHOPFP9C3D2G1D22
