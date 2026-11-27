import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQF0OriginalClosedJointPairing
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQF0Independent
noncomputable section
open Set
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6H5E8AU

theorem originalSU2CoreComplexPairingAudit (a b : SpinIndex)
    (f g : pairedGaugeData.invariantCore) :
    inner ℂ (coreToL2 (pairedAlgebraData.charge a f.val))
      (coreToL2 (pairedAlgebraData.charge a g.val)) =
    inner ℂ (coreToL2 (pairedAlgebraData.charge b f.val))
      (coreToL2 (pairedAlgebraData.charge b g.val)) :=
  FCP.BFSSCSQF0.paired_core_pairing a b f g

theorem originalSU2ClosedJointPairingAudit (a b : SpinIndex)
    (u v : FullL2 2) (y z : SpinIndex → FullL2 2)
    (hy : (u, y) ∈ originalMinimalClosedGraph pairedAlgebraData pairedGaugeData)
    (hz : (v, z) ∈ originalMinimalClosedGraph pairedAlgebraData pairedGaugeData) :
    inner ℂ (y a) (z a) = inner ℂ (y b) (z b) :=
  FCP.BFSSCSQF0.paired_closed_joint_pairing a b (u, y) (v, z) hy hz

#print axioms originalSU2CoreComplexPairingAudit
#print axioms originalSU2ClosedJointPairingAudit
end
end FCP.BFSSCSQF0Independent
