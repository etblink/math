# K1D18V10H F10AX — Gate 1 acceptance: original-gamma bracket-defect bilinearity

**Date:** 2026-11-02 UTC / 2026-11-01 Pacific  
**Repository:** `etblink/math`  
**Branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`  
**Disposition:** `ACCEPTED_TYPED_REAL_BILINEARITY_ONLY`

## Immutable qualification evidence

- Strict run: [#41396797396](https://github.com/etblink/math/actions/runs/41396797396), attempt 1, terminal success.
- Exact tested commit: `7a49c018a8a119790d18032902b73b2a9360ef92`.
- Exact F10AX source blob: `53a7c6bad1a515b87869858f776ee76003980f12`.
- Job: `125119752577`, `original-gamma-bracket-defect-bilinearity`.
- Lean: `4.34.1`.
- Mathlib: `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Exact F10AX source, accepted F10AW source, and complete accepted ancestry pins passed.
- Accepted F10AW generator-pair bracket ancestry rebuilt successfully.
- Fresh F10AX compilation passed with `-DwarningAsError=true` and produced a nonempty `.olean`.
- Four independently restated theorem types compiled with warnings as errors.
- All five declaration-level axiom reports, in both the source compile and independent audit, contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.
- Artifact: `13119819037`.
- Artifact ZIP SHA256: `84fc476cf0548ca0f90ec1eeaef68b2f71995ea135540cf02eb721c0f1acc722`.

## Accepted declarations

- `FCP.BFSSPairedSpin9Clifford.coordinateToOriginalGammaBracketDefect`
- `FCP.BFSSPairedSpin9Clifford.coordinateToOriginalGammaBracketDefect_add_left`
- `FCP.BFSSPairedSpin9Clifford.coordinateToOriginalGammaBracketDefect_add_right`
- `FCP.BFSSPairedSpin9Clifford.coordinateToOriginalGammaBracketDefect_smul_left`
- `FCP.BFSSPairedSpin9Clifford.coordinateToOriginalGammaBracketDefect_smul_right`

The raw defect is exactly

```text
D(A,B) = rho(A*B - B*A)
       - (rho(A)*rho(B) - rho(B)*rho(A)),
```

with `rho = coordinateToOriginalGammaLinearMap`. It is now qualified as additive and real homogeneous in each native source-matrix argument.

## Method provenance

The proof architecture is the accepted V9I/V9J algebraic pattern, specialized to F10AV's original `16×16` gamma target. The target carrier, source matrix multiplication, coefficient map, and scalar field remain literal. No theorem weakening, source-label transport, replacement gamma basis, axiom, admission, linter suppression, or proof-limit increase was introduced.

## Scope ceiling

This acceptance does **not** establish that the defect vanishes on any input. In particular, it does not yet establish:

- the defect packaged as typed linear slices;
- defect zero on coordinate-plane pairs;
- defect zero on one plane against an arbitrary skew input;
- defect zero on arbitrary skew pairs;
- a native `so(9) → so(16)` `LieHom`;
- any group-level, Spin(48), Fock, gauge, physical-domain, or BFSS spectral statement.

## Next bounded stage

Package the qualified additivity and homogeneity laws as left and right real `LinearMap` slices, then use accepted F10AW to prove

```text
D(F_rs, F_tu) = 0
```

for every four source labels, including all diagonal and collision cases. Arbitrary-skew extension remains a later gate.
