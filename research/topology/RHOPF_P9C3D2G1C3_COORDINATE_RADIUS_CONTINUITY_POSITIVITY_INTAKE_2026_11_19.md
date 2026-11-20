# RHOPF-P9C3D2G1C3 — coordinate radius continuity and nonzero positivity intake

**Pacific date:** 2026-11-19.  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED until source-native and independently imported strict GREEN.

G1C1 [#44688527281](https://github.com/etblink/math/actions/runs/44688527281) accepted strict native and independent positivity `x ≠ 0 → 0 < Q(x)`. G1C2 [#44690789047](https://github.com/etblink/math/actions/runs/44690789047) accepted continuity `Continuous Q` at exact tested `577cc56424d9a35e08226c7fd4a2a28f4d05ed82`; G1C2 qualification preserved at `9fdbdd05a751a6718899d27b60aa358b6ff55b00`.

## Two bounded statements

Define `relationalRangeCoordinateRadius x := Real.sqrt (relationalRangeCoordinateDotSelf x)`. Prove (1) `Continuous relationalRangeCoordinateRadius` using pinned `Real.continuous_sqrt.comp`; (2) `x ≠ 0 → 0 < relationalRangeCoordinateRadius x` from accepted G1C1 and pinned `Real.sqrt_pos.mpr`. Both native declarations, both independent original source-typed consumers and both axiom reports must pass. Preserve the exact source-defined quadratic form; no alternative spinor matrix or basis.

This prepares the denominator for radial normalizations, **but does not construct the normalization or its inverse**, a standard (S³) homeomorphism, Hopf quotient, Circle-equivariant identification, physical Fock implementer, gauge/Hamiltonian theorem or topological excitation.

## Strict acceptance

Exact frozen BFSS Gamma9/projector/Circle and G0A/B/C, G1A/B/C0/C1/C2 source blob pins, original integer fixture, exact new original and independent consumer hashes; Lean 4.34.1 and pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; warnings-as-errors native and independently imported consumer; all `#print axioms` reports restricted to `propext`, `Classical.choice`, `Quot.sound`, and no `sorryAx`; original ZIP checksum and embedded tested commit independently verified. Stop and preserve any RED before repair. No proof-budget changes or edits to `main`.
