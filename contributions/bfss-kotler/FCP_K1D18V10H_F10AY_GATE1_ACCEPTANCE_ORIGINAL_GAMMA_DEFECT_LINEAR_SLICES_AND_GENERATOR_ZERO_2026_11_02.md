# K1D18V10H F10AY — Gate 1 acceptance: original-gamma defect linear slices and generator zero

**Date:** 2026-11-02 UTC / 2026-11-01 Pacific  
**Repository:** `etblink/math`  
**Branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`  
**Disposition:** `ACCEPTED_LINEAR_SLICES_AND_COORDINATE_PAIR_ZERO_ONLY`

## Immutable qualification evidence

- Strict run: [#41398327173](https://github.com/etblink/math/actions/runs/41398327173), attempt 1, terminal success.
- Exact tested commit: `35d7a1acea738ebddec66d0a08e01063a9d604e0`.
- Exact F10AY source blob: `2ea4de72e1b6c2e46b6394849373fcc90fc51f34`.
- Job: `125124428056`, `original-gamma-bracket-defect-linear-slices`.
- Lean: `4.34.1`.
- Mathlib: `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Exact F10AY source and complete accepted ancestry pins passed.
- Accepted F10AX bracket-defect bilinearity ancestry rebuilt successfully.
- Fresh F10AY compilation passed with `-DwarningAsError=true` and produced a nonempty `.olean`.
- The generator-zero theorem type was independently restated and compiled with warnings as errors.
- All three declaration-level axiom reports, in both the source compile and independent audit, contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.
- Artifact: `13120762966`.
- Artifact ZIP SHA256: `2b84c1271b3fef107c4cc0f47ba123555065d8c97906fe55fec5c025e73d6b31`.

## Accepted declarations

- `FCP.BFSSPairedSpin9Clifford.coordinateToOriginalGammaBracketDefect_rightLinear`
- `FCP.BFSSPairedSpin9Clifford.coordinateToOriginalGammaBracketDefect_leftLinear`
- `FCP.BFSSPairedSpin9Clifford.coordinateToOriginalGammaBracketDefect_coordinatePlanes`

For each fixed source matrix, the exact original-`16` defect is now packaged as a real `LinearMap` in the other input. Accepted F10AW then proves

```text
D(F_rs,F_tu)=0
```

for every four source labels, including diagonal, repeated, reversed, overlap, and disjoint cases.

## Scope ceiling

No theorem yet extends generator zero across a finite spanning sum. In particular, this acceptance does not establish one-plane-versus-skew zero, arbitrary-skew-pair zero, a native `so(9) → so(16)` `LieHom`, or any group-level or physical claim.

## Next bounded stage

Apply the accepted right-linear defect slice to V9F's exact source-native skew coordinate-plane expansion to prove `D(F_rs,B)=0` for an arbitrary skew source matrix `B`. Preserve the original gamma target and do not import the distinct paired-`48` output.
