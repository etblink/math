import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3B1OriginalGammaRelationalCirclePhaseMultiplication

/-!
# RHOPF-P9C3C — original Gamma9 unit-circle phase orthogonality

From the independently qualified exact source-original R(a,b) real
16-carrier phase multiplication law and transpose equation, prove
  R(a,b)ᵀR(a,b) = R(a²+b²,0)
and when a²+b²=1, R(a,b)ᵀR(a,b)=I.

This establishes an orthogonal original-source matrix for each
unit-circle parameter; no continuous S¹ action, orbit quotient, Hopf
bundle, physical Fock/Hamiltonian or coordinate mapping claimed.
No original gamma entry expansion, private table duplication, new axioms,
unbounded aggregate imports, or proof resource changes.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3C
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C3A
open FCP.RHOPFP9C3B1

/-- Exact real-parameter source-original phase Gram identity.
The transpose acts by complex conjugation, and source phase products
obey the accepted complex multiplication formula. -/
theorem relationalCirclePhase_transpose_mul_self (a b : ℝ) :
    (relationalCirclePhase a b).transpose * relationalCirclePhase a b =
      relationalCirclePhase (a * a + b * b) 0 := by
  rw [relationalCirclePhase_transpose, relationalCirclePhase_mul]
  have hreal : a * a - (-b) * b = a * a + b * b := by ring
  have himag : a * b + (-b) * a = (0 : ℝ) := by ring
  rw [hreal, himag]

/-- The original gamma-source relational phase matrix is orthogonal
for every real unit-circle parameter, without any coordinate basis. -/
theorem relationalCirclePhase_orthogonal_of_unit
    (a b : ℝ) (hunit : a * a + b * b = 1) :
    (relationalCirclePhase a b).transpose * relationalCirclePhase a b =
      (1 : GammaMatrix) := by
  rw [relationalCirclePhase_transpose_mul_self, hunit,
    relationalCirclePhase_one_zero]

#print axioms relationalCirclePhase_transpose_mul_self
#print axioms relationalCirclePhase_orthogonal_of_unit

end
end FCP.RHOPFP9C3C
