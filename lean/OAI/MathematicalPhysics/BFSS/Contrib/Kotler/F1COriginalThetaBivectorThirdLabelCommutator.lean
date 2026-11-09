import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1BOriginalThetaBivectorSkewAdjoint

/-!
F1C — original Source48 ordered Majorana bivector commutes with a third
distinct original Majorana. This is the previously missing elementary-plane
case after accepted F1A (first/second labels) and F1B (skew-adjointness).

Uses only the actual Fermion 2 Fock space, delta-one source CAR, and the
exact source label order. No replacement gamma or abstract Spin action.
No LieHom, gauge-action identity, Hamiltonian or spectral assertion.
-/

set_option autoImplicit false

namespace FCP.BFSSF1COriginalThetaBivector
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

/-- The two-factor reversal follows from the original off-diagonal CAR.
The analogous helpers in the accepted F1A/F1B modules are private; we
preserve their source files rather than altering their accepted bodies. -/
private theorem originalTheta_pair_swap (p q : Source48Label) (hpq : p ≠ q) :
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

/-- Every third, distinct original Majorana commutes with the raw
ordered bivector in the genuine original Fock operator algebra. -/
theorem originalThetaBivector_comm_third
    (p q r : Source48Label)
    (_hpq : p ≠ q) (hpr : p ≠ r) (hqr : q ≠ r) :
    (majoranaCandidate p * majoranaCandidate q) * majoranaCandidate r -
      majoranaCandidate r * (majoranaCandidate p * majoranaCandidate q) =
        (0 : FockOp) := by
  let a : FockOp := majoranaCandidate p
  let b : FockOp := majoranaCandidate q
  let c : FockOp := majoranaCandidate r
  change (a * b) * c - c * (a * b) = 0
  have hac : a * c = -(c * a) :=
    originalTheta_pair_swap r p hpr.symm
  have hbc : b * c = -(c * b) :=
    originalTheta_pair_swap r q hqr.symm
  have hreorder : (a * b) * c = c * (a * b) := by
    calc
      (a * b) * c = a * (b * c) := mul_assoc a b c
      _ = a * (-(c * b)) := by rw [hbc]
      _ = -(a * (c * b)) := mul_neg a (c * b)
      _ = -((a * c) * b) := by rw [mul_assoc a c b]
      _ = -((-(c * a)) * b) := by rw [hac]
      _ = -(-((c * a) * b)) := by rw [neg_mul]
      _ = (c * a) * b := neg_neg _
      _ = c * (a * b) := mul_assoc c a b
  exact sub_eq_zero.mpr hreorder

#print axioms originalThetaBivector_comm_third

end
end FCP.BFSSF1COriginalThetaBivector
