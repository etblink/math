# HARDY-G9 R3 — prospective minimal generic helper context

Date: November 14, 2026 Pacific. Status: REGISTERED_NOT_EXECUTED. Commit this contract and R2 red checkpoint before helper edits.

## Preregistered source-context correction

The [R2 red receipt](P3_AUX_HARDY_G9_R2_RED_43678236725_UNUSED_DERIVATIVE_INSTANCES_2026_11_14.md) records successful mathematical elaboration of all three helper roots with only standard axioms. Its sole strict failure is the compiler-identified unused pair of Fintype instances in the derivative theorem. The two-red review recommends correcting their shared scope.

Make exactly two textual changes in P3AuxHardyG9ComplexMatrixEntryDerivative.lean:

1. Replace `variable {iota kappa : Type*} [Fintype iota] [Fintype kappa]` with `variable {iota kappa : Type*}`, using existing literal Greek names.
2. Delete the apply theorem's `omit [Fintype iota] [Fintype kappa] in` line, which is unnecessary once those instances are absent from scope.

Retain every proof body, including the successful R2 rw list with complexMatrixEntryCLM_apply; all three root names, definitions and explicit equality statements remain unchanged. This removes redundant inferred assumptions from the generic helper, adds no hypotheses, and does not alter any physical source theorem. Old helper `bb18c4f1defe98ffa779d48060c3d2644cf63c87`.

Freeze source `3b5a4b52254add95f741bb883f7e9edecf48dbdf` and complete twelve-example native consumer `88aa4d8382e62da727ef81b0f998673fe9f9513d`. Workflow may change only its expected helper blob. Original baseline19a441ad,162 recursive pins, early helper1+3/source6/native12 reports, all12 examples, toolchain, axioms, warning policy and budgets remain fixed.

## Falsifier, acceptance and stop

Hypothesis: the already elaborated helper proofs require no finite-index instances; minimal shared context removes the warning for every helper root. A missing instance, new or persisting warning, changed proof/statement, forbidden axiom or source/native failure falsifies the proposed repair at that boundary.

Require complete early helper audits, cold original build, fresh source/native compiler success and exact standard-axiom reports before G9 acceptance. If the generic context still fails, stop repeated scope edits and inspect the actual elaborated required instances in a separately registered isolated diagnostic; do not launch an unchanged retry. Native conversion errors follow the existing typed-comparison stop. No linter disable, limit increase or physical claim follows. G8 remains accepted; kinetic CAR, full rotation, tau norm, physical symmetry/energy domains and Hardy/fidelity remain outside G9.
