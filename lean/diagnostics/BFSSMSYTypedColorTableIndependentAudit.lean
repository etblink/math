import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYTypedColorTable

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYTypedColorTableIndependent

open OAI.BFSSQuantum
open FCP.BFSSSU2
open FCP.BFSSMSYTypedColorTable

/-- Select the reversed ordered color pair using the original color index.
Its weight is minus the prefactor at any complex scale. -/
theorem original_reverse_pair_weight (scale : ℂ) :
    (∑ a : ColorIndex 2, ∑ b : ColorIndex 2,
      (scale * (epsilon3 a b (2 : Fin 3) : ℂ)) *
        (if a = (1 : Fin 3) ∧ b = (0 : Fin 3) then (1 : ℂ) else 0)) = -scale := by
  let T : ColorIndex 2 → ColorIndex 2 → ℂ :=
    fun a b => if a = (1 : Fin 3) ∧ b = (0 : Fin 3) then 1 else 0
  have forward : T (0 : Fin 3) (1 : Fin 3) = 0 := by simp [T]
  have reverse : T (1 : Fin 3) (0 : Fin 3) = 1 := by simp [T]
  change (∑ a : Fin 3, ∑ b : Fin 3,
    (scale * (epsilon3 a b (2 : Fin 3) : ℂ)) * T a b) = -scale
  simpa only [smul_eq_mul, forward, reverse, zero_sub, mul_neg, mul_one]
    using (contract_plane01 T scale)

#print axioms original_reverse_pair_weight

end FCP.BFSSMSYTypedColorTableIndependent
