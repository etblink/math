import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainS1JActual48RealMajoranaColorActionProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG3B24ModeOrthogonalLiftProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPhysicalDomainS1V5ConcreteSixteenSourceColorBlocksProbe

/-!
# C48-1A1b0 — exact original S1J 48-real gauge column-entry preflight

Use the actual original 24-complex Fock mode color matrix and its
2-real-Majorana component duplication, transported through the accepted
sourceBlockColorEquiv. Only the original coordinate column entry is
shown here. No new Fock unitary, source all-vector covariance, Spin9
implementer, physical projection or Hamiltonian claim is made.
-/
set_option autoImplicit false

namespace FCP.BFSSC48C1A1b0OriginalS1JSourceAxisEntryMinimalProbe
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5

/-- The original source 8×3 Fock packing is definitionally the SAME
finProdFinEquiv as the qualified G1A color-mode packing. -/
theorem originalSourceLabel_eq_G1AColorMode
    (j : Fin 8) (s : Fin 2) (A : ColorIndex 2) :
    sourceBlockColorLabel (j,s) A =
      (FCP.BFSSSU2GaugeG1A.colorModeEquiv (j,A), s) := rfl

/-- Every literal S1J source matrix entry is exactly the actual
SU2 adjoint output-color B / input-color A coefficient, with
delta on the original spin-pair j and Majorana component s. -/
theorem originalS1J_sourceBlockColor_entry
    (q : GaugeGroup 2) (j k : Fin 8) (s t : Fin 2)
    (A B : ColorIndex 2) :
    FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q
        (sourceBlockColorLabel (k,t) B)
        (sourceBlockColorLabel (j,s) A) =
      if k = j ∧ t = s then
        FCP.BFSSSU2GaugeG3A.adjointColorMatrix q B A
      else 0 := by
  rw [originalSourceLabel_eq_G1AColorMode,
      originalSourceLabel_eq_G1AColorMode]
  rw [FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix_entry,
      FCP.BFSSSU2GaugeG3B.oneParticleMatrix_block]
  by_cases hk : k = j <;> by_cases ht : t = s <;>
    simp [hk, ht]

/-- The same entry theorem consumes any literal original source
row label by an explicit sourceBlockColorEquiv preimage witness. -/
theorem originalS1J_everySource48Row
    (q : GaugeGroup 2) (j : Fin 8) (s : Fin 2)
    (A : ColorIndex 2) (p : Source48Label) :
    ∃ (k : Fin 8) (t : Fin 2) (B : ColorIndex 2),
      sourceBlockColorLabel (k,t) B = p ∧
      FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q
          p (sourceBlockColorLabel (j,s) A) =
        if k = j ∧ t = s then
          FCP.BFSSSU2GaugeG3A.adjointColorMatrix q B A
        else 0 := by
  obtain ⟨⟨⟨k,t⟩,B⟩,hp⟩ :=
    sourceBlockColorEquiv.surjective p
  refine ⟨k,t,B,?_,?_⟩
  · change sourceBlockColorEquiv ((k,t),B) = p
    exact hp
  · rw [← hp]
    exact originalS1J_sourceBlockColor_entry q j k s t A B

#print axioms originalSourceLabel_eq_G1AColorMode
#print axioms originalS1J_sourceBlockColor_entry
#print axioms originalS1J_everySource48Row

end
end FCP.BFSSC48C1A1b0OriginalS1JSourceAxisEntryMinimalProbe
