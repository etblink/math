import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG16FourPlaneIncidenceDiagnostic

/-! G16 D0 independent finite-index controls; never a native BFSS qualification. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG16FourPlaneIncidenceIndependentConsumer
noncomputable section
open FCP.BFSSP3AuxHardyG16FourPlaneIncidenceDiagnostic

example (k : Fin 9) :
    singleCount k = if k = (8 : Fin 9) then 0 else 1 :=
  singleCount_exact k

example (k : Fin 9) :
    tripleCount k = if k = (8 : Fin 9) then 4 else 3 :=
  tripleCount_exact k

example (k : Fin 9) :
    (16 : ℝ) * (((singleCount k : ℝ) / (16 : ℝ) ^ 2) +
      ((tripleCount k : ℝ) / (56 : ℝ) ^ 2)) =
      if k = (8 : Fin 9) then (16 : ℝ) / 784 else 61 / 784 :=
  frobeniusWeight_exact k

example (k : Fin 9) :
    (1 / 2 : ℝ) * ((16 : ℝ) * (((singleCount k : ℝ) / (16 : ℝ) ^ 2) +
      ((tripleCount k : ℝ) / (56 : ℝ) ^ 2))) =
      if k = (8 : Fin 9) then (16 : ℝ) / 1568 else 61 / 1568 :=
  tauHalfWeight_exact k

example : singleCount (0 : Fin 9) = 1 := by
  decide

example : tripleCount (8 : Fin 9) = 4 := by
  decide

example :
    (16 : ℝ) * ((1 : ℝ) / (16 : ℝ) ^ 2 +
      (3 : ℝ) / (55 : ℝ) ^ 2) ≠ 61 / 784 := by
  norm_num

example :
    (Finset.univ.filter (fun t : Fin 4 =>
      t ≠ (3 : Fin 4) ∧ (8 : Fin 9) ≠ planeLeft t ∧
        (8 : Fin 9) ≠ planeRight t)).card = 3 := by
  decide

#print axioms FCP.BFSSP3AuxHardyG16FourPlaneIncidenceDiagnostic.singleCount_exact
#print axioms FCP.BFSSP3AuxHardyG16FourPlaneIncidenceDiagnostic.tripleCount_exact
#print axioms FCP.BFSSP3AuxHardyG16FourPlaneIncidenceDiagnostic.frobeniusWeight_exact
#print axioms FCP.BFSSP3AuxHardyG16FourPlaneIncidenceDiagnostic.tauHalfWeight_exact

end
end FCP.BFSSP3AuxHardyG16FourPlaneIncidenceIndependentConsumer
