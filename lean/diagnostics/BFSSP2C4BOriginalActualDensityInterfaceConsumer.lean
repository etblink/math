import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSP2C4BOriginalActualDensityInterfaceMicrogate

/-!
# Independent original density interface consumer

Check both the full original-source function equality and a pointwise
consequence, without relying on or importing unqualified P2-C4B.
-/

set_option autoImplicit false

namespace BFSSP2C4BOriginalActualDensityInterfaceConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP2C4AOriginalCoreIntegralTransfer
open FCP.BFSSP2C4BOriginalActualDensityInterfaceMicrogate

example (f : SmoothCore 2) :
    originalActualDensity f =
      (fun x : Boson 2 =>
        FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0 x *
          ‖f x‖^2) +
      (fun x : Boson 2 =>
        inner ℝ (f x)
          (FCP.BFSSSU2Full.concreteAlgebraData.deformedFermionField 1 0 x
            (f x))) :=
  originalActualDensity_eq_sourceSum f

example (f : SmoothCore 2) (x : Boson 2) :
    originalActualDensity f x =
      FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0 x *
        ‖f x‖^2 +
      inner ℝ (f x)
        (FCP.BFSSSU2Full.concreteAlgebraData.deformedFermionField 1 0 x
          (f x)) := by
  have h := congrFun (originalActualDensity_eq_sourceSum f) x
  simpa only [Pi.add_apply] using h

end
end BFSSP2C4BOriginalActualDensityInterfaceConsumer
