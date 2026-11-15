# HARDY-G11 R2 — current conditional lemmas and minimal source simplification

Date: November 15, 2026 Pacific. Status: REGISTERED_NOT_EXECUTED. Commit with the verified R1 red checkpoint before proof edits.

## Exact authorized delta

The R1 cold build and all six source proof reports succeed, but strict source compilation rejects one unused simp argument and deprecated conditional lemma names.

1. In source `originalHardyY_basis_off_color`, replace only `simp_all [originalHardyY, PiLp.single_apply]` by `simp_all [originalHardyY]`.
2. Replace all four source `if_pos` references by the compiler-recommended `ite_eq_left`, and all four `if_neg` references by `ite_eq_right`.
3. Apply the identical name replacements to the existing three positive and two negative conditional references in the complete native consumer. No control or proof structure changes.

Old source `6f769ce6641ca327c13fc0a61d77496b85fe63c5`; old consumer `c0470c8a91adf6548da0348ae8c02cb59cd97955`. All statements, imports, other proof text, twelve examples and source6/native12 print reports remain fixed. Workflow old blob `b741f6366b44d1d0a4afdb6d1a578edf592be95b` may change only the two expected candidate hashes. All donor/helper source bytes remain immutable.

Narrowly update the checkpoint checker for exact R1 red evidence and R2 source/consumer/contract lineage. Baseline `7d5f8f74b9d922a6e7628b7d05e30d2d2d6ab73d`,164 recursive pins, early helpers1+3, cold build, fresh source6/native12, all twelve controls, toolchain, standard axioms, warning policy and resources stay fixed.

## Falsifier, acceptance and stop

Unknown/mismatched replacement lemmas, persisting or new warnings, unsolved goals, failed native controls or forbidden axioms falsify the candidate at that stage. Static checks are not Lean qualification. Require the entire strict gate; R1 source reports do not establish native acceptance.

If the same unused-argument/deprecated-conditional boundary recurs, stop repeated edits for a separately registered isolated helper before another full retry. Any repeated native conversion triggers the existing typed-comparison stop. Two analogous reds require an architecture review. No warning suppression, global donor rewrite, changed statement/control or resource escalation. G10 remains accepted; G11 remains a coefficient identity, not final Fock/core or physical/spectral assembly.
