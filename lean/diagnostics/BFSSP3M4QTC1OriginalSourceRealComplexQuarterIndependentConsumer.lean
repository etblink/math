import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4QTC1OriginalSourceRealComplexQuarterBridge

/-!
# QTC1 independent consumer: real/complex normalization on true Fock Op

The proof claims ONLY coefficient-normalization identity, with original
real source K and original normalized Source48 gamma. Fin0..Fin3 and
explicit nonskew matrices exercise arbitrary coefficients.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4QTC1OriginalSourceRealComplexQuarterIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4QTC0AOriginalFockWeightedQuadraticCovariance
open FCP.BFSSP3M4QTC1OriginalSourceRealComplexQuarterBridge

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

theorem real_quarter_consumer
    {ι : Type*} [Fintype ι]
    (w : ι → ι → Op) (B : Matrix ι ι ℝ) :
    (∑ p : ι, ∑ q : ι, (B p q / 4 : ℝ) • w p q) =
    (1 / 4 : ℂ) •
      (∑ p : ι, ∑ q : ι, ((B p q : ℝ) : ℂ) • w p q) :=
  originalFock_real_quarter_quadratic w B

theorem original_K_quadratic_consumer
    (B : Matrix Source48Label Source48Label ℝ) :
    originalSource48BivectorK B =
      originalFockQuadratic sourceNormalizedGamma
        (fun p q : Source48Label => ((B p q : ℝ) : ℂ)) :=
  originalSource48BivectorK_eq_originalFockQuadratic B

example (w : Fin 0 → Fin 0 → Op) (B : Matrix (Fin 0) (Fin 0) ℝ) :
    (∑ p : Fin 0, ∑ q : Fin 0, (B p q / 4 : ℝ) • w p q) =
    (1 / 4 : ℂ) •
      (∑ p : Fin 0, ∑ q : Fin 0, ((B p q : ℝ) : ℂ) • w p q) :=
  originalFock_real_quarter_quadratic w B

example (w : Fin 1 → Fin 1 → Op) (B : Matrix (Fin 1) (Fin 1) ℝ) :
    (∑ p : Fin 1, ∑ q : Fin 1, (B p q / 4 : ℝ) • w p q) =
    (1 / 4 : ℂ) •
      (∑ p : Fin 1, ∑ q : Fin 1, ((B p q : ℝ) : ℂ) • w p q) :=
  originalFock_real_quarter_quadratic w B

example (w : Fin 2 → Fin 2 → Op) (B : Matrix (Fin 2) (Fin 2) ℝ) :
    (∑ p : Fin 2, ∑ q : Fin 2, (B p q / 4 : ℝ) • w p q) =
    (1 / 4 : ℂ) •
      (∑ p : Fin 2, ∑ q : Fin 2, ((B p q : ℝ) : ℂ) • w p q) :=
  originalFock_real_quarter_quadratic w B

example (w : Fin 3 → Fin 3 → Op) (B : Matrix (Fin 3) (Fin 3) ℝ) :
    (∑ p : Fin 3, ∑ q : Fin 3, (B p q / 4 : ℝ) • w p q) =
    (1 / 4 : ℂ) •
      (∑ p : Fin 3, ∑ q : Fin 3, ((B p q : ℝ) : ℂ) • w p q) :=
  originalFock_real_quarter_quadratic w B

private def nonskewB : Matrix (Fin 2) (Fin 2) ℝ :=
  fun p q => if p = 0 ∧ q = 1 then 1 else 0

example (w : Fin 2 → Fin 2 → Op) :
    (∑ p : Fin 2, ∑ q : Fin 2, (nonskewB p q / 4 : ℝ) • w p q) =
    (1 / 4 : ℂ) •
      (∑ p : Fin 2, ∑ q : Fin 2, ((nonskewB p q : ℝ) : ℂ) • w p q) :=
  originalFock_real_quarter_quadratic w nonskewB

example (w : Fin 2 → Fin 2 → Op) :
    (∑ p : Fin 2, ∑ q : Fin 2, ((0 : Matrix (Fin 2) (Fin 2) ℝ) p q / 4 : ℝ) • w p q) =
    (1 / 4 : ℂ) •
      (∑ p : Fin 2, ∑ q : Fin 2, (((0 : Matrix (Fin 2) (Fin 2) ℝ) p q : ℝ) : ℂ) • w p q) :=
  originalFock_real_quarter_quadratic w 0

example : nonskewB (0 : Fin 2) (1 : Fin 2) = 1 := by
  simp [nonskewB]

#print axioms real_quarter_consumer
#print axioms original_K_quadratic_consumer

end
end FCP.BFSSP3M4QTC1OriginalSourceRealComplexQuarterIndependentConsumer
