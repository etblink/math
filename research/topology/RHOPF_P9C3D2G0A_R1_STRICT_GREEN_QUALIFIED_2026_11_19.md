# RHOPF-P9C3D2G0A R1 — original Gamma9 relational range nontrivial strict GREEN

**Date:** November 19, 2026 (America/Los_Angeles).  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Original source run:** [#44668376890](https://github.com/etblink/math/actions/runs/44668376890), attempt 1, SUCCESS.  
**Exact tested commit:** `e962730b181771c29144d0a17e9dcc1544f0d583`.  
**Job:** `136063152581`.  
**Original artifact:** [#14598609722](https://github.com/etblink/math/actions/runs/44668376890/artifacts/14598609722).  
**Independent original ZIP SHA-256:** `ec3f48a2a685da0700e51f48a9554a2d3c0ed97635257f3e641f3ba52bfaa24f`.  
**Disposition:** **ACCEPT** `FCP.RHOPFP9C3D2G0A.relationalProjector_range_nontrivial` as original-source-native and independent strict GREEN.

## Exact qualification

- Frozen original BFSS Core/Gamma9 and accepted projector/rank/action/continuity source blob pins, exact source and consumer preflight: PASS.
- Original source-independent signed-permutation integer fixture: PASS.
- Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Frozen original-source dependency builds, 9031 jobs: PASS.
- Native Lean compilation, warnings-as-errors: PASS.
- Independently imported Lean consumer, warnings-as-errors: PASS.
- Original native and independent `#print axioms` reports: both exactly `[propext, Classical.choice, Quot.sound]`, no `sorryAx`: PASS.
- Independently downloaded original artifact ZIP checksum and embedded `exact-tested-commit.txt` both match original CI: PASS.
- Archive contents: `exact-tested-commit.txt`, `independent-original-integer-consumer.json`, `independent-lean-types-and-axioms.log`, `native-relational-range-nontrivial-and-axioms.log`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.

## Qualified source-exact result

```lean
theorem relationalProjector_range_nontrivial :
    Nontrivial (LinearMap.range (Matrix.toLin' relationalProjector))
```

The proof uses accepted `relationalProjector_range_finrank_four` and Mathlib `Module.finrank_pos_iff`; no alternate projector or source Gamma9 basis enters. Together with accepted P9C3D2F1/F2/F4, it establishes that the exact source-defined relational image has nonzero vectors and carries explicitly verified free continuous Circle action laws on the *unit subtype*, but **unit-subtype nonemptiness itself remains a separate proof obligation**.

## Negative knowledge and open obligations

G0A R0 workflow parse RED [#44668201022](https://github.com/etblink/math/actions/runs/44668201022) contained duplicated invalid YAML, had no jobs/artifacts, and did not test mathematics. It is preserved as a tooling failure. R1 workflow corrected the malformed declaration without modifying the G0A mathematical source/consumer. P9C3D2F4 R1/R2 RED diagnostics and R3 qualified GREEN remain intact.

Next bounded target: extract a nonzero vector from the exact original projector range and prove that it is fixed by `Matrix.toLin' relationalProjector`; then separately normalize to prove `Nonempty RelationalUnitSpinor`. Source-exact `S³` identification, quotient, physical Fock representation, and physical observables remain independent open hypotheses. No write to `main` or frozen accepted source.
