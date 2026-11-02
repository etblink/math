# F10AU Gate 2 RED — independent audit duplicated obsolete binder names

Date: 2026-11-01 Pacific local. Branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## Immutable failure evidence
[GitHub Actions Run #41371314341](https://github.com/etblink/math/actions/runs/41371314341), attempt 1, exact tested SHA `44c3201510f893199ec97015c479723639aa4935`, completed FAILURE. [Artifact #13109771825](https://github.com/etblink/math/actions/runs/41371314341/artifacts/13109771825), ZIP SHA256 `cf35d0439e1b5a8fe7013e6f92b0fa29531f2b14e44f92223e06b8abf31a0f7f`.

Original gamma/F10E/F10AJ–F10AT pins PASSED; frozen Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration PASSED; accepted F10AT ancestry rebuild PASSED; actual F10AU source fresh `-DwarningAsError=true` compilation PASSED. The candidate theorem elaborated and its root-axiom report was limited to `propext`, `Classical.choice`, `Quot.sound`.

The independent exact theorem-type audit FAILED because its separately restated complete theorem type still used the two old unused dependent-if binder names `hbd` and `had`, at temporary audit lines 20 and 22. This duplicated the Gate 1 lint defect in the audit harness. No independent audit PASS marker was emitted; F10AU remains UNQUALIFIED. This is an audit-source linter defect, not a counterexample or source compilation failure.

## Gate 3 bounded repair
Update ONLY the independent audit's restated type in the F10AU workflow: rename its final two unused dependent-if binders `hbd` -> `_hbd` and `had` -> `_had`. Leave the already-correct F10AU source untouched. Preserve the candidate source pin, theorem and five cases, source/toolchain pins, F10AT ancestry rebuild, warning-as-error flags, complete independent theorem type and root-axiom allowlist. The new strict run must pass the source compile AND independent audit. No lint suppression, weakened gate, changed mathematical statement, accepted ancestor edit, main merge or upstream PR. Preserve this RED as negative knowledge.
