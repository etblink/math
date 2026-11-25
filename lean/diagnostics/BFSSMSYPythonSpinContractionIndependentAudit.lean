import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYPythonSpinContraction

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYPythonSpinContractionIndependent
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0 FCP.BFSSSU2GaugeG1A FCP.BFSSPairedSpin9Plane
open FCP.BFSSMSYPackedCarrier FCP.BFSSMSYPackedBilinear
open FCP.BFSSMSYPackedSpin FCP.BFSSMSYPythonGammaRows FCP.BFSSMSYPythonSpinContraction
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector

/-- Literal 16*3 term enumeration, with no nonzero column omitted.
The product index enumerates precisely the same terms as the Python loops. -/
theorem literalSpinContraction_zero (r s : SpaceIndex) (hrs : r ≠ s)
    (x : PackedCoordinates) :
    (∑ u : SpinIndex × ColorIndex 2, ((pythonPairSign r s u.1 : ℝ) : ℂ) •
      packedBilinear (u.1, u.2) (pythonPairTarget r s u.1, u.2) x) = 0 ↔
        originalSource48BivectorK (normalizedPairedPlane r s) (packedCarrier x) = 0 := by
  exact pythonSpin_zero_iff r s hrs x

/-- Independent original-operator scale check with the actual unscaled sum. -/
theorem literalSpinContraction_scale (r s : SpaceIndex) (hrs : r ≠ s)
    (x : PackedCoordinates) :
    originalSource48BivectorK (normalizedPairedPlane r s) (packedCarrier x) =
      (1 / 8 : ℂ) • packedCarrier (∑ u : SpinIndex × ColorIndex 2,
        ((pythonPairSign r s u.1 : ℝ) : ℂ) •
          packedBilinear (u.1, u.2) (pythonPairTarget r s u.1, u.2) x) := by
  change _ = (1 / 8 : ℂ) • packedCarrier (pythonSpinContraction r s x)
  rw [← packedSpinPlane_intertwines, packedSpin_eq_python r s hrs, map_smul]

#print axioms literalSpinContraction_zero
#print axioms literalSpinContraction_scale

end
end FCP.BFSSMSYPythonSpinContractionIndependent
