import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CInversePauli

/-!
# IBI-G0C-INV-PAULI independent native source consumer

Use arbitrary original GaugeGroup 2; verify matrix inverse and independent
consumption of the original-source inverse Pauli coefficient theorem.
No imported GL(2) spin-cover lemma or new axiom.
-/ 

set_option autoImplicit false

namespace BFSSIBIG0CInversePauliIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSIBIG0CInversePauli

example (g : GaugeGroup 2) :
    (g : ColorMatrix 2)⁻¹ = star (g : ColorMatrix 2) :=
  sourceGaugeMatrix_inverse_eq_star g

example (g : GaugeGroup 2) (B A : ColorIndex 2) :
    (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) B A =
      (Matrix.trace (FCP.BFSSSU2.pauli B *
        ((g : ColorMatrix 2) * FCP.BFSSSU2.pauli A *
          (g : ColorMatrix 2)⁻¹))).re / 2 :=
  originalAdjointColorMatrix_pauliInverseTrace g B A

end
end BFSSIBIG0CInversePauliIndependentConsumer
