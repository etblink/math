import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP2cNonzeroOriginalGaugeVacuum

/-! Independent consumer of source-exact original BFSS gauge-vacuum results. -/
set_option autoImplicit false

namespace FCP.BFSSOriginalGaugeVacuumOP2CIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG4B
open FCP.BFSSOriginalGaugeProjectionOP2B
open FCP.BFSSOriginalGaugeVacuumOP2C

example : fermionVacuum ≠ (0 : Fermion 2) :=
  originalFermionVacuum_ne_zero

example (g : GaugeGroup 2) :
    originalGaugeLinearAction g fermionVacuum = fermionVacuum :=
  originalFermionVacuum_fixed g

example : fermionVacuum ∈ originalFermionGaugeFixed :=
  originalFermionVacuum_mem_fixed

example :
    originalFermionGaugeProjection fermionVacuum = fermionVacuum :=
  originalFermionGaugeProjection_vacuum

example : originalFermionGaugeProjection ≠ 0 :=
  originalFermionGaugeProjection_ne_zero

#print axioms FCP.BFSSOriginalGaugeVacuumOP2C.originalFermionVacuum_ne_zero
#print axioms FCP.BFSSOriginalGaugeVacuumOP2C.originalFermionGaugeProjection_ne_zero

end
end FCP.BFSSOriginalGaugeVacuumOP2CIndependentAudit
