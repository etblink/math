import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM4B2OriginalPhysicalMasslessRestrictedGraphClosed

/-!
GM4B2 imported independent native Lean consumer of GM4A's ACTUAL
source-physical SU2 massless Fock multiplier algebraic closed graph.
It checks the literal paired FullL2 fixed-space Hilbert product and
density without introducing a surrogate operator or new axioms.
-/
set_option autoImplicit false

namespace FCP.BFSSGM4B2Independent
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open Set

/-- Exact original physical partial-operator graph is a
closed subset of the genuine paired source physical product. -/
theorem pairedSourcePhysicalMasslessGraphClosed :
    IsClosed (FCP.BFSSGM4B2.pairedOriginalPhysicalMasslessGraph :
      Set (FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace ×
           FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace)) :=
  FCP.BFSSGM4B2.pairedOriginalPhysicalMasslessGraph_isClosed

/-- Independently consumes both exact source domain density and
actual physical-domain original massless graph closedness. -/
theorem pairedSourcePhysicalMasslessDenseAndClosed :
    Dense (FCP.BFSSGM4A.pairedOriginalPhysicalMasslessDomain :
      Set FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace) ∧
    IsClosed (FCP.BFSSGM4B2.pairedOriginalPhysicalMasslessGraph :
      Set (FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace ×
           FCP.BFSSSU2GaugeG4J.pairedGaugeData.physicalSpace)) :=
  FCP.BFSSGM4B2.pairedOriginalPhysicalMasslessDomain_dense_graph_closed

#print axioms pairedSourcePhysicalMasslessGraphClosed
#print axioms pairedSourcePhysicalMasslessDenseAndClosed

end FCP.BFSSGM4B2Independent
