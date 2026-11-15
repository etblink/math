import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0B0QuaternionPolynomial

/-!
# IBI-G0B0 independent consumer — finite determinant and normalization controls

The source result is a generic REAL quaternion polynomial theorem.
These independent examples do NOT bind it to the original BFSS G3A
adjoint matrix, supply a new representation, or assert SU(2) surjectivity.
-/

set_option autoImplicit false

namespace BFSSIBIG0B0IndependentConsumer

open FCP.BFSSIBIG0B0QuaternionPolynomial

/-- An arbitrary unit real quaternion has determinant +1 in the stated
polynomial matrix; no group representation is presumed. -/
example (a b c d : ℝ) (h : quaternionNormSq a b c d = 1) :
    (quaternionAdjointPolynomial a b c d).det = 1 := by
  rw [quaternionAdjointPolynomial_det, h]
  norm_num

/-- The nontrivial pure-b coordinate is a sign-sensitive finite control. -/
example :
    (quaternionAdjointPolynomial 0 1 0 0).det = 1 := by
  rw [quaternionAdjointPolynomial_det]
  norm_num [quaternionNormSq]

/-- Homogeneity check away from unit norm: determinant is cubic in
quaternion norm squared, NOT identically one. -/
example :
    (quaternionAdjointPolynomial 2 0 0 0).det = 64 := by
  rw [quaternionAdjointPolynomial_det]
  norm_num [quaternionNormSq]

end BFSSIBIG0B0IndependentConsumer
