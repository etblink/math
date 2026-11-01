# F10AL Gate 1 RED — statement-preserving strict linter repair

Date: 2026-11-01. Owner research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## Immutable negative result

[Run #41352777956](https://github.com/etblink/math/actions/runs/41352777956), attempt 1, commit `ca616ec51013aadc8d488b66c89e848996d20229`, completed FAILURE. [Artifact #13102276226](https://github.com/etblink/math/actions/runs/41352777956/artifacts/13102276226), SHA256 `cf93f3a367d1a39b413af579dee3a8c9b1e9117b9a6ea5c38e35aee3c931791f`.

Source pins for the ORIGINAL public gamma family, frozen Lean v4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, and rebuilding accepted F10AK ancestry PASSED. Fresh F10AL `-DwarningAsError=true` compilation FAILED ONLY on two strict lint diagnostics:
- F10AL source line 45: `hbc` argument unused in `source9OriginalGamma_ordered_fork_forward_product`. Its type `b<c` remains mathematically part of the exact frozen statement (even if this particular algebra identity does not need that assumption).
- F10AL source line 79: `simpa only [source9OriginalGamma_anticommute c b hcb, neg_neg]` triggered unnecessary-`simpa` linter, which requests `simp`.

Lean emitted all four candidate `#print axioms` reports with only allowed `propext`, `Classical.choice`, `Quot.sound` and NO `sorryAx`. But these reports are NOT qualification: compilation failed and the independent four exact type/axiom audits were skipped.

## Gate 2 bounded correction

Two source lines only: rename the unused forward-proof binder `hbc` to `_hbc` WITHOUT changing `b<c` or the theorem statement's elaborated type; replace `simpa only` with `simp only` at line 79. The ORIGINAL gamma matrix carrier, exact ordered labels, both product equalities, matrix commutator, native `so(16)` bracket, and all theorem names/types are preserved. Update only the F10AL source-hash pin in the strict workflow.

**Do not** disable strict linters, suppress warnings, weaken assumptions, raise Lean limits, add axioms or sorry, mutate accepted files, merge to main, or send upstream PR. Require a NEW warnings-as-errors compiler success AND all FOUR independent theorem-type and root-axiom audits before acceptance. If Gate 2 fails, retain and diagnose it independently.
