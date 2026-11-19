# RHOPF-P9C1B1 R2 — original-source strict GREEN independently qualified

**Date:** November 19, 2026.
**Branch:** `integration/bfss-unified-research-20261108`.
**Original strict run:** [#44525487857](https://github.com/etblink/math/actions/runs/44525487857), attempt 1, SUCCESS.
**Exact tested commit:** `e529367451a0f1113dbe10ff01422b8529e9ce37`.
**Decision:** **ACCEPT P9C1B1 R2** at its exact three original-source theorem declarations.

## Native, independent and artifact evidence

- Exact frozen source/hash preflight passed for original BFSS Core, gamma, P9A0, F10AN, F10AE, P9C0, P9C1A, P9C1B0 and the new native/consumer files; original independent integer fixture passed.
- Lean 4.34.1 and Mathlib at `d13f23b723b8a846827a245b89c10fc7d3f11612` restored and compiled.
- Original P9C1B0 dependency build passed, original source candidate compiled under `-DwarningAsError=true`, and a **separate independent typed Lean consumer** compiled with warnings as errors.
- Three original declarations and all three independent consumer axiom reports contain **only** `propext`, `Classical.choice`, `Quot.sound`—no `sorryAx`, invented axioms or hidden proof gaps.
- Original [artifact #14531741897](https://github.com/etblink/math/actions/runs/44525487857/artifacts/14531741897) downloaded; its SHA-256 `709a093f54adcb1b3a6729373192f5520cc260e716af2a6e47edf6af2d9a5f06` matches GitHub's original digest and its archived `exact-tested-commit.txt` equals the exact tested SHA above. The ZIP contains both original native and independent axiom-report logs, dependency build and signed-permutation consumer outputs.

## Exact accepted mathematical statements

Using the actual original `GammaMatrix` 16-real spinor carrier `relationalProjector` from accepted P9C1A and original trace-four P9C1B0, P9C1B1 qualifies:
1. `relationalProjector_toLin_idempotent` : `IsIdempotentElem (Matrix.toLin' relationalProjector)`.
2. `relationalProjector_range_finrank_four` : `Module.finrank ℝ (LinearMap.range (Matrix.toLin' relationalProjector)) = 4`.
3. `relationalProjector_rank_four` : `Matrix.rank relationalProjector = 4`.

Together with P9C0, P9C1A, P9C1B0, the original source proves `P²=P`, `trace P=4`, `rank P=4`, and `K1P=K2P=K3P`; no original source coordinate lookup required for these proofs.

## Negative knowledge, remaining obligations, and next gate

The preceding P9C1B1 R1 [#44522055912](https://github.com/etblink/math/actions/runs/44522055912) remains a native Lean RED: dotted `.isProj_range` unavailable on a definitional equality and a `simpa` failed unexpectedly between `mulVecLin` and `toLin'` representations. R2 uses an explicit Mathlib `isProj_range_iff_isIdempotentElem` and direct `change/exact` without changing theorem statements.

Still **UNPROVED in native source Lean:** exact identification of `im(P)` with the literal indexed `(0,1,8,9)` real four-plane. The original finite signed-permutation fixture reports this equality, but R1/R2/D0 original P9A1B coordinate-entry proofs all failed and remain recorded. Four-plane equality requires a separately qualified exact-source bridge. No global Spin9 action on full original Fock vectors, Noether charge, stable 3D hopfion, particle identity or Standard Model deviation follows from this finite algebraic theorem. Do not modify original BFSS Core, gamma implementation, Hamiltonian or Fock source.
