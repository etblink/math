import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1DOriginalThetaBivectorAllLabelAction

/-!
Independent original 48-label/Fermion 2 consumer for the exhaustive
F1D bivector commutator formula. No replacement Clifford carrier.
-/
set_option autoImplicit false

namespace FCP.BFSSF1DOriginalThetaBivectorIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open FCP.BFSSF1DOriginalThetaBivector

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

example (p q r : Source48Label) (hpq : p ≠ q) :
    (majoranaCandidate p * majoranaCandidate q) * majoranaCandidate r -
      majoranaCandidate r * (majoranaCandidate p * majoranaCandidate q) =
        if r = p then -majoranaCandidate q
        else if r = q then majoranaCandidate p
        else (0 : FockOp) :=
  originalThetaBivector_comm_all_labels p q r hpq

#print axioms FCP.BFSSF1DOriginalThetaBivector.originalThetaBivector_comm_all_labels

end
end FCP.BFSSF1DOriginalThetaBivectorIndependentAudit
