import OAI.MathematicalPhysics.BFSS.FermionQuantization

/-!
MASSLESS-M0: isolated original BFSS finite-theta scalar-negation atoms.
Source exact Fermion N, FrequencyMatrix N, theta and gamma contraction.
No D1F import, deformed field claim, full Hamiltonian or spectral claim.
-/
set_option autoImplicit false

namespace FCP.BFSSMasslessM0
noncomputable section
open OAI
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- The *positive* coefficient used by the original source donor's
frequency_bracket_contraction, before the massless interaction minus sign. -/
def sourceBracketCoefficient {N : ℕ}
    (M : AlgebraData N) (x : Boson N) : FrequencyMatrix N :=
  fun r s => ∑ j : SpaceIndex, ∑ C : ColorIndex N,
    M.structureConstant s.2 r.2 C * x (j,C) * M.gamma j r.1 s.1

/-- In the literal original finite Fock carrier, real pointwise negation
can be moved outside BOTH finite sums. No source field equation here. -/
theorem sourceThetaQuadraticSum_neg {N : ℕ}
    (M : AlgebraData N) (K : FrequencyMatrix N) :
    (∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
      ((-(K r s) : ℝ) : ℂ) • (M.theta r.1 r.2 * M.theta s.1 s.2)) =
    -(∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
      (K r s : ℂ) • (M.theta r.1 r.2 * M.theta s.1 s.2)) := by
  simp only [Complex.ofReal_neg]
  rw [← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro r _
  rw [← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro s _
  exact neg_smul (K r s : ℂ)
    (M.theta r.1 r.2 * M.theta s.1 s.2)

/-- The original donor's positive frequency_bracket_contraction now
supplies the cubic-field sum after *separately* handling the negative
real scalar at each original source theta-pair coefficient. -/
theorem sourceBracketCoefficient_negative_contraction {N : ℕ}
    (M : AlgebraData N) (x : Boson N) :
    (∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
      ((-(sourceBracketCoefficient M x r s) : ℝ) : ℂ) •
        (M.theta r.1 r.2 * M.theta s.1 s.2)) =
    -(∑ j : SpaceIndex, ∑ A : ColorIndex N,
        M.cubicFermionComponent x A j) := by
  calc
    _ = -(∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
          (sourceBracketCoefficient M x r s : ℂ) •
            (M.theta r.1 r.2 * M.theta s.1 s.2)) :=
        sourceThetaQuadraticSum_neg M (sourceBracketCoefficient M x)
    _ = _ := by
      have h := M.frequency_bracket_contraction x
      simpa only [sourceBracketCoefficient] using congrArg Neg.neg h

#print axioms sourceThetaQuadraticSum_neg
#print axioms sourceBracketCoefficient_negative_contraction

end
end FCP.BFSSMasslessM0
