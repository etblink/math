# IBI G0C source SO3 witness R1 — failed source composition rewrite

**Date:** 2026-11-15 Pacific
**Decision:** RED_NOT_QUALIFIED at exact tested SHA `cce416005bd4014da2a8f18785cd83bdf8ebd78f`.
**Branch:** `research/bfss-incidence-unified-20261114`.

## Exact run and compiler diagnostics

- [Run #43775181254](https://github.com/etblink/math/actions/runs/43775181254), `completed/failure`, job `132999767675`.
- Original-source pinned contract and frozen Lean 4.34.1 / Mathlib preflight PASS. All accepted abstract Euler and BFSS native Z/X source dependencies compiled; failure occurred at source witness file, cold build job `9024/9024`.
- `IBIG0CSourceSO3Witness.lean:57:47` remaining goal:
```
sourceRotZ α * sourceRotX β * adjointColorMatrix (sourceZGauge γ) =
sourceRotZ α * sourceRotX β * sourceRotZ γ
```
- `IBIG0CSourceSO3Witness.lean:62:13` remaining goal:
```
abstractRotZ α * abstractRotX β * sourceRotZ γ =
abstractRotZ α * abstractRotX β * abstractRotZ γ
```
Both are the **rightmost Z** occurrence after the proof's explicit `rw` sequence rewrote only the first occurrence of each matching lemma. The independently proven `abstractRotZ_eq_sourceRotZ` and `abstractRotX_eq_sourceRotX` remain valid; no new mathematical obstruction is indicated.
- Because the composition proof was not closed, `originalAdjointColorMatrix_sourceZXZ` and `originalBFSS_adjoint_hits_every_SO3` reported `sorryAx`; neither theorem is accepted from R1. Independent consumer not reached.
- [Preserved R1 artifact #14186057702](https://github.com/etblink/math/actions/runs/43775181254/artifacts/14186057702), GitHub API 5230 bytes; job log ZIP SHA-256 `789315ec4f4f6b823d7147923f4ddbe07da22aed07dd2198fa5ea71c95e886cf` (reported only, not independently rehashed).

## Bounded R2 repair and stop condition

Preserve exact theorem statements and independent consumer. After applying the already-accepted two source `adjointColorMatrix_mul` rewrites, use `simp only [originalAdjointColorMatrix_sourceZ_eq_rotZ, originalAdjointColorMatrix_sourceX_eq_rotX]` to rewrite **both** source Z images, not just the first. In the adapter equality, use `simp only [← abstractRotZ_eq_sourceRotZ, ← abstractRotX_eq_sourceRotX]` to normalize **both** Z occurrences. No arithmetic or physics model changes; no imported donor or new axiom. Update strict SHA pin and rerun cold source/consumer gate. Keep source-exact universal existence and a future typed `GaugeGroup 2 → SO(3)` hom separated; codomain det+1 is an additional interface.

If R2 reveals a different typed issue, preserve precise diagnostics; do not silently promote the source witness. No modifications to accepted BFSS X/Z, abstract angle/Euler, frozen FCP, unified integration or main.
