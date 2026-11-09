import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1COriginalThetaBivectorThirdLabelCommutator

/-! Independent three-distinct-label consumer, using the literal
original source 48 labels and the original Fermion 2 continuous operators. -/
set_option autoImplicit false

namespace FCP.BFSSF1COriginalThetaBivectorIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open FCP.BFSSF1COriginalThetaBivector

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

example (p q r : Source48Label)
    (hpq : p ≠ q) (hpr : p ≠ r) (hqr : q ≠ r) :
    (majoranaCandidate p * majoranaCandidate q) * majoranaCandidate r -
      majoranaCandidate r * (majoranaCandidate p * majoranaCandidate q) =
        (0 : FockOp) :=
  originalThetaBivector_comm_third p q r hpq hpr hqr

#print axioms FCP.BFSSF1COriginalThetaBivector.originalThetaBivector_comm_third

end
end FCP.BFSSF1COriginalThetaBivectorIndependentAudit
