# RHOPF-P9C3D2G1A R2 — exact structural preflight RED, native proof not retested

**Pacific date:** 2026-11-19, original CI completed 2026-11-20T05:36:47Z.  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Original run:** https://github.com/etblink/math/actions/runs/44682082979  
**Exact tested commit:** `0569870c0d99c34c113378865fe7bd461c5b38b3`.  
**Job:** `136107607273`.  
**Original artifact:** https://github.com/etblink/math/actions/runs/44682082979/artifacts/14605261173  
**Independently downloaded ZIP SHA-256:** `737a57d4f65f1da9ce5ab5cc2c009f26607cbbfe332e72ad584d919cd44e01e0`.  
**Embedded exact tested commit:** `0569870c0d99c34c113378865fe7bd461c5b38b3` (verified by extracted `exact-tested-commit.txt`).  
**Disposition: RED — UNQUALIFIED.**

## Stage boundaries

- Exact source/consumer Git blob pins: PASS.
- Pinned Lean toolchain and Mathlib manifest assertions: PASS (not yet restored).
- Structural source/consumer preflight: RED; Python `AssertionError` at line 70 of heredoc.
- Lean toolchain restoration: SKIPPED.
- Native mathematical source compilation: SKIPPED.
- Independent imported consumer compilation: SKIPPED.
- Native/consumer axiom checks: SKIPPED.
- Original diagnostic artifact: archived, independently SHA-256 matched, and embedded tested commit verified.

## Exact preflight mismatch

G1A R1 compiled its original mathematical definition `relationalUnitSpinorEquivRange` with warnings-as-errors and native axiom list `[propext, Classical.choice, Quot.sound]`. R1 failed in the separately imported consumer because the consumer's `example` needed a noncomputable context. R2 wrapped the exact existing example in a `noncomputable section` and properly closed it with an additional `end`.

However the inherited strict workflow still asserted:

```python
assert re.findall(r'(?m)^end(?: (\\S+))?$',consumer)==['FCP.RHOPFP9C3D2G1AIndependent']
```

The R2 consumer has two closing `end` commands, `['', 'FCP.RHOPFP9C3D2G1AIndependent']`; so the preflight correctly reports an assertion failure under a now-outdated consumer structure. No mathematical Lean code was run.

## Bounded R3 repair

Change **only** this strict workflow's structural consumer contract to require exactly two closings, with a matching `noncomputable section` count of exactly one. Keep the original mathematical G1A source **byte-for-byte unchanged**, the independently imported R2 consumer **byte-for-byte unchanged**, all source and consumer blob hashes, source-independent original integer fixture, pinned Lean 4.34.1/Mathlib, warnings-as-errors, axiom-list checks, resource limits and archived REDs unchanged. The repaired preflight remains strict: no arbitrary extra sections are allowed.

Requalify only after original native source, independently imported consumer, both axiom checks, and independently SHA-verified original ZIP return strict GREEN. No S³/homeomorphism, Hopf quotient, physical Fock lift, or physical topological state is established by a workflow repair.
