# K1D18V7G Gate 1 — native unit-line reflection simplification mismatch

**Project Lead evidence and bounded correction, 2026-10-30 UTC.** V7F Gate 2 is accepted; V7G remains an unaccepted research candidate pending a new strict pass.

## The red must not be overwritten or called mathematical evidence for the theorem

- Original red [run #41016001371](https://github.com/etblink/math/actions/runs/41016001371), tested exact SHA `c1657a21e8d0ca50e36733754dec516f34df7891`, job `123932346034`, finished failure at 2026-10-30T06:55:43Z.
- Failed V7G original source blob `63a1c2e95b5429b9b10dc49957182f89c475a71e`; retained artifact `12958954535` SHA-256 digest `6ebd9f800ae8b02f13049c712ab6c09df9b81a3cb28d1413adbcdb146d590dde`.
- Exact original source hashes, Lean 4.34.1 / pinned Mathlib, dependency restoration, and `FCP_CACHE_PILOT_WARM_REVALIDATION_PASS modules=37 roots=81` succeeded. Fresh warning-as-error compilation failed while building candidate V7G. Independent 123-root type/axiom audit was skipped.
- **First causal Lean diagnostic**: `SU2BFSSPhysicalDomainS1V52K1D18V7GOriginalSourceNativeEuclideanReflectionCorrespondenceProbe.lean:43:2`, `Type mismatch: After simplification`. The application of pinned `Submodule.reflection_singleton_apply` produced a quotient `inner ℝ u w / ↑1 ^ 2` while the expected statement had `inner ℝ u w`. The `simpa only` list omitted normal reductions of the coercion/power/division after specializing the normal to Euclidean unit norm.
- The dependent axiom printouts contain `sorryAx` because they are **unproved candidate declarations following the compile failure**, not an authorized proof. No V7G roots are accepted from this red.
- Cause class: **restricted simplifier omitted unit norm denominator normalization**. The source quadratic form and native reflection mathematical identity were not contradicted.

## Exact one-line repair

- Replace unique proof step `simpa only [hu, one_pow, div_one, two_smul, two_mul, add_smul] using` by `simpa [hu, two_smul, two_mul, add_smul] using`.
- New source blob `c2960c1c45c0a15b3a181b988e28aac0c948f0e6`; strict workflow `.github/workflows/bfss-kotler-k1d18v7g-source-native-reflection-correspondence-strict.yml` updates only this exact hash pin.
- This allows Lean's standard simplifier to normalize `(‖u‖ : ℝ)^2`, with *no change to the theorem statement, any source matrix, source-Q form, 48-label ordering, imports, constraints, Lean or Mathlib version, independent audit, accepted ancestor cache, or proof limits*.
- This is a **candidate only**; subsequent strict warning-as-error source compilation (36 modules), independent type and axiom audit (123 roots), and sealed 81-root ancestry verification must all pass at the exact tested commit. Inspect the first causal error if it goes red.

## Mathematical scope

V7G aims to show that the **actual source Clifford line-axis** operator is Mathlib's **native line reflection** after same-label Euclidean transport, and its negative is the corresponding native hyperplane reflection. For original Q-unit vectors, pairs correspond to native hyperplane-reflection pairs, including the genuine original Spin48 pair action. No arbitrary Euclidean Cartan factor normalization, determinant parity factor count, original sourceSO generation, Spin48 image surjectivity, covering, global Spin9 or BFSS spectral claim is made.

**Governance**: owner research branch only; no changes to `main`, any accepted source, FCP provenance, or upstream community.
