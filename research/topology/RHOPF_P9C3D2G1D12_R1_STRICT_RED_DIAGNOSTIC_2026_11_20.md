# RHOPF-P9C3D2G1D12 R1 — strict native RED preserved and independently verified

**Pacific date:** 2026-11-20. **Disposition:** REJECTED_NATIVE_RED.  
**Canonical branch:** `integration/bfss-unified-research-20261108` (not `main`).  
**Original run:** [#44793655880](https://github.com/etblink/math/actions/runs/44793655880), attempt 1 FAILED, exact tested `cf06fa08abb4374fdf9ec410139967d126e5d901`; job `136487490142`.  
**Original RED archive:** [#14657453606](https://github.com/etblink/math/actions/runs/44793655880/artifacts/14657453606). Independently recalculated ZIP SHA-256 `a4b9e371817e2244d894d74957435db61bfd3257ecf7b54458eded3f109d77ea` equals workflow upload and GitHub artifact digest; embedded exact-tested-commit matches `cf06fa08abb4374fdf9ec410139967d126e5d901`. Five original files preserved, including native failed Lean diagnostics and toolchain/build logs.

## Observed results

Frozen original Gamma9 source hash and proof-contract preflight PASS; pinned Lean 4.34.1/Mathlib restoration PASS; dependency build **9,059 jobs** PASS. Original G1D12 native Lean compilation RED at source line 41 column 10:
```
Unknown identifier `relationalCirclePhase`
```
Independent source consumer was **SKIPPED**. Native `#print axioms` output includes `sorryAx`, hence **no acceptance**.

## Root cause and recovery

The accepted `relationalCirclePhase` is defined in `FCP.RHOPFP9C3A` in the original `RHOPFP9C3AOriginalGammaRelationalCirclePhaseFamily.lean`, present through transitive imports. G1D12 explicitly opens `FCP.RHOPFP9C3D0`, `FCP.RHOPFP9C3D2A`, `FCP.RHOPFP9C3D2D` and other namespaces, but **not `FCP.RHOPFP9C3A`**. The direct `change` at line 41 refers to the short name without namespace qualification.

Bounded recovery: add `open FCP.RHOPFP9C3A` alongside existing `open` clauses and update ONLY G1D12 source blob pin in the strict workflow; no source Gamma9 edits, no theorem statement changes, no new axiom/sorry/proof budget, no `main` modification. Preserve R1 RED permanently; qualify only after R2 native and independent imported consumer strict GREEN plus independently checked original artifact ZIP checksum.
