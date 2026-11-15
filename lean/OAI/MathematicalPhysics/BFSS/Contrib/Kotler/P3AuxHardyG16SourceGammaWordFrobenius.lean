import OAI.MathematicalPhysics.BFSS.Core
import OAI.MathematicalPhysics.BFSS.GammaWords

/-! G16 D1A: original gamma-word Frobenius trace adapter.
Source exact; no originalHardyY, no coefficient quadratic, no Hardy sector. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG16SourceGammaWordFrobenius
noncomputable section
open OAI.BFSSQuantum

theorem originalGamma_frobenius_word (M : AlgebraData 2)
    (s t : Finset SpaceIndex) (hs : s.card ≤ 4) (ht : t.card ≤ 4) :
    Matrix.trace ((OAI.BFSSGamma.word M.gamma s).transpose *
      OAI.BFSSGamma.word M.gamma t) = if s = t then 16 else 0 := by
  have hrev : (OAI.BFSSGamma.word M.gamma s).transpose =
      OAI.BFSSGamma.reverseWord M.gamma s := by
    simpa only [OAI.BFSSGamma.word, OAI.BFSSGamma.reverseWord] using
      (OAI.BFSSGamma.list_transpose M.gamma
        (fun i => (M.gamma_symmetric i).eq) (s.sort (· ≤ ·)))
  rw [hrev]
  exact OAI.BFSSGamma.trace_reverseWord_word M.gamma M.gamma_clifford hs ht

theorem originalGamma_frobenius_self (M : AlgebraData 2)
    (s : Finset SpaceIndex) (hs : s.card ≤ 4) :
    Matrix.trace ((OAI.BFSSGamma.word M.gamma s).transpose *
      OAI.BFSSGamma.word M.gamma s) = 16 := by
  simpa using originalGamma_frobenius_word M s s hs hs

theorem originalGamma_frobenius_cross (M : AlgebraData 2)
    (s t : Finset SpaceIndex) (hs : s.card ≤ 4) (ht : t.card ≤ 4)
    (hst : s ≠ t) :
    Matrix.trace ((OAI.BFSSGamma.word M.gamma s).transpose *
      OAI.BFSSGamma.word M.gamma t) = 0 := by
  simpa [hst] using originalGamma_frobenius_word M s t hs ht

#print axioms FCP.BFSSP3AuxHardyG16SourceGammaWordFrobenius.originalGamma_frobenius_word
#print axioms FCP.BFSSP3AuxHardyG16SourceGammaWordFrobenius.originalGamma_frobenius_self
#print axioms FCP.BFSSP3AuxHardyG16SourceGammaWordFrobenius.originalGamma_frobenius_cross
#print axioms OAI.BFSSGamma.trace_reverseWord_word

end
end FCP.BFSSP3AuxHardyG16SourceGammaWordFrobenius
