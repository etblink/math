# HARDY-G9 R3 — exact strict launch binding

Date: November 14, 2026 Pacific. Status: IN_PROGRESS / UNQUALIFIED.

[Strict #43679125806](https://github.com/etblink/math/actions/runs/43679125806), attempt1, tests `b8bbae75b03a3eff9df7a6f15915b161a8d998b5`, job132705709839. Observed at checkout; preflight/compiler/native results pending.

## Source and review boundary

- [R2 red and two-red review](P3_AUX_HARDY_G9_R2_RED_43678236725_UNUSED_DERIVATIVE_INSTANCES_2026_11_14.md) bind exact202c3c24 and independently rehashed artifact14147317865. R2 compiles all three helper roots with standard axioms; its sole strict failure is unused Fintype instances in the derivative theorem. R1 remains preserved separately.
- [R3 minimal-context contract](P3_AUX_HARDY_G9_R3_PRE_GATE_MINIMAL_ENTRY_HELPER_CONTEXT_2026_11_14.md) committed at `bffaf9812a3fa5a27f04441a1807e82df0a823d2` before helper edits and retained as immediate tested parent.
- Helper `e7904e1edf3af664b3900c31c0757412d495d60c` removes only the shared two Fintype classes and now-obsolete apply-only omit directive. ALL R2 proof bodies, three root names, definitions and explicit equality statements are unchanged. Redundant inferred helper assumptions are removed; no physical source statement is changed.
- Source `3b5a4b52254add95f741bb883f7e9edecf48dbdf` and complete native consumer `88aa4d8382e62da727ef81b0f998673fe9f9513d` are byte-identical. Workflow `cfdf124d53c6802352dd4e2e493fb19befa1e2f4` changes only its expected helper blob.
- Original baseline19a441ad, expected162 recursive pins, early helper1+3/source6/native12 reports and all12 native examples, toolchain, warning/axiom policy and limits remain fixed. No linter suppression or resource escalation.
- Static exact-two-edit/hash/source/consumer/import/root/pin/YAML/bash/four Python/scope checks and strict positive/five-negative auditor fixtures PASS. Checkpoint passes; qualification-bypass, wrong-prior-red and changed-source fixtures are rejected. No local Lean is available; these checks are not theorem qualification.
- Administrative #43679125802 is independently pending and is not strict proof evidence.

Require whole strict success and exact source/consumer/artifact review before accepting G9 or advancing another proof gate. A further helper-context failure triggers the preregistered isolated required-instance diagnostic, not another unchanged scope retry. Native conversion failures follow the existing typed-comparison stop. G8 and original physical Hamiltonian receipts remain accepted. Kinetic CAR, full charge/tau rotation, tau norm, physical Spin9/covariance, energy/spectral domains, Hardy/fidelity and spectral claims remain separate.
