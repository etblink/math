import Mathlib.Algebra.Group.TransferInstance
import Mathlib.Algebra.Module.Defs
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D30OriginalGammaComplexScalarAssociativity

/-!
# RHOPF-P9C3D2G1D31 — original Gamma9 complex module on isolated carrier

The source-exact Gamma9 J4 satisfies J4²=-I (D10). D29/D30
strictly established zero, one, imaginary unit, scalar/vector
additivity, multiplication associativity and zero-vector laws
for z⊙x := z.re•x+z.im•J4(x). Package precisely this action
as a Complex module on a NEW CARRIER, not on Fin 4 → ℝ.

The separate carrier avoids conflicting native norm, module and
topology typeclass instances on the noncanonically chosen coordinates.
It neither chooses complex orthonormal coordinates nor proves a
standard Hopf quotient, Chern class, physical Fock or stable soliton.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D31
noncomputable section

open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D29
open FCP.RHOPFP9C3D2G1D30

/-- An isolated carrier for the original Gamma9 4-real-coordinate
source-derived complex structure. It does NOT inherit an ambient norm. -/
@[ext]
structure RelationalSourceComplexFour where
  coordinates : Fin 4 → ℝ

/-- No new coordinate transformation: this equivalence simply
unwraps the source-four-real carrier. -/
def relationalSourceComplexFourEquiv :
    RelationalSourceComplexFour ≃ (Fin 4 → ℝ) where
  toFun := RelationalSourceComplexFour.coordinates
  invFun := fun x => ⟨x⟩
  left_inv := by
    intro x
    cases x
    rfl
  right_inv := by
    intro x
    rfl

/-- Transport only the additive group, without transporting
the ambient norm or introducing any global Fin 4 → ℝ instance. -/
noncomputable instance relationalSourceComplexFourAddCommGroup :
    AddCommGroup RelationalSourceComplexFour :=
  relationalSourceComplexFourEquiv.addCommGroup

/-- Source-exact complex scalar multiplication on the separate carrier. -/
noncomputable instance relationalSourceComplexFourSMul :
    SMul ℂ RelationalSourceComplexFour where
  smul z x := ⟨relationalSourceComplexScalarAction z x.coordinates⟩

/-- All Module ℂ laws are the previously qualified source Gamma9
D29/D30 identities, tested without touching the native R4 module. -/
noncomputable instance relationalSourceComplexFourModule :
    Module ℂ RelationalSourceComplexFour where
  smul_add := by
    intro z x y
    apply RelationalSourceComplexFour.ext
    change relationalSourceComplexScalarAction z
      (x.coordinates + y.coordinates) =
        relationalSourceComplexScalarAction z x.coordinates +
          relationalSourceComplexScalarAction z y.coordinates
    exact relationalSourceComplexScalarAction_add_vector z _ _
  add_smul := by
    intro z w x
    apply RelationalSourceComplexFour.ext
    change relationalSourceComplexScalarAction (z + w) x.coordinates =
      relationalSourceComplexScalarAction z x.coordinates +
        relationalSourceComplexScalarAction w x.coordinates
    exact relationalSourceComplexScalarAction_add_scalar z w _
  smul_zero := by
    intro z
    apply RelationalSourceComplexFour.ext
    change relationalSourceComplexScalarAction z 0 = (0 : Fin 4 → ℝ)
    exact relationalSourceComplexScalarAction_zero_vector z
  zero_smul := by
    intro x
    apply RelationalSourceComplexFour.ext
    change relationalSourceComplexScalarAction 0 x.coordinates =
      (0 : Fin 4 → ℝ)
    exact relationalSourceComplexScalarAction_zero _
  one_smul := by
    intro x
    apply RelationalSourceComplexFour.ext
    change relationalSourceComplexScalarAction 1 x.coordinates = x.coordinates
    exact relationalSourceComplexScalarAction_one _
  mul_smul := by
    intro z w x
    apply RelationalSourceComplexFour.ext
    change relationalSourceComplexScalarAction (z * w) x.coordinates =
      relationalSourceComplexScalarAction z
        (relationalSourceComplexScalarAction w x.coordinates)
    exact relationalSourceComplexScalarAction_mul z w _

/-- The new complex scalar operation is exactly the accepted
original Gamma9 action on underlying four-real coordinates. -/
theorem relationalSourceComplexFour_smul_coordinates
    (z : ℂ) (x : RelationalSourceComplexFour) :
    (z • x).coordinates =
      relationalSourceComplexScalarAction z x.coordinates := by
  rfl

/-- Complex i acts through the exact original Gamma9 J4. -/
theorem relationalSourceComplexFour_I_coordinates
    (x : RelationalSourceComplexFour) :
    (Complex.I • x).coordinates =
      relationalPhaseJFourLinear x.coordinates := by
  rw [relationalSourceComplexFour_smul_coordinates]
  exact relationalSourceComplexScalarAction_I _

#print axioms relationalSourceComplexFourEquiv
#print axioms relationalSourceComplexFourAddCommGroup
#print axioms relationalSourceComplexFourSMul
#print axioms relationalSourceComplexFourModule
#print axioms relationalSourceComplexFour_smul_coordinates
#print axioms relationalSourceComplexFour_I_coordinates

end
end FCP.RHOPFP9C3D2G1D31
