# RHOPF-P9A1B R1 — original strict RED diagnostic and bounded R2 repair

Date: November 18, 2026 (Pacific). Branch: `integration/bfss-unified-research-20261108`.

## Exact failed native gate

[Run #44468240191](https://github.com/etblink/math/actions/runs/44468240191) at exact tested commit `639a0ba10c4888b2c3eaf1369522531577358729` is **RED**. Preflight exact source hashes, pinned Lean 4.34.1 / Mathlib restoration and original gamma / P9A0 dependency builds all passed. Native warning-as-error compiler failed:

- `RHOPFP9A1BOriginalGammaSelectedHopfRows.lean:34:0`: deterministic `whnf` timeout at 200000 heartbeats in `K13_selected_rows`.
- Line 43: same failure in `K25_selected_rows`.
- Line 51: same failure in `K46_selected_rows`.
- Line 62: dependent unknown constant `K13_selected_rows` from the failed elaboration, not a separate mathematical counterexample.

Independent Lean consumer was **SKIPPED**. Do not promote R1 and do not treat failed `#print axioms` outputs as proofs. Original [artifact #14503680933](https://github.com/etblink/math/actions/runs/44468240191/artifacts/14503680933) has GitHub SHA-256 `55ed1ffd73bf0907c36fb4ec361388659901d83777a39ec2f18cb101a2fd27e0`, independently downloaded and checked against GitHub's digest. Its original failed native log and independent integer consumer are preserved.

## Root cause and bounded repair

R1 expanded full `Matrix.mul_apply` and `Fin.sum_univ_succ` real 16-term sums in each of 64 row cases per theorem; elaboration exhausted default heartbeats. Previous F10 source-private gamma diagnostics warned about the same brittle reduction boundary.

R2 uses `import all` on the identical original `SU2RealGammaProbe.lean` and applies the source-proved sparse integer lemma `gammaInt_mul_apply`. It checks only original selected entries over integers, then casts to the original real GammaMatrix representation via `Matrix.map_mul`. No replacement gamma table, no theorem signature changes, no resource-limit increases or changed original Hamiltonian/Fock source. All four public statements and the independent consumer remain unchanged.

R2 is PROSPECTIVE until a fresh exact original native and independent consumer green CI run and axiom checks are independently verified. If import-private-scope or cast transfer errors occur, preserve the next RED and split into a smaller source-exact diagnostic.
