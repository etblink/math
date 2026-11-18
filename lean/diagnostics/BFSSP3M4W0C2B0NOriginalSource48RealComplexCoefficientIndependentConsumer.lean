import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2B0NOriginalSource48RealComplexCoefficientAdapter

/-!
# W0C2B0N R1 — independent consumer of actual Source48 real/complex adapter

Imports the newly staged original provider. No surrogate operators, original
K(A) bracket, unproved 48-gamma centrality or physical conclusions.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0C2B0NOriginalSource48RealComplexCoefficientIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M4W0C2B0NOriginalSource48RealComplexCoefficientAdapter

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev MatR := Matrix Source48Label Source48Label ℝ

theorem originalSource48Fock_real_column_to_complex_consumer
    (A : MatR) (x : Source48Label → Op) (k : Source48Label) :
    (∑ p : Source48Label, (A p k : ℝ) • x p) =
    ∑ p : Source48Label, (originalSource48_complexify A) p k • x p :=
  originalSource48Fock_real_column_to_complex A x k

theorem originalSource48_complexify_commutator_consumer
    (A B : MatR) :
    originalSource48_complexify (A * B - B * A) =
      originalSource48_complexify A * originalSource48_complexify B -
      originalSource48_complexify B * originalSource48_complexify A :=
  originalSource48_complexify_commutator A B

theorem originalSource48Fock_real_commutator_column_to_complex_consumer
    (A B : MatR) (x : Source48Label → Op) (k : Source48Label) :
    (∑ p : Source48Label, ((A * B - B * A) p k : ℝ) • x p) =
    ∑ p : Source48Label,
      ((originalSource48_complexify A * originalSource48_complexify B -
        originalSource48_complexify B * originalSource48_complexify A) p k) • x p :=
  originalSource48Fock_real_commutator_column_to_complex A B x k

-- Three separately typechecked genuine original-source controls.
example (A : MatR) (x : Source48Label → Op) (k : Source48Label) :
    (∑ p : Source48Label, (A p k : ℝ) • x p) =
    ∑ p : Source48Label, (originalSource48_complexify A) p k • x p :=
  originalSource48Fock_real_column_to_complex_consumer A x k

example (A B : MatR) :
    originalSource48_complexify (A * B - B * A) =
      originalSource48_complexify A * originalSource48_complexify B -
      originalSource48_complexify B * originalSource48_complexify A :=
  originalSource48_complexify_commutator_consumer A B

example (A B : MatR) (x : Source48Label → Op) (k : Source48Label) :
    (∑ p : Source48Label, ((A * B - B * A) p k : ℝ) • x p) =
    ∑ p : Source48Label,
      ((originalSource48_complexify A * originalSource48_complexify B -
        originalSource48_complexify B * originalSource48_complexify A) p k) • x p :=
  originalSource48Fock_real_commutator_column_to_complex_consumer A B x k

#print axioms originalSource48Fock_real_column_to_complex_consumer
#print axioms originalSource48_complexify_commutator_consumer
#print axioms originalSource48Fock_real_commutator_column_to_complex_consumer

end
end FCP.BFSSP3M4W0C2B0NOriginalSource48RealComplexCoefficientIndependentConsumer
