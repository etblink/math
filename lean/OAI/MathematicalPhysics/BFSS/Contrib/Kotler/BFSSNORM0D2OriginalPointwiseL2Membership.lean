import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0D1OriginalFockFieldContinuity

/-!
# NORM-0D D1-A — pointwise original FullL2 membership

Apply the strictly qualified D0-B original normalized Fock-operator
field to the actual representative of f : FullL2 2. Pinned Mathlib
joint operator evaluation supplies strong measurability; the original
NORM-0C source norm bound yields MemLp by domination.

This gate does NOT define a new Lp equivalence class or a bounded
FullL2 linear operator. These are reserved for D1-B and D2.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0D2OriginalPointwiseL2Membership
noncomputable section

open OAI.BFSSQuantum
open MeasureTheory
open FCP.BFSSNORM0COriginalNormalizedFockField
open FCP.BFSSNORM0D1OriginalFockFieldContinuity

/-- The genuine x-dependent original Fermion 2 operator applied to any
representative of an original FullL2 2 class is a.e. strongly
measurable with respect to the actual bosonic Lebesgue volume. -/
theorem originalPointwiseFock_aeStronglyMeasurable
    (B : GammaMatrix) (f : FullL2 2) :
    AEStronglyMeasurable
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x))
      (volume : Measure (Boson 2)) := by
  have hfield : AEStronglyMeasurable
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B)
      (volume : Measure (Boson 2)) :=
    (originalNormalizedFockGramObservable_continuous B).aestronglyMeasurable
  exact (isBoundedBilinearMap_apply
      (𝕜 := ℂ) (E := Fermion 2) (F := Fermion 2)).continuous.comp_aestronglyMeasurable
        (hfield.prodMk (Lp.aestronglyMeasurable f))

/-- Dominating estimate on every original bosonic configuration.
This bound comes only from the accepted NORM-0C actual Fock norm. -/
theorem originalPointwiseFock_norm_le
    (B : GammaMatrix) (f : FullL2 2) (x : Boson 2) :
    ‖originalNormalizedFockGramObservable x B (f x)‖ ≤
      originalFockGammaBoundConstant B * ‖f x‖ := by
  calc
    ‖originalNormalizedFockGramObservable x B (f x)‖ ≤
        ‖originalNormalizedFockGramObservable x B‖ * ‖f x‖ :=
      (originalNormalizedFockGramObservable x B).le_opNorm (f x)
    _ ≤ originalFockGammaBoundConstant B * ‖f x‖ :=
      mul_le_mul_of_nonneg_right
        (originalNormalizedFockGram_norm_le x B) (norm_nonneg (f x))

/-- Original bosonic volume need not be finite: the pointwise
operator-field product is L2 whenever its input is the original
Fermion 2-valued L2 representative. -/
theorem originalPointwiseFock_memLp
    (B : GammaMatrix) (f : FullL2 2) :
    MemLp
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x))
      2 (volume : Measure (Boson 2)) :=
  MemLp.of_le_mul (Lp.memLp f)
    (originalPointwiseFock_aeStronglyMeasurable B f)
    (Filter.Eventually.of_forall (originalPointwiseFock_norm_le B f))

#print axioms originalPointwiseFock_aeStronglyMeasurable
#print axioms originalPointwiseFock_norm_le
#print axioms originalPointwiseFock_memLp

end
end FCP.BFSSNORM0D2OriginalPointwiseL2Membership
