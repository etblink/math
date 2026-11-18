import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0C2B0MOriginalFockComplexNestedCoefficient

/-!
# W0C2B0M R1 — independent original complex Fock coefficient consumer

Imports only the new exact original Fock provider. No real coefficient
transport, Source48Label specialization, gamma-centrality, or K-bracket.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0C2B0MOriginalFockComplexNestedCoefficientIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSP3M4W0C2B0MOriginalFockComplexNestedCoefficient

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

theorem originalFock_complex_nested_coefficient_compose_consumer
    {ι : Type*} [Fintype ι]
    (x : ι → Op) (A B : Matrix ι ι ℂ) (k : ι) :
    (∑ p : ι, B p k • (∑ q : ι, A q p • x q)) =
    ∑ q : ι, (A * B) q k • x q :=
  originalFock_complex_nested_coefficient_compose x A B k

theorem originalFock_complex_nested_coefficient_bracket_consumer
    {ι : Type*} [Fintype ι]
    (x : ι → Op) (A B : Matrix ι ι ℂ) (k : ι) :
    (∑ p : ι, B p k • (∑ q : ι, A q p • x q)) -
    (∑ p : ι, A p k • (∑ q : ι, B q p • x q)) =
    ∑ q : ι, (A * B - B * A) q k • x q :=
  originalFock_complex_nested_coefficient_bracket x A B k

-- Two independently typechecked genuine Fermion 2 operator controls.
example {ι : Type*} [Fintype ι]
    (x : ι → Op) (A B : Matrix ι ι ℂ) (k : ι) :
    (∑ p : ι, B p k • (∑ q : ι, A q p • x q)) =
    ∑ q : ι, (A * B) q k • x q :=
  originalFock_complex_nested_coefficient_compose_consumer x A B k

example {ι : Type*} [Fintype ι]
    (x : ι → Op) (A B : Matrix ι ι ℂ) (k : ι) :
    (∑ p : ι, B p k • (∑ q : ι, A q p • x q)) -
    (∑ p : ι, A p k • (∑ q : ι, B q p • x q)) =
    ∑ q : ι, (A * B - B * A) q k • x q :=
  originalFock_complex_nested_coefficient_bracket_consumer x A B k

#print axioms originalFock_complex_nested_coefficient_compose_consumer
#print axioms originalFock_complex_nested_coefficient_bracket_consumer

end
end FCP.BFSSP3M4W0C2B0MOriginalFockComplexNestedCoefficientIndependentConsumer
