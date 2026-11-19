import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C1B1OriginalGammaRelationalRank

/-!
Independent P9C1B1 consumer imports exact native source for three typed
idempotent and four-dimensional source range/rank claims.
-/
set_option autoImplicit false

namespace FCP.RHOPFP9C1B1Independent
open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C1B1

example :
    IsIdempotentElem
      (Matrix.toLin' relationalProjector :
        (SpinIndex → ℝ) →ₗ[ℝ] (SpinIndex → ℝ)) :=
  relationalProjector_toLin_idempotent

example :
    Module.finrank ℝ (LinearMap.range (Matrix.toLin' relationalProjector)) = 4 :=
  relationalProjector_range_finrank_four

example : Matrix.rank relationalProjector = 4 :=
  relationalProjector_rank_four

#print axioms FCP.RHOPFP9C1B1.relationalProjector_toLin_idempotent
#print axioms FCP.RHOPFP9C1B1.relationalProjector_range_finrank_four
#print axioms FCP.RHOPFP9C1B1.relationalProjector_rank_four

end FCP.RHOPFP9C1B1Independent
