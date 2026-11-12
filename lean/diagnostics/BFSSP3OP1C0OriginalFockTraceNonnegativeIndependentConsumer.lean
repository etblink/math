import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3OP1C0OriginalFockTraceNonnegative

/-!
P3-OP1C0 independent consumer of original Fock trace positivity.
Arbitrary original Fock endomorphism, arbitrary orthonormal basis;
the accepted OP1A pairing diagonal is explicitly tested too.
-/

set_option autoImplicit false

namespace BFSSP3OP1C0OriginalFockTraceNonnegativeIndependentConsumer
noncomputable section

open scoped InnerProductSpace

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3OP1AOriginalFockTracePairing
open FCP.BFSSP3OP1C0OriginalFockTraceNonnegative

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

variable {ι : Type*} [Fintype ι]

/-- Independent source-typed trace cone application. -/
example (b : OrthonormalBasis ι ℂ (Fermion 2)) (T : OriginalFockOp) :
    0 ≤ (FCP.BFSST1OriginalFockTraceInvariance.originalFockTrace (star T * T)).re :=
  originalFockTrace_star_mul_re_nonneg b T

/-- Reuse in the accepted actual original source OP1A pairing. -/
example (b : OrthonormalBasis ι ℂ (Fermion 2)) (T : OriginalFockOp) :
    0 ≤ (originalFockTracePairing T T).re := by
  change 0 ≤ (FCP.BFSST1OriginalFockTraceInvariance.originalFockTrace (star T * T)).re
  exact originalFockTrace_star_mul_re_nonneg b T

#print axioms FCP.BFSSP3OP1C0OriginalFockTraceNonnegative.originalFockTrace_star_mul_re_nonneg

end
end BFSSP3OP1C0OriginalFockTraceNonnegativeIndependentConsumer
