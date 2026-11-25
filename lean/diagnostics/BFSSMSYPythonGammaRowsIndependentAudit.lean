import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYPythonGammaRows

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYPythonGammaRowsIndependent

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A FCP.BFSSPairedSpin9Plane
open FCP.BFSSMSYPackedSpin FCP.BFSSMSYPythonGammaRows

/-- Same-color row target has the exact nonzero sign/8 weight. -/
theorem literalSpinRowWeight (r s : SpaceIndex) (hrs : r ≠ s)
    (a : ColorIndex 2) (i : SpinIndex) :
    normalizedPairedPlane r s (pairedLabelEquiv (i, a))
      (pairedLabelEquiv (pythonPairTarget r s i, a)) / 4 =
        (pythonPairSign r s i : ℝ) / 8 := by
  rw [normalizedPlane_sourceCoefficient r s hrs,
    ite_eq_left (rfl : a = a), sourceGammaPair_entry,
    ite_eq_left (rfl : pythonPairTarget r s i = pythonPairTarget r s i)]
  ring

/-- Every other column in that same-color row has weight zero. -/
theorem literalSpinOffRow (r s : SpaceIndex) (hrs : r ≠ s)
    (a : ColorIndex 2) (i j : SpinIndex) (h : pythonPairTarget r s i ≠ j) :
    normalizedPairedPlane r s (pairedLabelEquiv (i, a))
      (pairedLabelEquiv (j, a)) / 4 = 0 := by
  rw [normalizedPlane_sourceCoefficient r s hrs,
    ite_eq_left (rfl : a = a), sourceGammaPair_entry, ite_eq_right h]
  norm_num

/-- Cross-color entries have zero weight, independently of the row formula. -/
theorem literalSpinCrossColor (r s : SpaceIndex) (hrs : r ≠ s)
    (a b : ColorIndex 2) (hab : a ≠ b) (i j : SpinIndex) :
    normalizedPairedPlane r s (pairedLabelEquiv (i, a))
      (pairedLabelEquiv (j, b)) / 4 = 0 := by
  rw [normalizedPlane_sourceCoefficient r s hrs, ite_eq_right hab, zero_div]

#print axioms literalSpinRowWeight
#print axioms literalSpinOffRow
#print axioms literalSpinCrossColor

end FCP.BFSSMSYPythonGammaRowsIndependent
