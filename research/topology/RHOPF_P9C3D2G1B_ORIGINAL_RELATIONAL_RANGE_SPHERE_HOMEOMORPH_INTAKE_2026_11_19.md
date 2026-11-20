# RHOPF-P9C3D2G1B — exact source-intrinsic unit sphere homeomorphism

**Pacific date:** 2026-11-19.  
**Branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED until original native and independently imported source strict GREEN.

## Accepted predecessor

G1A R4 strict GREEN [#44682661002](https://github.com/etblink/math/actions/runs/44682661002), tested commit `6aed1d99ff1a9a75220c8044cba1e83b1da89a37`, qualification accepted in `8b21e43a7ea81fc3429f229d1f09cf0512d8a380`. G1A proves an explicit `Equiv` between original fixed norm-one spinors and the unit sphere of the actual original Gamma9 projector range, without selecting a basis.

## Bounded G1B proof contract

Prove exactly:
```lean
noncomputable def relationalUnitSpinorHomeomorphRange :
    RelationalUnitSpinor ≃ₜ RelationalRangeUnitSphere
```
with `toEquiv := relationalUnitSpinorEquivRange`. The forward map is the identity in the original real 16-spinor ambient carrier, wrapped in range then unit-sphere subtypes. The inverse is the original range carrier wrapped back in the fixed-vector subtype, via source-original idempotence. Its two continuity proofs use only the natural inherited subtype topologies (pinned `continuous_subtype_val` and `Continuous.subtype_mk` already accepted in F4).

This is a topology-only bridge; it does not assert a coordinate identification with `S³`, any metric isometry, standard Hopf quotient, physical Fock implementation, or nontrivial topological defect.

## Strict source and independent controls

Keep exact source/Gamma9/relational group/projector/G0A/B/C/G1A pins, new G1B original/consumer hash pins, original integer fixture; restore pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; warnings-as-errors source native compile, separately imported consumer and both original axiom reports (allowed only `propext`, `Classical.choice`, `Quot.sound`); original ZIP independently verified SHA and embedded tested commit. No automatic acceptance on workflow status alone, no changes to `main`, no increased proof budgets. Preserve RED evidence without erasing prior failed attempts.
