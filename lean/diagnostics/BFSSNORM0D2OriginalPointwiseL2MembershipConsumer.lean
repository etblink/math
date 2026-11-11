import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0D2OriginalPointwiseL2Membership

/-!
# NORM-0D D1-A independent original SmoothCore consumer

The D1-A measurable and dominated original FullL2 representative
specializes to a genuine original SmoothCore test-function argument.
Pass to the smooth test function itself only by the original
coreToL2_ae identity, not by pointwise identity of Lp classes.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0D2OriginalPointwiseL2MembershipConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open MeasureTheory
open FCP.BFSSNORM0COriginalNormalizedFockField
open FCP.BFSSNORM0D2OriginalPointwiseL2Membership

/-- The actual smooth BFSS test-vector field has an L2-valued
pointwise normalized Fock image, even on infinite-volume Boson 2. -/
theorem originalPointwiseFock_smoothCore_memLp
    (B : GammaMatrix) (f : SmoothCore 2) :
    MemLp
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x))
      2 (volume : Measure (Boson 2)) := by
  have h : MemLp
      (fun x : Boson 2 =>
        originalNormalizedFockGramObservable x B ((coreToL2 f) x))
      2 (volume : Measure (Boson 2)) :=
    originalPointwiseFock_memLp B (coreToL2 f)
  apply MemLp.ae_eq ?_ h
  filter_upwards [coreToL2_ae f] with x hx
  exact congrArg (originalNormalizedFockGramObservable x B) hx

/-- A separate source-domain test for the norm envelope. -/
theorem originalPointwiseFock_smoothCore_norm_le
    (B : GammaMatrix) (f : SmoothCore 2) (x : Boson 2) :
    ‖originalNormalizedFockGramObservable x B (f x)‖ ≤
      originalFockGammaBoundConstant B * ‖f x‖ := by
  calc
    ‖originalNormalizedFockGramObservable x B (f x)‖ ≤
        ‖originalNormalizedFockGramObservable x B‖ * ‖f x‖ :=
      (originalNormalizedFockGramObservable x B).le_opNorm (f x)
    _ ≤ originalFockGammaBoundConstant B * ‖f x‖ :=
      mul_le_mul_of_nonneg_right
        (originalNormalizedFockGram_norm_le x B) (norm_nonneg (f x))

#print axioms FCP.BFSSNORM0D2OriginalPointwiseL2Membership.originalPointwiseFock_aeStronglyMeasurable
#print axioms FCP.BFSSNORM0D2OriginalPointwiseL2Membership.originalPointwiseFock_norm_le
#print axioms FCP.BFSSNORM0D2OriginalPointwiseL2Membership.originalPointwiseFock_memLp
#print axioms originalPointwiseFock_smoothCore_memLp
#print axioms originalPointwiseFock_smoothCore_norm_le

end
end FCP.BFSSNORM0D2OriginalPointwiseL2MembershipConsumer
