import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainS1JActual48RealMajoranaColorActionProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG3B24ModeOrthogonalLiftProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPhysicalDomainS1V5ConcreteSixteenSourceColorBlocksProbe

/-!
# C48-1A1b0 — original S1J source axis as the actual matrix column

Independent miniature successor to the accepted source-entry preflight
(#42847346999). On the literal original Source48Vector, establish the
S1J.mulVec action on one G1A-indexed source axis by the pinned matrix
column lemma. Retain true output-color B / input-color A orientation.

This is NOT yet arbitrary-vector Fock gauge covariance, algebra
commutation, gauge projection invariance or a physical Hamiltonian result.
-/
set_option autoImplicit false

namespace FCP.BFSSC48C1A1b0OriginalS1JAxisMulVecMinimalProbe
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V5

theorem originalSourceLabel_eq_G1AColorMode
    (j : Fin 8) (s : Fin 2) (A : ColorIndex 2) :
    sourceBlockColorLabel (j,s) A =
      (FCP.BFSSSU2GaugeG1A.colorModeEquiv (j,A), s) := rfl

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

/-- On a literal original 48-real-Majorana source unit axis,
the genuine S1J matrix gives precisely the SU(2) adjoint color-column
sum, preserving the original spin pair and real/imaginary bit. -/
theorem originalS1J_mulVec_sourceBlockColorAxis
    (q : GaugeGroup 2) (j : Fin 8) (s : Fin 2)
    (A : ColorIndex 2) :
    (FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
        (sourceBlockColorAxis (j,s) A) =
      ∑ B : ColorIndex 2,
        (FCP.BFSSSU2GaugeG3A.adjointColorMatrix q B A) •
          sourceBlockColorAxis (j,s) B := by
  classical
  change
    (FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec
        (Pi.single (sourceBlockColorLabel (j,s) A) (1 : ℝ)) =
      ∑ B : ColorIndex 2,
        (FCP.BFSSSU2GaugeG3A.adjointColorMatrix q B A) •
          Pi.single (sourceBlockColorLabel (j,s) B) (1 : ℝ)
  rw [Matrix.mulVec_single_one]
  funext p
  obtain ⟨⟨⟨k,t⟩,B⟩,hp⟩ := sourceBlockColorEquiv.surjective p
  have hp' : sourceBlockColorLabel (k,t) B = p := by
    change sourceBlockColorEquiv ((k,t),B) = p
    exact hp
  rw [← hp']
  change
    FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q
        (sourceBlockColorLabel (k,t) B)
        (sourceBlockColorLabel (j,s) A) =
      ∑ C : ColorIndex 2,
        (FCP.BFSSSU2GaugeG3A.adjointColorMatrix q C A) •
          Pi.single (sourceBlockColorLabel (j,s) C) (1 : ℝ)
            (sourceBlockColorLabel (k,t) B)
  rw [originalS1J_sourceBlockColor_entry]
  have hsingle (C : ColorIndex 2) :
      Pi.single (sourceBlockColorLabel (j,s) C) (1 : ℝ)
          (sourceBlockColorLabel (k,t) B) =
        if k = j ∧ t = s ∧ C = B then (1 : ℝ) else 0 := by
    by_cases h : k = j ∧ t = s ∧ C = B
    · rcases h with ⟨rfl,rfl,rfl⟩
      simp
    · have hne :
          sourceBlockColorLabel (k,t) B ≠
            sourceBlockColorLabel (j,s) C := by
        intro hsame
        have hpair : ((k,t),B) = ((j,s),C) :=
          sourceBlockColorLabel_injective hsame
        apply h
        exact
          ⟨congrArg (fun z : RealSpinBlock × ColorLabel => z.1.1) hpair,
           congrArg (fun z : RealSpinBlock × ColorLabel => z.1.2) hpair,
           (congrArg (fun z : RealSpinBlock × ColorLabel => z.2) hpair).symm⟩
      simpa [h] using (Pi.single_eq_of_ne hne (1 : ℝ))
  simp_rw [hsingle]
  by_cases hk : k = j
  · subst k
    by_cases ht : t = s
    · subst t
      simp
    · simp [ht]
  · simp [hk]

#print axioms originalSourceLabel_eq_G1AColorMode
#print axioms originalS1J_sourceBlockColor_entry
#print axioms originalS1J_mulVec_sourceBlockColorAxis

end
end FCP.BFSSC48C1A1b0OriginalS1JAxisMulVecMinimalProbe
