import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.D1S0OriginalQuantizedCARGaugeBridge
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe
import OAI.MathematicalPhysics.BFSS.FermionQuantization

/-! Independent literal original-carrier consumer for D1S0. -/
set_option autoImplicit false

namespace FCP.BFSSHopfD1S0Consumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J

/-- No model substitution: original theta operators and Fermion 2. -/
theorem original_theta_car
    (α β : SpinIndex) (A B : ColorIndex 2) :
    pairedAlgebraData.theta α A * pairedAlgebraData.theta β B +
      pairedAlgebraData.theta β B * pairedAlgebraData.theta α A =
      (if α = β ∧ A = B then (1 : ℂ) else 0) •
        (1 : Fermion 2 →L[ℂ] Fermion 2) :=
  FCP.BFSSHopfD1S0.originalThetaCAR α β A B

/-- Independent consumer explicitly selects the source pairedGaugeData. -/
theorem original_theta_pair_gauge
    (g : GaugeGroup 2) (α β : SpinIndex)
    (A B : ColorIndex 2) (v : Fermion 2) :
    pairedGaugeData.fermion g
        (pairedAlgebraData.theta α A (pairedAlgebraData.theta β B v)) =
      ∑ C : ColorIndex 2, ∑ D : ColorIndex 2,
        ((pairedAlgebraData.adjointCoefficient g A C : ℂ) *
          (pairedAlgebraData.adjointCoefficient g B D : ℂ)) •
          pairedAlgebraData.theta α C
            (pairedAlgebraData.theta β D (pairedGaugeData.fermion g v)) :=
  FCP.BFSSHopfD1S0.originalThetaPair_covariant g α β A B v

/-- Independent original real FrequencyMatrix 2 / source quantization. -/
theorem original_quantized_carrier (C : FrequencyMatrix 2) :
    FCP.BFSSHopfD1S0.originalSourceFlattened C =
      pairedAlgebraData.quantizeFrequency (-C) :=
  FCP.BFSSHopfD1S0.originalSourceFlattened_eq_originalQuantization C

#print axioms original_theta_car
#print axioms original_theta_pair_gauge
#print axioms original_quantized_carrier

end
end FCP.BFSSHopfD1S0Consumer
