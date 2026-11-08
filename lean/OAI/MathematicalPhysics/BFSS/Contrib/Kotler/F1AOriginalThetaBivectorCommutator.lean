import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSSource48NormalizedFockGammaProbe
import Mathlib.Tactic.NoncommRing

/-!
# F1A — actual original Source48 theta bivector commutator orientation

On the *original* BFSS Fermion 2 Fock Hilbert carrier, retain the
delta-one Majorana CAR (not the sqrt(2)-normalized unit Clifford gamma).
For distinct source 48-labels p and q, the raw ordered bivector
theta(p)*theta(q) has commutators -theta(q) and +theta(p) with
theta(p) and theta(q), respectively.

This is the first original F1 sign/normalization micro-gate; it is
NOT skew-adjointness, a full so(48) Lie implementer, a continuous
Spin(9) Fock action, a physical Hamiltonian or a spectral theorem.
No original source operators or model conventions are redefined.
-/

set_option autoImplicit false

namespace FCP.BFSSF1AOriginalThetaBivector
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

/-- The actual, unnormalized Source48-indexed original BFSS Majoranas
anticommute at distinct labels. No normalized Clifford replacement. -/
private theorem theta_anticommute (p q : Source48Label) (hpq : p ≠ q) :
    majoranaCandidate q * majoranaCandidate p =
      -(majoranaCandidate p * majoranaCandidate q) := by
  have hcar :
      majoranaCandidate p * majoranaCandidate q +
      majoranaCandidate q * majoranaCandidate p = (0 : FockOp) := by
    simpa [hpq] using
      (FCP.BFSSFermionF2B2Indexed.majoranaCandidate_car p q)
  have hswap :
      majoranaCandidate q * majoranaCandidate p +
      majoranaCandidate p * majoranaCandidate q = (0 : FockOp) := by
    calc
      _ = majoranaCandidate p * majoranaCandidate q +
          majoranaCandidate q * majoranaCandidate p := add_comm _ _
      _ = 0 := hcar
  exact (add_eq_zero_iff_eq_neg).mp hswap

/-- The delta-one CAR gives 2*theta(p)^2=1 in the actual Fock operator algebra. -/
private theorem theta_diagonal (p : Source48Label) :
    majoranaCandidate p * majoranaCandidate p +
    majoranaCandidate p * majoranaCandidate p = (1 : FockOp) := by
  simpa using
    (FCP.BFSSFermionF2B2Indexed.majoranaCandidate_car p p)

/-- The ordered original theta bivector rotates its first label with
a **negative** sign. No implicit normalized-Clifford convention. -/
theorem originalThetaBivector_comm_first (p q : Source48Label) (hpq : p ≠ q) :
    (majoranaCandidate p * majoranaCandidate q) * majoranaCandidate p -
      majoranaCandidate p * (majoranaCandidate p * majoranaCandidate q) =
      -majoranaCandidate q := by
  let a : FockOp := majoranaCandidate p
  let b : FockOp := majoranaCandidate q
  change (a * b) * a - a * (a * b) = -b
  have hba : b * a = -(a * b) := theta_anticommute p q hpq
  have haa : a * a + a * a = 1 := theta_diagonal p
  calc
    (a * b) * a - a * (a * b) =
        a * (b * a) - (a * a) * b := by simp only [mul_assoc]
    _ = a * (-(a * b)) - (a * a) * b := by rw [hba]
    _ = -((a * a + a * a) * b) := by
      simp only [mul_neg, sub_eq_add_neg, add_mul, neg_add_rev, mul_assoc]
    _ = -(1 * b) := by rw [haa]
    _ = -b := by simp

/-- The same original ordered bivector rotates its second label with
a **positive** sign; both signs are consequences of delta-one CAR. -/
theorem originalThetaBivector_comm_second (p q : Source48Label) (hpq : p ≠ q) :
    (majoranaCandidate p * majoranaCandidate q) * majoranaCandidate q -
      majoranaCandidate q * (majoranaCandidate p * majoranaCandidate q) =
      majoranaCandidate p := by
  let a : FockOp := majoranaCandidate p
  let b : FockOp := majoranaCandidate q
  change (a * b) * b - b * (a * b) = a
  have hba : b * a = -(a * b) := theta_anticommute p q hpq
  have hbb : b * b + b * b = 1 := theta_diagonal q
  calc
    (a * b) * b - b * (a * b) =
        a * (b * b) - (b * a) * b := by simp only [mul_assoc]
    _ = a * (b * b) - (-(a * b)) * b := by rw [hba]
    _ = a * (b * b + b * b) := by
      simp only [neg_mul, sub_neg_eq_add, mul_assoc, mul_add]
    _ = a * 1 := by rw [hbb]
    _ = a := by simp

#print axioms originalThetaBivector_comm_first
#print axioms originalThetaBivector_comm_second

end
end FCP.BFSSF1AOriginalThetaBivector
