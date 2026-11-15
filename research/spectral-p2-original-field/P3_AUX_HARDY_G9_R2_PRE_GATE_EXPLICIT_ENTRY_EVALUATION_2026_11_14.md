# HARDY-G9 R2 — prospective explicit entry evaluation and instance omission

Date: November 14, 2026 Pacific. Status: REGISTERED_NOT_EXECUTED. Contract must be committed before helper repair. [R1 red](P3_AUX_HARDY_G9_R1_RED_43677035838_ENTRY_EVALUATION_AND_UNUSED_INSTANCES_2026_11_14.md) preserves exact evidence.

## Two bounded corrections in the isolated Mathlib-only helper

1. Put `omit [Fintype iota] [Fintype kappa] in` immediately before complexMatrixEntryCLM_apply, using the existing literal Greek variable names. The compiler identifies exactly these unused section instances. The equality statement, its explicit arguments and rfl proof stay unchanged; no linter is disabled.
2. Change only the derivative proof's final rw list from `[hfun, ContinuousLinearMap.fderiv]` to `[hfun, ContinuousLinearMap.fderiv, complexMatrixEntryCLM_apply]`. The existing apply theorem matches the exact R1 residual. No new mathematical hypothesis or theorem is needed.

Freeze source `3b5a4b52254add95f741bb883f7e9edecf48dbdf` and consumer `88aa4d8382e62da727ef81b0f998673fe9f9513d` byte-for-byte. Old helper `3748b667fd18724845da3cf5f2b11717f6d87ac8`. The strict workflow remains byte-identical except its expected helper blob. Keep original accepted baseline19a441ad, exact162-pin closure, helper1+3/source6/native12 reports, all12 examples, toolchain, warnings/axioms and limits.

## Acceptance and stop rule

Require both early helpers, cold original source build, fresh source and complete independent native consumer with exact reports and only standard permitted axioms. Static checks are not Lean acceptance. Any remaining helper residual is inspected in isolation. A native conversion failure invokes the original preregistered typed-diagnostic rule; no unchanged retry or resource escalation. A later R2 green qualifies only G9's original coefficient derivative/basis bridge. No kinetic CAR, full charge/tau, tau norm, physical Spin9, Hardy/fidelity or spectral claim is added.
