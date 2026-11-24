import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2ColorCrossProbe

/-! The original Pauli color table and ordered complex-module contraction
for the MSY plane with zero-based indices 0 and 1. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYTypedColorTable

open FCP.BFSSSU2

/-- In the original ordered Pauli colors, the two nonzero entries at color 2
have opposite signs. -/
theorem epsilon_plane01 (a b : Fin 3) :
    epsilon3 a b (2 : Fin 3) =
      if a = (0 : Fin 3) ∧ b = (1 : Fin 3) then 1
      else if a = (1 : Fin 3) ∧ b = (0 : Fin 3) then -1
      else 0 := by
  fin_cases a <;> fin_cases b <;> norm_num [epsilon3]

/-- Apply the finite color contraction before specializing the summands
to products of bounded Majorana operators. -/
theorem contract_plane01 {V : Type*} [AddCommGroup V] [Module ℂ V]
    (T : Fin 3 → Fin 3 → V) (scale : ℂ) :
    (∑ a : Fin 3, ∑ b : Fin 3, (scale * (epsilon3 a b (2 : Fin 3) : ℂ)) • T a b) =
      scale • (T (0 : Fin 3) (1 : Fin 3) - T (1 : Fin 3) (0 : Fin 3)) := by
  rw [smul_sub, sub_eq_add_neg]
  simp [Fin.sum_univ_three, epsilon_plane01]

#print axioms epsilon_plane01
#print axioms contract_plane01

end FCP.BFSSMSYTypedColorTable
