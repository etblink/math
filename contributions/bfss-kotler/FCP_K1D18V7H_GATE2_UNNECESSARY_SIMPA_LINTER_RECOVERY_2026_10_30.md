# K1D18V7H Gate 2 — unnecessarySimpa warning-as-error; Gate 3 bounded repair

**Project Lead negative-knowledge record — 2026-10-30 UTC.** Preserve all failed CI evidence and original source SHA. Source-exact V7G is still accepted. V7H is unqualified until a complete independent strict green.

## Immutable failure provenance

- [Gate 2 run #41020331788](https://github.com/etblink/math/actions/runs/41020331788), job `123945949932`, attempt 1; tested commit `891c58e3caa7cf8cd54c932baea44e20685a76ce`, conclusion **failure**, completed 2026-10-30T07:40:40Z.
- Failed source blob `7d23c05c6cde8a6338b0282af8e43e0109b4e516`; retained artifact `12962135752` digest `sha256:f0140a5119968437659793e92ca3732e573d47e13c978b24359b19b73d5e5e18`.
- Exact source hashes, pinned toolchain restoration, and sealed ancestry `FCP_CACHE_PILOT_WARM_REVALIDATION_PASS modules=37 roots=81` passed.
- The first (and only observed source) error was `SU2BFSSPhysicalDomainS1V52K1D18V7HNativeHyperplaneUnitNormalOrIdentityProbe.lean:69:2: error: try 'simp' instead of 'simpa'`. This is the `linter.unnecessarySimpa` diagnostic promoted to an error by mandatory `-DwarningAsError=true`. **Not a mathematical proof failure.**
- All six local declaration axiom printouts had only `propext`, `Classical.choice`, `Quot.sound` and no `sorryAx`; nevertheless, compiler status was red and the separate exact 129-root type/axiom audit step was skipped. No V7H root is accepted.
- Gate 1 [run #41018912569](https://github.com/etblink/math/actions/runs/41018912569) failed at an ordinary `rw` into a dependent submodule-instance motive. Its surgical change to `simpa only` solved that elaboration issue but exposed the unnecessarySimpa linter, a distinct negative result. Do not discard either failure.

## One-line Gate 3 correction

Replace the unique line
```lean
  simpa only [euclideanUnitNormal_span_eq u hu]
```
with
```lean
  simp only [euclideanUnitNormal_span_eq u hu]
```
inside `euclideanUnitNormal_reflection_eq`. Lean itself recommends `simp`; this is a proof-style fix only, retaining its instance-aware dependent rewrite.

New exact source blob `f55cd43b5edd99b12aba51d76ee6b3fa75abb103`. Only the corresponding exact source hash pin changes in `.github/workflows/bfss-kotler-k1d18v7h-hyperplane-unit-normal-zero-strict.yml`. Strict compilation still requires 37 fresh warning-as-error modules, 129 original source-exact independent axiom/type roots, 81 accepted sealed ancestor roots, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. No source definitions or theorem statements, alternate matrix, linter suppression, axiom additions or proof limits changed.

This is a CANDIDATE. Accept V7H only after completed terminal green and independent verification of exact SHA, source pins and individual declaration-level axioms.

## Scope not proved

Even after V7H acceptance, it proves only the zero-vs-unit-normal reflection bridge. Removing zero factors from a Cartan list, parity of nonzero hyperplane reflections from determinant +1, source unit-pair products, actual sourceSO generation, unconditional Spin48 surjectivity, covering, global Spin9 and BFSS physical spectra are separate unproved mathematical obligations. No changes to main, FCP canonical provenance or upstream community.
