# MASSLESS-M1 — source-exact massless coefficient and real-scalar restriction: staged proof design

**Date:** 2026-11-21 (America/Los_Angeles). **Status:** source-read design only. No M1 source module or CI has been started. **Gate prerequisite:** MASSLESS-M0 must independently qualify with exact source/strict evidence. D1F R1/R2/R3 stay frozen native RED, no D1F R4.

## Original source inputs and exact physical meaning

At original `FermionQuantization.lean` blob `c6b72d030225c707ef54f5285a18a7a8175ee280`:

- `AlgebraData.fermionCoefficient x` is the **mass-deformed** coefficient `(3/2)·massT−bracket(x)`, not the massless original interaction matrix.
- `M.frequency_bracket_contraction x` proves an identity for `+bracket(x)` on literal original theta products.
- `M.deformedFermionField_bracket x` already proves
  `M.deformedFermionField 1 0 x = (((-Complex.I)/2) • (∑ j,∑ A,M.cubicFermionComponent x A j)).restrictScalars ℝ`.
- `M.quantizeFrequency K` is the **complex-linear** source Fock operator `(Complex.I/2) • ∑r,s (K r s:ℂ) • theta_r*theta_s`. Its real restriction is a different type; never conflate.
- The original generic self-adjointness theorem in `FrequencyOperators.lean` already exists. The novel next interface is **massless field equality**, not reproving fiber Hermiticity.

## Three smaller independently testable proof atoms

A. **Massless source matrix type and identity.** Define new `masslessSourceFrequency M x : FrequencyMatrix N := -FCP.BFSSMasslessM0.sourceBracketCoefficient M x`. Show
`masslessSourceFrequency M x = M.fermionCoefficient x − M.fermionCoefficient 0` by *source-typed entry equality*, not by importing failed D1F. The previously elaborated historical D1F first theorem shows the mathematical algebra is reasonable, but is not itself an accepted dependency. Ensure the zero-bosonic argument is explicitly typed as `(0 : Boson N)`.

B. **Complex-linear original finite-Fock quantizer normalization (M1a candidate).** From accepted M0 `sourceBracketCoefficient_negative_contraction`, establish *one literal original source equality*:
```lean
M.quantizeFrequency (masslessSourceFrequency M x) =
  ((-Complex.I) / 2) •
    (∑ j : SpaceIndex, ∑ A : ColorIndex N,
      M.cubicFermionComponent x A j)
```
Use one expected-type `change` to expose the original outer `Complex.I/2` scalar and finite double sum. Rewrite only with the accepted M0 negative-contraction theorem. Finish the **scalar** sign identity with explicit `smul_neg`, `neg_smul`, `neg_div` rather than broad `module`/`ring` or `simp <;> ring`. Keep this M1a gate on the complex-linear original `Fermion N →L[ℂ] Fermion N`; do not add a real-linear field goal to the same first-causal source until this atom is independently strict GREEN.

C. **Real-scalar restriction source field and downstream consumer (M1b candidate).** Only after M1a GREEN, use the exact source compiled `M.deformedFermionField_bracket x` and M1a equality to prove
```lean
M.deformedFermionField 1 0 x =
  (M.quantizeFrequency (masslessSourceFrequency M x)).restrictScalars ℝ
```
on the real-linear underlying original Fock space, then qualify an **independent literal paired SU(2) `pairedAlgebraData` consumer** with explicit two-root `#print axioms` reports. Use namespaced theorem application `FCP.BFSSMasslessM1a.* M x`, not erroneous `M.some_local_helper` field notation (a documented D1F R3 failure). Do not silently convert the massive h=m=1 source donor into massless h=1,m=0.

## Scientific and proof-engineering falsification controls

- **Sign control:** at `x=0`, massless `masslessSourceFrequency M 0=0`; however `M.fermionCoefficient 0` contains the deformation mass term. A theorem claiming both equal at x=0 without subtraction is wrong.
- **Model control:** `h=1,m=0` massless source versus `h=m=1` mass-deformed source. Reuse of the latter requires an explicit subtraction identity and real-restriction arithmetic.
- **Namespace control:** no `M.helper` for theorems in `FCP.BFSSMasslessM1a`; use explicit namespace.
- **CI control:** original source hashes, exact pinned Lean/Mathlib, warning-as-error native and strict compile, axiom roots only `[propext, Classical.choice, Quot.sound]`, independently verified original artifact ZIP, and a distinct consumer qualification. One evidence-driven repair maximum per microgate and two-RED STOP.
- **Physical control:** a fixed-boson original Fock operator is bounded but the (x)-dependent field on `FullL2` can be unbounded. This equality says nothing about the maximal multiplication domain, Gauss-physical closure, energy or spectrum.
- **Research counterfactual:** any attempted inference of a physical Hopfion or Standard Model family from 48×48 Majorana coefficient kernel structure, without an original gauge-invariant smooth-core and full-form energy statement, fails the physical eligibility test.

**Project Lead decision:** do not start M1 until exact MASSLESS-M0 original source result and archive are independently qualified. If M0 fails twice, archive both REDs and revise the proof architecture rather than attempting broad tactics.
