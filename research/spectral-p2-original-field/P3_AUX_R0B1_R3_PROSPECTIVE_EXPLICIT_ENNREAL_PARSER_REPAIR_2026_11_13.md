# P3-AUX-R0B1 R3 — explicit ENNReal type parser repair

**Date:** 2026-11-13 Pacific. **Status:** staged prospective source/consumer, UNQUALIFIED until exact strict GREEN.

## First causal history

- R1 [#43513258078](https://github.com/etblink/math/actions/runs/43513258078) RED at `1c36cb17` (real norm simplification, plus exponent notation failure).
- R2 [#43514755373](https://github.com/etblink/math/actions/runs/43514755373) RED at `2f419563` (real norm proof now compiled; two `ℝ≥0∞` parser failures only).
- [Immutable R2 red and two-analogous-red review](P3_AUX_R0B1_R2_RED_43514755373_FIRST_CAUSAL_2026_11_13.md), including artifact #14080721997 and SHA256 digest.

## Exactly bounded R3 change

Replace `(⊤ : ℝ≥0∞)` with **`(⊤ : ENNReal)`** in the two source type annotations for `MemLp` and `Lp`, and in the independent consumer's `MemLp` type. No change to statement meaning (same `WithTop ℝ≥0` extended nonnegative real), original `Boson 2`, volume, six roots, mathematical hypotheses, R0A input, native sixteen-charge output anchor, R2's now-compiling norm proof, or pinned build/CI workflow.

Strict source uses frozen Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, original Core blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`, accepted R0A source blob `a67f8740586588c6d4ee9c9148574c81c14d4937`. The existing strict workflow must compile *all six* roots and an independent consumer and enforce allowed axioms `propext`, `Classical.choice`, `Quot.sound`.

**Scope restriction:** even if R3 passes, only the continuous complex source radial reciprocal factor and actual `L∞` representative are qualified, not multiplication on original `FullL2`, sixteen-component `PiLp`, weighted charge graph, Hilbert-domain density, physical auxiliary Hamiltonian, positive gap, ground-state fidelity or related BFSS spectral claims.

Do not treat this repair memo as a proof receipt, and preserve both prior reds without rewriting qualified history.
