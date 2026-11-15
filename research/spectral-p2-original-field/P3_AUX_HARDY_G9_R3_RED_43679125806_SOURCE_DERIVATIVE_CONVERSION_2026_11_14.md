# HARDY-G9 R3 — helpers pass, original derivative conversion fails

Date: November 14, 2026 Pacific. Verdict: RED_UNQUALIFIED.

[Strict #43679125806](https://github.com/etblink/math/actions/runs/43679125806), attempt 1, tested `b8bbae75b03a3eff9df7a6f15915b161a8d998b5`, job `132705709839`, completed with failure. G8 remains accepted. Native source qualification and consumer acceptance do not follow from intermediate reports.

## First causal failure and scope

The minimal shared-context repair succeeds. Both early isolated audits pass: the generic finite-operator helper (one root) and the complex matrix-entry helper (three roots), including fresh warning-as-error invocations. The previous unused-Fintype boundary is resolved.

The cold original build reaches `P3AuxHardyG9OriginalYEntryDerivativeBinding.lean:41:2`. In `originalHardyTauCoefficientDerivative_eq_basis`, `simpa only [originalHardyYCLM_apply]` does not convert the helper theorem's matrix-CLM entry function to the literal original Y-entry function under fderiv. The compiler displays the remaining source-function mismatch. This is a type mismatch, not a recursion/resource failure.

The first three source declarations emit standard-axiom reports, including the exact `originalHardyY_entry_fderiv` identity. The failed basis theorem and its two dependents contain consequential `sorryAx` reports. These are failed-build diagnostics, not accepted proofs. The cold build fails; fresh source compilation, the complete native consumer and final scope audit are not executed.

## Exact evidence

- Preflight 162 PASS; manifest SHA256 `5bce6af68bc704073e666549f238c39e6f5d0dc8590f0862832ea4aeb91abc2e`; pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored.
- Source `3b5a4b52254add95f741bb883f7e9edecf48dbdf`; helper `e7904e1edf3af664b3900c31c0757412d495d60c`; consumer `88aa4d8382e62da727ef81b0f998673fe9f9513d`; workflow `cfdf124d53c6802352dd4e2e493fb19befa1e2f4`.
- Artifact `14148096780`, 22,116 bytes. Downloaded ZIP independently rehashed to SHA256 `40860cc239b341797a4509ade3adccb9bdf81264c7477da85465b65d795d8839`, matching GitHub's digest. All eleven files preserved in the [complete ZIP](diagnostics/P3_AUX_HARDY_G9_R3_43679125806_evidence.zip); tested SHA and recursive pin manifest checked.
- [First-causal source diagnostic and all six root reports](diagnostics/P3_AUX_HARDY_G9_R3_SOURCE_DERIVATIVE_CONVERSION_43679125806_2026_11_14.txt).

## Three-red review and decision

R1/R2 exposed the generic helper's entry-evaluation and redundant-instance problems. R3 resolves both and tests the original source for the first time. Its new failure lies in the next adapter, so another helper-context edit would not address it.

The source already proves the exact literal original scalar-entry derivative in the preceding theorem and its exact entry evaluation in the theorem before that. Reuse those identities directly, rather than ask simplification to bridge the function presentations a second time. [R4 preregistration](P3_AUX_HARDY_G9_R4_PRE_GATE_REUSE_EXACT_SOURCE_DERIVATIVE_2026_11_14.md) bounds this to one proof tail and the corresponding workflow pin/donor check. Helpers, original donor sources, explicit statements and the entire consumer stay fixed. A repeated source conversion boundary triggers an isolated typed diagnostic before any further full strict retry.
