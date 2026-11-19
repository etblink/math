# RHOPF-P9A1B R2 — verified native RED and D0 recovery decision

**Project Lead checkpoint:** November 18, 2026 (US Pacific).
**Original run:** [#44469465063](https://github.com/etblink/math/actions/runs/44469465063).
**Exact tested commit:** `d37ac3e86df5d233b647edff0422f6579d6812fd`.
**Verdict:** **RED**, no native theorem qualification and independent consumer skipped.

## R2 exact failure

GitHub Actions original-source preflight passed, Lean 4.34.1 / pinned Mathlib restored, and the original gamma/P9A0 dependent builds passed. The compiler stopped at line 2 of `RHOPFP9A1BOriginalGammaSelectedHopfRows.lean`:

```
error: cannot use `import all` without `module`
```

The existing `SU2RealGammaProbe.lean` has the traditional pre-module-style header; the R2 attempt to import its private definitions via `import all` was invalid at this toolchain. This is a module-visibility error before theorem elaboration, not a contradiction of any original gamma identities. Importing private definitions is not the appropriate recovery technique here.

**Original R2 artifact:** [#14503417774](https://github.com/etblink/math/actions/runs/44469465063/artifacts/14503417774), independently downloaded ZIP with SHA-256 `856c2e052329e5009738e995005c02377f0d727ff7fb27794adea2f39299b60f`, matching GitHub's recorded digest. Original failed native compilation log and source-integer consumer retained.

**Earlier R1:** [#44468240191](https://github.com/etblink/math/actions/runs/44468240191), failed at default 200000-heartbeat `whnf` timeouts in 3 source row lemmas; separate downstream missing theorem was collateral. Preserve R1 and R2 independently; neither is GREEN.

## Recovery choice

Prior original-source F10D tests successfully used `rfl` on concrete public gamma entries. The next diagnostic (P9A1B-D0) tests only source-exact entries at (0,1) and (0,2) for all three source full bivectors, using the unchanged public `gamma` API and `rfl` to avoid real-sum simplification.

No table copying, no import-all or module migration, no increased heartbeat/recursion limits, no change to the four P9A1B theorem statements, source Hamiltonian or Fock representation. D0 must pass strict native + independent consumer CI before restoring the 192-entry universal row target. A RED should be preserved and diagnosed before further proof expansion.
