import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4QTC0CAbstractCoefficientContraction

/-!
# QTC0C independently importing consumer

The word values are arbitrary elements of a complex additive module,
with no operator multiplication or skew assumption. Includes dimensions
zero to three and an explicit non-skew coordinate counter-control.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4QTC0CAbstractCoefficientIndependentConsumer
noncomputable section

open FCP.BFSSP3M4QTC0CAbstractCoefficientContraction

theorem left_consumer
    {ι M : Type*} [Fintype ι] [AddCommMonoid M] [Module ℂ M]
    (w : ι → ι → M) (a b : Matrix ι ι ℂ) :
    (∑ i : ι, ∑ j : ι, ∑ p : ι,
      (a p i * b i j) • w p j) =
    ∑ p : ι, ∑ j : ι, (a * b) p j • w p j :=
  coefficient_left w a b

theorem right_consumer
    {ι M : Type*} [Fintype ι] [AddCommMonoid M] [Module ℂ M]
    (w : ι → ι → M) (a b : Matrix ι ι ℂ) :
    (∑ i : ι, ∑ j : ι, ∑ p : ι,
      (b i j * a p j) • w i p) =
    ∑ i : ι, ∑ p : ι, (b * a.transpose) i p • w i p :=
  coefficient_right w a b

theorem both_consumer
    {ι M : Type*} [Fintype ι] [AddCommMonoid M] [Module ℂ M]
    (w : ι → ι → M) (a b : Matrix ι ι ℂ) :
    (∑ i : ι, ∑ j : ι, ∑ p : ι,
      (a p i * b i j) • w p j) +
    (∑ i : ι, ∑ j : ι, ∑ p : ι,
      (b i j * a p j) • w i p) =
    ∑ i : ι, ∑ j : ι,
      (a * b + b * a.transpose) i j • w i j :=
  coefficient_both w a b

example (w : Fin 0 → Fin 0 → ℂ)
    (a b : Matrix (Fin 0) (Fin 0) ℂ) :
    (∑ i : Fin 0, ∑ j : Fin 0, ∑ p : Fin 0,
       (a p i * b i j) • w p j) +
    (∑ i : Fin 0, ∑ j : Fin 0, ∑ p : Fin 0,
       (b i j * a p j) • w i p) =
    ∑ i : Fin 0, ∑ j : Fin 0,
       (a * b + b * a.transpose) i j • w i j :=
  coefficient_both w a b

example (w : Fin 1 → Fin 1 → ℂ)
    (a b : Matrix (Fin 1) (Fin 1) ℂ) :
    (∑ i : Fin 1, ∑ j : Fin 1, ∑ p : Fin 1,
       (a p i * b i j) • w p j) +
    (∑ i : Fin 1, ∑ j : Fin 1, ∑ p : Fin 1,
       (b i j * a p j) • w i p) =
    ∑ i : Fin 1, ∑ j : Fin 1,
       (a * b + b * a.transpose) i j • w i j :=
  coefficient_both w a b

example (w : Fin 2 → Fin 2 → ℂ)
    (a b : Matrix (Fin 2) (Fin 2) ℂ) :
    (∑ i : Fin 2, ∑ j : Fin 2, ∑ p : Fin 2,
       (a p i * b i j) • w p j) +
    (∑ i : Fin 2, ∑ j : Fin 2, ∑ p : Fin 2,
       (b i j * a p j) • w i p) =
    ∑ i : Fin 2, ∑ j : Fin 2,
       (a * b + b * a.transpose) i j • w i j :=
  coefficient_both w a b

example (w : Fin 3 → Fin 3 → ℂ)
    (a b : Matrix (Fin 3) (Fin 3) ℂ) :
    (∑ i : Fin 3, ∑ j : Fin 3, ∑ p : Fin 3,
       (a p i * b i j) • w p j) +
    (∑ i : Fin 3, ∑ j : Fin 3, ∑ p : Fin 3,
       (b i j * a p j) • w i p) =
    ∑ i : Fin 3, ∑ j : Fin 3,
       (a * b + b * a.transpose) i j • w i j :=
  coefficient_both w a b

private def e00 : Matrix (Fin 2) (Fin 2) ℂ :=
  fun i j => if i = 0 ∧ j = 0 then 1 else 0

example :
    (1 : Matrix (Fin 2) (Fin 2) ℂ) * e00 +
      e00 * (1 : Matrix (Fin 2) (Fin 2) ℂ).transpose =
    e00 + e00 := by
  simp

example :
    (1 : Matrix (Fin 2) (Fin 2) ℂ) * e00 -
      e00 * (1 : Matrix (Fin 2) (Fin 2) ℂ) = 0 := by
  simp

example : e00 (0 : Fin 2) (0 : Fin 2) = 1 := by
  simp [e00]

#print axioms left_consumer
#print axioms right_consumer
#print axioms both_consumer

end
end FCP.BFSSP3M4QTC0CAbstractCoefficientIndependentConsumer
