import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4QTC1G0OriginalFockGenericRealQuarter

/-!
# QTC1G0 independent generic real-quarter consumer

No imports or uses of failed QTC1 R1/R2, original Source48
specialized gamma/K(B), or hypothetical commutator bracket.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4QTC1G0OriginalFockGenericRealQuarterIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M4QTC1G0OriginalFockGenericRealQuarter

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

theorem originalFock_real_quarter_generic_consumer
    {ι : Type*} [Fintype ι]
    (w : ι → ι → Op) (B : Matrix ι ι ℝ) :
    (∑ p : ι, ∑ q : ι, (B p q / 4 : ℝ) • w p q) =
    (1 / 4 : ℂ) •
      (∑ p : ι, ∑ q : ι, ((B p q : ℝ) : ℂ) • w p q) :=
  originalFock_real_quarter_quadratic_generic w B

example (w : Fin 0 → Fin 0 → Op) (B : Matrix (Fin 0) (Fin 0) ℝ) :
    (∑ p : Fin 0, ∑ q : Fin 0, (B p q / 4 : ℝ) • w p q) =
    (1 / 4 : ℂ) •
      (∑ p : Fin 0, ∑ q : Fin 0, ((B p q : ℝ) : ℂ) • w p q) :=
  originalFock_real_quarter_quadratic_generic w B

example (w : Fin 1 → Fin 1 → Op) (B : Matrix (Fin 1) (Fin 1) ℝ) :
    (∑ p : Fin 1, ∑ q : Fin 1, (B p q / 4 : ℝ) • w p q) =
    (1 / 4 : ℂ) •
      (∑ p : Fin 1, ∑ q : Fin 1, ((B p q : ℝ) : ℂ) • w p q) :=
  originalFock_real_quarter_quadratic_generic w B

example (w : Fin 2 → Fin 2 → Op) (B : Matrix (Fin 2) (Fin 2) ℝ) :
    (∑ p : Fin 2, ∑ q : Fin 2, (B p q / 4 : ℝ) • w p q) =
    (1 / 4 : ℂ) •
      (∑ p : Fin 2, ∑ q : Fin 2, ((B p q : ℝ) : ℂ) • w p q) :=
  originalFock_real_quarter_quadratic_generic w B

example (w : Fin 3 → Fin 3 → Op) (B : Matrix (Fin 3) (Fin 3) ℝ) :
    (∑ p : Fin 3, ∑ q : Fin 3, (B p q / 4 : ℝ) • w p q) =
    (1 / 4 : ℂ) •
      (∑ p : Fin 3, ∑ q : Fin 3, ((B p q : ℝ) : ℂ) • w p q) :=
  originalFock_real_quarter_quadratic_generic w B

private def e01 : Matrix (Fin 2) (Fin 2) ℝ :=
  fun p q => if p = 0 ∧ q = 1 then 1 else 0

example (w : Fin 2 → Fin 2 → Op) :
    (∑ p : Fin 2, ∑ q : Fin 2, (e01 p q / 4 : ℝ) • w p q) =
    (1 / 4 : ℂ) •
      (∑ p : Fin 2, ∑ q : Fin 2, ((e01 p q : ℝ) : ℂ) • w p q) :=
  originalFock_real_quarter_quadratic_generic w e01

example (w : Fin 2 → Fin 2 → Op) :
    (∑ p : Fin 2, ∑ q : Fin 2, ((0 : Matrix (Fin 2) (Fin 2) ℝ) p q / 4 : ℝ) • w p q) =
    (1 / 4 : ℂ) •
      (∑ p : Fin 2, ∑ q : Fin 2,
        (((0 : Matrix (Fin 2) (Fin 2) ℝ) p q : ℝ) : ℂ) • w p q) :=
  originalFock_real_quarter_quadratic_generic w 0

example : e01 (0 : Fin 2) (1 : Fin 2) = 1 := by
  simp [e01]

#print axioms originalFock_real_quarter_generic_consumer

end
end FCP.BFSSP3M4QTC1G0OriginalFockGenericRealQuarterIndependentConsumer
