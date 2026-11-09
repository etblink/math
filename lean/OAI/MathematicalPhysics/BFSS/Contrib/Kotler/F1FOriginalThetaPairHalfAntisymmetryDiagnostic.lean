import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1BOriginalThetaBivectorSkewAdjoint
import Mathlib.Tactic.NormNum

/-!
F1F original theta-pair half-antisymmetry, independently of Fock-map sums.

The two original-Fock source operators are the literal unnormalized
delta-one Majorana candidates at actual Source48Label p,q. For
distinct labels, source CAR makes their ordered products anticommute.
The external 1/2 converts the antisymmetric pair to exactly the ordered
bivector, WITHOUT normalizing the Majoranas or involving the 48x48
coefficient map. This is a reusable algebraic prerequisite, not a
qualification of C1/C1b concrete plane maps or production F1F.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FOriginalThetaPairHalfAntisymmetry
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

/-- A symbolic real-module scalar identity, proved without source Fock
reduction. The antisymmetric difference equals twice its first term
whenever the reverse term is its additive inverse. -/
theorem half_smul_sub_eq_self_of_reverse_neg
    {M : Type*} [AddCommGroup M] [Module ℝ M]
    (x y : M) (hy : y = -x) :
    (1 / 2 : ℝ) • (x - y) = x := by
  rw [hy, sub_neg_eq_add, smul_add]
  calc
    (1 / 2 : ℝ) • x + (1 / 2 : ℝ) • x =
        ((1 / 2 : ℝ) + (1 / 2 : ℝ)) • x :=
      (add_smul (1 / 2 : ℝ) (1 / 2 : ℝ) x).symm
    _ = (1 : ℝ) • x := by norm_num
    _ = x := one_smul ℝ x

/-- Public source-CAR swap, with exactly the original ordered
unnormalized theta operators and no universal-Clifford replacement.
The internal F1A/F1B proof pattern was previously strict-qualified. -/
theorem originalThetaPair_reverse_eq_neg
    (p q : Source48Label) (hpq : p ≠ q) :
    majoranaCandidate q * majoranaCandidate p =
      -(majoranaCandidate p * majoranaCandidate q) := by
  have hcar_scalar :
      majoranaCandidate p * majoranaCandidate q +
        majoranaCandidate q * majoranaCandidate p =
          (0 : ℂ) • (1 : FockOp) := by
    simpa only [ite_eq_right hpq] using
      (FCP.BFSSFermionF2B2Indexed.majoranaCandidate_car p q)
  have hcar :
      majoranaCandidate p * majoranaCandidate q +
        majoranaCandidate q * majoranaCandidate p = (0 : FockOp) := by
    exact hcar_scalar.trans (zero_smul ℂ (1 : FockOp))
  have hswap :
      majoranaCandidate q * majoranaCandidate p +
        majoranaCandidate p * majoranaCandidate q = (0 : FockOp) := by
    calc
      _ = majoranaCandidate p * majoranaCandidate q +
            majoranaCandidate q * majoranaCandidate p := add_comm _ _
      _ = 0 := hcar
  exact (add_eq_zero_iff_eq_neg).mp hswap

/-- For distinct actual source labels the external real half of the
antisymmetric original-theta pair equals the raw ordered bivector.
No equality to a fully expanded 48x48 coefficient sum is used. -/
theorem originalThetaPair_half_antisym_eq_ordered
    (p q : Source48Label) (hpq : p ≠ q) :
    (1 / 2 : ℝ) •
        (majoranaCandidate p * majoranaCandidate q -
          majoranaCandidate q * majoranaCandidate p) =
      majoranaCandidate p * majoranaCandidate q :=
  half_smul_sub_eq_self_of_reverse_neg
    (majoranaCandidate p * majoranaCandidate q)
    (majoranaCandidate q * majoranaCandidate p)
    (originalThetaPair_reverse_eq_neg p q hpq)

#print axioms half_smul_sub_eq_self_of_reverse_neg
#print axioms originalThetaPair_reverse_eq_neg
#print axioms originalThetaPair_half_antisym_eq_ordered

end
end FCP.BFSSF1FOriginalThetaPairHalfAntisymmetry
