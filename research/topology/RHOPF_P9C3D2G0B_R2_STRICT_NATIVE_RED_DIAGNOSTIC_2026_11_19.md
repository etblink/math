# RHOPF-P9C3D2G0B R2 — original native RED preserved

**Date:** 2026-11-19 (America/Los_Angeles); run completed 2026-11-20 04:14:29Z.  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Exact tested commit:** `8d63439d448eb3fd1c897198d219f2547a35688c`.  
**Original strict run:** https://github.com/etblink/math/actions/runs/44671858118  
**CI job:** `136074427329`.  
**Original artifact:** https://github.com/etblink/math/actions/runs/44671858118/artifacts/14601240092  
**Downloaded ZIP SHA-256:** `6ae84a4408a71eca4225743e640b2029c03182929ec3229af1376fc2d6f857ab` — independently computed and matched the CI-uploaded digest.  
**Embedded exact-tested-commit.txt:** `8d63439d448eb3fd1c897198d219f2547a35688c` — independently confirmed.

**Disposition: RED, NOT QUALIFIED.**

## Qualification boundary

- Exact source/blob and independent integer-source preflight: PASS.
- Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original frozen Gamma9 and G0A dependency build (9032 jobs): PASS.
- New G0B native compilation: RED.
- Independent consumer: SKIPPED.
- Axiom checks: UNQUALIFIED (native `#print axioms` contains `sorryAx` due to compilation errors).
- Diagnostic artifact ZIP and embedded tested SHA: VERIFIED.

## Exact RED diagnostics

```text
RHOPFP9C3D2G0BOriginalGammaRelationalNonzeroFixedVector.lean:36:2:
error: Try this: haveI̵
The goal is a proposition, so `have` is preferred over `haveI`.

RHOPFP9C3D2G0BOriginalGammaRelationalNonzeroFixedVector.lean:40:11:
error(lean.unknownIdentifier): Unknown constant `IsIdempotentElem.mem_range_iff`
```

The first error is the warnings-as-errors style linter. The second is an unavailable theorem import/name in this exact source environment. The original qualified rank source already uses `LinearMap.isProj_range_iff_isIdempotentElem`, which provides the fixed-vector statement without an additional import.

## Bounded R3 recovery

Retain theorem statement, exact original Gamma9 projection, accepted G0A, unchanged consumer, source-independent integer fixture, pinned toolchain and 200000-heartbeat default. Replace the local instance mechanism with `have hnt : Nontrivial ...` and the already-available `nontrivial_iff_exists_ne` to extract a nonzero range element. Use the accepted `LinearMap.isProj_range_iff_isIdempotentElem` projection interface and `hProj.map_id` to show the range element is fixed. Update only the new source's frozen blob pin in its workflow. No new math axioms or linter/resource overrides.

Only original native and independently imported strict GREEN with independently verified original artifact authorizes acceptance. Preserve both G0B R1/R2 REDs and the previous G0A tooling RED.
