import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9A1BD0OriginalGammaTwoCellDiagnostic

/-! Independent named-theorem consumers; same actual original gamma. -/
set_option autoImplicit false

namespace FCP.RHOPFP9A1BD0Consumer
open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.RHOPFP9A1BD0

example : (gamma 1 * gamma 3) (0 : SpinIndex) (1 : SpinIndex) = (-1 : ℝ) :=
  K13_entry_0_1
example : (-(gamma 2 * gamma 5)) (0 : SpinIndex) (1 : SpinIndex) = (-1 : ℝ) :=
  K25_entry_0_1
example : (-(gamma 4 * gamma 6)) (0 : SpinIndex) (1 : SpinIndex) = (-1 : ℝ) :=
  K46_entry_0_1
example : (gamma 1 * gamma 3) (0 : SpinIndex) (2 : SpinIndex) = (0 : ℝ) :=
  K13_entry_0_2
example : (-(gamma 2 * gamma 5)) (0 : SpinIndex) (2 : SpinIndex) = (0 : ℝ) :=
  K25_entry_0_2
example : (-(gamma 4 * gamma 6)) (0 : SpinIndex) (2 : SpinIndex) = (0 : ℝ) :=
  K46_entry_0_2

#print axioms FCP.RHOPFP9A1BD0.K13_entry_0_1
#print axioms FCP.RHOPFP9A1BD0.K25_entry_0_1
#print axioms FCP.RHOPFP9A1BD0.K46_entry_0_1
#print axioms FCP.RHOPFP9A1BD0.K13_entry_0_2
#print axioms FCP.RHOPFP9A1BD0.K25_entry_0_2
#print axioms FCP.RHOPFP9A1BD0.K46_entry_0_2

end FCP.RHOPFP9A1BD0Consumer
