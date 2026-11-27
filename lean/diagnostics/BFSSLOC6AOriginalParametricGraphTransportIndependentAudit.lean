import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC6AOriginalParametricGraphTransport

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC6AIndependent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSLOC6A FCP.BFSSICDB0

theorem originalParametricGraphTransportAudit {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex)
    (P : FullL2 N →L[ℂ] FullL2 N)
    (j : SmoothCore N → G.invariantCore)
    (hJ : ∀ f : SmoothCore N, P (coreToL2 f) = coreToL2 (j f).val)
    (hQ : ∀ f : SmoothCore N,
      P (coreToL2 (M.charge a f)) = coreToL2 (M.charge a (j f).val))
    (u v : FullL2 N) (hu : P u = u) (hv : P v = v)
    (hp : (u, v) ∈ closure (Set.range (fun f : SmoothCore N =>
      (coreToL2 f, coreToL2 (M.charge a f))))) :
    (u, v) ∈ originalIndividualClosedGraph M G a :=
  source_fixed_graph_mem M G a P j hJ hQ u v hu hv hp

#print axioms originalParametricGraphTransportAudit
end
end FCP.BFSSLOC6AIndependent
