import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.D1K1AOriginalFockSeedGaugeTransport
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG4JExactGaugeDataAssemblyProbe

/-! Independent consumer of D1K1-A on the exact original SU2 GaugeData
and original 24-mode Fermion 2 carrier. No assumptions or surrogate model. -/

set_option autoImplicit false

namespace FCP.BFSSHopfD1K1AConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSHopfD1K1A

theorem exact_seed_source_gauge (g : GaugeGroup 2) :
    pairedGaugeData.fermion g sourceFockSeed = sourceColorOrbit g :=
  sourceColorOrbit_eq_originalGauge g

theorem exact_seed_source_gauge_mul (g h : GaugeGroup 2) :
    pairedGaugeData.fermion g (sourceColorOrbit h) =
      sourceColorOrbit (g * h) :=
  sourceColorOrbit_mul g h

theorem exact_seed_source_norm (g : GaugeGroup 2) :
    ‖sourceColorOrbit g‖ = ‖sourceFockSeed‖ :=
  sourceColorOrbit_norm g

#print axioms exact_seed_source_gauge
#print axioms exact_seed_source_gauge_mul
#print axioms exact_seed_source_norm

end
end FCP.BFSSHopfD1K1AConsumer
