import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.ProbeW0C2B2E0OpaqueFockEqualActions
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2AOriginalBivectorLieDefectTraceBridge

/-!
Independent consumer: generic source lemma on the original Fermion 2 Fock
carrier, plus the ACTUAL original normalized Source48 gamma family as an
explicit consumer parameter. P,Q are opaque, not source K(A) expressions.
No unconditional all-48 centrality is established.
-/

set_option autoImplicit false

namespace FCP.BFSSW0C2B2E0OpaqueFockEqualActionsConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSW0C2B2E0OpaqueFockEqualActions

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

theorem originalFock_equal_actions_implies_difference_commutes_consumer
    (P Q X : Op)
    (h : P * X - X * P = Q * X - X * Q) :
    Commute (P - Q) X :=
  originalFock_equal_actions_implies_difference_commutes P Q X h

theorem originalFock_equal_columns_implies_difference_commutes_consumer
    (P Q X C : Op)
    (hP : P * X - X * P = C)
    (hQ : Q * X - X * Q = C) :
    Commute (P - Q) X :=
  originalFock_equal_columns_implies_difference_commutes P Q X C hP hQ

/-- Genuine original 48 normalized Majoranas are used at this importing
consumer; both equality hypotheses are separate, still missing source
obligations. This is NOT original K(A) centrality. -/
theorem originalFock_equal_gamma_columns_difference_commutes_consumer
    (P Q : Op) (C : Source48Label → Op)
    (hP : ∀ k : Source48Label,
      P * sourceNormalizedGamma k - sourceNormalizedGamma k * P = C k)
    (hQ : ∀ k : Source48Label,
      Q * sourceNormalizedGamma k - sourceNormalizedGamma k * Q = C k) :
    ∀ k : Source48Label,
      Commute (P - Q) (sourceNormalizedGamma k) := by
  exact originalFock_equal_column_family_implies_difference_commutes
    P Q sourceNormalizedGamma C hP hQ

/-- Control: the two original Fock input operators coincide. No source
expanded K(A) formula is placed in this reflexive equality. -/
example (P X : Op) : Commute (P - P) X := by
  exact originalFock_equal_actions_implies_difference_commutes P P X rfl

/-- Control: 48-label original gamma instantiated only at the leaf. -/
example (P : Op) (k : Source48Label) :
    Commute (P - P) (sourceNormalizedGamma k) := by
  exact originalFock_equal_actions_implies_difference_commutes
    P P (sourceNormalizedGamma k) rfl

#print axioms originalFock_equal_actions_implies_difference_commutes_consumer
#print axioms originalFock_equal_columns_implies_difference_commutes_consumer
#print axioms originalFock_equal_gamma_columns_difference_commutes_consumer

end
end FCP.BFSSW0C2B2E0OpaqueFockEqualActionsConsumer
