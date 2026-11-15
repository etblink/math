# HARDY-G9 R2 — helper proof clean, strict unused-instance error

Date: November 14, 2026 Pacific. Verdict: RED_UNQUALIFIED.

[Strict #43678236725](https://github.com/etblink/math/actions/runs/43678236725), attempt1, tested `202c3c24a910d7bea9590902b0e683aff0e313d0`, job132702991129. The first-causal strict failure is the unused-section-instance linter at entry helper21:0. Original G9 source/native consumer were skipped. G8 remains accepted.

## What changed relative to R1

R2's existing entry-evaluation rewrite closes R1's unsolved goal. Its omit directive clears the apply theorem's warning. The helper lake build succeeds (8924 jobs), and both build and fresh direct compiler logs report ALL THREE helper roots with only propext/Classical.choice/Quot.sound. No unsolved goals, sorryAx, or recursion errors remain.

The successfully elaborated derivative proof now reveals the same unused finite-index section-instance warning in complexMatrixEntry_fderiv_apply. The fresh `-DwarningAsError=true` invocation fails on it. The compiler identifies exactly [Fintype iota] and [Fintype kappa] and recommends omitting them or restructuring shared declarations. No linter is disabled. Source/native results cannot be inferred from these helper reports.

## Exact evidence

- Preflight162 PASS; manifest SHA256 `963b2de0e257bb28fcf9f5f5a8fd69108bd0799ced02772b27efa9484eb9a86b`; pinned Lean4.34.1/Mathlib restoration and accepted early generic-helper audit PASS.
- Helper `bb18c4f1defe98ffa779d48060c3d2644cf63c87`; source `3b5a4b52254add95f741bb883f7e9edecf48dbdf`; complete native consumer `88aa4d8382e62da727ef81b0f998673fe9f9513d`; workflow `88562990cca5db41ea7b7fa07e42245733d34ca3`.
- Artifact14147317865,13251 bytes, independently rehashed SHA256 `4a58b7a0b80528431021bd9f3f976b985b9aabf1eab304a67d2093c58f213fc9`; [complete nine-file ZIP](diagnostics/P3_AUX_HARDY_G9_R2_43678236725_evidence.zip) includes fresh helper.log, build.log, exact SHA and manifest.
- Candidate administrative #43678236741 is independently GREEN at the tested SHA; it is separate from strict mathematical qualification.

## Two-red review and minimal-context decision

R1 combined a genuine missing evaluation rewrite with an unused-instance warning. R2 demonstrates that the evaluation repair is correct at the helper level; its sole remaining blocker belongs to the same unnecessary-section-instance family. No native conversion was tested, and the native retry stop has not been triggered. The shared context itself should be minimal.

The entry CLM uses continuous coordinate projections and real embedding into Complex. Its domain is a normed real space; its matrix target is a product topological module. Its scalar derivative is taken into normed Complex. The successful R2 apply theorem already omits both Fintype instances while referring to the same entry CLM, and the compiler marks the derivative's instances unused. Thus these finite-index assumptions are not needed by any of the three helper roots.

[R3 preregistration](P3_AUX_HARDY_G9_R3_PRE_GATE_MINIMAL_ENTRY_HELPER_CONTEXT_2026_11_14.md) removes the two Fintype classes from their shared variable declaration and removes the now-superfluous apply-only omit directive. All helper proof bodies, definitions and explicit equality statements stay fixed. Freeze original G9 source/native consumer; change only the workflow helper pin. Preserve both red attempts and require the entire strict gate. No new mathematical target, source model, resource escalation or warning suppression is justified by these diagnostics.
