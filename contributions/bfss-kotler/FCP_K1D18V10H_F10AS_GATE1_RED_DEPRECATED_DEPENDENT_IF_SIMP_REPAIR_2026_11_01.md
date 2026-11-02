# F10AS Gate 1 RED — deprecated dependent-if simp lemmas under strict Lean 4.34.1

Date: 2026-11-01 (America/Los_Angeles). Owner branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## Immutable failed-gate evidence
[Run #41364801493](https://github.com/etblink/math/actions/runs/41364801493), attempt 1, tested exact SHA `e945646f6549a619a28d10ed8859e20f246de21d`, completed FAILURE. [Artifact #13106529699](https://github.com/etblink/math/actions/runs/41364801493/artifacts/13106529699), ZIP SHA256 `4c79a1f5e633f246610094d4a637bd6852bfcdf1121a1e11e0a65f9091f30776`.

Original gamma/F10E/F10AJ–F10AS immutable source pins, frozen Lean v4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, and accepted F10AR ancestry rebuild PASSED. Strict candidate compilation failed on NINE diagnostics across THREE dependent-if cases:
- Lines 61, 81, 100: `dif_pos rfl` deprecated in Lean 4.34.1 (`dite_eq_left` is replacement), plus the unused-simp-argument linter reports the positive-branch rewrite is unnecessary after `subst`.
- Lines 64, 83, 102: `dif_neg h` deprecated (`dite_eq_right h` is replacement).
- The compiler reported allowed root axioms for all four candidate declarations, no sorryAx in their report. Yet the strict build FAILED. FOUR independent exact type/axiom audits were SKIPPED; NO qualification.

## Minimal statement-preserving Gate 2 patch
Remove the 3 unused `simp only [dif_pos rfl]` proof steps, retaining `subst` and following accepted self/reverse bracket exact terms. Replace all 3 deprecated `simp only [dif_neg h]` steps with source-version-supported `simp only [dite_eq_right h]`. Preserve every mathematical theorem statement and hypothesis, source exact native so(16,R) pair carrier, all other proof lines, and all qualified prior Lean sources. Update only the F10AS source hash and replace the verification scope probe for deprecated lemmas with source exact `dite_eq_right` and `by_cases`. Warning-as-error and linter checks stay ENABLED.

Require new F10AS Gate 2 warnings-as-errors compilation and all FOUR complete declaration types and allowed root-axiom audits; no new axioms/sorry, no resource limit increases, no main merge or upstream PR. Preserve Gate 1 negative evidence even if later green.
