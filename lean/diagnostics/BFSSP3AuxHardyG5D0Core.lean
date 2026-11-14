import OAI.MathematicalPhysics.BFSS.Core
import diagnostics.BFSSP3AuxHardyG5D0Generic

/-! Variable operators on the literal original Fock carrier. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG5D0
noncomputable section

open OAI.BFSSQuantum

theorem variableFockZeroScalar (T : Fermion 2 →L[ℂ] Fermion 2) :
    (0 : ℂ) • T = (0 : Fermion 2 →L[ℂ] Fermion 2) :=
  zero_smul ℂ T

theorem variableFockZeroSum {ι : Type*} [Fintype ι]
    (T : ι → Fermion 2 →L[ℂ] Fermion 2) :
    (∑ p : ι, (0 : ℂ) • T p) = (0 : Fermion 2 →L[ℂ] Fermion 2) :=
  finiteComplexZeroSum T

#print axioms FCP.BFSSP3AuxHardyG5D0.variableFockZeroScalar
#print axioms FCP.BFSSP3AuxHardyG5D0.variableFockZeroSum

end
end FCP.BFSSP3AuxHardyG5D0
