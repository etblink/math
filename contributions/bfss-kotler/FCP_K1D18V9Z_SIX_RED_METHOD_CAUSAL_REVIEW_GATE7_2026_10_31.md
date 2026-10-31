# Project Lead — K1D18V9Z six-red causal review, historical methods audit, and Gate 7 correction

**Review date:** 2026-10-31 UTC
**Governing principle:** Seek truth about reality; preserve results rather than theories; learn from failures without promoting failed gates to accepted Lean proofs.
**Repository:** `etblink/math`, research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.
**Provenance source examined:** `etblink/Foundational-Convergence-Program` at main, especially `FCP_CHARTER.md`, `EPISTEMIC_RULES.md`, `governance/FCP_METHOD_0_2_0_TRUTH_SEEKING_REVISION_PROTOCOL.md`, and `audits/FCP_METHOD_0_2_0_DEFECT_TRACEABILITY_0_1_0.md`.
**Reference comparison:** accepted V9X Run [#41236259454](https://github.com/etblink/math/actions/runs/41236259454), accepted V9Y Run [#41238340160](https://github.com/etblink/math/actions/runs/41238340160), prior V7H unnecessary-simpa recovery [#41020331788](https://github.com/etblink/math/actions/runs/41020331788), V7Z full strict gate [#41133563019](https://github.com/etblink/math/actions/runs/41133563019), V8A false-negative validator review, and V8J unreachable-tactic/preservation incident review.

## 1. Exact sixth-red evidence and scope

Sixth [Run #41244487507](https://github.com/etblink/math/actions/runs/41244487507), job `124664966328`, attempt 1, **completed/failure**, tested SHA `416abc3bf147ae6daa90640b8a93ec5bb3802448`. Original source Git blob `3e47660781df48090e91e56ad86e7d95d5d5727e`; original workflow blob `9278ef9227b0fb72e3c9dd36ef33f1353f60b8c8`. Failure artifact ID `13059576002`, digest `sha256:f889c5bdb8b5305aa2daa6b3f078a1430acc1bf0e861dd7bcf6597f26eba6210`.

The exact source/preflight, frozen source hashes, pinned Lean `leanprover/lean4:v4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, and previously accepted V9Y ancestry all **PASS**. Fresh V9Z compile with `-DwarningAsError=true` **FAILS** at only these three source positions:

- Line 40:31: `error: try 'simp' instead of 'simpa'`
- Line 63:31: `error: try 'simp' instead of 'simpa'`
- Line 88:31: `error: try 'simp' instead of 'simpa'`

All six source `#print axioms` reports produced *exactly* `propext`, `Classical.choice`, and `Quot.sound` and **no `sorryAx`**. This is evidence the three mathematical proofs elaborated, but the mandatory strict linter made the entire compiler step red. The later independent six-declaration exact type/axiom audit was **SKIPPED**, therefore no V9Z acceptance is authorized.

## 2. Six-run causal matrix: non-equivalent red evidence

| Gate | Run and immutable tested SHA | First causal blocker | Resolution attempted / learning |
|---|---|---|---|
| 1 | [#41239583476](https://github.com/etblink/math/actions/runs/41239583476) `6ea7b35ee6ef3b6ec4bb8f8c49f3bc482fac6fa5` | `Multiplicative.continuous_toAdd` unknown. | Pinned `Mathlib/Topology/Constructions.lean` defines root-level `continuous_toAdd`; scoping the type-tag function does not scope the theorem. |
| 2 | [#41240548627](https://github.com/etblink/math/actions/runs/41240548627) `263c8610cebf47220122782b9e2c65e8d2ae11b4` | `Multiplicative.ofAdd_toAdd` unknown. | Pinned `Mathlib/Algebra/Group/TypeTags/Basic.lean` defines root-level `ofAdd_toAdd`; source lookup must precede qualification claims. |
| 3 | [#41241412956](https://github.com/etblink/math/actions/runs/41241412956) `b18429e4dc79c5b53ced2a46b7f7721742d1e3a3` | Type mismatch: `Continuous ((fun t => f (ofAdd t)) ∘ toAdd)` vs `Continuous f.toFun`. | `Function.comp_apply` does not rewrite *unapplied* compositions under `Continuous`. |
| 4 | [#41242415143](https://github.com/etblink/math/actions/runs/41242415143) `ee3eead060decf869a2be0fe365dc7235798a178` | After pointwise time normalization: `Continuous (fun u => f u)` vs `Continuous f.toFun`. | Use pinned `Continuous.congr`, not a bare `simpa` over function shape. |
| 5 | [#41243461699](https://github.com/etblink/math/actions/runs/41243461699) `907c651f4e2b475b53c7b9e6eb091087d35410d0` | In congruence: `f u = f.toFun u` not solved by time-tag simp alone. | Pinned `MonoidHom.toFun_eq_coe` proves the exact underlying hom field identity. |
| 6 | [#41244487507](https://github.com/etblink/math/actions/runs/41244487507) `416abc3bf147ae6daa90640b8a93ec5bb3802448` | **ONLY** strict `unnecessarySimpa` linter at three proof sites; all six source axiom reports clean. | Replace `simpa only` with `simp only`, obeying the linter; do not disable it. |

All six gated failures preserve their own SHA/artifact; they cannot be relabeled green retrospectively. Their cause classifications moved from *unknown theorem name* → *function representation/typed bridge* → *style/linter*, rather than producing evidence that real one-parameter orthogonal flows are discontinuous.

## 3. Historical successful procedures — source-derived

- **V7H Gate 2 → Gate 3:** `FCP_K1D18V7H_GATE2_UNNECESSARY_SIMPA_LINTER_RECOVERY_2026_10_30.md` documents exactly the same warning-as-error `try 'simp' instead of 'simpa'` with permitted axiom reports and a skipped independent gate. Its recommended corrective procedure was a single `simpa only` → `simp only` substitution, no linter suppression, no theorem changes.
- **V7Z Gate 1 → 2:** `FCP_K1D18V7Z_GATE2_ACCEPTANCE_ALGEBRAIC_CLOSURE_SPIN9_TOPOLOGY_FRONTIER_2026_10_30.md` verifies 55 fresh modules and 174 exact declaration roots, and preserves a preceding syntax failure fixed by removing an extraneous parser character. Principle: fix exact first compiler diagnostic, not globally change limits or proof scope.
- **V8A three red gates → source-bound validator reform:** `FCP_K1D18V8A_THREE_GATE_CAUSAL_REVIEW_AND_VALIDATOR_RECOVERY_2026_10_30.md` distinguishes a real syntax error from two false-negative *Python output regex* failures. Successful design: independently elaborate the actual original typed Lean `example` propositions and separately check named `#print axioms` lines; stop using pretty-print regex as type authority.
- **V8J:** `FCP_K1D18V8J_GATE1_RED_CAUSAL_REVIEW_AND_GATE2_RECOVERY_2026_10_30.md` describes an unnecessary unreachable `abel` after `simp`, and a separate Git tree assembly incident. Principle: remove redundant tactics, build the new tree from the intended parent's *actual* tree, CAS-update the ref and inspect complete commit paths.
- **V9X green:** a genuine original-label typed `MonoidHom` accepted at Run #41236259454, with six individual source exact definitions/evaluations and independent axiom checks; earlier red independent-audit `noncomputable example` issue preserved without source theorem changes.
- **V9Y green:** Run #41238340160 qualified real-parameter continuity of the same original label orthogonal-subtype maps, with four individual independent checks; earlier root namespace and type elaboration errors resolved using `Matrix.Norms.Operator` and explicit matrix types.

The common useful technique is **original representation unchanged → pinned-source exact types → one named typed bridge per mismatch → strict independent declaration audit → evidence-preserving publication**.

## 4. Unsuccessful patterns and anti-patterns

1. **Guessing namespace from the name of a type** created two avoidable V9Z red gates. The correct theorem scope must be inspected in pinned source, including where a `namespace` block ends.
2. **Trying consecutive global `simpa` variants before exposing the exact function and field** created repeated type-mismatch gates. Use an explicit `change`, `Continuous.congr`, and the exact `MonoidHom.toFun_eq_coe` bridge instead.
3. **Ignoring warnings-as-errors in a proof that otherwise closes** caused the sixth V9Z red. The linter is a contract; use its correction, never `set_option linter.unnecessarySimpa false`.
4. **Promoting source compiler axiom prints to gate success** is invalid when strict compile itself is red or the independent audit was skipped.
5. **Treating a validator regex as a semantic proof** is invalid; retain kernel-checked typed independent `example` statements.
6. **Increasing heartbeats/recursion depth, replacing original basis with color-major surrogates, relaxing axiom whitelist, disabling checks, or conflating topological and algebraic results** would obscure rather than resolve the current root cause. No evidence justifies any such change.
7. **Using a Git base tree from a different commit than intended parent** can erase accepted files, as V8J proved; require exact parent/tree and full post-publication diff.
8. **Source-derived record quality:** the previous V9Y acceptance document's *prospective V9Z* paragraph incorrectly refers to `Multiplicative.continuous_toAdd`. Its accepted V9Y proof remains sound, while this prospective API note is superseded by pinned-source root-level `continuous_toAdd`. Preserve history and correct the claim in this newer record, not by silently rewriting the prior acceptance artifact.

## 5. Plan, disposition and acceptance contract

**Decision:** The evidence no longer calls for a new mathematical construction or a weaker statement. The sixth red is a narrow proof-style/linter issue. Apply **exactly three** source corrections in the unqualified V9Z candidate:

```lean
exact h.congr (fun u => by simpa only [ofAdd_toAdd, MonoidHom.toFun_eq_coe])
```

becomes

```lean
exact h.congr (fun u => by simp only [ofAdd_toAdd, MonoidHom.toFun_eq_coe])
```

Both `ofAdd_toAdd` and `MonoidHom.toFun_eq_coe` are verified pinned source lemmas; the preceding `change` and the accepted V9X/V9Y ancestors stay intact.

The strict workflow changes only its exact candidate source Git blob pin. Preserve three `ContinuousMonoidHom (Multiplicative ℝ) (Matrix.orthogonalGroup Source48Label ℝ)` declarations, three exact matrix exponential evaluations, six independent Lean root-typed examples/checks, six separate allowed axiom reports, pinned Lean/Mathlib, `-DwarningAsError=true`, retained artifacts, and source-label original Fock pairing.

**Qualification requirements:**
- successful strict preflight, pinned restore, and accepted V9Y ancestry compile;
- fresh original candidate source compilation with `-DwarningAsError=true` and no linter warnings/errors;
- independent source-exact Lean elaboration and six named root axiom audits without `sorryAx`, only `propext`, `Classical.choice`, `Quot.sound`;
- completed **green** at exact tested candidate SHA; artifact ID/hash; full diff against intended parent = only three declared paths: V9Z Lean source, V9Z strict workflow, this retrospective;
- freeze acceptance only after inspecting independent logs.

If the new run is red, classify first causal diagnostic before any further edit; do not make another name-guessing trial. If repeated failures begin to show kernel/elaboration complexity rather than a localized API/linter error, stop the V9Z gate sequence and run a small separately checked typed bridge microprobe. In this present gate the evidence supports the direct three-line fix.

**Scope ceiling:** Even accepted V9Z is only continuous fixed-generator one-parameter original paired-Fock orthogonal homs. It would **not** prove `det = 1`/SO48 membership, global Spin9 integration, exact Spin48 lifting or covering, or BFSS physics/spectral results. The FCP epistemic hierarchy prohibits promoting formal math to physical truth without explicit bridges.

**Authority boundary:** Work only on the named research branch; no main, no frozen FCP source rewrite, no upstream mathcommunity PR or merge.
