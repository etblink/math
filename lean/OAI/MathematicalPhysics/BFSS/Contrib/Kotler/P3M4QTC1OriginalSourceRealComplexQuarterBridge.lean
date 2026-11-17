import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB1SOriginalSource48SkewMatrixFockBivector
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4QTC0DOriginalFockThinTensorAdapter

/-!
# BFSS M4 QTC1 — original real source K(B) is the exact complex Q_B

Small normalization-only bridge. The ORIGINAL Source48Label Majoranas,
the true Fermion 2 operator carrier, and the literal B[p,q]/4 real scalar
coefficient are used. Do not import stopped QTC0B and do not assert
the source commutator of two K generators or physical Hamiltonian covariance.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4QTC1OriginalSourceRealComplexQuarterBridge
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4QTC0AOriginalFockWeightedQuadraticCovariance

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Exact 1/4 coefficient compatibility for arbitrary FINITE real matrices
on opaque ORIGINAL complex-linear Fock operators. No gamma/48x48 unfolding. -/
theorem originalFock_real_quarter_quadratic
    {ι : Type*} [Fintype ι]
    (w : ι → ι → Op) (B : Matrix ι ι ℝ) :
    (∑ p : ι, ∑ q : ι, (B p q / 4 : ℝ) • w p q) =
    (1 / 4 : ℂ) •
      (∑ p : ι, ∑ q : ι, ((B p q : ℝ) : ℂ) • w p q) := by
  classical
  calc
    _ = ∑ p : ι, ∑ q : ι,
        (1 / 4 : ℂ) • (((B p q : ℝ) : ℂ) • w p q) := by
      apply Finset.sum_congr rfl
      intro p hp
      apply Finset.sum_congr rfl
      intro q hq
      have hr : (B p q / 4 : ℝ) = (1 / 4 : ℝ) * B p q := by
        ring
      have hc : ((B p q / 4 : ℝ) : ℂ) =
          (1 / 4 : ℂ) * ((B p q : ℝ) : ℂ) := by
        push_cast
        ring
      calc
        (B p q / 4 : ℝ) • w p q =
          ((B p q / 4 : ℝ) : ℂ) • w p q :=
            FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul
              (B p q / 4) (w p q)
        _ = ((1 / 4 : ℂ) * ((B p q : ℝ) : ℂ)) • w p q := by
          rw [hc]
        _ = (1 / 4 : ℂ) • (((B p q : ℝ) : ℂ) • w p q) := by
          rw [smul_smul]
    _ = (1 / 4 : ℂ) •
        (∑ p : ι, ∑ q : ι, ((B p q : ℝ) : ℂ) • w p q) := by
      simp only [Finset.smul_sum]

/-- The ORIGINAL real-source K(B), on original square-one Source48 gamma,
equals the accepted normalised complex quadratic, for ALL real B,
including nonskew matrices. No Lie-group or physical-domain claim. -/
theorem originalSource48BivectorK_eq_originalFockQuadratic
    (B : Matrix Source48Label Source48Label ℝ) :
    originalSource48BivectorK B =
    originalFockQuadratic sourceNormalizedGamma
      (fun p q : Source48Label => ((B p q : ℝ) : ℂ)) := by
  classical
  calc
    originalSource48BivectorK B =
      (∑ p : Source48Label, ∑ q : Source48Label,
        (B p q / 4 : ℝ) •
          (sourceNormalizedGamma p * sourceNormalizedGamma q)) := by
        rfl
    _ = (1 / 4 : ℂ) •
      (∑ p : Source48Label, ∑ q : Source48Label,
        ((B p q : ℝ) : ℂ) •
          (sourceNormalizedGamma p * sourceNormalizedGamma q)) :=
      originalFock_real_quarter_quadratic
        (fun p q : Source48Label =>
          sourceNormalizedGamma p * sourceNormalizedGamma q) B
    _ = originalFockQuadratic sourceNormalizedGamma
          (fun p q : Source48Label => ((B p q : ℝ) : ℂ)) := by
        rfl

#print axioms originalFock_real_quarter_quadratic
#print axioms originalSource48BivectorK_eq_originalFockQuadratic

end
end FCP.BFSSP3M4QTC1OriginalSourceRealComplexQuarterBridge
