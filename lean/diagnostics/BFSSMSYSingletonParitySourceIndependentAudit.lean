import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYSingletonParitySource

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYSingletonParitySourceIndependent
noncomputable section

open FCP.BFSSMSYSingletonParitySource FCP.BFSSFermionF3B2
open OAI.ContinuumCoulomb.HubbardGlobal

/-- The actual source coefficient with two smaller occupied modes. -/
theorem evenInsertionAudit :
    creationCoefficient (3 : Fin 24) {0, 2, 4} = 1 := by
  rw [creationCoefficient_eq_parityTest _ _ (by decide)]
  have h : (({0, 2, 4} : Finset (Fin 24)).filter (fun k => k < 3)).card = 2 := by
    decide
  have hs : (-1 : ℤˣ) ^ (2 : ℕ) = 1 := by decide
  simp only [h, ite_eq_left hs]

/-- The actual source coefficient with one smaller occupied mode. -/
theorem oddInsertionAudit :
    creationCoefficient (2 : Fin 24) {0, 3, 4} = -1 := by
  rw [creationCoefficient_eq_parityTest _ _ (by decide)]
  have h : (({0, 3, 4} : Finset (Fin 24)).filter (fun k => k < 2)).card = 1 := by
    decide
  have hs : (-1 : ℤˣ) ^ (1 : ℕ) ≠ 1 := by decide
  simp only [h, ite_eq_right hs]

#print axioms evenInsertionAudit
#print axioms oddInsertionAudit

end
end FCP.BFSSMSYSingletonParitySourceIndependent
