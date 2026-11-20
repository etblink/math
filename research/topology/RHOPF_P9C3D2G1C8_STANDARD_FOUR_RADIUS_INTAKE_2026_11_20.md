# RHOPF-P9C3D2G1C8 — standard Euclidean real-four radius intake

**Pacific date:** 2026-11-20.  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED until native original and separately imported consumer strict GREEN.

## Accepted original Gamma9 source context

G1C7 strict GREEN [#44702819736](https://github.com/etblink/math/actions/runs/44702819736) at exact tested `72eb7f492f45e3ff99491b9b11d2fd8d91fbf23f`, qualified and preserved in `2bab306cb13563e67d9839512ef191e341d3ebed`. G1C7 proves continuous retraction from nonzero coordinate subtype to the source-original Gamma9 transported `Q=1` subtype. This retraction is noninjective on the entire punctured R4; no punctured-to-sphere homeomorphism should be asserted.

## Next source-exact bounded theorem

Define `standardCoordinateRadius x := Real.sqrt (x ⬝ᵥ x)` for `x : Fin 4 → ℝ`, explicitly using standard real-four **Euclidean dot-self**, NOT the Pi product sup norm. Prove:
- `Continuous standardCoordinateRadius` from pinned `Continuous.dotProduct` and `Real.continuous_sqrt`.
- `x ≠ 0 → 0 < standardCoordinateRadius x` from finite real squares nonnegative, `dotProduct_self_eq_zero`, and `Real.sqrt_pos.mpr`.

Only these two declarations are in scope. A later gate can define `StandardUnitCoordinates := {x : Fin 4 → ℝ // x ⬝ᵥ x = 1}` and construct the two radial maps `QUnit → StandardUnit` and `StandardUnit → QUnit`, with explicit dot-self and Q homogeneity, continuity, inverse identities, and independent checks. No current claim of an `S³` homeomorphism, isometry, Circle-equivariant standard Hopf quotient, BFSS Fock implementation or physical topological soliton.

## Strict controls

Original BFSS/Gamma9 projector/Circle and accepted G0A/B/C/G1A/B/C0/C1/C2/C3/C4/C5/C6/C7 exact source bytes, source-independent original signed-permutation integer fixture, new native and independent consumer blob pins, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, warnings-as-errors native and independent consumer, both reports restricted to `propext`, `Classical.choice`, `Quot.sound` with no `sorryAx`, independently checked original ZIP SHA256 and tested commit. Preserve any RED as diagnostic, no proof-budget increases, no rewrite of source gamma matrices or write to main.
