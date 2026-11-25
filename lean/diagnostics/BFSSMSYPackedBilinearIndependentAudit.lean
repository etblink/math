import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYPackedBilinear

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYPackedBilinearIndependent
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A FCP.BFSSMSYPackedCarrier FCP.BFSSMSYPackedBilinear

/-- Literal original source theta, in the same right-first order as Python. -/
theorem literalOrderedProductAudit (s t : SpinIndex) (a b : ColorIndex 2)
    (c : PackedCoordinates) :
    packedCarrier (packedBilinear (s, a) (t, b) c) =
      (2 : ℂ) • pairedAlgebraData.theta s a
        (pairedAlgebraData.theta t b (packedCarrier c)) := by
  rw [pairedAlgebraData_theta, pairedAlgebraData_theta]
  exact packedBilinear_intertwines (s, a) (t, b) c

/-- All three color-pair contraction tests use this same zero equivalence. -/
theorem literalColorPlaneZeroAudit (a b : ColorIndex 2) (c : PackedCoordinates) :
    packedContraction (Finset.univ : Finset SpinIndex) (fun _ => (1 : ℂ))
      (fun s => (s, a)) (fun s => (s, b)) c = 0 ↔
      (∑ s : SpinIndex, pairedAlgebraData.theta s a
        (pairedAlgebraData.theta s b (packedCarrier c))) = 0 := by
  have h := packedContraction_zero_iff (Finset.univ : Finset SpinIndex)
    (fun _ => (1 : ℂ)) (fun s => (s, a)) (fun s => (s, b)) c
  simpa only [sourceContraction, one_smul, pairedAlgebraData_theta] using h

#print axioms literalOrderedProductAudit
#print axioms literalColorPlaneZeroAudit

end
end FCP.BFSSMSYPackedBilinearIndependent
