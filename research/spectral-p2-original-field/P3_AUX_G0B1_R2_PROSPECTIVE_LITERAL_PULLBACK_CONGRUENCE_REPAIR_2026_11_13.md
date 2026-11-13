# P3-AUX-G0B1 R2 — prospective source-exact Lp wrapper conversion repair

**Date:** 2026-11-13 Pacific. **Status:** PENDING STRICT QUALIFICATION. Repair does not alter the mathematical theorem or its exact original SU(2) gauge action.

R1 [strict RED #43526064993](https://github.com/etblink/math/actions/runs/43526064993) at exact tested commit `4a1425588021ac88736253a2978d3c4acc22747c` has first-causal failure at source line 50 `rw [hf]`: `hf` came from `Lp.coeFn_compMeasurePreserving f ...`, but the target is the source `pairedGaugeData.bosonPullback g` packaged through Mathlib `Lp.compMeasurePreservingₗ ℂ`. The term is convertible, but Lean's syntactic rewrite matcher did not find it. [Immutable R1 first-causal receipt](P3_AUX_G0B1_R1_RED_43526064993_FIRST_CAUSAL_2026_11_13.md); artifact #14085322981.

## Scope-limited R2 change

- Replace exactly one source proof tactic `by rw [hf]` with `by exact congrArg (fun v : Fermion 2 => originalReciprocalField ε x • v) hf`.
- `congrArg` applies the genuine original scalar multiplication to the existing a.e. equality without a syntactic `rw`; Lean definitional reduction should recognize `GaugeData.bosonPullback` as the original Mathlib pullback linear map.
- Keep the exact original `FullL2 2`, `Boson 2`, `Fermion 2`, `pairedGaugeData`, true group direction g, the `G0B0` source AE identity, `G0A` original gauge radial invariance and the complete initial theorem statement byte-for-byte identical. No simplification axioms, sorry or proxy source.
- Freeze R1 independent consumer blob `f45d0a97cc475b04205aeddfd290248f7e3b529f`, strict workflow blob `08db24155cbc9eb8e9fa2d85eaa42381ecdffc66`, original Core/R0A/R0B1/R0B2A/G0A/G0B0/G4J blobs and Lean 4.34.1 Mathlib d13f23b7.

## Qualification rule

A future exact strict new source and native independent consumer GREEN, exact one root and only permitted `propext, Classical.choice, Quot.sound` axioms is necessary to qualify the bosonic commutation theorem. The R1 red is permanent negative knowledge. If red again, preserve the earliest new compiler error and revisit transparent source convertibility without modifying the statement.

**Exclusions:** no fermionic fiber-action commutation, no preservation of exact `pairedGaugeData.physicalSpace`, no Haar projector commutator, no infinitesimal Gauss operator, no original 16-output PiLp lift, injectivity, weighted original charge, auxiliary Hamiltonian, Hardy estimate or gap. Latest accepted original physical operator remains M5BF0.
