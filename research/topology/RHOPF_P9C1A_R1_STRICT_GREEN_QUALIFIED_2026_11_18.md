# RHOPF-P9C1A R1 — original-source strict GREEN independently qualified

**Date:** November 18, 2026 (US Pacific); run completed November 19, 2026 UTC.
**Branch:** `integration/bfss-unified-research-20261108`.
**Original strict run:** [#44475758613](https://github.com/etblink/math/actions/runs/44475758613) attempt 1, success.
**Exact original tested commit:** `0497075aecac41d887da2522fa9277d407d557cc`.
**Decision:** ACCEPT **P9C1A R1** precisely within three original-source matrix theorems.

## Evidence

1. Source sha and declaration-contract preflight PASS. Core.lean, original SU2RealGammaProbe, P9A0, F10AN, P9C0, native and independent candidates, original 9-gamma integer consumer all pinned byte-exact.
2. Original Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored PASS.
3. Original P9C0 dependencies built PASS; fresh warning-as-error native original P9C1A compiled PASS.
4. Independent source-exact Lean consumer compiled PASS; native/consumer 6 axiom prints all list only `propext`, `Classical.choice`, `Quot.sound`. NO `sorryAx`.
5. Original source signed-permutation independent integer consumer PASS: original 36 pair Gram, 81 Clifford pair checks, 384 subcarrier entry comparisons; this is independent finite evidence, not native qualification of those comparisons.
6. [Artifact #14506079374](https://github.com/etblink/math/actions/runs/44475758613/artifacts/14506079374) downloaded, zip SHA-256 `26d27afcd653d5c4893ce61f90072f35fa6f31968aa3447d8634fb97b227eb8b`, equal to GitHub artifact digest. Archived `exact-tested-commit.txt` contains expected commit `0497075aecac41d887da2522fa9277d407d557cc`.

## Precise result

Let `A=gamma 1 * gamma 3`, `B=-(gamma 2 * gamma 5)`, `C=-(gamma 4 * gamma 6)` in original `GammaMatrix` (16 real by 16 real), and define
`relationalProjector = (1/4 : ℝ) • ((1-A*B)*(1-A*C))`.

**Native Lean proved:**
- `FCP.RHOPFP9C1A.relationalProjector_idempotent`: `P*P=P`.
- `FCP.RHOPFP9C1A.K13_projected_eq_K25`: `A*P=B*P`.
- `FCP.RHOPFP9C1A.K13_projected_eq_K46`: `A*P=C*P`.

These are original-source, rigorous algebraic statements. No rank, nonzero image, dimension-four or literal selected-coordinate Hopf identification has been Lean-qualified. In particular P9A1B original-row attempts R1/R2/D0 remain RED and no physical Fock operator, Hamiltonian conservation law, soliton or particle result has been claimed. Project lead next seeks trace/rank four, then coordinate identification under separate strict gates. Do not change original source.
