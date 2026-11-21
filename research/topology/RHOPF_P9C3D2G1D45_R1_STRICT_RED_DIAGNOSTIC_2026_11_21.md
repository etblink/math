# RHOPF-P9C3D2G1D45 R1 — strict original source RED diagnostic

**Pacific date:** 2026-11-21. **Disposition:** RED, D45 UNQUALIFIED. Original [run #44926417213](https://github.com/etblink/math/actions/runs/44926417213), job `136913383448`, attempt 1, exact tested commit `07d6a13c365ffcc581efcad25424025482c493ba`.

## Frozen preflight and original evidence
The accepted original Gamma9 SHA/contract preflight passed; the independent original Gamma9 signed-permutation integer fixture passed; Lean 4.34.1 / pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored; 9,092 accepted dependency builds passed. Native D45 compilation RED; independent imported D45 consumer SKIPPED.

Original [GitHub artifact ZIP #14716178500](https://github.com/etblink/math/actions/runs/44926417213/artifacts/14716178500) independently downloaded; locally calculated SHA-256 `32c24e8bc3ef55afdab746f05368fb484e8a878436b1d5fec15edca895190d64` equals GitHub original artifact SHA, `unzip -t` PASS. Five ZIP members: `exact-tested-commit.txt`, `native-original-source-q-orthonormal-repr-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`. Embedded exact tested SHA equals `07d6a13c365ffcc581efcad25424025482c493ba`.

## Native RED diagnostics, not contrary geometry evidence
1. `RHOPFP9C3D2G1D45OriginalGammaSourceQOrthonormalRepr.lean:47`: `stdOrthonormalBasis` produces `OrthonormalBasis (Fin (Module.finrank ℂ RelationalSourceComplexFour))`, whereas D45's goal expects `OrthonormalBasis (Fin 2)`. `simpa only` did not discharge type equality in this context. Use the existing `OrthonormalBasis.reindex` with `finCongr relationalSourceComplexFour_finrank_complex` from D43.
2. Lines 71/73/75: `letI` in a proposition triggers pinned style linter `linter.style.haveILetI` under warnings-as-errors; use the `let : ...` style established by accepted D41's theorem proof (do not disable linter).
3. Line 89: applying generic `map_smul` directly to `LinearIsometryEquiv` fails to synthesize `MulActionHomClass`; use its underlying `toLinearEquiv` for scalar action.

All four native axiom reports contain `sorryAx` as downstream elaboration failures, so none is qualified. R1 does not falsify the original source-Q-isometry statement.

## Bounded R2 repair
Modify only the D45 source proof internals at those points and repin its exact Git blob SHA in existing strict workflow. Preserve all D45 public declaration names/types, D45 independent consumer, accepted D41–D44 math, frozen original Gamma9, CI warning and axiom strictness, and `main`.

Require R2's complete strict native+independent success and its own original ZIP digest/commit verification before any qualification. Preserve original R1 RED forever.
