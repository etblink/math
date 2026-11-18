import Mathlib.Tactic

/-!
# SM-D1-SCC1: elementary witness-separation foundations

A small, original Lean formalization. The predictor maps a proposed model
and an observable to a deterministic Bool; this is *synthetic mathematics*,
not a Standard Model physical prediction, likelihood, or experiment.

Counterfactual separation means disagreement at a named witness, while
uniform separation means that *all* listed model pairs can be separated.
Minimality here is deletion-minimality on a finite witness set; there is
no global MCS uniqueness result. Missing predictions are represented by
Option Bool in a distinct relation that refuses to treat none = none as
physical agreement.

No NFC/SCC theorem, BFSS premise or hidden physical map is imported.
-/

set_option autoImplicit false

namespace FCP.StandardModel.SMD1SCC1

universe u v
variable {Model : Type u} {Obs : Type v}

/-- Two model instances agree on *the listed observations only*. -/
def AgreesOn (p : Model → Obs → Bool) (S : Set Obs) (a b : Model) : Prop :=
  ∀ w, w ∈ S → p a w = p b w

/-- A genuine distinction has a witness belonging to the named set. -/
def SeparatesOn (p : Model → Obs → Bool) (S : Set Obs) (a b : Model) : Prop :=
  ∃ w, w ∈ S ∧ p a w ≠ p b w

theorem agrees_refl (p : Model → Obs → Bool) (S : Set Obs) (a : Model) :
    AgreesOn p S a a := by
  intro w hw
  rfl

theorem agrees_symm (p : Model → Obs → Bool) (S : Set Obs) (a b : Model)
    (hab : AgreesOn p S a b) : AgreesOn p S b a := by
  intro w hw
  exact (hab w hw).symm

theorem agrees_trans (p : Model → Obs → Bool) (S : Set Obs) (a b c : Model)
    (hab : AgreesOn p S a b) (hbc : AgreesOn p S b c) :
    AgreesOn p S a c := by
  intro w hw
  exact (hab w hw).trans (hbc w hw)

theorem separation_not_agreement (p : Model → Obs → Bool)
    (S : Set Obs) (a b : Model) (h : SeparatesOn p S a b) :
    ¬ AgreesOn p S a b := by
  intro hsame
  rcases h with ⟨w, hw, hne⟩
  exact hne (hsame w hw)

theorem disagreement_has_witness (p : Model → Obs → Bool)
    (S : Set Obs) (a b : Model) (h : ¬ AgreesOn p S a b) :
    SeparatesOn p S a b := by
  classical
  by_contra hsep
  apply h
  intro w hw
  by_contra hne
  apply hsep
  exact ⟨w, hw, hne⟩

theorem separation_mono (p : Model → Obs → Bool)
    (S T : Set Obs) (a b : Model) (hST : S ⊆ T)
    (h : SeparatesOn p S a b) : SeparatesOn p T a b := by
  rcases h with ⟨w, hw, hne⟩
  exact ⟨w, hST hw, hne⟩

theorem agreement_antitone (p : Model → Obs → Bool)
    (S T : Set Obs) (a b : Model) (hST : S ⊆ T)
    (h : AgreesOn p T a b) : AgreesOn p S a b := by
  intro w hw
  exact h w (hST hw)

/-- Finite witnesses may be searched individually, with no probability input. -/
def FiniteSeparates (p : Model → Obs → Bool) (S : Finset Obs)
    (a b : Model) : Prop :=
  ∃ w, w ∈ S ∧ p a w ≠ p b w

theorem finite_separation_mono (p : Model → Obs → Bool)
    (S T : Finset Obs) (a b : Model) (hST : S ⊆ T)
    (h : FiniteSeparates p S a b) : FiniteSeparates p T a b := by
  rcases h with ⟨w, hw, hne⟩
  exact ⟨w, hST hw, hne⟩

/-- Deletion minimality; not a claim of uniqueness of possible minima. -/
def DeletionMinimal (p : Model → Obs → Bool) [DecidableEq Obs]
    (S : Finset Obs) (a b : Model) : Prop :=
  FiniteSeparates p S a b ∧
    ∀ w, w ∈ S → ¬ FiniteSeparates p (S.erase w) a b

theorem singleton_deletion_minimal (p : Model → Obs → Bool)
    [DecidableEq Obs] (a b : Model) (w : Obs)
    (hne : p a w ≠ p b w) :
    DeletionMinimal p ({w} : Finset Obs) a b := by
  constructor
  · exact ⟨w, by simp, hne⟩
  · intro v hv
    have hvw : v = w := Finset.mem_singleton.mp hv
    subst v
    intro hs
    rcases hs with ⟨x, hx, _⟩
    simp at hx

/-- Distinguishing witnesses may produce distinct equally minimal supports. -/
theorem distinct_singleton_minimals (p : Model → Obs → Bool)
    [DecidableEq Obs] (a b : Model) (w₁ w₂ : Obs)
    (hneq : w₁ ≠ w₂)
    (h₁ : p a w₁ ≠ p b w₁) (h₂ : p a w₂ ≠ p b w₂) :
    DeletionMinimal p ({w₁} : Finset Obs) a b ∧
    DeletionMinimal p ({w₂} : Finset Obs) a b ∧
    ({w₁} : Finset Obs) ≠ ({w₂} : Finset Obs) := by
  refine ⟨singleton_deletion_minimal p a b w₁ h₁,
    singleton_deletion_minimal p a b w₂ h₂, ?_⟩
  intro hsets
  have hw : w₁ ∈ ({w₂} : Finset Obs) := by
    rw [← hsets]
    simp
  exact hneq (Finset.mem_singleton.mp hw)

/-- Uniform separation of all permissible points, not merely one fit. -/
def UniformlySeparates (p : Model → Obs → Bool)
    (A B : Set Model) (S : Finset Obs) : Prop :=
  ∀ a, a ∈ A → ∀ b, b ∈ B → FiniteSeparates p S a b

theorem uniform_separation_mono (p : Model → Obs → Bool)
    (A B : Set Model) (S T : Finset Obs) (hST : S ⊆ T)
    (h : UniformlySeparates p A B S) : UniformlySeparates p A B T := by
  intro a ha b hb
  exact finite_separation_mono p S T a b hST (h a ha b hb)

/-- If two families share a scenario, uniform separation is impossible. -/
theorem overlap_blocks_uniform (p : Model → Obs → Bool)
    (A B : Set Model) (S : Finset Obs)
    (hab : ∃ x, x ∈ A ∧ x ∈ B) :
    ¬ UniformlySeparates p A B S := by
  intro h
  rcases hab with ⟨x, ha, hb⟩
  rcases h x ha x hb with ⟨w, _, hne⟩
  exact hne rfl

/-- Complete agreement requires a shared *present* prediction, not none. -/
def FullyAgrees (p : Model → Obs → Option Bool)
    (S : Finset Obs) (a b : Model) : Prop :=
  ∀ w, w ∈ S → ∃ value : Bool,
    p a w = some value ∧ p b w = some value

/-- An explicit present-present difference; absent predictions cannot separate. -/
def DefinedSeparation (p : Model → Obs → Option Bool)
    (S : Finset Obs) (a b : Model) : Prop :=
  ∃ w, w ∈ S ∧ ∃ va vb : Bool,
    p a w = some va ∧ p b w = some vb ∧ va ≠ vb

theorem missing_blocks_agreement (p : Model → Obs → Option Bool)
    (S : Finset Obs) (a b : Model) (w : Obs)
    (hw : w ∈ S) (hmissing : p a w = none) :
    ¬ FullyAgrees p S a b := by
  intro h
  rcases h w hw with ⟨value, hvalue, _⟩
  rw [hmissing] at hvalue
  cases hvalue

theorem defined_separation_not_agreement (p : Model → Obs → Option Bool)
    (S : Finset Obs) (a b : Model)
    (h : DefinedSeparation p S a b) :
    ¬ FullyAgrees p S a b := by
  intro hagree
  rcases h with ⟨w, hw, va, vb, ha, hb, hne⟩
  rcases hagree w hw with ⟨v, ha', hb'⟩
  have h₁ : va = v := Option.some.inj (ha.symm.trans ha')
  have h₂ : vb = v := Option.some.inj (hb.symm.trans hb')
  exact hne (h₁.trans h₂.symm)

#print axioms agrees_refl
#print axioms agrees_symm
#print axioms agrees_trans
#print axioms separation_not_agreement
#print axioms disagreement_has_witness
#print axioms separation_mono
#print axioms agreement_antitone
#print axioms finite_separation_mono
#print axioms singleton_deletion_minimal
#print axioms distinct_singleton_minimals
#print axioms uniform_separation_mono
#print axioms overlap_blocks_uniform
#print axioms missing_blocks_agreement
#print axioms defined_separation_not_agreement

end FCP.StandardModel.SMD1SCC1
