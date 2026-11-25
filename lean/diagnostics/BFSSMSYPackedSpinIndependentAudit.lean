import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYPackedSpin

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYPackedSpinIndependent
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0 FCP.BFSSSU2GaugeG1A
open FCP.BFSSMSYPackedCarrier FCP.BFSSMSYPackedBilinear FCP.BFSSMSYPackedSpin
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector FCP.BFSSPairedSpin9Plane

/-- Literal quarter-weight coefficient, including the half-normalized spin plane. -/
theorem literalSpinWeightAudit (r s : SpaceIndex) (hrs : r ≠ s)
    (a b : ColorIndex 2) (α β : SpinIndex) :
    normalizedPairedPlane r s (pairedLabelEquiv (α, a)) (pairedLabelEquiv (β, b)) / 4 =
      if a = b then (pairedAlgebraData.gamma r * pairedAlgebraData.gamma s) α β / 8
      else 0 := by
  rw [normalizedPlane_sourceCoefficient r s hrs a b α β]
  by_cases hab : a = b <;> simp [hab] <;> ring

/-- Use the original source K and literal ordered packed double sum. -/
theorem literalSpinZeroAudit (r s : SpaceIndex) (x : PackedCoordinates) :
    (∑ p : Source48Label, ∑ q : Source48Label,
      ((normalizedPairedPlane r s p q / 4 : ℝ) : ℂ) •
        packedBilinear (pairedLabelEquiv.symm p) (pairedLabelEquiv.symm q) x) = 0 ↔
      originalSource48BivectorK (normalizedPairedPlane r s) (packedCarrier x) = 0 := by
  change packedSpinPlane r s x = 0 ↔ _
  rw [← packedSpinPlane_intertwines]
  constructor
  · intro h
    rw [h, map_zero]
  · intro h
    apply packedCarrier.injective
    rw [map_zero]
    exact h

#print axioms literalSpinWeightAudit
#print axioms literalSpinZeroAudit

end
end FCP.BFSSMSYPackedSpinIndependent
