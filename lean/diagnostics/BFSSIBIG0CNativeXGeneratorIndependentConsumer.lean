import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CNativeXGenerator

/-!
Independent consumer of genuine original BFSS native X generator; no
spin-cover surrogate, SO(3) X-image or global surjectivity assumption.
-/
set_option autoImplicit false

namespace BFSSIBIG0CNativeXGeneratorIndependentConsumer
noncomputable section
open OAI.BFSSQuantum
open FCP.BFSSIBIG0CNativeXGenerator
open FCP.BFSSIBIG0CInversePauli

example (β : ℝ) :
    ((sourceXGauge β : GaugeGroup 2) : ColorMatrix 2) =
      sourceXMatrix β := sourceXGauge_coe β

example : sourceXGauge 0 = (1 : GaugeGroup 2) :=
  sourceXGauge_zero

example (β : ℝ) :
    (((sourceXGauge β : GaugeGroup 2) : ColorMatrix 2)⁻¹) =
      star ((sourceXGauge β : GaugeGroup 2) : ColorMatrix 2) :=
  sourceGaugeMatrix_inverse_eq_star (sourceXGauge β)

end
end BFSSIBIG0CNativeXGeneratorIndependentConsumer
