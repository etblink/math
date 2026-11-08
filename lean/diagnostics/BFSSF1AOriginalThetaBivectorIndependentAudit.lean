import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1AOriginalThetaBivectorCommutator

/-!
Independent exact original Source48-indexed Majorana bivector consumer.
Checks both commutator signs without any alternate carrier or normalization.
-/
set_option autoImplicit false

namespace FCP.BFSSF1AOriginalThetaBivectorIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open FCP.BFSSF1AOriginalThetaBivector

example (p q : Source48Label) (hpq : p ≠ q) :
    (majoranaCandidate p * majoranaCandidate q) * majoranaCandidate p -
      majoranaCandidate p * (majoranaCandidate p * majoranaCandidate q) =
      -majoranaCandidate q :=
  originalThetaBivector_comm_first p q hpq

example (p q : Source48Label) (hpq : p ≠ q) :
    (majoranaCandidate p * majoranaCandidate q) * majoranaCandidate q -
      majoranaCandidate q * (majoranaCandidate p * majoranaCandidate q) =
      majoranaCandidate p :=
  originalThetaBivector_comm_second p q hpq

#print axioms FCP.BFSSF1AOriginalThetaBivector.originalThetaBivector_comm_first
#print axioms FCP.BFSSF1AOriginalThetaBivector.originalThetaBivector_comm_second

end
end FCP.BFSSF1AOriginalThetaBivectorIndependentAudit
