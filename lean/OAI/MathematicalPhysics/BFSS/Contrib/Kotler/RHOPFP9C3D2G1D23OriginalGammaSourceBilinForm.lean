import Mathlib.LinearAlgebra.BilinearMap
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D22OriginalGammaTransportedDotRealBilinearity

/-!
# RHOPF-P9C3D2G1D23 — bundle original Gamma9 transported dot as real bilinear form

D20 proves original Gamma9 Q polarization equals the original source
real-16-spinor dot pulled back through the accepted E inverse.
D21 qualifies symmetry and strict positive diagonal. D22 qualifies all
four real bilinearity equations. This gate packages precisely that
pre-existing source-derived function using the pinned Mathlib
LinearMap.mk₂ API, without introducing a global inner product instance.

No synthetic Gamma9, substitution of coordinate Euclidean dot, chosen
complex frame, standard Hopf scalar equivariance or physical Fock claims.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D23
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D20
open FCP.RHOPFP9C3D2G1D21
open FCP.RHOPFP9C3D2G1D22

/-- Source-exact real bilinear form of original Gamma9 Q on four
noncanonical real coordinates, without a global inner product instance. -/
noncomputable def relationalSourceBilinForm :
    LinearMap.BilinForm ℝ (Fin 4 → ℝ) :=
  LinearMap.mk₂ ℝ relationalSourceTransportedDot
    relationalSourceTransportedDot_add_left
    (by
      intro a x y
      simpa only [smul_eq_mul] using
        relationalSourceTransportedDot_smul_left a x y)
    relationalSourceTransportedDot_add_right
    (by
      intro a x y
      simpa only [smul_eq_mul] using
        relationalSourceTransportedDot_smul_right a x y)

/-- Bundling changes no value: the application is the already
qualified exact original Gamma9 E-transported source-spinor dot. -/
theorem relationalSourceBilinForm_apply (x y : Fin 4 → ℝ) :
    relationalSourceBilinForm x y =
      relationalSourceTransportedDot x y := by
  rfl

/-- The bundled source real bilinear form retains its qualified symmetry. -/
theorem relationalSourceBilinForm_symm (x y : Fin 4 → ℝ) :
    relationalSourceBilinForm x y =
      relationalSourceBilinForm y x := by
  rw [relationalSourceBilinForm_apply, relationalSourceBilinForm_apply]
  exact relationalSourceTransportedDot_symm x y

/-- The bundled original source form has the original source quadratic
Q as its diagonal; do not replace it by ordinary coordinate dot. -/
theorem relationalSourceBilinForm_self_eq_quadratic (x : Fin 4 → ℝ) :
    relationalSourceBilinForm x x =
      relationalRangeCoordinateDotSelf x := by
  rw [relationalSourceBilinForm_apply]
  exact relationalSourceTransportedDot_self_eq_quadratic x

/-- Strict positive diagonal of the bundled original Gamma9 form. -/
theorem relationalSourceBilinForm_self_pos_of_ne_zero
    (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    0 < relationalSourceBilinForm x x := by
  rw [relationalSourceBilinForm_apply]
  exact relationalSourceTransportedDot_self_pos_of_ne_zero x hx

#print axioms relationalSourceBilinForm
#print axioms relationalSourceBilinForm_apply
#print axioms relationalSourceBilinForm_symm
#print axioms relationalSourceBilinForm_self_eq_quadratic
#print axioms relationalSourceBilinForm_self_pos_of_ne_zero

end
end FCP.RHOPFP9C3D2G1D23
