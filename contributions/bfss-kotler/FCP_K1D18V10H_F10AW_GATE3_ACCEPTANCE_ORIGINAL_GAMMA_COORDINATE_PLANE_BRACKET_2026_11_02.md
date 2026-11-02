# K1D18V10H F10AW — Gate 3 acceptance: original-gamma coordinate-plane bracket

**Date:** 2026-11-02 UTC / 2026-11-01 Pacific  
**Repository:** `etblink/math`  
**Branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`  
**Disposition:** `ACCEPTED_EXACT_GENERATOR_PAIR_BRACKET_ONLY`

## Immutable qualification evidence

- Strict run: [#41395358308](https://github.com/etblink/math/actions/runs/41395358308), attempt 1, terminal success.
- Exact tested commit: `1b4653358727d040b9984bdfa4bd242cd6ecabac`.
- Exact F10AW source blob: `449905b6dd06fc9e747a0c9c22c8b6c66afab1a5`.
- Job: `125115397626`, `original-gamma-coordinate-plane-bracket`.
- Lean: `4.34.1`.
- Mathlib: `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Exact source and accepted-ancestor pins passed.
- Accepted F10AV/F10AU ancestry rebuilt successfully.
- Accepted native source four-index coordinate-plane bracket ancestry rebuilt successfully.
- Fresh F10AW compilation passed with `-DwarningAsError=true` and produced a nonempty `.olean`.
- Independent exact theorem-type restatement compiled with warnings as errors.
- The source declaration and independent audit both reported only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.
- Artifact: `13119627191`.
- Artifact ZIP SHA256: `ec7da473bd8b17fc9694ed4905552c4f7c49c04cb9c112cdae8e777cbda1191e`.

## Accepted theorem

`FCP.BFSSPairedSpin9Clifford.coordinateToOriginalGammaLinearMap_coordinatePlane_bracket`

For every four source labels `r s t u : SpaceIndex`, including diagonal, repeated-pair, reversed-pair, overlap, and four-distinct cases, the exact original-gamma coefficient LinearMap preserves the matrix commutator of the source-native coordinate planes:

```text
rho(F_rs F_tu - F_tu F_rs)
  = rho(F_rs) rho(F_tu) - rho(F_tu) rho(F_rs).
```

The theorem retains the accepted normalization `rho(F_rs) = (1/2) gamma_r gamma_s` for distinct labels. No label permutation, replacement gamma basis, guessed coefficient, theorem weakening, new axiom, admission, linter suppression, or proof-limit increase was introduced.

## Causal repair and preserved negative knowledge

The prior full-gate reds remain immutable. Run #41390535566 showed that ordinary simplification did not transport coercion through F10AU's nested proof-dependent conditional. Diagnostic run #41392402777 then showed two distinct proof-interface errors:

1. splitting conditionals only in the coerced equality left the target conditional tree unsplit;
2. an ordinary nondependent-`if` coercion lemma did not match the dependent subtype values.

Corrected diagnostic run [#41394112952](https://github.com/etblink/math/actions/runs/41394112952), exact commit `a95c9d03883bb8a194b7bdb715bc27df26cea575`, compiled when the same source-label conditionals were split simultaneously in the coerced equality and the target. That diagnostic was exploratory and added zero roots. F10AW transferred only the compiling carrier bridge and discharged the three impossible label-collision branches by explicit equality composition.

## Scope ceiling

This acceptance establishes generator-pair bracket compatibility only. It does **not** yet establish:

- bracket preservation for arbitrary skew `9×9` source matrices;
- a typed native `so(9) → so(16)` `LieHom`;
- global Spin(9) integration;
- any Spin(48) lift, covering, or surjectivity statement;
- the original Fock action;
- gauge or physical-domain compatibility;
- BFSS spectral existence.

## Next bounded stage

Define the raw original-`16` bracket defect

```text
D(A,B) = rho(A*B - B*A) - (rho(A)*rho(B) - rho(B)*rho(A))
```

and prove only its typed real additivity and scalar homogeneity in each input. Reuse the qualified V9I/V9J bracket-defect architecture but retain the original `16×16` gamma target and F10AV map. Generator zero, one-plane-versus-skew extension, arbitrary-skew vanishing, and the native `LieHom` remain later separately qualified stages.
