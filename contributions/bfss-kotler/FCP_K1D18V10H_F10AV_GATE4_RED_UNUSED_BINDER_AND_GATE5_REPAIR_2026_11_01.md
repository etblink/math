# K1D18V10H F10AV — Gate 4 strict linter failure and bounded Gate 5 repair

**Date:** 2026-11-01 Pacific / 2026-11-02 UTC  
**Repository:** `etblink/math`  
**Branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`  
**Status:** Gate 4 failed; Gate 5 is a new unqualified candidate.

## Immutable Gate 4 evidence

[Run #41379566948](https://github.com/etblink/math/actions/runs/41379566948), job `125067165791`, tested commit `964837366a6584abfabcdfbeceba42e0d4835e77`, completed red. Failure artifact #13113571122; artifact ZIP digest `sha256:f6e3492771cb5c173e46e74cc7c01934b38c96e4900123333dc43b23383099cb`.

Passed: exact source/ancestry preflight; pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restore; accepted F10AU exhaustive original-gamma bracket ancestry rebuild; accepted V9F native skew-coordinate-plane spanning ancestry rebuild.

Failed: fresh F10AV warnings-as-errors compilation at source line 116:9:

```text
error: Variable name `hrs` is not explicitly referenced.
```

The dependent conditional in the theorem's stated result names an equality witness that the branch result does not use. The strict compiler recommends `_hrs` (or `_`). This is a linter failure, not a mathematical counterexample.

The source compiler emitted all eight F10AV `#print axioms` reports; each listed only `propext`, `Classical.choice`, and `Quot.sound`, with no `sorryAx`. However, the warnings-as-errors compile step was red and the separate independent eight-declaration type/axiom audit was skipped. Therefore **F10AV is not accepted** by this run.

## Source-bound repair

- Rename the unused dependent-if binder from `hrs` to `_hrs` in `coordinateToOriginalGammaLinearMap_coordinatePlane`.
- Make the same binder-name correction in the independently restated complete theorem type inside the strict workflow's audit example. The audit must compile under the same warning-as-error policy; repairing only the source would reproduce a known failure mode.
- Update the workflow's exact candidate source-blob pin to the new source blob.
- Preserve every theorem proposition modulo the irrelevant binder name, proof body, coefficient normalization, original gamma generators, source matrix carriers, imports, accepted ancestry, pinned dependencies, and axiom whitelist.

This is the same proven repair pattern as F10AU: Gate 1 run #41370068416 exposed unused dependent-if binders; the source was repaired with `_hbd` / `_had`; Gate 2 run #41371314341 exposed the same stale binder names in the independent audit; the audit was corrected; Gate 3 run #41372474729 then qualified F10AU. F10AV must correct both source and independent restatement in one atomic change.

No linter suppression, warning downgrade, proof-limit increase, axiom relaxation, theorem weakening, source-basis substitution, accepted-ancestor edit, `main` merge, or upstream PR is permitted.

## Gate 5 qualification contract

At the exact tested commit, require: (1) exact source and accepted-ancestry pins; (2) pinned Lean/Mathlib restoration; (3) successful F10AU and V9F ancestry rebuilds; (4) fresh F10AV warnings-as-errors compilation; (5) independent elaboration of all eight complete declaration types; (6) declaration-level axiom reports restricted to `propext`, `Classical.choice`, and `Quot.sound`, with no `sorryAx`; and (7) exact tested SHA plus retained logs and artifact identity/digest.

Any new red remains immutable and must be classified from its first causal diagnostic before another edit.

## Scope ceiling

Even a fully qualified F10AV result establishes only that the specified source-native real linear map sends every skew 9x9 input into the original gamma-matrix `so(16, ℝ)` carrier. It does **not** establish arbitrary bracket preservation, a source `so(9) → so(16)` `LieHom`, global Spin(9) integration, a Spin(48) lift or covering, gauge/physical-domain compatibility, or BFSS spectral claims.