import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSUGC3GraphHaarProjection

set_option autoImplicit false
set_option warningAsError true
namespace FCP.BFSSUGC3Independent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData OAI.Laughlin.Rotation
open FCP.BFSSUGC3 FCP.BFSSSU2PhysicalDomainD2B6
open FCP.BFSSSU2PhysicalDomainD2B9A FCP.BFSSSU2PhysicalDomainD2B9B
open MeasureTheory

theorem originalSU2HaarGraphAudit (M : AlgebraData 2) (G : M.GaugeData)
    (v : FullL2 2) (y : SpinIndex → FullL2 2) (hp : (v, y) ∈ M.fullClosedGraph) :
    ((∫ g : GaugeGroup 2, sourceFullGaugePairCLM M G g v ∂sourceHaar),
      fun α => ∫ g : GaugeGroup 2, sourceFullGaugePairCLM M G g (y α) ∂sourceHaar) ∈
        M.fullClosedGraph :=
  graph_haar_closed_mem M G hp

theorem originalSU2HaarFixedAudit (M : AlgebraData 2) (G : M.GaugeData)
    (v : FullL2 2) (y : SpinIndex → FullL2 2) (hp : (v, y) ∈ M.fullClosedGraph)
    (hv : v ∈ G.physicalSpace) :
    (sourceFullHaarAverageCLM M G v,
      fun α => sourceFullHaarAverageCLM M G (y α)) = (v, y) :=
  graph_haar_fixed M G hp hv

#print axioms originalSU2HaarGraphAudit
#print axioms originalSU2HaarFixedAudit
end
end FCP.BFSSUGC3Independent
