import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CSourceSO3Witness

/-!
Independent original-source consumer: demands a GaugeGroup 2 witness
for an arbitrary proper 3x3 rotation, plus an exact composite source
image. No generic surrogate spin cover or physical Hilbert assertions.
-/
set_option autoImplicit false

namespace BFSSIBIG0CSourceSO3WitnessIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSIBIG0CNativeZGenerator
open FCP.BFSSIBIG0CNativeXGenerator
open FCP.BFSSIBIG0CSourceSO3Witness

example (Q : Matrix (Fin 3) (Fin 3) ℝ)
    (hQ : Q ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ) :
    ∃ g : GaugeGroup 2,
      FCP.BFSSSU2GaugeG3A.adjointColorMatrix g = Q :=
  originalBFSS_adjoint_hits_every_SO3 Q hQ

example (Q : Matrix.specialOrthogonalGroup (Fin 3) ℝ) :
    ∃ g : GaugeGroup 2,
      FCP.BFSSSU2GaugeG3A.adjointColorMatrix g =
        (Q : Matrix (Fin 3) (Fin 3) ℝ) :=
  originalBFSS_adjoint_hits_every_SO3 Q Q.prop

example (α β γ : ℝ) :
    FCP.BFSSSU2GaugeG3A.adjointColorMatrix
      (sourceZGauge α * sourceXGauge β * sourceZGauge γ) =
      FCP.BFSSIBIG0CSO3Euler.rotZ α *
        FCP.BFSSIBIG0CSO3Euler.rotX β *
        FCP.BFSSIBIG0CSO3Euler.rotZ γ :=
  originalAdjointColorMatrix_sourceZXZ α β γ

end
end BFSSIBIG0CSourceSO3WitnessIndependentConsumer
