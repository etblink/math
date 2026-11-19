import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9A1BOriginalGammaSelectedHopfRows

/-! Independent type consumer of the new *original source* Hopf R4 claims.
No alternate gamma tables or physical Hamiltonian are introduced. -/
set_option autoImplicit false

namespace FCP.RHOPFP9A1BIndependentAudit
open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.RHOPFP9A1B

example (j : SpinIndex) :
    (gamma 1 * gamma 3) 0 j = selectedHopfJ 0 j :=
  K13_selected_rows 0 j (by simp [IsHopfRow])

example (j : SpinIndex) :
    (-(gamma 2 * gamma 5)) 8 j = selectedHopfJ 8 j :=
  K25_selected_rows 8 j (by simp [IsHopfRow])

example (j : SpinIndex) :
    (-(gamma 4 * gamma 6)) 9 j = selectedHopfJ 9 j :=
  K46_selected_rows 9 j (by simp [IsHopfRow])

example (j : SpinIndex) :
    (gamma 1 * gamma 3) 1 j = (-(gamma 2 * gamma 5)) 1 j := by
  exact (selected_R4_three_original_bivectors_equal 1 j
    (by simp [IsHopfRow])).1

#print axioms FCP.RHOPFP9A1B.K13_selected_rows
#print axioms FCP.RHOPFP9A1B.K25_selected_rows
#print axioms FCP.RHOPFP9A1B.K46_selected_rows
#print axioms FCP.RHOPFP9A1B.selected_R4_three_original_bivectors_equal

end FCP.RHOPFP9A1BIndependentAudit
