import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9A0OriginalGammaPairClifford

/-!
# RHOPF-P9A1B — original-source selected Hopf R4 row comparison

This is a source-exact *finite-coordinate* claim on the original 16-real
gamma matrices. It uses the selected original indices 0, 1, 8, 9 and the
three already fixed source gamma products, never a replacement matrix.

No statement about a full-spinor Hopf base invariant, physical bosonic
Spin(9) action, Fock-vector implementer, Hamiltonian, Noether operator,
soliton, or particle follows from this finite-dimensional gate.
-/
set_option autoImplicit false

namespace FCP.RHOPFP9A1B
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSGamma9

/-- The four original real spinor indices of the selected complex C2 carrier. -/
def IsHopfRow (i : SpinIndex) : Prop :=
  i = 0 ∨ i = 1 ∨ i = 8 ∨ i = 9

/-- Sparse four-coordinate common-phase generator, zero off selected R4. -/
def selectedHopfJ : GammaMatrix := fun i j =>
  if i = 0 ∧ j = 1 then -1
  else if i = 1 ∧ j = 0 then 1
  else if i = 8 ∧ j = 9 then -1
  else if i = 9 ∧ j = 8 then 1
  else 0

/-- Original gamma1 gamma3 has exactly the selected complex Hopf J rows,
including zero entries pointing into any transverse column. -/
theorem K13_selected_rows (i j : SpinIndex) (hi : IsHopfRow i) :
    (gamma 1 * gamma 3) i j = selectedHopfJ i j := by
  rcases hi with h | h | h | h <;>
    subst i <;>
    fin_cases j <;>
    norm_num [selectedHopfJ, gamma, Matrix.mul_apply, Fin.sum_univ_succ]

/-- The full, different -gamma2 gamma5 has those same original R4 rows. -/
theorem K25_selected_rows (i j : SpinIndex) (hi : IsHopfRow i) :
    (-(gamma 2 * gamma 5)) i j = selectedHopfJ i j := by
  rcases hi with h | h | h | h <;>
    subst i <;>
    fin_cases j <;>
    norm_num [selectedHopfJ, gamma, Matrix.mul_apply, Fin.sum_univ_succ]

/-- The full, different -gamma4 gamma6 has those same original R4 rows. -/
theorem K46_selected_rows (i j : SpinIndex) (hi : IsHopfRow i) :
    (-(gamma 4 * gamma 6)) i j = selectedHopfJ i j := by
  rcases hi with h | h | h | h <;>
    subst i <;>
    fin_cases j <;>
    norm_num [selectedHopfJ, gamma, Matrix.mul_apply, Fin.sum_univ_succ]

/-- Three globally inequivalent original full spinor generators are
indistinguishable on every selected R4 output coordinate and every input
coordinate, including all transverse inputs. -/
theorem selected_R4_three_original_bivectors_equal
    (i j : SpinIndex) (hi : IsHopfRow i) :
    (gamma 1 * gamma 3) i j = (-(gamma 2 * gamma 5)) i j ∧
    (gamma 1 * gamma 3) i j = (-(gamma 4 * gamma 6)) i j := by
  exact ⟨(K13_selected_rows i j hi).trans (K25_selected_rows i j hi).symm,
    (K13_selected_rows i j hi).trans (K46_selected_rows i j hi).symm⟩

#print axioms K13_selected_rows
#print axioms K25_selected_rows
#print axioms K46_selected_rows
#print axioms selected_R4_three_original_bivectors_equal

end
end FCP.RHOPFP9A1B
