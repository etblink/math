# HARDY-G9 R4 — reuse the exact original entry derivative

Date: November 14, 2026 Pacific. Status: REGISTERED_NOT_EXECUTED. Commit this contract and the R3 red checkpoint before proof edits.

## Hypothesis and bounded repair

R3's helpers now pass, but its original source line 41 fails to rewrite the matrix-CLM entry function into the literal original Y-entry function. The preceding source theorem `originalHardyY_entry_fderiv` already states the required derivative with the exact literal function, and `originalHardyYEntryCLM_apply` supplies the exact evaluation.

In `originalHardyTauCoefficientDerivative_eq_basis`, retain the initial `unfold originalHardyTauCoefficientDerivative`. Replace only its failed `simpa only ... using (complexMatrixEntry_fderiv_apply ...)` tail by:

```lean
  rw [originalHardyY_entry_fderiv]
  exact originalHardyYEntryCLM_apply M i j A α β (EuclideanSpace.single (k, B) 1)
```

All declarations, explicit statements, imports and other proof bodies stay fixed. Old source blob: `3b5a4b52254add95f741bb883f7e9edecf48dbdf`. Freeze helper `e7904e1edf3af664b3900c31c0757412d495d60c` and complete twelve-example consumer `88aa4d8382e62da727ef81b0f998673fe9f9513d`. The accepted G3/G8 original source bytes remain fixed.

The strict workflow may change only the expected candidate source blob and its source-use assertion: replace the now-obsolete requirement for a direct `complexMatrixEntry_fderiv_apply` call by a check for the literal `rw [originalHardyY_entry_fderiv]` and direct `originalHardyYEntryCLM_apply` evaluation, retaining the existing YCLM-apply requirement. The isolated helper's three-root qualification remains mandatory. Update the administrative checkpoint checker narrowly for the exact R3 red and R4 source/prior-red contract; do not loosen strict Lean or axiom checks.

## Falsifier, acceptance and stop

The proposed repair fails if the literal source derivative cannot rewrite this target, the exact entry evaluation does not match, a new warning appears, or any strict source/native check fails. Static checks do not establish Lean correctness.

Require baseline `19a441adc0bc2408e639a1dca2ec0e67e31e6f57`, all 162 recursive source pins, unchanged toolchain/resources/warning policy, early one-plus-three helper reports, cold original build, fresh six-root source and twelve-root consumer audits, all twelve native examples and the complete final scope audit. All axioms must remain within propext/Classical.choice/Quot.sound.

If the same source-function conversion boundary recurs, stop full-gate retries and preregister an isolated variable-data typed comparison of the exact derivative rewrite and entry evaluation. Do not increase limits, suppress warnings, change statements or substitute a new model. A distinct native failure must be preserved and reviewed before another repair. G8 remains accepted; kinetic CAR, full rotation, tau norm, physical symmetry/energy domains, Hardy/fidelity and spectral conclusions remain outside G9.
