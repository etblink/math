import Mathlib.Analysis.InnerProductSpace.Defs
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D23OriginalGammaSourceBilinForm

/-!
# RHOPF-P9C3D2G1D24 — source-exact original Gamma9 real inner-product core

The accepted original Gamma9 E-transported real dot is a symmetric
positive definite real bilinear form by D20–D23. Package precisely the
accepted form into the pinned Mathlib InnerProductSpace.Core data,
without installing any global instances on Fin 4 → ℝ.

Mathlib explicitly warns not to instantiate the induced norm on a type
which already has an unrelated norm. This definition is standalone
data only; it changes neither the native Euclidean norm nor topology.

It supplies a source-compatible positive-definite inner product core,
not yet the final normed inner product space or an orthonormal complex
basis, standard scalar Hopf quotient or physical BFSS Fock claim.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D24
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D20
open FCP.RHOPFP9C3D2G1D21
open FCP.RHOPFP9C3D2G1D22
open FCP.RHOPFP9C3D2G1D23

/-- The actual original Gamma9 real-spinor transported dot,
packaged as a positive-definite Mathlib inner-product core.
No global InnerProductSpace or Norm instance is introduced. -/
@[instance_reducible]
noncomputable def relationalSourceInnerCore :
    InnerProductSpace.Core ℝ (Fin 4 → ℝ) where
  inner := fun x y => relationalSourceBilinForm x y
  conj_inner_symm := by
    intro x y
    change relationalSourceBilinForm y x =
      relationalSourceBilinForm x y
    exact relationalSourceBilinForm_symm y x
  re_inner_nonneg := by
    intro x
    change 0 ≤ relationalSourceBilinForm x x
    rw [relationalSourceBilinForm_apply]
    exact relationalSourceTransportedDot_self_nonneg x
  add_left := by
    intro x y z
    change relationalSourceBilinForm (x + y) z =
      relationalSourceBilinForm x z + relationalSourceBilinForm y z
    rw [relationalSourceBilinForm_apply,
      relationalSourceBilinForm_apply,
      relationalSourceBilinForm_apply]
    exact relationalSourceTransportedDot_add_left x y z
  smul_left := by
    intro x y a
    change relationalSourceBilinForm (a • x) y =
      a * relationalSourceBilinForm x y
    rw [relationalSourceBilinForm_apply,
      relationalSourceBilinForm_apply]
    exact relationalSourceTransportedDot_smul_left a x y
  definite := by
    intro x hx
    by_contra hne
    have hp := relationalSourceBilinForm_self_pos_of_ne_zero x hne
    change relationalSourceBilinForm x x = 0 at hx
    rw [hx] at hp
    exact (lt_irrefl (0 : ℝ)) hp

/-- Core application is exactly D23's source-real bilinear form. -/
theorem relationalSourceInnerCore_inner_apply (x y : Fin 4 → ℝ) :
    relationalSourceInnerCore.inner x y =
      relationalSourceBilinForm x y := by
  rfl

/-- The source inner-product core diagonal is the original Q, not
the canonical coordinate Euclidean norm. -/
theorem relationalSourceInnerCore_self_eq_quadratic (x : Fin 4 → ℝ) :
    relationalSourceInnerCore.inner x x =
      relationalRangeCoordinateDotSelf x := by
  rw [relationalSourceInnerCore_inner_apply]
  exact relationalSourceBilinForm_self_eq_quadratic x

#print axioms relationalSourceInnerCore
#print axioms relationalSourceInnerCore_inner_apply
#print axioms relationalSourceInnerCore_self_eq_quadratic

end
end FCP.RHOPFP9C3D2G1D24
