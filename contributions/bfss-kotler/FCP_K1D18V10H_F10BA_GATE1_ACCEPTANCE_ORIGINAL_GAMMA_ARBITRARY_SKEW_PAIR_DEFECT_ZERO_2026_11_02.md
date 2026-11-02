# K1D18V10H F10BA — Gate 1 acceptance: original-gamma arbitrary-skew-pair defect zero

**Date:** 2026-11-02 UTC / 2026-11-01 Pacific  
**Repository:** `etblink/math`  
**Branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`  
**Disposition:** `ACCEPTED_ARBITRARY_SKEW_PAIR_BRACKET_PRESERVATION_ONLY`

## Immutable qualification evidence

- Strict run: [#41401214015](https://github.com/etblink/math/actions/runs/41401214015), attempt 1, terminal success.
- Exact tested commit: `fc9bfb9e1ea9ab74ef45fdc17306c0be6895160d`.
- Exact F10BA source blob: `2a05796d38b74b401b0054e5944d84583ab0dae5`.
- Job: `125133232340`, `original-gamma-arbitrary-skew-defect-extension`.
- Lean: `4.34.1`.
- Mathlib: `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Exact F10BA source and complete accepted ancestry pins passed.
- Accepted F10AZ plane-versus-skew-zero ancestry rebuilt successfully.
- Fresh F10BA compilation passed with `-DwarningAsError=true` and produced a nonempty `.olean`.
- The exact arbitrary-skew-pair theorem type was independently restated and compiled with warnings as errors.
- The declaration-level axiom reports in both the source compile and independent audit contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.
- Artifact: `13121697832`.
- Artifact ZIP SHA256: `febaab841ad979376c878e85563ae265f1a7ac80e7882110e7b10e479903cde0`.

## Accepted declaration

- `FCP.BFSSPairedSpin9Clifford.coordinateToOriginalGammaBracketDefect_skew_pair_zero`

For every pair of native skew source matrices `A` and `B`, the exact original-`16` defect satisfies

```text
D(A,B)=0.
```

By the definition of the defect, this establishes bracket preservation of the accepted original-gamma coefficient LinearMap on arbitrary skew inputs. The proof applies the accepted left-linear slice to V9F's exact coordinate-plane expansion of `A` and uses F10AZ on every summand.

## Scope ceiling

This theorem is stated on matrices with explicit skewness hypotheses. It does not itself construct a Mathlib `LieHom` between the native source and target skew-matrix Lie subalgebras. It also makes no group-integration, covering, Fock, gauge-domain, physical-domain, or BFSS spectral claim.

## Next bounded stage

Audit the exact native Mathlib skew-matrix Lie-subalgebra constructors and coercions. Then package the accepted coefficient LinearMap, F10AV skew-image proof, and this bracket theorem as a typed `so(9) → so(16)` `LieHom` in a separate fail-closed strict gate.
