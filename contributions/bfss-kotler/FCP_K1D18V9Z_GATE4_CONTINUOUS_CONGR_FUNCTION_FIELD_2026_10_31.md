# K1D18V9Z — Gate 4 red: bundled ContinuousMonoidHom function-field bridge

Date: 2026-10-31 UTC
Research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.
Original Gate 4 tested commit: `ee3eead060decf869a2be0fe365dc7235798a178`.
Original Gate 4 source blob: `5fa045b08be2fb3de85f7b63afb8b22e149543ac`.
Original Gate 4 workflow blob: `ccb06a0c62d9cf85427c83143cf6041416afb8e7`.
Fourth red strict [Run #41242415143](https://github.com/etblink/math/actions/runs/41242415143), job `124658841358`, RED. Original failure artifact ID `13057449396`; digest `sha256:ba19d4c01b24c8e93335cc1e7efb6f3681c419cbad80ab07195bf4ef1a32779c`.

## Four separated red causes and evidence

1. [Run #41239583476](https://github.com/etblink/math/actions/runs/41239583476): `Multiplicative.continuous_toAdd` does not exist; the pinned Mathlib theorem is root-level `continuous_toAdd`.
2. [Run #41240548627](https://github.com/etblink/math/actions/runs/41240548627): `Multiplicative.ofAdd_toAdd` does not exist; the pinned Mathlib theorem is root-level `ofAdd_toAdd`.
3. [Run #41241412956](https://github.com/etblink/math/actions/runs/41241412956): an unapplied function composition inside `Continuous` is not eliminated by `Function.comp_apply`; exposed the function pointwise via `change Continuous (fun u => ...)`.
4. [Run #41242415143](https://github.com/etblink/math/actions/runs/41242415143): the explicit pointwise `change` **resolved the time-tag simplification**, but the final `simpa only [ofAdd_toAdd] using h` still leaves type `Continuous (fun u => f u)`, while the `ContinuousMonoidHom` constructor expects `Continuous (↑f).toFun`. These are pointwise the same, but the simplifier does not complete the conversion at the function level. All three definition obligations fail at source lines 40, 63 and 88 with matching type mismatch diagnostics. The six source declarations consequently print `sorryAx`; independent audit skipped.

Every red run passed exact source and Lean/Mathlib preflight, and accepted V9Y ancestry compilation. The fourth red is not a discontinuity theorem or a counterexample to the accepted V9X/V9Y real flows.

## Bounded Gate 5 corrective proof bridge

The pinned `Mathlib/Topology/Continuous.lean` provides
`Continuous.congr {g : X → Y} (h : Continuous f) (h' : ∀ x, f x = g x) : Continuous g`.
Use it to **transport continuity pointwise** from the source function to the target underlying bundled hom field. Retain the already working explicitly typed `change Continuous (fun u : Multiplicative ℝ => f (Multiplicative.ofAdd (Multiplicative.toAdd u))) at h`, and replace in three proofs exactly
```lean
simpa only [ofAdd_toAdd] using h
```
with
```lean
exact h.congr (fun u => by simpa only [ofAdd_toAdd])
```
This proves pointwise equality at the actual `u`, rather than asking `simpa` to recognize a hidden coercion from `MonoidHom` to its `toFun` field.

Strict workflow re-pins only the candidate source blob. All original six mathematical declarations, all `Source48Label` original 48-label Fock indexing, accepted V9X/V9Y ancestry and hashes, strict compiler, independent original carrier-specialized examples, six declaration-level axiom audits, and permitted axioms `propext`, `Classical.choice`, `Quot.sound` are unchanged.

This remains a **hypothesis**, not a qualification; Gate 5 must compile with `-DwarningAsError=true` and independently pass without `sorryAx`. No changed limits, weaker checks, new axioms, or original theorem statement changes. No changes to main, frozen FCP provenance or upstream mathcommunity.

The continuous one-parameter homs, if proven, are not global `Spin(9)→SO(48)` integration, determinant-one orientation, `Spin(48)` lift/covering, or BFSS physical/spectral claims.
