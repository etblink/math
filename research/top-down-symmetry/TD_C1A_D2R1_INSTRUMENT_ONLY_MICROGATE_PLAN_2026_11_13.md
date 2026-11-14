# D2R1 — instrument-only original-Fock control microgate

**Registered:** 2026-11-13 Pacific. **Experiment:** `E-TD-C1A-D2R1-INSTRUMENT-001`. **Status:** REGISTERED_NOT_EXECUTED.
**Scope:** qualify the *observation instrumentation* on source `Fermion 2` under pinned Lean `v4.34.1` / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Not original source axis or full 48-vector covariance; no true operator join.

## Scientific-method contract and hypothesis

Observation: D2 #43560114891 was a green *collection* but failed its first variable control at a no-op observation tactic linter and reported an unresolved witness type metavariable versus an outer metadata wrapper.

Hypothesis: On the exact source Fock carrier with arbitrary variable `U,A,B,h`, using an **explicitly typed** local witness, `instantiateMVars` after `inferType`, and bounded raw-versus-outer-metadata-stripped expressions will produce a valid fully elaborated comparison report; a legitimate proof finishing with `exact hw` will compile and pass the source/standard-axiom audit when only the diagnostic-only `linter.unusedTactic` option is explicitly disabled. No hypothesis of substantive source gamma covariance is tested.

Independent changes, introduced only in the new files: (1) witness binder has exact explicit type instead of `have hw := h ψ`; (2) inspection calls `instantiateMVars` on both types; (3) report raw and top-level `Expr.consumeMData` structural/alpha equality; (4) disable `linter.unusedTactic` **only in the diagnostic positive control**, without changing `-DwarningAsError` or axiom audit.

Dependent observations: exact named root compilation, axiom set, compiler errors, `witness_mvars`, `goal_mvars`, raw/outer-metadata-stripped structural and alpha flags, elapsed time and hash of log.

Controls: unchanged source Core, original `Fermion 2` with `U : Fermion 2 ≃ₗᵢ[ℂ] Fermion 2`, original `ContinuousLinearMap.mul_def/comp_apply` and `LinearIsometryEquiv.coe_coe''` rewrite route; no copied or substituted basis/physical Fock definitions.

## Early stopping and decision

1. Preflight frozen source blob/toolchain/manifest and reject `sorry/admit/axiom/unsafe`, full unqualified TD-C1A import, `maxRecDepth`/`maxHeartbeats`, unexpected warning, nonstandard `#print axioms` roots.
2. Compile only the new inspector and original Core, then the **single original-Fock variable control**. No original axis dependency build in this microgate.
3. Require report exists exactly once, witness and goal have **no uninstantiated metavariables**, and the variable proof passes the standard axioms audit. The compiled proof is not native axis qualification.
4. If metaprogram elaboration/option fails: stop, preserve exact source/error, label `INCONCLUSIVE`, and fix only instrumentation with a new preregistered patch. If report succeeds, inspect whether raw comparison differs only in metadata; only then design (in a separately registered phase) a full D2 native observation collection.

**Forbidden:** no TD-C1A strict R4 retry, no kernel unification of Fock deep expressions, no `isDefEq`/unbounded `pp.all`, no actual source operator equality assertion, no performance limit increase, no inference of gaps/GUT/physical Spin(9) from this instrumentation.
