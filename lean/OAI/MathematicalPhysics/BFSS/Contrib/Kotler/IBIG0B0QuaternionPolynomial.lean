import Mathlib

/-!
# IBI-G0B0 — finite quaternion adjoint determinant polynomial

This is a candidate-neutral, generic four-real-variable polynomial
identity. The entries are copied in the same rows=output/columns=input
orientation as the PRE-EXISTING original BFSS
S1V52L9C1.originalQuaternionAdjointPolynomial.

NO claim is made here that this finite matrix equals the original G3A
source SU(2) gauge action. Native coordinate norm and source binding
require independent formal qualification. This source is UNQUALIFIED
until its strict gate and separate consumer pass.
-/

set_option autoImplicit false

namespace FCP.BFSSIBIG0B0QuaternionPolynomial

noncomputable section

open Matrix

/-- Square of the real quaternion norm, with the source coordinate order. -/
def quaternionNormSq (a b c d : ℝ) : ℝ :=
  a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2

/-- Finite polynomial of the preexisting source quaternion color-action
coefficients; not an independent physical SU(2) model. -/
def quaternionAdjointPolynomial (a b c d : ℝ) :
    Matrix (Fin 3) (Fin 3) ℝ :=
  !![
    a ^ 2 - b ^ 2 - c ^ 2 + d ^ 2, 2*a*b + 2*c*d, -2*a*c + 2*b*d;
    -2*a*b + 2*c*d, a ^ 2 - b ^ 2 + c ^ 2 - d ^ 2, 2*a*d + 2*b*c;
    2*a*c + 2*b*d, -2*a*d + 2*b*c, a ^ 2 + b ^ 2 - c ^ 2 - d ^ 2
  ]

/-- Exact polynomial identity, before any original-source group crosswalk. -/
theorem quaternionAdjointPolynomial_det (a b c d : ℝ) :
    (quaternionAdjointPolynomial a b c d).det =
      (quaternionNormSq a b c d) ^ 3 := by
  simp [Matrix.det_fin_three, quaternionAdjointPolynomial, quaternionNormSq]
  <;> ring

#print axioms quaternionNormSq
#print axioms quaternionAdjointPolynomial
#print axioms quaternionAdjointPolynomial_det

end
end FCP.BFSSIBIG0B0QuaternionPolynomial
