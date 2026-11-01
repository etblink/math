# F10E Gate 1 RED — one deprecated pinned Lean simplification API, source proofs elaborated

Date 2026-10-31 PDT. Authorized branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## Exact CI evidence — red correctly retained

- [Strict F10E run #41269330982](https://github.com/etblink/math/actions/runs/41269330982), attempt 1, job `124738657288`, completed FAILURE on exact SHA `bf1294a7336a080e58771c33e1b67a3b6c0c7752`. Original F10E candidate Git blob `97a430ba9e99ab1bc24b3f664d8cd430c03ffeb6`.
- Pinned Lean `leanprover/lean4:v4.34.1`, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Preflight source hashes PASS; clean cache/toolchain restore PASS; accepted F9 source ancestry rebuild PASS. Fresh source `lake env lean -DwarningAsError=true` FAILED on **one deprecated API**, at source line 66, `if_neg`: `error: \`if_neg\` has been deprecated: Use \`ite_eq_right\` instead`. The strict independent declaration audit was correctly SKIPPED.
- Despite strict compiler failure, ALL FOUR original public gamma proof bodies elaborated in the compiler and emitted `#print axioms` results: only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`. This is valuable evidence of source theorem scope but **NOT qualifying acceptance** while the warning-as-error compile remains red.
- [Immutable artifact #13068488205](https://github.com/etblink/math/actions/runs/41269330982/artifacts/13068488205), SHA-256 `9de8f703adf64eb63129d25e022e83f6c39d850f8be7b334883c6204a7cdf2b9`.

## Source-exact bounded fix — UNQUALIFIED until fresh CI passes

The original `gamma_clifford a b` has an `if a = b then 2 else 0` expression. The theorem's explicit argument `hab : a ≠ b` proves its else branch. Pinned Mathlib regularly uses `ite_eq_right hab` as the contemporary simp rewrite lemma in exactly this context. Change the ONLY proof line:

```lean
  simp only [if_neg hab, zero_smul] at h
```

to

```lean
  simp only [ite_eq_right hab, zero_smul] at h
```

Preserve all four original theorem statements, `gamma_clifford` source scope, all accepted predecessors, original nine gamma matrices, original paired-Fock 48 labels, and the existing independent four-type and axiom checks. Update only the workflow's exact source Git blob pin and add this negative-evidence record.

## Governing negative knowledge and publication controls

The original F10 full matrix Gate1 [#41266215820](https://github.com/etblink/math/actions/runs/41266215820) had 256 unresolved private integer gamma entries and a nonexistent product API; Gate2 [#41266892206](https://github.com/etblink/math/actions/runs/41266892206) left 8 negative diagonal entries; Gate3 [#41267510559](https://github.com/etblink/math/actions/runs/41267510559) attempted a `change` on unreduced goals; F10D [#41268424166](https://github.com/etblink/math/actions/runs/41268424166) was rejected at parse-time because `import all` requires a `module` consumer. Do not resume direct private-table proof, add compiler limits, invoke `native_decide`, or claim a positive determinant without source-exact formal evidence.

F1–F9 are ACCEPTED. F10 / F10D FAIL / unqualified. F10E only CANDIDATE pending both full strict source compilation AND independent exact type/axiom audits. Even if F10E qualifies, it proves **trace-zero and Clifford identities only**, not universal determinant positivity, exact global original paired SO48, Spin48 lifting/covering, or BFSS physical spectral claims.
