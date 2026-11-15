import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CNativeZGenerator

/-!
Independent source consumer: exact original BFSS GaugeGroup 2 Z-generator
existence, original matrix identity at zero and accepted unitary inverse.
No SO(3) image or surjectivity is assumed.
-/

set_option autoImplicit false

namespace BFSSIBIG0CNativeZGeneratorIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSIBIG0CNativeZGenerator
open FCP.BFSSIBIG0CInversePauli

example (θ : ℝ) :
    ((sourceZGauge θ : GaugeGroup 2) : ColorMatrix 2) =
      sourceZMatrix θ := sourceZGauge_coe θ

example : sourceZGauge 0 = (1 : GaugeGroup 2) :=
  sourceZGauge_zero

example (θ : ℝ) :
    (((sourceZGauge θ : GaugeGroup 2) : ColorMatrix 2)⁻¹) =
      star ((sourceZGauge θ : GaugeGroup 2) : ColorMatrix 2) :=
  sourceGaugeMatrix_inverse_eq_star (sourceZGauge θ)

end
end BFSSIBIG0CNativeZGeneratorIndependentConsumer
