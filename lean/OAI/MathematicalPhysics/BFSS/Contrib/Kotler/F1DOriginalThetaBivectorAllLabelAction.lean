import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1COriginalThetaBivectorThirdLabelCommutator

/-!
F1D — the full original Source48-label action of an ordered theta bivector.

This packages exactly the separately qualified F1A first/second-label
commutators and F1C third-distinct-label commutator in one exhaustive
original-label identity. It retains the original delta-one Majorana CAR
on Fermion 2. The F1B skew-adjoint companion is imported unchanged.

This is not yet a Lie algebra homomorphism, a global Spin(9) Fock lift,
a physical gauge action, or a spectral assertion.
-/

set_option autoImplicit false

namespace FCP.BFSSF1DOriginalThetaBivector
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

/-- The exact, unnormalized original Majorana bivector has a negative
first-label commutator, a positive second-label commutator, and zero
commutator with every third distinct source label. -/
theorem originalThetaBivector_comm_all_labels
    (p q r : Source48Label) (hpq : p ≠ q) :
    (majoranaCandidate p * majoranaCandidate q) * majoranaCandidate r -
      majoranaCandidate r * (majoranaCandidate p * majoranaCandidate q) =
        if r = p then -majoranaCandidate q
        else if r = q then majoranaCandidate p
        else (0 : FockOp) := by
  by_cases hrp : r = p
  · subst r
    simpa using
      (FCP.BFSSF1AOriginalThetaBivector.originalThetaBivector_comm_first p q hpq)
  · by_cases hrq : r = q
    · subst r
      have hqp : q ≠ p := Ne.symm hpq
      simpa [hqp] using
        (FCP.BFSSF1AOriginalThetaBivector.originalThetaBivector_comm_second p q hpq)
    · have hpr : p ≠ r := fun h => hrp h.symm
      have hqr : q ≠ r := fun h => hrq h.symm
      simpa [hrp, hrq] using
        (FCP.BFSSF1COriginalThetaBivector.originalThetaBivector_comm_third
          p q r hpq hpr hqr)

#print axioms originalThetaBivector_comm_all_labels

end
end FCP.BFSSF1DOriginalThetaBivector
