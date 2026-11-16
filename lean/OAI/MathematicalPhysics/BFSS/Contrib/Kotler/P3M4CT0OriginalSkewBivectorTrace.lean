import Mathlib.Tactic
import Mathlib.LinearAlgebra.Trace
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.T1OriginalFockTraceInvariance
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1P0BOriginalSource48SkewPlaneNormalization

/-!
# BFSS M4 CT0 — original Fock trace and source48 skew bivector

On the actual original Fermion 2 complex Hilbert space, reuse the
ordinary source T1 trace, original source LB1S K(A) coefficient 1/4,
and the accepted real-to-complex Fock scalar bridge.

No fake commuting Fock operator model, abstract replacement gamma
carrier, new axioms, changed accepted donors or native full K-bracket.
The scalar finite-double-sum cancellation is proved before source
specialization. This gate does NOT assert a bivector Lie bracket or
physical Spin(9) Fock-vector representation.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4CT0OriginalSkewBivectorTrace
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSST1OriginalFockTraceInvariance
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4LB1P0AOriginalSource48SkewPlane

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Cyclicity of the literal T1 original complex Fock trace.
Transport the pinned Mathlib LinearMap theorem across T1's
canonical source endomorphism equivalence. -/
theorem originalFockTrace_mul_comm (X Y : Op) :
    originalFockTrace (X * Y) = originalFockTrace (Y * X) := by
  simp only [originalFockTrace_apply, map_mul]
  exact LinearMap.trace_mul_comm
    (originalFockEndAlgEquiv.symm X) (originalFockEndAlgEquiv.symm Y)

/-- Finite antisymmetric coefficients cancel against symmetric
complex pairings, with arbitrary repeated indices included. -/
theorem originalFock_complex_skew_symmetric_doubleSum_zero
    {ι : Type*} [Fintype ι]
    (a f : ι → ι → ℂ)
    (ha : ∀ p q, a p q = -(a q p))
    (hf : ∀ p q, f p q = f q p) :
    (∑ p : ι, ∑ q : ι, a p q * f p q) = 0 := by
  classical
  let s : ℂ := ∑ p : ι, ∑ q : ι, a p q * f p q
  have hs : s = -s := by
    dsimp [s]
    calc
      (∑ p : ι, ∑ q : ι, a p q * f p q) =
          ∑ q : ι, ∑ p : ι, a p q * f p q :=
        Finset.sum_comm
      _ = ∑ q : ι, ∑ p : ι, -(a q p * f q p) := by
        apply Finset.sum_congr rfl
        intro q hq
        apply Finset.sum_congr rfl
        intro p hp
        rw [ha p q, hf p q]
        ring
      _ = -(∑ q : ι, ∑ p : ι, a q p * f q p) := by
        simp only [Finset.sum_neg_distrib]
  have htwo : (2 : ℂ) * s = 0 := by
    calc
      (2 : ℂ) * s = s + s := by ring
      _ = s + (-s) := by rw [← hs]
      _ = 0 := add_neg_cancel s
  have hzero : s = 0 :=
    (mul_eq_zero.mp htwo).resolve_left (by norm_num)
  exact hzero

private theorem originalFockTrace_real_smul
    (c : ℝ) (X : Op) :
    originalFockTrace (c • X) = (c : ℂ) * originalFockTrace X := by
  rw [FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul]
  simp only [map_smul, smul_eq_mul]

/-- The genuine source 48-label real skew K has exactly zero ordinary
complex Fock trace. Neither CAR expansion nor the full K bracket
is needed: the coefficient is skew, while Tr(Gamma_p Gamma_q)
is symmetric by the exact original T1 trace cyclicity. -/
theorem originalSource48BivectorK_skew_trace_zero
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : A.transpose = -A) :
    originalFockTrace (originalSource48BivectorK A) = 0 := by
  classical
  have hcoeff (p q : Source48Label) :
      ((A p q / 4 : ℝ) : ℂ) = -((A q p / 4 : ℝ) : ℂ) := by
    simpa only [neg_div, Complex.ofReal_neg] using
      congrArg (fun c : ℝ => ((c / 4 : ℝ) : ℂ))
        (originalSource48_matrixSkew_entries A hA p q)
  have hpair (p q : Source48Label) :
      originalFockTrace (sourceNormalizedGamma p * sourceNormalizedGamma q) =
        originalFockTrace (sourceNormalizedGamma q * sourceNormalizedGamma p) :=
    originalFockTrace_mul_comm _ _
  have hsum :
      (∑ p : Source48Label, ∑ q : Source48Label,
        ((A p q / 4 : ℝ) : ℂ) *
          originalFockTrace (sourceNormalizedGamma p * sourceNormalizedGamma q)) =
        0 :=
    originalFock_complex_skew_symmetric_doubleSum_zero
      (fun p q => ((A p q / 4 : ℝ) : ℂ))
      (fun p q => originalFockTrace
        (sourceNormalizedGamma p * sourceNormalizedGamma q))
      hcoeff hpair
  calc
    originalFockTrace (originalSource48BivectorK A) =
        ∑ p : Source48Label, ∑ q : Source48Label,
          originalFockTrace ((A p q / 4 : ℝ) •
            (sourceNormalizedGamma p * sourceNormalizedGamma q)) := by
      simp only [originalSource48BivectorK, map_sum]
    _ = ∑ p : Source48Label, ∑ q : Source48Label,
          ((A p q / 4 : ℝ) : ℂ) *
            originalFockTrace (sourceNormalizedGamma p * sourceNormalizedGamma q) := by
      apply Finset.sum_congr rfl
      intro p hp
      apply Finset.sum_congr rfl
      intro q hq
      exact originalFockTrace_real_smul (A p q / 4) _
    _ = 0 := hsum

#print axioms originalFockTrace_mul_comm
#print axioms originalFock_complex_skew_symmetric_doubleSum_zero
#print axioms originalSource48BivectorK_skew_trace_zero

end
end FCP.BFSSP3M4CT0OriginalSkewBivectorTrace
