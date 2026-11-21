import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D31OriginalGammaIsolatedComplexModule
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D28OriginalGammaHermitianJ4ComplexIdentities

/-!
# RHOPF-P9C3D2G1D32 — exact source Hermitian on isolated complex carrier

D31 strictly packages an isolated original Gamma9 derived Module ℂ on
RelationalSourceComplexFour without imposing a competing norm or
complex instance on Fin 4 → ℝ. D26/D28 strictly qualify the same
source-Q-derived Hermitian candidate and J4 complex unit identities.

This bounded gate pulls precisely that H to the isolated complex
module, proving conjugate symmetry, Q-positive diagonal and
H(I•x,y)=I*H(x,y), H(x,I•y)=-(I*H(x,y)).
It does NOT yet prove arbitrary complex-scalar sesquilinearity, a
bundled complex inner-product space, a canonical complex orthonormal
frame, Hopf quotient/Chern charge or physical BFSS Fock/Hamiltonian.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D32
noncomputable section

open FCP.RHOPFP9C3D2G1C1
open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D26
open FCP.RHOPFP9C3D2G1D28
open FCP.RHOPFP9C3D2G1D31

/-- The *same exact original Gamma9* complex Hermitian candidate,
evaluated on the isolated source complex module carrier. -/
noncomputable def relationalSourceComplexFourHermitian
    (x y : RelationalSourceComplexFour) : ℂ :=
  relationalSourceHermitianCandidate x.coordinates y.coordinates

/-- The source Gamma9 Hermitian candidate remains conjugate symmetric
on the isolated complex module carrier. -/
theorem relationalSourceComplexFourHermitian_conj_symm
    (x y : RelationalSourceComplexFour) :
    star (relationalSourceComplexFourHermitian y x) =
      relationalSourceComplexFourHermitian x y := by
  exact relationalSourceHermitianCandidate_conj_symm _ _

/-- Its imaginary diagonal vanishes for all source carrier vectors. -/
theorem relationalSourceComplexFourHermitian_self_im_zero
    (x : RelationalSourceComplexFour) :
    (relationalSourceComplexFourHermitian x x).im = 0 := by
  exact relationalSourceHermitianCandidate_self_im_zero _

/-- The real diagonal equals original Gamma9 Q, not the ambient
standard four-coordinate Euclidean norm. -/
theorem relationalSourceComplexFourHermitian_self_re_quadratic
    (x : RelationalSourceComplexFour) :
    (relationalSourceComplexFourHermitian x x).re =
      relationalRangeCoordinateDotSelf x.coordinates := by
  exact relationalSourceHermitianCandidate_self_re_quadratic _

/-- Positivity uses the accepted original transported Gamma9 spinor
form and injectivity of the wrapper's exact coordinate equivalence. -/
theorem relationalSourceComplexFourHermitian_self_re_pos_of_ne_zero
    (x : RelationalSourceComplexFour) (hx : x ≠ 0) :
    0 < (relationalSourceComplexFourHermitian x x).re := by
  have hcoord : x.coordinates ≠ 0 := by
    intro hz
    apply hx
    apply RelationalSourceComplexFour.ext
    change x.coordinates = (0 : Fin 4 → ℝ)
    exact hz
  exact relationalSourceHermitianCandidate_self_re_pos_of_ne_zero
    x.coordinates hcoord

/-- Source-complex multiplication by i in the first argument acts
as the actual original Gamma9 J4 on H. -/
theorem relationalSourceComplexFourHermitian_I_left
    (x y : RelationalSourceComplexFour) :
    relationalSourceComplexFourHermitian (Complex.I • x) y =
      Complex.I * relationalSourceComplexFourHermitian x y := by
  change relationalSourceHermitianCandidate
    (Complex.I • x).coordinates y.coordinates =
      Complex.I * relationalSourceHermitianCandidate
        x.coordinates y.coordinates
  rw [relationalSourceComplexFour_I_coordinates]
  exact relationalSourceHermitianCandidate_J4_left_mul_I _ _

/-- Source-complex multiplication by i in the second argument acts
by minus i on H, using the SAME accepted Gamma9 J4. -/
theorem relationalSourceComplexFourHermitian_I_right
    (x y : RelationalSourceComplexFour) :
    relationalSourceComplexFourHermitian x (Complex.I • y) =
      -(Complex.I * relationalSourceComplexFourHermitian x y) := by
  change relationalSourceHermitianCandidate
    x.coordinates (Complex.I • y).coordinates =
      -(Complex.I * relationalSourceHermitianCandidate
        x.coordinates y.coordinates)
  rw [relationalSourceComplexFour_I_coordinates]
  exact relationalSourceHermitianCandidate_J4_right_neg_mul_I _ _

#print axioms relationalSourceComplexFourHermitian
#print axioms relationalSourceComplexFourHermitian_conj_symm
#print axioms relationalSourceComplexFourHermitian_self_im_zero
#print axioms relationalSourceComplexFourHermitian_self_re_quadratic
#print axioms relationalSourceComplexFourHermitian_self_re_pos_of_ne_zero
#print axioms relationalSourceComplexFourHermitian_I_left
#print axioms relationalSourceComplexFourHermitian_I_right

end
end FCP.RHOPFP9C3D2G1D32
