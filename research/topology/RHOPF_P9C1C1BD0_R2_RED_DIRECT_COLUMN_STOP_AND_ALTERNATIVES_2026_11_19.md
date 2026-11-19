# RHOPF-P9C1C1B-D0 R2 — native RED; direct single-column tactic family stopped

**Date:** 2026-11-19.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**R2 original run:** [#44577006982](https://github.com/etblink/math/actions/runs/44577006982), concluded **RED**, attempt 1, exact tested SHA `ce7eb401eec62b5b2b924b084f1c8252ef05c05d`.
**Retained artifact:** [#14558650758](https://github.com/etblink/math/actions/runs/44577006982/artifacts/14558650758), original ZIP SHA-256 `e24839aea3f16c69bd377a7672d29745c90c878985dc447622ffbc71d06f11fd`. Original ZIP was downloaded; hash matches GitHub Actions digest and contains the exact tested commit and native compiler log.

## Results and evidence

- Frozen original source hash/declaration preflight, original signed-permutation independent integer fixture, pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, and accepted native original Gamma9/relational predecessors: PASS.
- Original source `RHOPFP9C1C1BD0OriginalGammaSingleColumnDiagnostic.lean` failed at **line 39:4** after `fin_cases i <;> norm_num [gamma, Matrix.map_apply, Pi.single_apply]`. Lean reported `Pi.single 10 ?m.55 i` has type `?m.48 i` but expected `ℝ`, as in R1. Hence the one native theorem `originalGamma3_on_basis0` reports `sorryAx` in the failed diagnostic; independent Lean consumer skipped.
- R1 [#44574592530](https://github.com/etblink/math/actions/runs/44574592530) and R2 are BOTH native RED. R1 used `norm_num [gamma, Matrix.map_apply, Pi.single]`; R2 substituted the typed `Pi.single_apply` lemma without changing the observed dependent-function elaboration error.

**STOP decision:** Do not retry this `fin_cases i; norm_num` direct source-column tactic family, extend it to 4x16 or 256 cells, copy private original signed-permutation tables, use non-module `import all`, or change original source or resource limits. This negative diagnostic must remain retained even if a future different approach proves the statement.

## Forward-path analysis

The original source gamma definition is a cast from a **private integer signed-permutation matrix**; private perm/sign implementation is not a published modular typed interface. Copying it into an imported second implementation would require a rigorous original-source equality bridge, not numerical fixture equivalence alone. A reusable public signed-permutation action adapter should first supply one *typed source equality theorem*, ideally in the source-owning module after explicit source-owner authorization, but our accepted original source is currently frozen: no modification has been authorized. A new diagnostic may instead develop generic sparse-action algebra over a **parameterized signed permutation** with a separate *explicit source binding obligation*. Do not claim the binding for free.

**Alternative advancement without that binding:** Prove an original-source invariant complex-structure equation for `J = K13 * relationalProjector` using previously qualified full-source commutation, square `K13²=-I`, and projector idempotence. The equation `J²=-P` can be proved abstractly, avoiding gamma coordinate lookup entirely. This would show that the rank-four original relational image is invariant under a complex structure, a necessary geometric ingredient for a selected complex Hopf phase, but no physical vortex, carrier coordinates, Fock-space action, or dynamical selection follows solely from it.

Current strongest accepted results remain P9C1B1 rank4, P9C1C0 conditional coordinate rank-saturation, and P9C1C1A common-action equalizer. A new `J²=-P` gate is a separate source-exact algebraic experiment, not a disguised continuation of the failed direct-entry method.
