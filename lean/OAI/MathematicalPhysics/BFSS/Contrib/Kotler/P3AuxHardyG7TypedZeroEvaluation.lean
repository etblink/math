import OAI.MathematicalPhysics.BFSS.Core

/-! Typed zero laws on the literal original carriers, with arbitrary map data.
No native algebra, theta or tau definition is imported or unfolded here. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG7TypedZeroEvaluation
noncomputable section
open OAI.BFSSQuantum

theorem coreLinearMap_zero (L : SmoothCore 2 →ₗ[ℂ] SmoothCore 2) :
    L (0 : SmoothCore 2) = (0 : SmoothCore 2) :=
  LinearMap.map_zero L

theorem fockContinuousLinearMap_zero (T : Fermion 2 →L[ℂ] Fermion 2) :
    T (0 : Fermion 2) = (0 : Fermion 2) :=
  T.map_zero

#print axioms FCP.BFSSP3AuxHardyG7TypedZeroEvaluation.coreLinearMap_zero
#print axioms FCP.BFSSP3AuxHardyG7TypedZeroEvaluation.fockContinuousLinearMap_zero

end
end FCP.BFSSP3AuxHardyG7TypedZeroEvaluation
