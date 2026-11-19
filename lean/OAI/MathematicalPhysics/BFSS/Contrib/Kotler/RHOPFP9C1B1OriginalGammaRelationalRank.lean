import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C1B0OriginalGammaRelationalTrace
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.LinearAlgebra.Trace

/-!
# RHOPF-P9C1B1 — original Gamma9 relational projector rank four

Source exact original real Spin9 GammaMatrix relationalProjector P has
already been independently qualified as P²=P (P9C1A) and trace(P)=4
(P9C1B0). The pinned Mathlib lemma LinearMap.IsProj.trace
identifies trace of an idempotent endomorphism with the finrank of
its range. This source-exact gate transports the source matrix to its
associated linear map, proves finrank(range P)=4 and Matrix.rank P=4.

No original Gamma9 matrix entry expansions, alternative gamma
matrices, private imports, supplementary axioms, increased tactic
resource limits or physical/Fock/observable claims.
The indexed four-coordinate Hopf-carrier identification is OPEN.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C1B1
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSGamma9
open FCP.RHOPFP9C1A
open FCP.RHOPFP9C1B0

/-- Original gamma projector induces an idempotent map on its
actual 16-component real spinor carrier. -/
theorem relationalProjector_toLin_idempotent :
    IsIdempotentElem
      (Matrix.toLin' relationalProjector :
        (SpinIndex → ℝ) →ₗ[ℝ] (SpinIndex → ℝ)) := by
  change
    (Matrix.toLin' relationalProjector) *
      (Matrix.toLin' relationalProjector) =
        Matrix.toLin' relationalProjector
  rw [Module.End.mul_eq_comp, ← Matrix.toLin'_mul]
  exact congrArg Matrix.toLin' relationalProjector_idempotent

/-- Source-original real 16-spinor agreement sector has dimension four,
through the pinned Mathlib trace-of-idempotent projection theorem. -/
theorem relationalProjector_range_finrank_four :
    Module.finrank ℝ (LinearMap.range (Matrix.toLin' relationalProjector)) = 4 := by
  have htrace :
      (Module.finrank ℝ
        (LinearMap.range (Matrix.toLin' relationalProjector)) : ℝ) =
        4 := by
    calc
      (Module.finrank ℝ
          (LinearMap.range (Matrix.toLin' relationalProjector)) : ℝ) =
        LinearMap.trace ℝ (SpinIndex → ℝ)
          (Matrix.toLin' relationalProjector) :=
          relationalProjector_toLin_idempotent.isProj_range.trace.symm
      _ = Matrix.trace relationalProjector :=
        Matrix.trace_toLin'_eq relationalProjector
      _ = 4 := relationalProjector_trace_four
  exact_mod_cast htrace

/-- Typed rank-four source gamma matrix theorem, with no selection of
the indexed (0,1,8,9) basis imposed. -/
theorem relationalProjector_rank_four :
    Matrix.rank relationalProjector = 4 := by
  change
    Module.finrank ℝ (LinearMap.range relationalProjector.mulVecLin) = 4
  simpa only [Matrix.toLin'_apply'] using
    relationalProjector_range_finrank_four

#print axioms relationalProjector_toLin_idempotent
#print axioms relationalProjector_range_finrank_four
#print axioms relationalProjector_rank_four

end
end FCP.RHOPFP9C1B1
