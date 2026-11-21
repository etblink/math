import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D27OriginalGammaHermitianJ4Components

/-!
# RHOPF-P9C3D2G1D28 — original Gamma9 full complex J4 Hermitian identities

D27 strictly qualified all four source-exact real/imaginary components
of H(J4 x,y) and H(x,J4 y), where H is the exact original Gamma9
source Q-derived Hermitian candidate and J4 the original source
complex structure. Pin-exact Mathlib supplies Complex.I_mul_re/im and
Complex.neg_re/im. Use Complex.ext to reassemble TWO full ℂ equalities.

This gate does not yet define a complex module, prove full
sesquilinearity, choose a Q-orthonormal ℂ² frame, assume the ordinary
coordinate Euclidean metric, or assert a classical Hopf quotient.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D28
noncomputable section

open FCP.RHOPFP9C3D2G1D10
open FCP.RHOPFP9C3D2G1D26
open FCP.RHOPFP9C3D2G1D27

/-- Under original Gamma9 J4 in the first variable, exact source
Hermitian H transforms by the actual complex unit I. -/
theorem relationalSourceHermitianCandidate_J4_left_mul_I
    (x y : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate (relationalPhaseJFourLinear x) y =
      Complex.I * relationalSourceHermitianCandidate x y := by
  apply Complex.ext
  · rw [Complex.I_mul_re]
    exact relationalSourceHermitianCandidate_J4_left_re x y
  · rw [Complex.I_mul_im]
    exact relationalSourceHermitianCandidate_J4_left_im x y

/-- Under original Gamma9 J4 in the second variable, exact source
Hermitian H transforms by negative complex unit I. -/
theorem relationalSourceHermitianCandidate_J4_right_neg_mul_I
    (x y : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate x (relationalPhaseJFourLinear y) =
      -(Complex.I * relationalSourceHermitianCandidate x y) := by
  apply Complex.ext
  · rw [Complex.neg_re, Complex.I_mul_re, neg_neg]
    exact relationalSourceHermitianCandidate_J4_right_re x y
  · rw [Complex.neg_im, Complex.I_mul_im]
    exact relationalSourceHermitianCandidate_J4_right_im x y

#print axioms relationalSourceHermitianCandidate_J4_left_mul_I
#print axioms relationalSourceHermitianCandidate_J4_right_neg_mul_I

end
end FCP.RHOPFP9C3D2G1D28
