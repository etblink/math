import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMasslessD0e1cOriginalGenericGraphClosedness

/-!
MASSLESS-D0e1d — separate source-exact paired SU(2) consumer of the
qualified generic original massless graph theorem, together with
qualified original massless-domain density. This is the actual paired
48-Majorana Fock carrier, not a replacement Hilbert model.
Does not assert symmetry, self-adjointness, gauge invariance,
a physical ground state, a spectral gap, or a Hopfion.
-/
set_option autoImplicit false

namespace FCP.BFSSMasslessD0e1d
noncomputable section
open OAI
open OAI.BFSSQuantum

/-- The literal original paired SU(2) massless multiplication graph
is topologically closed in the original bosonic FullL2 product. -/
theorem pairedOriginalMasslessGraph_isClosed :
    IsClosed (FCP.BFSSMasslessD0c0.originalMasslessGraph
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData :
      Set (FullL2 2 × FullL2 2)) :=
  FCP.BFSSMasslessD0e1c.originalMasslessGraph_isClosed
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData

/-- Original 48-Majorana paired SU(2) multiplier:
dense maximal natural L2 domain and closed graph simultaneously. -/
theorem pairedOriginalMasslessDomain_dense_and_graph_closed :
    Dense (FCP.BFSSMasslessD0b0.originalMasslessDomain
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData :
      Set (FullL2 2)) ∧
    IsClosed (FCP.BFSSMasslessD0c0.originalMasslessGraph
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData :
      Set (FullL2 2 × FullL2 2)) :=
  ⟨FCP.BFSSMasslessD0d0.pairedOriginalMasslessDomain_dense,
   pairedOriginalMasslessGraph_isClosed⟩

#print axioms pairedOriginalMasslessGraph_isClosed
#print axioms pairedOriginalMasslessDomain_dense_and_graph_closed

end
end FCP.BFSSMasslessD0e1d
