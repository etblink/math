import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYPackedCarrier

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYPackedCarrierIndependent
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF3B5 FCP.BFSSSU2GaugeG1A
open FCP.BFSSMSYCoefficientCarrier FCP.BFSSMSYNormalizedToggle
open FCP.BFSSMSYPackedMask FCP.BFSSMSYPackedCarrier

theorem literalPackedCoordinateAudit (c : PackedCoordinates) (m : Fin (2 ^ 24)) :
    occupationCoeff (packedCarrier c) (decodeMask m) = c m := by
  calc
    _ = maskReindex c (decodeMask m) := occupationCoeff_carrier _ _
    _ = _ := maskReindex_at c m

theorem literalPackedOddAudit (j : Fin 8) (C : ColorIndex 2) (c : PackedCoordinates) :
    packedCarrier (packedOddAction (colorModeEquiv (j, C)) c) =
      (((Real.sqrt 2 : ℝ) : ℂ)) •
        pairedAlgebraData.theta (spinPairEquiv.symm (j, (1 : Fin 2))) C (packedCarrier c) := by
  rw [pairedAlgebraData_theta]
  exact packedOddIntertwine j C c

#print axioms literalPackedCoordinateAudit
#print axioms literalPackedOddAudit

end
end FCP.BFSSMSYPackedCarrierIndependent
