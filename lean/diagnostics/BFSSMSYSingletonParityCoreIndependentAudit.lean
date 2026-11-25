import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYSingletonParityCore

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYSingletonParityCoreIndependent
noncomputable section

open FCP.BFSSMSYSingletonParityCore

/-- Test the generic sign identity on the actual Mathlib inverse cycle. -/
theorem cycleAudit (p : Fin 4) :
    Equiv.Perm.sign (Fin.cycleRange p).symm = (-1) ^ p.val := by
  have h : StrictMono (fun j : Fin 3 => (Fin.cycleRange p).symm j.succ) := by
    intro a b hab
    simpa only [Fin.cycleRange_symm_succ] using
      (show p.succAbove a < p.succAbove b from Fin.strictMono_succAbove p hab)
  rw [sign_of_strictMono_succ _ h, Fin.cycleRange_symm_zero]

/-- Check a nonconsecutive set; order position is not ambient mode number. -/
theorem rankAudit :
    ((({0, 2, 4} : Finset (Fin 5)).orderIsoOfFin (by decide :
      ({0, 2, 4} : Finset (Fin 5)).card = 3)).symm ⟨4, by decide⟩).val = 2 := by
  rw [orderRank_eq_card_filter]
  decide

#print axioms cycleAudit
#print axioms rankAudit

end
end FCP.BFSSMSYSingletonParityCoreIndependent
