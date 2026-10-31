# K1D18V9U — second strict red: qualified paired-label type identity

Date: 2026-10-31 UTC
Research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`
Prior accepted milestone: V9T at `4d4a148ec9ecc797cab0c828157b788dd02f498e`
Frozen V9U source blob: `cb27bc0755dc7f64bed51943ae18c24a00cba912`
Gate 1: [Run #41228863049](https://github.com/etblink/math/actions/runs/41228863049), RED
Gate 2: [Run #41229839938](https://github.com/etblink/math/actions/runs/41229839938), RED; source SHA `4492df1685adcb917ac1e494972a6fd446f6d134`.

## Exact observed causal evidence

The second run passed source hash/pin preflight, restored the pinned Lean and Mathlib tools, compiled the complete qualified V9T ancestry, and freshly compiled the exact V9U module under `-DwarningAsError=true`. All three V9U theorem declarations emitted only `propext`, `Classical.choice` and `Quot.sound` in their axiom listings. The isolated independent audit was red.

The first red had a missing explicit subtype-to-matrix projection. Gate 2 confirmed that `.val` fixes that earlier error, but the independent `/tmp/PairedSpin9V9U_Audit.lean` at lines 14 and 16 still failed because its unqualified `Source48Label` referred to a different type than the true source-label type of the canonical LieHom image. Actual Lean diagnostic:

```text
↑(coordinateToPairedCanonicalSkewLieHom A)
has type Matrix FCP.BFSSS1V0.Source48Label FCP.BFSSS1V0.Source48Label ℝ
but is expected to have type Matrix Source48Label Source48Label ℝ
```

This is a source-index *type identity* failure in an independent auditor, not a refutation of the unchanged, freshly compiled source theorem. Do not merge or identify the two labels by assumption.

## Bounded corrective experiment

Replace **only two audit type annotations** with the fully qualified `Matrix FCP.BFSSS1V0.Source48Label FCP.BFSSS1V0.Source48Label ℝ`. Keep both explicit `.val` projections. Do not change any theorem statement, gamma representation, basis permutation, normalized generator, Lean limit, pinned dependency, original V9U source or accepted V9T ancestry. The same independent compilation and declaration-level axiom checks remain mandatory.

A subsequent strict PASS is required before V9U qualification. Both red runs must remain recorded as negative engineering evidence. Neither potential V9U success nor the accepted V9T real `LieHom` proves a global continuous `Spin(9)→SO(48)` action, a `Spin(48)` lift, a source covering map, or BFSS spectral claims. Main, FCP provenance and mathcommunity upstream are unchanged.
