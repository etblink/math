# K1D18V10H F10AW — Gate 2 RED: repeated subtype coercion failure

**Date:** 2026-11-02 UTC / 2026-11-01 Pacific  
**Repository:** `etblink/math`  
**Branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`  
**Disposition:** Gate 2 candidate failed. No F10AW theorem root is accepted.

## Immutable run evidence

- [Run #41390535566](https://github.com/etblink/math/actions/runs/41390535566), attempt 1, terminal failure.
- Exact tested commit: `9faaa0f6e25367ab2b53002b219f7bb3d94c045d`.
- Job: `125100716647`, `original-gamma-coordinate-plane-bracket`.
- Retained artifact: [#13117102550](https://github.com/etblink/math/actions/runs/41390535566/artifacts/13117102550), ZIP SHA256 `fecff59b4bc5c65e95b9bed0f1bd5e7da996e073ae3160012b2e70b13fae507b`.
- Exact source/ancestor pins passed.
- Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restore passed.
- Accepted F10AV/F10AU ancestry rebuilt successfully.
- Native source four-index coordinate-plane bracket ancestry rebuilt successfully.
- Fresh F10AW warnings-as-errors compilation failed at Step 7.
- Independent theorem-type/root-axiom audit was skipped.

## Earliest causal failure — unchanged carrier boundary

At F10AW source line 97, the revised ordinary `simp` attempt still fails to convert F10AU's native `LieSubalgebra` dependent conditional into the `GammaMatrix` conditional required by the target.

The compiler reports the coerced equality in the shape

```lean
gamma r * gamma s * (gamma t * gamma u) - ... =
  ↑(if hac : r = t then ... else ...)
```

while the target is

```lean
gamma r * gamma s * (gamma t * gamma u) - ... =
  if r = t then ... else ...
```

The output subtype is defined by `source9OriginalGammaDistinctPairInSo`; its conditional remains inside the subtype when the coercion is applied. Replacing the previous `simp only` list with ordinary `simp` did not distribute the coercion through that dependent conditional. This repeats the first causal failure of [Run #41388590016](https://github.com/etblink/math/actions/runs/41388590016), rather than resolving it.

This is a source-level subtype/coercion elaboration failure. It is not a counterexample to the accepted F10AU pair-bracket theorem, F10AV coefficient LinearMap, or the desired generator-pair identity.

## Secondary proof diagnostics

The later `split_ifs <;> simp_all <;> norm_num [smul_smul]` leaves two impossible equality branches:

1. `s = u` and `r = u`, contradicting `hrs : r ≠ s`; the remaining goal is `gamma u * gamma t = 0`.
2. `s = t` and `r = t`, contradicting `hrs : r ≠ s`; the remaining goal is `gamma t * gamma u = 0`.

These are secondary proof-branch discharge failures. The explicit contradictions are respectively `hrs (hru.trans hsu.symm)` and `hrs (hrt.trans hst.symm)` after naming the generated equalities. They are not evidence of a mathematical counterexample. Do not repair this part of the full theorem until the earlier carrier-conversion boundary is independently qualified.

## Method correction and bounded diagnostic

The Gate 1 causal review required stopping full-theorem edits if the subtype coercion remained the first failure. That stop rule is now active.

An isolated diagnostic module was added at commit `9357900fc8ae5f0ea8ef112ff1c81dccbd201969`:

`lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10AWSubtypeCoercionInterfaceDiagnostic.lean`

It tests two alternatives against the exact accepted F10AU equality:
- Diagnostic A: split the dependent conditional only after applying the subtype coercion.
- Diagnostic B: prove and use a local lemma distributing subtype coercion over an `if`.

A separate exploratory workflow was added at commit `9175bfedd38cb2f788eedd5039809bdbab9f01ab`:
[Run #41392402777](https://github.com/etblink/math/actions/runs/41392402777). It pins the exact accepted F10AU ancestry, Lean 4.34.1 and Mathlib revision, rebuilds F10AU, and compiles only the isolated diagnostic. At the time of this record, its result is pending; it is not a formal acceptance gate and contributes zero theorem roots.

## Next action

1. Inspect the terminal result and full artifact for diagnostic Run #41392402777.
2. If either isolated coercion method compiles, transfer only that proven bridge into F10AW and separately discharge the two contradictory overlap branches with explicit equality composition.
3. If both methods fail, stop and reduce the carrier conversion further to a primitive subtype/conditional lemma. Do not submit another full F10AW variant without new compiler evidence.
4. Only after the exploratory bridge passes, run the unchanged fail-closed F10AW gate: exact source and ancestor pins, pinned dependencies, warnings-as-errors, independent complete theorem-type elaboration, declaration-level root-axiom audit, no `sorryAx`, and retained exact-SHA artifacts.

No theorem statement, hypotheses, source labels, pair orientation, coefficient, carrier, axiom policy, linter policy, or proof limits are changed. F10AW remains unqualified.
