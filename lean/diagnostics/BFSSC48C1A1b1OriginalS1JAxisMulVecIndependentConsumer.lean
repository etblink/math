import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.C48C1A1b1OriginalS1JAxisMulVecSource

/-!
# C48-1A1b1 independent consumer of the exact original S1J axis theorem

This file separately imports the original qualified mathematical source
declarations rather than reconstructing their source-specific proof.
It consumes the general axis theorem and the independently accepted
S1J identity matrix theorem to derive the **new identity-color-column**
corollary. No Fock-vector unitary or Hamiltonian statement is asserted.
-/
set_option autoImplicit false

namespace FCP.BFSSC48C1A1b1OriginalS1JAxisMulVecIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V5

/-- The SU(2) adjoint source coefficients at the gauge identity
reconstruct the exact original 48-Majorana coordinate axis.
This is a distinct consequence of the imported matrix-axis theorem
and the true S1J source identity, not a restatement of its type. -/
theorem originalS1J_unitColorColumn_reconstruct
    (j : Fin 8) (s : Fin 2) (A : ColorIndex 2) :
    (∑ B : ColorIndex 2,
      (FCP.BFSSSU2GaugeG3A.adjointColorMatrix
        (1 : GaugeGroup 2) B A) •
        sourceBlockColorAxis (j,s) B) =
      sourceBlockColorAxis (j,s) A := by
  calc
    _ =
      (FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix
        (1 : GaugeGroup 2)).mulVec (sourceBlockColorAxis (j,s) A) :=
        (FCP.BFSSC48C1A1b1OriginalS1JAxisMulVecSource.originalS1J_mulVec_sourceBlockColorAxis
          (1 : GaugeGroup 2) j s A).symm
    _ = sourceBlockColorAxis (j,s) A := by
      simp [FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix_one]

#print axioms FCP.BFSSC48C1A1b1OriginalS1JAxisMulVecSource.originalSourceLabel_eq_G1AColorMode
#print axioms FCP.BFSSC48C1A1b1OriginalS1JAxisMulVecSource.originalS1J_sourceBlockColor_entry
#print axioms FCP.BFSSC48C1A1b1OriginalS1JAxisMulVecSource.originalS1J_mulVec_sourceBlockColorAxis
#print axioms originalS1J_unitColorColumn_reconstruct

end
end FCP.BFSSC48C1A1b1OriginalS1JAxisMulVecIndependentConsumer
