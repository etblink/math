import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5E2OriginalRadialWeightedCoreSubtraction

set_option autoImplicit false

namespace FCP.BFSSGM5E2Independent
noncomputable section

open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J
open FCP.BFSSGM5E1 FCP.BFSSGM5E2

/-- Independently rebind radial weighted subtraction to the literal
original paired SU(2) invariant Fock smooth core and FullL2 carrier. -/
theorem pairedRadialWeightedCore_sub (f g : pairedGaugeData.invariantCore) :
    radialWeightedCore (f - g).val =
      radialWeightedCore f.val - radialWeightedCore g.val := by
  exact radialWeightedCore_sub f.val g.val

#print axioms pairedRadialWeightedCore_sub

end
end FCP.BFSSGM5E2Independent
