import OAI.MathematicalPhysics.BFSS.FermionQuantization

/-!
FCP BFSS ADJ-A1 — original-source Majorana pair adjoint with
separately bound real coefficient.

Different theorem and interface from the frozen D1S4 source gate.
There is NO source Matrix / FrequencyMatrix K, no source-matrix
entry rewrite, and no total quantizer or spectral claim.

Once this original-Fock coefficient-independent interface passes,
a future ADJ-A2 can instantiate c,d from skew source coefficients,
using qualified A0 to handle the finite double sum.
-/
set_option autoImplicit false

namespace FCP.BFSSAdjointA1
noncomputable section
open OAI
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- On the literal original Fock carrier, star reverses an original
theta pair and conjugates its separately typed scalar coefficient. -/
theorem originalThetaPairRealCoefficient_star {N : ℕ}
    (M : AlgebraData N) (r s : FrequencyIndex N) (c : ℝ) :
    star ((c : ℂ) •
      (M.theta r.1 r.2 * M.theta s.1 s.2)) =
    (c : ℂ) •
      (M.theta s.1 s.2 * M.theta r.1 r.2) := by
  rw [star_smul, star_mul,
    (M.theta_selfAdjoint s.1 s.2).star_eq,
    (M.theta_selfAdjoint r.1 r.2).star_eq]
  have hreal : star (c : ℂ) = (c : ℂ) := by simp
  rw [hreal]

/-- A pair of explicitly typed real numbers satisfying c=-d
yields the negative reversed original theta pair.
No frequency-matrix application occurs inside the rewrite. -/
theorem originalThetaPairRealCoefficient_skew {N : ℕ}
    (M : AlgebraData N) (r s : FrequencyIndex N)
    (c d : ℝ) (hcd : c = -d) :
    star ((c : ℂ) •
      (M.theta r.1 r.2 * M.theta s.1 s.2)) =
    -((d : ℂ) •
      (M.theta s.1 s.2 * M.theta r.1 r.2)) := by
  rw [originalThetaPairRealCoefficient_star M r s c, hcd,
    Complex.ofReal_neg]
  exact neg_smul (d : ℂ)
    (M.theta s.1 s.2 * M.theta r.1 r.2)

#print axioms originalThetaPairRealCoefficient_star
#print axioms originalThetaPairRealCoefficient_skew

end
end FCP.BFSSAdjointA1
