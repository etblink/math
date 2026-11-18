# SM-D1-SCC1 R2 — original native dependency RED

**2026-11-18. RED / NOT QUALIFIED.**

- Original strict run: https://github.com/etblink/math/actions/runs/44402082336
- Tested commit: `963546220631a1b75229425d1aa860577ee011bc`; original job `135147533074`.
- Original R2 artifact: `14474546461`; SHA256 `0da8a32f0307feae7a17cdd9ddfc74ee97bdb2d1b3aa6a222d09572573f62e6e`, 2218 bytes.
- Git checkout, pinned SM-Y0/SM-D0/SCC0/BFSS preflight, Lean 4.34.1 and Mathlib restoration all **PASS**.
- Cold source build **PASS** (3,092 jobs); strict source check **PASS** (14 printed native axiom reports; only `propext`, `Classical.choice`, `Quot.sound` as allowed).
- Independent consumer **NOT TESTED**: the consumer launched but exited at import resolution before any of its own declarations elaborated. The imported `SMY0OneFamilyAnomalyLedger.olean` was absent because the workflow's explicit `lake build` target built only `SMD1SCC1FiniteWitnessSeparation`, which has no SM-Y0 import. The *consumer* imports both.
- This is a missing build dependency in CI, not a failure of the strict source theorem statements. Do not infer consumer correctness.
- R3 remedy: explicitly add the existing SM-Y0 Lean module to the `lake build` targets **before** running the independent consumer. No source theorem/consumer statement or runtime limit change is authorized by this diagnosis.
- Preserve original R2 RED evidence (full job, provider ZIP and hash manifest) separately; the GitHub-run artifact expires after 14 days.

**Negative knowledge:** Every independent consumer must have *all* its imports built, not only the new source. Preserve the exact tested source/CI pairing before promotion. No BFSS/SM mathematical or empirical acceptance changes.
