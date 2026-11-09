import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1AOriginalThetaBivectorCommutator

/-!
# F1B — actual original Source48 ordered Majorana bivector skew-adjointness

This bounded theorem is about the literal original BFSS 24-mode `Fermion 2`
Hilbert carrier with the original delta-one Majorana normalization.
It reuses the F1A source CAR orientation and F2 self-adjointness methods,
without importing the separate universal-Clifford/Spin48 chain.

No Spin(9) group lift, gauge commutation, supercharge covariance, physical
Hamiltonian or spectral statement is asserted.
-/

set_option autoImplicit false

namespace FCP.BFSSF1BOriginalThetaBivector
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

/-- For unequal original source labels, the *unnormalized* Majorana
operators anticommute; this is the exact original delta-one CAR. -/
private theorem originalTheta_pair_swap (p q : Source48Label)
    (hpq : p ≠ q) :
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

/-- The raw ordered source bivector is skew-adjoint on the ACTUAL original
Fock Hilbert space for distinct 48-labels. No normalization is altered. -/
theorem originalThetaBivector_skewAdjoint
    (p q : Source48Label) (hpq : p ≠ q) :
    star (majoranaCandidate p * majoranaCandidate q) =
      -(majoranaCandidate p * majoranaCandidate q) := by
  have hadj :
      ContinuousLinearMap.adjoint
        (majoranaCandidate p * majoranaCandidate q) =
          majoranaCandidate q * majoranaCandidate p := by
    change ContinuousLinearMap.adjoint
        (majoranaCandidate p ∘L majoranaCandidate q) =
      majoranaCandidate q ∘L majoranaCandidate p
    rw [ContinuousLinearMap.adjoint_comp,
      (majoranaCandidate_selfAdjoint q).adjoint_eq,
      (majoranaCandidate_selfAdjoint p).adjoint_eq]
  calc
    star (majoranaCandidate p * majoranaCandidate q) =
        ContinuousLinearMap.adjoint
          (majoranaCandidate p * majoranaCandidate q) :=
      ContinuousLinearMap.star_eq_adjoint _
    _ = majoranaCandidate q * majoranaCandidate p := hadj
    _ = -(majoranaCandidate p * majoranaCandidate q) :=
      originalTheta_pair_swap p q hpq

#print axioms originalThetaBivector_skewAdjoint

end
end FCP.BFSSF1BOriginalThetaBivector
