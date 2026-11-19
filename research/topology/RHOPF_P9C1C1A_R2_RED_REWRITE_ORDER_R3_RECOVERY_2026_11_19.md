# RHOPF-P9C1C1A R2 — native RED two rewrite-order failures; bounded R3

**Date:** November 19, 2026.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Exact original R2 run:** [#44568940095](https://github.com/etblink/math/actions/runs/44568940095) — completed **RED**.
**Exact tested SHA:** `0ca772854001b8760f9205096d5408eee8055d20`.
**Retained artifact:** [#14554437733](https://github.com/etblink/math/actions/runs/44568940095/artifacts/14554437733). ZIP SHA-256 `2ad9385ff15ccd2de04c317e454affc31d832ceda08d584231b53f5e9a558c04`; independently downloaded and matched GitHub digest, with `exact-tested-commit.txt` matching tested SHA.

## R2 native compiler diagnosis

Preflight original source hashes/contracts PASS; frozen Lean 4.34.1/Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 PASS; qualified original gamma/projector/coordinate-bridge dependencies PASS; original integer fixture PASS.

R1's `open scoped Matrix` notation fix worked. R2 native file compiled `relationalProjector_fixed_of_common_action`, `selectedBasisFixed_of_common_action`, and `selectedCoordinatePlane_eq_projector_range_of_common_action` with only standard axioms.

However the full `relationalProjector_range_iff_common_action` proof failed at lines **92 and 99** with identical `rw [← Matrix.mulVec_mulVec, hw]` errors: the `mulVec_mulVec` rewrite first elaborated/rewrote the source `KA *ᵥ v` itself (KA abbreviates two gammas), rather than the desired right-hand `(KA * relationalProjector) *ᵥ w`. That left no occurrence of `relationalProjector *ᵥ w` for `hw`. The failed declaration's R2 axiom report contains `sorryAx`. Independent typed Lean consumer was skipped. Thus R2 remains **RED**, no P9C1C1A promotion.

## Bounded R3 code operation

Change ONLY those two proof steps by separating:
1. `KA *ᵥ v = KA *ᵥ (relationalProjector *ᵥ w)` using `rw [hw]` (substitution into explicit RHS), and
2. `KA *ᵥ (relationalProjector *ᵥ w) = (KA * relationalProjector) *ᵥ w` by `Matrix.mulVec_mulVec w KA relationalProjector`.

Retain all four original theorem statements, all source imports, the unchanged independently typed consumer, exact frozen gamma/Core/Mathlib/Lean pins, ordinary resource limits and allowed root axioms. Only update the exact new native source Git blob pin in strict CI. No substitute source matrices, no partial proof promotion, no original BFSS Fock/Hamiltonian modifications.

## Acceptance test and scientific limit

R3 strictly qualifies only if native proof, separately compiled imported consumer, all eight theorem axiom reports with no `sorryAx`, exact tested commit and original ZIP digest match. If R3 fails, stop and diagnose its precise new result; do not call it mathematical disproof from a Lean proof adapter failure. Even if it passes, the original four coordinate basis actions remain **unproved**, so `im(P)=span(e0,e1,e8,e9)` and physical vortex/Noether/Fock conclusions remain unqualified.
