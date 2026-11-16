import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1P0AOriginalSource48SkewPlane

/-! Independent original Source48Label skew plane source consumer.
Only native 48-label matrix statements, not bivector Fock closure. -/
set_option autoImplicit false

namespace FCP.BFSSP3M4LB1P0AOriginalSource48SkewPlaneIndependentConsumer
noncomputable section

open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1P0AOriginalSource48SkewPlane

theorem originalSource48SkewPlane_entries_skew_consumer
    (i j p q : Source48Label) :
    originalSource48SkewPlane i j p q =
      -(originalSource48SkewPlane i j q p) :=
  originalSource48SkewPlane_entries_skew i j p q

theorem originalSource48SkewPlane_transpose_consumer
    (i j : Source48Label) :
    (originalSource48SkewPlane i j).transpose =
      -originalSource48SkewPlane i j :=
  originalSource48SkewPlane_transpose i j

#print axioms originalSource48SkewPlane_entries_skew_consumer
#print axioms originalSource48SkewPlane_transpose_consumer

end
end FCP.BFSSP3M4LB1P0AOriginalSource48SkewPlaneIndependentConsumer
