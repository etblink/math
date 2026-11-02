# K1D18V10H F10BB — Gate 2 acceptance: canonical original-gamma skew LieHom

**Date:** 2026-11-02 UTC / 2026-11-02 Pacific  
**Repository:** `etblink/math`  
**Branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`  
**Disposition:** `ACCEPTED_CANONICAL_SO9_TO_SO16_LIEHOM_ONLY`

## Immutable qualification evidence

- Strict run: [#41439485836](https://github.com/etblink/math/actions/runs/41439485836), attempt 1, terminal success.
- Exact tested commit: `41fe720842ed92599c852fe013029f52f43894a9`.
- Exact repaired F10BB source blob: `cbf92737d81c5e69efc2fa85735d6af239540070`.
- Job: `125257462198`, `original-gamma-canonical-skew-liehom`.
- Lean: `4.34.1`.
- Mathlib: `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Exact source and complete accepted ancestry pins passed.
- Accepted F10BA arbitrary-skew bracket-preservation ancestry rebuilt successfully.
- Fresh F10BB compilation passed with `-DwarningAsError=true` and produced a nonempty `.olean`.
- Independent exact restatements of the canonical LieHom type and its typed bracket specialization compiled with warnings as errors.
- Both declaration-level axiom reports, in the source compile and independent audit, contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.
- Artifact: `13141150692`.
- Artifact ZIP SHA256: `fb1c274097b353d947bcb784f25eaac6ae9c3857de311ffa0afe8f89ed3397cd`.

Gate 1 remains an immutable red at run [#41437884545](https://github.com/etblink/math/actions/runs/41437884545). Its structure-field rewrite-location failure was repaired by binding projected membership proofs to local variables; the theorem statement and carrier types were unchanged.

## Accepted declarations

- `FCP.BFSSPairedSpin9Clifford.coordinateToOriginalGammaSkewLieHom`
- `FCP.BFSSPairedSpin9Clifford.coordinateToOriginalGammaSkewLieHom_map_lie`

The primary accepted type is

```lean
LieAlgebra.Orthogonal.so SpaceIndex ℝ →ₗ⁅ℝ⁆
  LieAlgebra.Orthogonal.so SpinIndex ℝ
```

This is the canonical Mathlib `so(9,ℝ) → so(16,ℝ)` Lie algebra homomorphism built from the accepted original-gamma coefficient LinearMap, F10AV skew-image theorem, and F10BA arbitrary-skew bracket preservation. The distinct paired-`48` carrier is neither imported nor used.

## Scope ceiling

This qualification is strictly Lie-algebraic. It does not prove integration to a global group homomorphism, continuity or smoothness of an integrated map, source simply connectedness obligations, kernel or image classification, a Spin(16) or Spin(48) group lift, Fock-space implementation, gauge-domain compatibility, physical-domain statements, or BFSS spectral existence.

## Next bounded stage

Freeze this interface. Audit the exact available Mathlib integration APIs and enumerate every additional analytic, topological, and global-group hypothesis needed before proposing a group-level theorem. Preserve “LieHom does not imply global integration” as the governing negative constraint.
