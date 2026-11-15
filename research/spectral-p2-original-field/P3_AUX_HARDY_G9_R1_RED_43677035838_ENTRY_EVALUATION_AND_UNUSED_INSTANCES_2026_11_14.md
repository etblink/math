# HARDY-G9 R1 — RED before native build

Date: November 14, 2026 Pacific. Verdict: RED_UNQUALIFIED.

[Strict #43677035838](https://github.com/etblink/math/actions/runs/43677035838), attempt1, tested `bf556a9a7fa4c921ca1ad8c4b539ed094451de2a`, job132699358033, failed in the isolated Mathlib-only entry helper. The cold original BFSS source and entire independent native consumer were skipped. G8 remains accepted.

## Independently reviewed evidence

- Exact162-pin original-source preflight PASS; manifest SHA256 `860a3059669d4f6e92ee523c37055a61dfc3fc157845ce9a28ef9aa4f97534f8`.
- Lean4.34.1 / pinned Mathlib restoration PASS. Early accepted G5 generic finite-operator helper fresh one-root strict audit PASS.
- Entry-helper source line16 warns that complexMatrixEntryCLM_apply carries unused Fintype iota/kappa section variables. The compiler explicitly recommends omitting those two instances for this theorem.
- First compiler error at helper22:65: unsolved goal after hfun and ContinuousLinearMap.fderiv rewrites. Exact residual: `(complexMatrixEntryCLM L a b) h = (L h a b : Complex)`.
- The existing immediately preceding complexMatrixEntryCLM_apply theorem has exactly this statement and reports only standard permitted axioms. Its proof is rfl; the derivative proof failed to invoke it after the derivative rewrite. The first two root reports are clean; the derivative report contains consequential sorryAx. This does not qualify the helper or G9.
- No native recursion or physical mathematical counterexample occurred. No original source, source theorem or native consumer ran far enough to establish a result.
- Artifact14147315518,13511 bytes, independently rehashed SHA256 `ef6d6af5b86701f80b6bcd4db251a4eac32ace814d15b4efcb0b291bcc3d1ece`; [complete evidence ZIP](diagnostics/P3_AUX_HARDY_G9_R1_43677035838_evidence.zip) preserves all eight files, including exact tested SHA, manifest and full helper failure.
- Candidate administrative #43677035853 is independently GREEN at the same tested SHA. Administrative consistency is separate from mathematical strict RED.

## Frozen source and bounded recovery

G9 source `3b5a4b52254add95f741bb883f7e9edecf48dbdf`, complete twelve-example consumer `88aa4d8382e62da727ef81b0f998673fe9f9513d`, helper `3748b667fd18724845da3cf5f2b11717f6d87ac8`, workflow `9a3cb2e759746fc1e4dee210916a7925abe32136` bind this attempt. Original G8 and predecessors are unchanged.

[R2 preregistration](P3_AUX_HARDY_G9_R2_PRE_GATE_EXPLICIT_ENTRY_EVALUATION_2026_11_14.md) permits exactly two local helper corrections: omit the two unused Fintype instances for the apply theorem, and append its existing evaluation lemma to the derivative proof's rw list. Change only the workflow's expected helper blob. No native source/consumer/statement changes, new assumptions, linter suppression or resource increases.

The early-helper boundary worked: a small generic proof omission was isolated before the expensive source build. R1 is preserved independently; a later green cannot erase its failed proof bytes or diagnostics. Mathematical scope remains original entry derivative/basis binding only, with physical symmetry/energy-domain, kinetic CAR, Hardy/fidelity and spectral obligations separate.
