# F10AR Gate 1 RED — typeclass metavariable resolution in native Lie negation

Date: 2026-11-01. Authorized research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## Immutable negative evidence
[Run #41362594482](https://github.com/etblink/math/actions/runs/41362594482), attempt 1, exact tested commit `6e0dfdb9d76de23d0a30529a8c443e8d5ec8b5d7`, completed FAILURE. [Artifact #13106495239](https://github.com/etblink/math/actions/runs/41362594482/artifacts/13106495239), ZIP SHA256 `e1ccd425af136ee90d50d4e52bd4593b8b7361349dd9f41bce58149d5dba6552`.

Original gamma source pins, frozen Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, and F10AQ accepted ancestry rebuild PASSED. Fresh warning-as-errors compiler FAILED at F10AR source line 59 `exact neg_lie` and line 71 `exact lie_neg`: in both locations Lean reports `typeclass instance problem is stuck: LieRingModule ?m.17 ?m.18` with undetermined metavariable parameters. Both proposed native reversed-bracket statements are well-scoped but their proof-term `exact` attempts did not resolve implicit module arguments. The two incomplete proofs were marked with `sorryAx` in diagnostic axiom reports and remain NOT ACCEPTED. Third and fourth native zero cases had no errors in the compiler log but all four independent type/axiom audits were SKIPPED because strict source compilation failed. The failure is proof-term elaboration, not a mathematical counterexample or grounds to relax exact theorem scope.

## Gate 2 minimal correction
Replace the proof terminal `exact neg_lie` at line 59 with `simp only [neg_lie]` and `exact lie_neg` at line 71 with `simp only [lie_neg]`. Lean will instantiate the existing pinned Mathlib native Lie-bracket negation laws from the goal expressions; accepted F10AP source sign reversal and all original gamma representations remain unchanged. No theorem statements, all other proofs, native so(16,R) carrier, indexed hypotheses, ancestor files, toolchain, workflow semantics or resource limits change. The strict workflow's source-hash pin is updated for the two-line proof correction.

Require a NEW source-pinned `-DwarningAsError=true` compile PASS and all FOUR independent exact theorem-type/root-axiom checks PASS with only `propext`, `Classical.choice`, `Quot.sound` and NO sorryAx. A green is not assumed until independently confirmed. Preserve immutable red evidence, no new axioms/sorry, no raised recursion/heartbeats, no disabled linting, no main merge/upstream PR.
