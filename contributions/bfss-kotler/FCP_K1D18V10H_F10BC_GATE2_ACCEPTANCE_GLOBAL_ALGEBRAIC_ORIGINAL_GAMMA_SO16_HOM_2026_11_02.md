# K1D18V10H F10BC — Gate 2 acceptance: global algebraic original-gamma SO(16) homomorphism

**Date:** 2026-11-02 UTC / 2026-11-02 Pacific  
**Repository:** `etblink/math`  
**Branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`  
**Disposition:** `ACCEPTED_GLOBAL_ALGEBRAIC_SOURCE_SPIN9_TO_ORIGINAL_GAMMA_SO16_ONLY`

## Immutable qualification evidence

- Strict run: [#41453417697](https://github.com/etblink/math/actions/runs/41453417697), attempt 1, terminal success.
- Exact tested commit: `0504e72d34679fdb0684c5ee29e4d7e7f93ff534`.
- Exact repaired F10BC source blob: `7798089cb8ac4ec4fffc3ead4caa474def81b3f8`.
- Job: `125304006773`, `source-spin9-original-gamma-so16`.
- Lean: `4.34.1`.
- Mathlib: `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Exact source, original gamma, V10C Clifford lift, V10E orthogonal representation, and F10Q determinant-one pins passed.
- The full accepted F10Q ancestry rebuilt successfully: 8978 jobs.
- Fresh F10BC compilation passed with `-DwarningAsError=true` and produced a nonempty `.olean`.
- Independent exact restatements of all three declarations compiled with warnings as errors.
- All three declaration-level axiom reports contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.
- Artifact: `13146522049`.
- Artifact ZIP SHA256: `0157739705189ddafc3966554191bf2afc4fb90a3b85c5647e17110d96d45cd2`.

Gate 1 remains an immutable red at run [#41451815156](https://github.com/etblink/math/actions/runs/41451815156). Its single failure was an unclosed definitional coercion after rewriting multiplication in the accepted orthogonal-group subtype. Gate 2 added only the explicit `rfl` closure; theorem statements, carriers, dependencies, limits, and scope were unchanged.

## Accepted declarations

- `FCP.BFSSPairedSpin9Clifford.source9SpinGammaMatrix_mem_specialOrthogonalGroup`
- `FCP.BFSSPairedSpin9Clifford.source9SpinGammaSpecialOrthogonalHom`
- `FCP.BFSSPairedSpin9Clifford.source9SpinGammaSpecialOrthogonalHom_apply`

The primary accepted type is

```lean
spinGroup source9Quadratic →*
  Matrix.specialOrthogonalGroup SpinIndex ℝ
```

This is a single global **algebraic** group homomorphism from the exact pinned source Clifford `spinGroup` into the genuine pinned matrix SO(16) subtype. Its underlying matrix is exactly the accepted whole-Clifford evaluation by the original nine real `16×16` gamma matrices.

## Relation to F10BB

F10BC and F10BB are now two exact, source-matched interfaces:

- F10BB: canonical `so(9,ℝ) → so(16,ℝ)` Lie algebra homomorphism;
- F10BC: global algebraic `spinGroup source9Quadratic → SO(16)` group homomorphism.

They are not yet formally connected by a differential theorem. F10BC deliberately does not import F10BB. No continuity, smoothness, manifold structure, tangent/skew equivalence, or derivative equality has been inferred.

## Scope ceiling

This qualification does not establish:

- continuity or smoothness of the algebraic group homomorphism;
- `LieGroup` instances for the exact source or target;
- equality of its differential with F10BB;
- source simply connectedness or a covering theorem;
- a separately defined Spin(16) lift;
- Fock implementation, gauge-domain compatibility, physical invariance, or BFSS spectral existence.

## Next bounded stage

Freeze both accepted interfaces. Do not attempt abstract Lie integration under the current pinned Mathlib API. The next admissible work is diagnostic-only: determine whether the exact source and SO(16) subtypes can be furnished with the needed manifold/Lie-group structures and whether their tangent Lie algebras can be compared to the canonical skew-matrix types. No global differential theorem should be proposed until those bridges compile independently.
