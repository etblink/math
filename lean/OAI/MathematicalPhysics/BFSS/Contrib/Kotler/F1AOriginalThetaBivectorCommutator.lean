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
      have hcomp_neg : a * (-(a * b)) = -(a * (a * b)) := by
        change a ∘L (-(a ∘L b)) = -(a ∘L (a ∘L b))
        exact ContinuousLinearMap.comp_neg a (a ∘L b)
      calc
        a * (-(a * b)) - (a * a) * b =
            -(a * (a * b)) - a * (a * b) := by
              rw [hcomp_neg, mul_assoc]
        _ = -((a * a + a * a) * b) := by
              rw [add_mul, mul_assoc]
              abel
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
      have hneg_comp : (-(a * b)) * b = -((a * b) * b) := by
        change (-(a ∘L b)) ∘L b = -((a ∘L b) ∘L b)
        exact ContinuousLinearMap.neg_comp (a ∘L b) b
      calc
        a * (b * b) - (-(a * b)) * b =
            a * (b * b) + (a * b) * b := by
              rw [hneg_comp, sub_neg_eq_add]
        _ = a * (b * b + b * b) := by
              rw [mul_add, mul_assoc]
    _ = a * 1 := by rw [hbb]
    _ = a := by simp

#print axioms originalThetaBivector_comm_first
#print axioms originalThetaBivector_comm_second

end
end FCP.BFSSF1AOriginalThetaBivector
