import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2B0OriginalRealFockCoefficientContraction

/-!
# W0C2B0 — independent original real coefficient contraction consumer
Only the exact original Fock source is imported. No physical bracket claim.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0C2B0OriginalRealFockCoefficientIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4W0C2B0OriginalRealFockCoefficientContraction

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
private abbrev Mat := Matrix Source48Label Source48Label ℝ

theorem originalFock_commutator_real_smul_consumer
    (T X : Op) (c : ℝ) :
    T * (c • X) - (c • X) * T =
      c • (T * X - X * T) :=
  originalFock_commutator_real_smul T X c

theorem originalFock_real_matrix_bracket_contraction_consumer
    {ι : Type*} [Fintype ι] (x : ι → Op)
    (A B : Matrix ι ι ℝ) (k : ι) :
    (∑ p : ι, (B p k : ℝ) •
      (∑ q : ι, (A q p : ℝ) • x q)) -
    (∑ p : ι, (A p k : ℝ) •
      (∑ q : ι, (B q p : ℝ) • x q)) =
    ∑ q : ι, ((A * B - B * A) q k : ℝ) • x q :=
  originalFock_real_matrix_bracket_contraction x A B k

theorem originalSource48_gamma_real_bracket_contraction_consumer
    (A B : Mat) (k : Source48Label) :
    (∑ p : Source48Label, (B p k : ℝ) •
      (∑ q : Source48Label, (A q p : ℝ) • sourceNormalizedGamma q)) -
    (∑ p : Source48Label, (A p k : ℝ) •
      (∑ q : Source48Label, (B q p : ℝ) • sourceNormalizedGamma q)) =
    ∑ q : Source48Label,
      ((A * B - B * A) q k : ℝ) • sourceNormalizedGamma q :=
  originalSource48_gamma_real_bracket_contraction A B k

-- Three actual original source carrier controls: scalar transport,
-- arbitrary real 48×48 nested coefficient contraction, source gamma.
example (T X : Op) (c : ℝ) :
    T * (c • X) - (c • X) * T =
      c • (T * X - X * T) :=
  originalFock_commutator_real_smul_consumer T X c

example (A B : Mat) (k : Source48Label) (x : Source48Label → Op) :
    (∑ p : Source48Label, (B p k : ℝ) •
      (∑ q : Source48Label, (A q p : ℝ) • x q)) -
    (∑ p : Source48Label, (A p k : ℝ) •
      (∑ q : Source48Label, (B q p : ℝ) • x q)) =
    ∑ q : Source48Label, ((A * B - B * A) q k : ℝ) • x q :=
  originalFock_real_matrix_bracket_contraction_consumer x A B k

example (A B : Mat) (k : Source48Label) :
    (∑ p : Source48Label, (B p k : ℝ) •
      (∑ q : Source48Label, (A q p : ℝ) • sourceNormalizedGamma q)) -
    (∑ p : Source48Label, (A p k : ℝ) •
      (∑ q : Source48Label, (B q p : ℝ) • sourceNormalizedGamma q)) =
    ∑ q : Source48Label,
      ((A * B - B * A) q k : ℝ) • sourceNormalizedGamma q :=
  originalSource48_gamma_real_bracket_contraction_consumer A B k

#print axioms originalFock_commutator_real_smul_consumer
#print axioms originalFock_real_matrix_bracket_contraction_consumer
#print axioms originalSource48_gamma_real_bracket_contraction_consumer

end
end FCP.BFSSP3M4W0C2B0OriginalRealFockCoefficientIndependentConsumer
