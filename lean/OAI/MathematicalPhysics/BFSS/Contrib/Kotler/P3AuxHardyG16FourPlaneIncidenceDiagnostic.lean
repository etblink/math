import Mathlib

/-! G16 D0: finite 4-plane / 9-axis incidence and rational weights only.
No gamma representation, original Fock carrier, numerical Y theorem or physical Hardy claim. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG16FourPlaneIncidenceDiagnostic
noncomputable section

def planeLeft (t : Fin 4) : Fin 9 := ⟨2 * t.val, by omega⟩
def planeRight (t : Fin 4) : Fin 9 := ⟨2 * t.val + 1, by omega⟩

def singleCount (k : Fin 9) : ℕ :=
  (Finset.univ.filter (fun t : Fin 4 =>
    k = planeLeft t ∨ k = planeRight t)).card

def tripleCount (k : Fin 9) : ℕ :=
  (Finset.univ.filter (fun t : Fin 4 =>
    k ≠ planeLeft t ∧ k ≠ planeRight t)).card

theorem singleCount_exact (k : Fin 9) :
    singleCount k = if k = (8 : Fin 9) then 0 else 1 := by
  fin_cases k <;> decide

theorem tripleCount_exact (k : Fin 9) :
    tripleCount k = if k = (8 : Fin 9) then 4 else 3 := by
  fin_cases k <;> decide

theorem frobeniusWeight_exact (k : Fin 9) :
    (16 : ℝ) * (((singleCount k : ℝ) / (16 : ℝ) ^ 2) +
      ((tripleCount k : ℝ) / (56 : ℝ) ^ 2)) =
      if k = (8 : Fin 9) then (16 : ℝ) / 784 else 61 / 784 := by
  by_cases h : k = (8 : Fin 9)
  · simp [singleCount_exact, tripleCount_exact, h] <;> norm_num
  · simp [singleCount_exact, tripleCount_exact, h] <;> norm_num

theorem tauHalfWeight_exact (k : Fin 9) :
    (1 / 2 : ℝ) * ((16 : ℝ) * (((singleCount k : ℝ) / (16 : ℝ) ^ 2) +
      ((tripleCount k : ℝ) / (56 : ℝ) ^ 2))) =
      if k = (8 : Fin 9) then (16 : ℝ) / 1568 else 61 / 1568 := by
  by_cases h : k = (8 : Fin 9)
  · simp [singleCount_exact, tripleCount_exact, h] <;> norm_num
  · simp [singleCount_exact, tripleCount_exact, h] <;> norm_num

#print axioms FCP.BFSSP3AuxHardyG16FourPlaneIncidenceDiagnostic.singleCount_exact
#print axioms FCP.BFSSP3AuxHardyG16FourPlaneIncidenceDiagnostic.tripleCount_exact
#print axioms FCP.BFSSP3AuxHardyG16FourPlaneIncidenceDiagnostic.frobeniusWeight_exact
#print axioms FCP.BFSSP3AuxHardyG16FourPlaneIncidenceDiagnostic.tauHalfWeight_exact

end
end FCP.BFSSP3AuxHardyG16FourPlaneIncidenceDiagnostic
