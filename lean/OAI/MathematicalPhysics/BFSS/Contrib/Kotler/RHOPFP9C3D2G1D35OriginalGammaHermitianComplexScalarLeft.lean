import Mathlib.Tactic.Ring
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D34OriginalGammaHermitianRightRealLaws

/-!
# RHOPF-P9C3D2G1D35 — source-original complex scalar linearity in H first argument

D33/D34 strictly qualified real bilinearity of the *same* original
Gamma9 source-Q-derived Hermitian candidate. D28 strictly qualified
H(J4x,y)=I*H(x,y), and D29/D31 construct the exact original Gamma9
complex scalar action and its isolated Module ℂ carrier.

Prove only full first-variable complex scalar linearity, first in
the source original four-real coordinates and then in the isolated
complex module wrapper. The conjugate-linear second variable, bundled
inner-product space, classical Hopf quotient and physical 48-Majorana
BFSS Fock/Hamiltonian/hopfion remain separate hypotheses/gates.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D35
noncomputable section

open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D26
open FCP.RHOPFP9C3D2G1D28
open FCP.RHOPFP9C3D2G1D29
open FCP.RHOPFP9C3D2G1D31
open FCP.RHOPFP9C3D2G1D32
open FCP.RHOPFP9C3D2G1D33

/-- Exact original Gamma9 Q-Hermitian function is linear in the first
variable for arbitrary complex scalars under its source-derived
J4-action, without changing the real coordinate module instance. -/
theorem relationalSourceHermitianCandidate_complex_smul_left
    (z : ℂ) (x y : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate
        (relationalSourceComplexScalarAction z x) y =
      z * relationalSourceHermitianCandidate x y := by
  calc
    relationalSourceHermitianCandidate
        (relationalSourceComplexScalarAction z x) y =
        (z.re : ℂ) * relationalSourceHermitianCandidate x y +
          (z.im : ℂ) * (Complex.I * relationalSourceHermitianCandidate x y) := by
            unfold relationalSourceComplexScalarAction
            rw [relationalSourceHermitianCandidate_add_left,
              relationalSourceHermitianCandidate_real_smul_left,
              relationalSourceHermitianCandidate_real_smul_left,
              relationalSourceHermitianCandidate_J4_left_mul_I]
    _ = ((z.re : ℂ) + (z.im : ℂ) * Complex.I) *
          relationalSourceHermitianCandidate x y := by ring
    _ = z * relationalSourceHermitianCandidate x y := by
          rw [Complex.re_add_im]

/-- The same original Gamma9 Hermitian function is complex linear on
the D31 isolated, source-exact Module ℂ carrier. -/
theorem relationalSourceComplexFourHermitian_smul_left
    (z : ℂ) (x y : RelationalSourceComplexFour) :
    relationalSourceComplexFourHermitian (z • x) y =
      z * relationalSourceComplexFourHermitian x y := by
  change relationalSourceHermitianCandidate
      (z • x).coordinates y.coordinates =
    z * relationalSourceHermitianCandidate x.coordinates y.coordinates
  rw [relationalSourceComplexFour_smul_coordinates]
  exact relationalSourceHermitianCandidate_complex_smul_left z _ _

#print axioms relationalSourceHermitianCandidate_complex_smul_left
#print axioms relationalSourceComplexFourHermitian_smul_left

end
end FCP.RHOPFP9C3D2G1D35
