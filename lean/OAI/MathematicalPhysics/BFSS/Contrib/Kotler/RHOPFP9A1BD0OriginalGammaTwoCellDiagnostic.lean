import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2RealGammaProbe

/-!
# RHOPF-P9A1B-D0 — original gamma finite-entry two-cell diagnostic

R1 failed after expanding 16-term real matrix sums, R2 at a disallowed
import-all of the original non-module source. This bounded diagnostic tests
the PUBLIC source gamma directly using kernel definitional reduction, as in
the earlier accepted F10D original-gamma entry microgates.

Only six exact original-source concrete cell identities are claimed.
No private source access, copied signed-permutation tables, other gamma
representation, physical Fock/Hamiltonian inference, or resource overrides.
-/
set_option autoImplicit false

namespace FCP.RHOPFP9A1BD0
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSGamma9

theorem K13_entry_0_1 :
    (gamma 1 * gamma 3) (0 : SpinIndex) (1 : SpinIndex) = (-1 : ℝ) := by
  rfl

theorem K25_entry_0_1 :
    (-(gamma 2 * gamma 5)) (0 : SpinIndex) (1 : SpinIndex) = (-1 : ℝ) := by
  rfl

theorem K46_entry_0_1 :
    (-(gamma 4 * gamma 6)) (0 : SpinIndex) (1 : SpinIndex) = (-1 : ℝ) := by
  rfl

theorem K13_entry_0_2 :
    (gamma 1 * gamma 3) (0 : SpinIndex) (2 : SpinIndex) = (0 : ℝ) := by
  rfl

theorem K25_entry_0_2 :
    (-(gamma 2 * gamma 5)) (0 : SpinIndex) (2 : SpinIndex) = (0 : ℝ) := by
  rfl

theorem K46_entry_0_2 :
    (-(gamma 4 * gamma 6)) (0 : SpinIndex) (2 : SpinIndex) = (0 : ℝ) := by
  rfl

#print axioms K13_entry_0_1
#print axioms K25_entry_0_1
#print axioms K46_entry_0_1
#print axioms K13_entry_0_2
#print axioms K25_entry_0_2
#print axioms K46_entry_0_2

end
end FCP.RHOPFP9A1BD0
