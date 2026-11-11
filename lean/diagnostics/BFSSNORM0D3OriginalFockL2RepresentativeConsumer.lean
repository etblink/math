import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0D3OriginalFockL2Representative

/-!
# NORM-0D D1-B — independent genuine-source FullL2 consumer

Test the newly constructed L2 output on the original SmoothCore and
the original L2 zero input. Both rely on a.e. representative laws,
not on equality of L2 functions at all points.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0D3OriginalFockL2RepresentativeConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open MeasureTheory
open FCP.BFSSNORM0COriginalNormalizedFockField
open FCP.BFSSNORM0D3OriginalFockL2Representative

/-- On the actual original smooth test-function core, D1-B agrees
almost everywhere with original pointwise Fock multiplication. -/
theorem originalFockL2Action_smoothCore_ae
    (B : GammaMatrix) (f : SmoothCore 2) :
    (originalFockL2Action B (coreToL2 f) : Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x)) := by
  filter_upwards [originalFockL2Action_ae B (coreToL2 f), coreToL2_ae f]
    with x haction hf
  exact haction.trans (congrArg (originalNormalizedFockGramObservable x B) hf)

/-- On the original L2 zero class, the new D1-B output is the zero
class. This is a consumer-level compatibility check, not yet D2. -/
theorem originalFockL2Action_zero (B : GammaMatrix) :
    originalFockL2Action B (0 : FullL2 2) = 0 := by
  apply Lp.ext
  filter_upwards [originalFockL2Action_ae B (0 : FullL2 2),
    Lp.coeFn_zero (Fermion 2) 2 (volume : Measure (Boson 2))]
    with x haction hz
  simpa only [hz, map_zero] using haction

#print axioms FCP.BFSSNORM0D3OriginalFockL2Representative.originalFockL2Action_ae
#print axioms FCP.BFSSNORM0D3OriginalFockL2Representative.originalFockL2Action_toLp_rep
#print axioms FCP.BFSSNORM0D3OriginalFockL2Representative.originalFockL2Action_ae_of_rep
#print axioms originalFockL2Action_smoothCore_ae
#print axioms originalFockL2Action_zero

end
end FCP.BFSSNORM0D3OriginalFockL2RepresentativeConsumer
