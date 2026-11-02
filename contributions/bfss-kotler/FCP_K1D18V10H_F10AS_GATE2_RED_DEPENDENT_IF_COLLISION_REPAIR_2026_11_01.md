# F10AS Gate 2 RED — dependent-if collision case proof elaboration

Date (Pacific local): 2026-11-01. Authorized owner branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## Immutable failed-gate evidence
[Run #41366021008](https://github.com/etblink/math/actions/runs/41366021008), first attempt, tested SHA `1c5736a09283c4b31e8e8f017eb64779205b7063`, completed FAILURE. [Artifact #13107233187](https://github.com/etblink/math/actions/runs/41366021008/artifacts/13107233187), ZIP SHA256 `395447a9925e1576103dcbdb423ceee5d15b09ff7353af3de649a7f01b19f163`. Pin checks, frozen Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, accepted F10AR ancestry build ALL passed. Fresh `-DwarningAsError=true` compilation failed. All four independent exact theorem-type/root-axiom audits skipped.

Compiler failures:
* F10AS source line 61: `Type mismatch` in the `a=c` chain collision branch. After `subst c`, RHS still contains `if hac : a=a then 0 else 2 • ...`, so applying previously qualified reversed-pair zero theorem before reducing that dependent-if cannot match the goal.
* Lines 80 and 98: `exact lie_self _` causes `LieRing ?m.46` typeclass instance problems with unresolved carrier metavariables. Previous F10AR RED taught that passing an ambiguous generic Lie theorem to `exact` can underconstrain typeclass inference.
* Diagnostic axiom output of the three incomplete declarations included `sorryAx`. Not accepted; no theorem qualification.

## Bounded Gate 3 repair
For all three positive collision branches, explicitly `rw [dite_eq_left (show x = x from rfl)]` *after* the existing `subst`. This uses the precise active Lean 4.34.1 supported core theorem; it is not deprecated. Keep all three negative-branch `simp only [dite_eq_right h]` steps unchanged. For shared-left and shared-right collision cases, replace `exact lie_self _` with the already F10AR-qualified source-exact carrier theorem `source9OriginalGamma_distinct_pair_native_so_self_bracket_zero`, supplying explicit source-index arguments and proof of distinct labels. The chain collision case similarly uses the existing F10AS reverse-bracket zero theorem.

Preserve byte-for-byte all four mathematical theorem STATEMENTS, hypotheses, original gamma representation, accepted module ancestry, test toolchain, strict compilation flags and four independently re-elaborated complete dependent-if types/root-axiom auditors. Update only the candidate source-hash pin and scope check in the strict workflow. NO sorry, added axioms, new gamma tables, raised limits, linter suppression, main merge or upstream PR. This gate is a new *candidate* until full strict verification passes; Gate 1 and Gate 2 remain RED records even if future gates succeed.
