# P3-D5B0 GREEN acceptance and bounded D5B1 L² separation pre-gate — 2026-11-12

**Branch** `integration/bfss-unified-research-20261108`. Source-preserving / original-Fock-only policy remains in force.

## Accepted D5B0

- Strict run https://github.com/etblink/math/actions/runs/43309538795 completed **success**, attempt 1, exact tested commit `c92ac1806266944400d877ab1894b97f71183e48`.
- The 69 pinned historical/source/consumer blob checks passed, including immutable original source `9c870ed078e09d9bd58dd267c5e21d7fa70cbd40` and independent consumer `24201b4ee6f3f9e1feb2a4a4ff94917d214f9585`.
- Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; full cold build 9178 jobs; independent consumer and warnings-as-error checks green; only `propext`, `Classical.choice`, `Quot.sound`.
- Evidence artifact ID `13985968581`, digest `sha256:8dab5c1869d09663efe0877c64541fc615dbd47034c5661303046824b538c901`.
- Accepted theorem `originalFockHilbertColumnField_memLp_iff`: finite original-Fock Hilbert-column field is in `L²` iff every genuine Fock-valued column is.
- Accepted `originalFockL2ColumnProjection` and `originalFockL2ColumnProjection_apply_ae`: source-exact continuous complex-linear `L²` coordinate projections with precise a.e. meaning. Independent consumer exercised genuine `Boson 2`.

## D5B1 candidate: columns separate original-Fock L² fields

- A generic finite-index proof that all coordinates equal a.e. imply equality in `Lp (PiLp 2 _) 2 μ`, using pinned Mathlib `Filter.eventually_all`, `Lp.ext`, `PiLp.ext`. Proven generically *before* specialization to `Fermion 2` avoids large-source elaboration recursion.
- Specialize to D5B0 projections: if every continuous `L²` projection of two actual `Fermion 2`-valued finite Hilbert-column fields agrees, then the fields agree. The proof chains the accepted `originalFockL2ColumnProjection_apply_ae` twice.
- Independent consumer checks equality, zero detection, iff equality, and the literal original `Boson 2` Lebesgue base.
- Carry all 69 prior pins byte-identically; add only source+consumer = 71 pins. Align the new exact Lake build target / olean path / import assertions; test under cold source, independent consumer, allowed axioms.
- **Scope limitation:** injectivity of all projections is not the surjectivity or norm identity of the finite-`L²` direct sum. Nor does this establish the operator-valued Hilbert–Schmidt `L²` equivalence, SU2 gauge fixedness, closed Hamiltonian graph equality, spectral localization or a mass gap.
- **Next after B1:** finitely indexed `L²` inner-product norm decomposition; test separately from the converse/surjectivity. Reuse `L2.inner_def`, `PiLp.inner_apply`, `integrable_inner`, `integral_finsetSum` from pinned Mathlib and source D5B0. Do not infer the original BFSS spectral conclusion.

**Status:** D5B1 candidate only until its own strict-green CI gate.
