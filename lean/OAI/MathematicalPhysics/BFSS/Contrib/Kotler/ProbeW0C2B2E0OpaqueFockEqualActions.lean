import Mathlib.Tactic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2B1OriginalFockJacobiCovarianceActionR2

/-!
# BFSS W0C2B2 E0 — opaque original Fock equality-of-actions microgate

New route after the stopped B2/D0/D1/D2A source-definitional attempts.
The ONLY operator carrier is the original Fermion 2 complex Fock algebra.
P, Q and X remain variables; they are NOT the expanded original K(A).
The result is conditional on a separately obtained equality of actions,
which is NOT supplied here. No source-gamma centrality or Lie bracket claim.
-/

set_option autoImplicit false

namespace FCP.BFSSW0C2B2E0OpaqueFockEqualActions
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Noncommutative equality of the actions of two OPAQUE genuine original
Fock operators implies their DIFFERENCE commutes with an opaque test
operator. No K(A) or gamma term is elaborated in this proof. -/
theorem originalFock_equal_actions_implies_difference_commutes
    (P Q X : Op)
    (h : P * X - X * P = Q * X - X * Q) :
    Commute (P - Q) X := by
  change (P - Q) * X = X * (P - Q)
  simp only [sub_mul, mul_sub]
  calc
    P * X - Q * X =
        (P * X - X * P) - (Q * X - X * Q) +
          (X * P - X * Q) := by abel
    _ = X * P - X * Q := by rw [h]; simp

/-- This interface accepts TWO independently proved action equations with
the SAME explicitly typed column C; it does not infer their equality
by expanding their original operators. -/
theorem originalFock_equal_columns_implies_difference_commutes
    (P Q X C : Op)
    (hP : P * X - X * P = C)
    (hQ : Q * X - X * Q = C) :
    Commute (P - Q) X := by
  exact originalFock_equal_actions_implies_difference_commutes P Q X
    (hP.trans hQ.symm)

/-- A family of identical columns yields the centralizer property on
the entire indexed family, still on the exact original Fock carrier.
A subsequent source-specific proof must supply BOTH real gamma actions. -/
theorem originalFock_equal_column_family_implies_difference_commutes
    {ι : Type*} (P Q : Op) (x C : ι → Op)
    (hP : ∀ k : ι, P * x k - x k * P = C k)
    (hQ : ∀ k : ι, Q * x k - x k * Q = C k) :
    ∀ k : ι, Commute (P - Q) (x k) := by
  intro k
  exact originalFock_equal_columns_implies_difference_commutes
    P Q (x k) (C k) (hP k) (hQ k)

#print axioms originalFock_equal_actions_implies_difference_commutes
#print axioms originalFock_equal_columns_implies_difference_commutes
#print axioms originalFock_equal_column_family_implies_difference_commutes

end
end FCP.BFSSW0C2B2E0OpaqueFockEqualActions
