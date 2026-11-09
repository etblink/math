import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1BOriginalThetaBivectorSkewAdjoint

/-! Independent original-source F1B skew-adjointness consumer.
This imports the newly built F1B theorem on the genuine Fermion 2 Fock
carrier rather than replacing the operators or assuming an abstract Clifford
representation. -/

set_option autoImplicit false

namespace FCP.BFSSF1BOriginalThetaBivectorIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0
open FCP.BFSSF1BOriginalThetaBivector

example (p q : Source48Label) (hpq : p ≠ q) :
    star (majoranaCandidate p * majoranaCandidate q) =
      -(majoranaCandidate p * majoranaCandidate q) :=
  originalThetaBivector_skewAdjoint p q hpq

#print axioms FCP.BFSSF1BOriginalThetaBivector.originalThetaBivector_skewAdjoint

end
end FCP.BFSSF1BOriginalThetaBivectorIndependentAudit
