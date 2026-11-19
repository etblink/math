import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9A0OriginalGammaPairClifford
import all OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2RealGammaProbe

/-!
# RHOPF-P9A1B R2 — source-exact sparse finite-entry transport

R1 RED: direct 16-term real-matrix normalisation exceeded the ordinary
200000 heartbeat bound at all three row lemmas. R2 retains the theorem
statements, imports the exact ORIGINAL private integer signed-permutation
implementation, and uses its *proved* sparse multiplication formula
before casting to the real public gamma matrices.

There is no alternate gamma representation, source Core change, option
override, custom axiom or physical/Fock/Noether conclusion.
-/
set_option autoImplicit false

namespace FCP.RHOPFP9A1B
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSGamma9

/-- Original four real spinor indices of the selected complex C2 carrier. -/
def IsHopfRow (i : SpinIndex) : Prop :=
  i = 0 ∨ i = 1 ∨ i = 8 ∨ i = 9

/-- Comparison complex structure, not a new original Spin9 Lie generator. -/
def selectedHopfJ : GammaMatrix := fun i j =>
  if i = 0 ∧ j = 1 then -1
  else if i = 1 ∧ j = 0 then 1
  else if i = 8 ∧ j = 9 then -1
  else if i = 9 ∧ j = 8 then 1
  else 0

/-- Same selected-complex-structure table over integers for sparse source reduction. -/
private def selectedHopfJInt : Matrix (Fin 16) (Fin 16) ℤ := fun i j =>
  if i = 0 ∧ j = 1 then -1
  else if i = 1 ∧ j = 0 then 1
  else if i = 8 ∧ j = 9 then -1
  else if i = 9 ∧ j = 8 then 1
  else 0

private theorem selectedHopfJInt_cast (i j : SpinIndex) :
    (selectedHopfJInt i j : ℝ) = selectedHopfJ i j := by
  unfold selectedHopfJInt selectedHopfJ
  split_ifs <;> norm_num

/-- Sparse proof uses original source private gammaInt_mul_apply rather
than unfolding 16 real matrix sums in each of 64 finite cases. -/
private theorem K13_int_rows (i j : SpinIndex) (hi : IsHopfRow i) :
    (gammaInt 1 * gammaInt 3) i j = selectedHopfJInt i j := by
  rw [gammaInt_mul_apply]
  rcases hi with h | h | h | h <;>
    subst i <;>
    fin_cases j <;>
    decide

private theorem K25_int_rows (i j : SpinIndex) (hi : IsHopfRow i) :
    -((gammaInt 2 * gammaInt 5) i j) = selectedHopfJInt i j := by
  rw [gammaInt_mul_apply]
  rcases hi with h | h | h | h <;>
    subst i <;>
    fin_cases j <;>
    decide

private theorem K46_int_rows (i j : SpinIndex) (hi : IsHopfRow i) :
    -((gammaInt 4 * gammaInt 6) i j) = selectedHopfJInt i j := by
  rw [gammaInt_mul_apply]
  rcases hi with h | h | h | h <;>
    subst i <;>
    fin_cases j <;>
    decide

/-- Full original gamma1 gamma3 has the selected Hopf J rows,
including zero columns pointing to transverse coordinates. -/
theorem K13_selected_rows (i j : SpinIndex) (hi : IsHopfRow i) :
    (gamma 1 * gamma 3) i j = selectedHopfJ i j := by
  calc
    (gamma 1 * gamma 3) i j =
        (((gammaInt 1 * gammaInt 3).map (Int.castRingHom ℝ)) i j) := by
      simp only [gamma, Matrix.map_mul]
    _ = (selectedHopfJInt i j : ℝ) := by
      rw [Matrix.map_apply, K13_int_rows i j hi]
    _ = selectedHopfJ i j := selectedHopfJInt_cast i j

/-- Second full source bivector has identical selected rows. -/
theorem K25_selected_rows (i j : SpinIndex) (hi : IsHopfRow i) :
    (-(gamma 2 * gamma 5)) i j = selectedHopfJ i j := by
  calc
    (-(gamma 2 * gamma 5)) i j =
        -(((gammaInt 2 * gammaInt 5).map (Int.castRingHom ℝ)) i j) := by
      simp only [gamma, Matrix.map_mul, Matrix.neg_apply]
    _ = ((-((gammaInt 2 * gammaInt 5) i j) : ℤ) : ℝ) := by
      simp
    _ = (selectedHopfJInt i j : ℝ) := by
      rw [K25_int_rows i j hi]
    _ = selectedHopfJ i j := selectedHopfJInt_cast i j

/-- Third full source bivector has identical selected rows. -/
theorem K46_selected_rows (i j : SpinIndex) (hi : IsHopfRow i) :
    (-(gamma 4 * gamma 6)) i j = selectedHopfJ i j := by
  calc
    (-(gamma 4 * gamma 6)) i j =
        -(((gammaInt 4 * gammaInt 6).map (Int.castRingHom ℝ)) i j) := by
      simp only [gamma, Matrix.map_mul, Matrix.neg_apply]
    _ = ((-((gammaInt 4 * gammaInt 6) i j) : ℤ) : ℝ) := by
      simp
    _ = (selectedHopfJInt i j : ℝ) := by
      rw [K46_int_rows i j hi]
    _ = selectedHopfJ i j := selectedHopfJInt_cast i j

/-- Identical action on selected rows for ALL original input columns. -/
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
