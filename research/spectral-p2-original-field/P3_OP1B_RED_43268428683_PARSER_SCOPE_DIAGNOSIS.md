# P3-OP1B strict RED #43268428683 — original trace column inner-product parser scope

**Date:** November 12, 2026, Pacific. **Project Lead status:** RED at exact tested source commit `df24dca8869033f0e4335a977f8737db4e8c9d8c`; narrow source/consumer parser repair authorized under existing bounded proof plan. **No theorem accepted at this gate.**

## Immutable evidence
- [Run #43268428683](https://github.com/etblink/math/actions/runs/43268428683), attempt 1, completed `failure`; job `131358152198`.
- [Red artifact #13968256785](https://github.com/etblink/math/actions/runs/43268428683/artifacts/13968256785), GitHub-reported digest `sha256:41d1be6a06404fe843a3e2c9df5184a68a3aa88c025e279565db22043585eec1`; contains original cold-build log and source-pin evidence.
- The 59/59 exact blob preflight passed. Pinned Lean `4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored. Historical OP1A/T1 sources cold-compiled again with normal allowed axioms.
- New source failed before consumer compilation, in `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3OP1BOriginalFockTraceColumns.lean`:
  `31:48: expected token`; `48:32: expected token`.
- The positions are the closing delimiters of `⟪b i, T (b i)⟫_ℂ` and `⟪T (b i), T (b i)⟫_ℂ`. New source and consumer lack `open scoped InnerProductSpace` even though pinned `Mathlib/Analysis/InnerProductSpace/Trace.lean` has it at line 25 before its `trace_eq_sum_inner` theorem. No unsolved well-typed mathematical inequality was reported; parser errors block elaboration.
- The two `#print axioms` outputs list `sorryAx` solely because parsing/elaboration failed. Neither theorem is strict-qualified at this tested commit. No permission to weaken statements or axioms follows.

## First causal classification and smallest repair
**Source parser/notation scope**, not type mismatch, failed proof tactic, topological assumption, physical domain mismatch, or new representation obstruction.

Insert **only** `open scoped InnerProductSpace` in the new OP1B source and its independent consumer (which likewise spells scoped inner notation), leaving the identical two Lean theorem statements and proof tactic bodies, all 57 accepted ancestor blob pins, original module imports, toolchain, consumers' nontrivial arguments, strict warning/axiom contracts untouched. Update precisely the new source and consumer Git blob pins in the OP1B workflow. Launch one new cold source-and-consumer run.

If the replacement run is red at a *new* Lean type/tactic error, classify that first error from the log and isolate only its source-level adapter; do not speculate or cycle broad simplifiers. If a consumer-only linter red occurs after source passes, leave source bytes untouched. Preserve this red and the next receipt chronologically.

**Scientific ceiling:** OP1B's exact trace and positive-adjoint column identities remain **UNQUALIFIED** until their own strict-green source plus independent consumer, and would not prove source Spin continuity, physical gauge fixedness, closed original Hamiltonian or spectral eigenvalues.
