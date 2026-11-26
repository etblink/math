import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSUGC4PhysicalGraphCoreIdentification

set_option autoImplicit false
set_option warningAsError true
namespace FCP.BFSSUGC4Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSUGC4 FCP.BFSSSU2PhysicalDomainD2B4 FCP.BFSSSU2PhysicalDomainD2B9B

theorem originalSU2PhysicalGraphAudit (M : AlgebraData 2) (G : M.GaugeData)
    (v : FullL2 2) (y : SpinIndex → FullL2 2) :
    (v, y) ∈ G.deformedModelGraph 1 0 ↔
      (v, y) ∈ M.fullClosedGraph ∧ v ∈ G.physicalSpace :=
  upstream_physical_graph_iff M G v y

theorem originalSU2CoreHaarChargeAudit (M : AlgebraData 2) (G : M.GaugeData)
    (f : SmoothCore 2) (α : SpinIndex) :
    sourceFullHaarAverageCLM M G (coreToL2 (M.charge α f)) =
      coreToL2 (M.charge α (sourceHaarAverageCore M G f)) :=
  congrFun (core_haar_charge_commutes M G f) α

#print axioms originalSU2PhysicalGraphAudit
#print axioms originalSU2CoreHaarChargeAudit
end
end FCP.BFSSUGC4Independent
