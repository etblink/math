import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM3BOriginalMasslessGraphGaugeInvariant
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6G7ZActualSourceFullL2UnitaryGaugeRepresentationProbe

/-!
GM3C — literal original 48-Majorana paired SU(2) Fock graph,
TWO-SIDED gauge invariance, as exact Set.image equality.

GM3B proves diagonal forward graph membership. L6G7Z independently
proves that the exact original FullL2 gauge maps have inverses
U(g⁻¹). This gate composes these source-qualified results;
no synthetic gauge action, new Hilbert space or new operator.

Original D0e1d proves separately that this graph is closed.
Neither the present group action image equality nor closedness
is a statement about a Hamiltonian gap, essential self-adjointness,
Gauss generator, a physical state or a Hopfion.
-/
set_option autoImplicit false

namespace FCP.BFSSGM3C
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- Diagonal action on the ACTUAL original FullL2 × FullL2,
defined only from the accepted source action U(g), without a
new representation on an artificial graph carrier. -/
noncomputable def pairedOriginalDiagonalGauge (g : GaugeGroup 2) :
    (FullL2 2 × FullL2 2) → (FullL2 2 × FullL2 2) :=
  fun z =>
    (FCP.BFSSSU2PhysicalDomainL6G7U.actualOriginalFullL2GaugePairCLM g z.1,
     FCP.BFSSSU2PhysicalDomainL6G7U.actualOriginalFullL2GaugePairCLM g z.2)

/-- Genuine exact source U(g)U(g⁻¹)=1, on BOTH original L2 coordinates,
not just on an abstract representation or an invariant smooth core. -/
theorem pairedOriginalDiagonalGauge_inv_right
    (g : GaugeGroup 2) (z : FullL2 2 × FullL2 2) :
    pairedOriginalDiagonalGauge g (pairedOriginalDiagonalGauge g⁻¹ z) = z := by
  apply Prod.ext
  · change FCP.BFSSSU2PhysicalDomainL6G7U.actualOriginalFullL2GaugePairCLM g
      (FCP.BFSSSU2PhysicalDomainL6G7U.actualOriginalFullL2GaugePairCLM g⁻¹ z.1) =
        z.1
    exact FCP.BFSSSU2PhysicalDomainL6G7Z.actualOriginalFullL2GaugePair_inv_right g z.1
  · change FCP.BFSSSU2PhysicalDomainL6G7U.actualOriginalFullL2GaugePairCLM g
      (FCP.BFSSSU2PhysicalDomainL6G7U.actualOriginalFullL2GaugePairCLM g⁻¹ z.2) =
        z.2
    exact FCP.BFSSSU2PhysicalDomainL6G7Z.actualOriginalFullL2GaugePair_inv_right g z.2

/-- The accepted GM3B result applied to exactly the original
combined FullL2 gauge action, with no extra hypothesis. -/
theorem pairedOriginalDiagonalGauge_graph_mem
    (g : GaugeGroup 2) (z : FullL2 2 × FullL2 2)
    (hz : z ∈ FCP.BFSSMasslessD0c0.originalMasslessGraph
      FCP.BFSSSU2GaugeG1A.pairedAlgebraData) :
    pairedOriginalDiagonalGauge g z ∈
      FCP.BFSSMasslessD0c0.originalMasslessGraph
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData := by
  change
    (FCP.BFSSSU2GaugeG4J.pairedGaugeData.fiberAction g
        (FCP.BFSSSU2GaugeG4J.pairedGaugeData.bosonPullback g⁻¹ z.1),
     FCP.BFSSSU2GaugeG4J.pairedGaugeData.fiberAction g
        (FCP.BFSSSU2GaugeG4J.pairedGaugeData.bosonPullback g⁻¹ z.2)) ∈
      FCP.BFSSMasslessD0c0.originalMasslessGraph
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData
  exact FCP.BFSSGM3B.pairedOriginalMasslessGraph_gauge_mem g z hz

/-- Two-sided equality: the TRUE original paired-SU(2) algebraic
massless operator graph is carried ONTO ITSELF by every original
diagonal unitary gauge transformation. -/
theorem pairedOriginalMasslessGraph_gauge_image_eq
    (g : GaugeGroup 2) :
    Set.image (pairedOriginalDiagonalGauge g)
      (FCP.BFSSMasslessD0c0.originalMasslessGraph
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData :
        Set (FullL2 2 × FullL2 2)) =
      (FCP.BFSSMasslessD0c0.originalMasslessGraph
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData :
        Set (FullL2 2 × FullL2 2)) := by
  apply Set.Subset.antisymm
  · rintro z ⟨w, hw, rfl⟩
    exact pairedOriginalDiagonalGauge_graph_mem g w hw
  · intro z hz
    refine ⟨pairedOriginalDiagonalGauge g⁻¹ z,
      pairedOriginalDiagonalGauge_graph_mem g⁻¹ z hz, ?_⟩
    exact pairedOriginalDiagonalGauge_inv_right g z

#print axioms pairedOriginalDiagonalGauge
#print axioms pairedOriginalDiagonalGauge_inv_right
#print axioms pairedOriginalDiagonalGauge_graph_mem
#print axioms pairedOriginalMasslessGraph_gauge_image_eq

end
end FCP.BFSSGM3C
