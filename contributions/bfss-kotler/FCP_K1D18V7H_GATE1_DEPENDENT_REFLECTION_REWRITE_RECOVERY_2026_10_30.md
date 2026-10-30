# K1D18V7H Gate 1 — dependent reflection rewrite failure; Gate 2 recovery

**Project Lead negative evidence, 2026-10-30 UTC.** V7G remains accepted. V7H is unqualified pending new strict evidence.

## Failed gate and causal diagnosis

- [GitHub Actions run #41018912569](https://github.com/etblink/math/actions/runs/41018912569), tested SHA `5a413c25381a7859083459804bb1b928043c6e0b`, job `123941484559`, completed failure, attempt 1.
- Original failed V7H source Git blob `36f41add9bd467e8603e511def89cb23ee3199bd`. Retained failure artifact `12961725288`, SHA-256 `fe0fbddb695e0e837557d8617663ad507e462219bf9f027c46048a711a61ed60`.
- Exact source pin check, Lean/Mathlib restore and `FCP_CACHE_PILOT_WARM_REVALIDATION_PASS modules=37 roots=81` passed. Fresh warning-as-error compilation failed; independent 129-root audit was skipped, so NO V7H root qualified.
- **First causal error** at source line 69:6, `Tactic rewrite failed: motive is not type correct`, rewriting `euclideanUnitNormal_span_eq u hu` inside `Kᗮ.reflection`. The `FiniteDimensional ℝ ↥K` instance is indexed by the exact submodule, so ordinary `rw` cannot elaborate a dependent motive, even though the two source lines are mathematically equal. Lean's diagnostic advises `simp` as an instance-aware rewrite strategy. This is an elaboration/instance-transport boundary, NOT a counterexample to source reflection normalization.
- The first independent unit-normal and span equality roots compiled before this error; their dependent failed roots are unqualified and may mention `sorryAx` only as an effect of failed elaboration.

## Bounded one-line recovery

- Replace exactly `rw [euclideanUnitNormal_span_eq u hu]` by `simpa only [euclideanUnitNormal_span_eq u hu]` in `euclideanUnitNormal_reflection_eq`.
- New source blob `7d23c05c6cde8a6338b0282af8e43e0109b4e516`; only that source hash pin changes in the existing V7H strict workflow `.github/workflows/bfss-kotler-k1d18v7h-hyperplane-unit-normal-zero-strict.yml`.
- No changes to theorem statements, original 48-label source Q, original Clifford action, native Euclidean type, accepted source modules, toolchain, sealed ancestry, axiom whitelist, compilation limits or generator assumptions.
- New gate remains a candidate: 37 fresh warning-as-error modules, 129 independent root type/axiom audits and exact sealed 81-root ancestry verification. If red, classify the new earliest causal error and retain the negative evidence. Do not claim a theorem from a failed compilation.

## Scientific scope and governance

Zero-native-hyperplane reflection as identity, unit normalization of each nonzero Euclidean normal and the unit-or-identity disjunction are not yet accepted. Subsequent determinant parity and even pair generation remain unproved. SourceSO generation and Spin48 surjectivity, covering, global Spin9 and BFSS spectra remain separate unproved obligations. Research branch only; do not alter `main`, accepted sources, FCP canonical provenance, or upstream.
