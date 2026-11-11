# NORM-0C second strict red — consumer deprecated scalar-application API, source builds

**Date:** 2026-11-11 Pacific
**Branch:** `integration/bfss-unified-research-20261108`
**Evidence classification:** STRICT RED, **consumer API warning-as-error only**; NORM-0C source already cold built and all five source+consumer roots elaborated with standard-only axioms. Not yet strictly accepted.
**Tested commit:** `4a95e00ed3134293ba99a0649f7999ce92408f70`; [run #43015220730](https://github.com/etblink/math/actions/runs/43015220730) completed failure 2026-11-11 12:07:17 UTC.
**Job:** `130504473501`.
**Artifact:** ID `13853142988`, ZIP SHA-256 `5e14e46c0ca9ea4c9c017d60fdf63749c4c1a214e7c3b6f629853cb36158f0db`.

## First causal diagnostic and proof state

1. `NORM0C_ORIGINAL_108_BLOB_CLOSURE_PASS` confirmed 108 exact frozen Git hashes (106 NORM-0B accepted ancestors plus NORM-0C source and consumer).
2. Pinned Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 restored successfully.
3. Original source cold build completed `Build completed successfully (9070 jobs)`. NORM-0C source theorem roots `originalFockGammaBoundConstant_nonneg`, `originalFockGram_norm_le_trace`, `originalNormalizedFockGram_norm_le` all showed only `propext`, `Classical.choice`, `Quot.sound`. No new source Lean error or source theorem changes.
4. Both independent consumer roots `originalNormalizedFockGram_vector_bound` and `originalNormalizedFockGram_gauge_covariant` elaborated and printed only permitted axioms.
5. The **sole fatal error** from warning-as-error at `diagnostics/BFSSNORM0COriginalNormalizedFockFieldConsumer.lean:55:13`: `ContinuousLinearMap.smul_apply has been deprecated: Use smul_apply instead`. This is an exact pinned API deprecation, not a failed mathematical proof. Existing ancestry source linter/deprecation warnings appear in source-build logs but are frozen accepted imports; the independent consumer's warning is the new qualification blocker. The run's consumer Lean process exited nonzero, so the gate is **RED**, regardless of axiom reports.

## Exact bounded corrective action

Replace the sole consumer line
```lean
  simp only [ContinuousLinearMap.smul_apply]
```
with
```lean
  simp only [smul_apply]
```
following Lean's exact deprecation replacement. Preserve the remainder of the true original Fock-vector and G2A/G4E consumer proof, all five axiom checks, source math and all frozen toolchain/strict requirements. Consumer SHA `314694880753d91e6a0de516b6a8d50f5c6d10e5` → `307870a4cb93e1ead38253b9d94b5e79c3c2c11c`. Workflow SHA `543d50ff4b11995cccb988c07f70fa6f761e2a89` → `29b5e76730dd894c0c953d1c9ff17d9f4521bc7e`, updating exactly that one consumer hash among 108. Source hash remains `84de66e73be2018b03ced898ebf70e691c07b40f`. No `sorry`, `unsafe`, linter suppression or change to physics premises.

**Next step:** new exact 108-pin cold strict run required. Only when the independent consumer finishes with zero errors, zero forbidden warnings, all five allowed-only axiom reports and final PASS marker can the NORM-0C pointwise fixed-B uniform bound be marked QUALIFIED. NORM-0D original `FullL2 2` multiplier remains independent and open.

## Generalizable engineering lesson

Treat strict deprecation reds separately from proof failures; use the compiler-reported exact updated API and change one consumer line. The earlier [F1A #42533991101](https://github.com/etblink/math/actions/runs/42533991101) and [OP2c #42530241914](https://github.com/etblink/math/actions/runs/42530241914) cases illustrate the same useful distinction. Do not rewrite the NORM-0C math or relax warnings to manufacture a green.
