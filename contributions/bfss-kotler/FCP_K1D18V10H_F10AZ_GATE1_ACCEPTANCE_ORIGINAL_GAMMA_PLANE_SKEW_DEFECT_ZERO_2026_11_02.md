# K1D18V10H F10AZ — Gate 1 acceptance: original-gamma plane-versus-skew defect zero

**Date:** 2026-11-02 UTC / 2026-11-01 Pacific  
**Repository:** `etblink/math`  
**Branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`  
**Disposition:** `ACCEPTED_COORDINATE_PLANE_VERSUS_ARBITRARY_SKEW_ZERO_ONLY`

## Immutable qualification evidence

- Strict run: [#41399709437](https://github.com/etblink/math/actions/runs/41399709437), attempt 1, terminal success.
- Exact tested commit: `572ec235e499c3093c18a2c6854128d0fdb801cc`.
- Exact F10AZ source blob: `d2276d3b4e1de86294a71a042828c32f0ff54d51`.
- Job: `125128660331`, `original-gamma-plane-skew-defect-extension`.
- Lean: `4.34.1`.
- Mathlib: `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Exact F10AZ source and complete accepted ancestry pins passed.
- Accepted F10AY linear-slice and coordinate-pair-zero ancestry rebuilt successfully.
- Fresh F10AZ compilation passed with `-DwarningAsError=true` and produced a nonempty `.olean`.
- The exact plane-versus-skew theorem type was independently restated and compiled with warnings as errors.
- The declaration-level axiom reports in both the source compile and independent audit contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.
- Artifact: `13121014321`.
- Artifact ZIP SHA256: `116258dcff5d9e567343d52a40933ae490d42ba98e52ae7983f1a043882035df`.

## Accepted declaration

- `FCP.BFSSPairedSpin9Clifford.coordinateToOriginalGammaBracketDefect_plane_skew_right`

For every source coordinate plane `F_rs` and every native skew source matrix `B`, the exact original-`16` defect satisfies

```text
D(F_rs,B)=0.
```

The proof uses the accepted right-linear defect slice, V9F's exact source-native skew coordinate-plane expansion, and F10AY zero on every coordinate-plane pair.

## Scope ceiling

This acceptance fixes the first input to a single coordinate plane. It does not establish arbitrary-skew-pair zero, a native `so(9) → so(16)` `LieHom`, group integration, or any physical or spectral consequence.

## Next bounded stage

Apply the accepted left-linear defect slice to V9F's exact coordinate-plane expansion of an arbitrary skew first input. Use the accepted F10AZ theorem on each coordinate-plane summand to prove `D(A,B)=0` for arbitrary skew `A` and `B`, then qualify that theorem in a separate strict gate.
