# HARDY-G5 R5 preregistration — tested canonical zero witnesses

Date: 2026-11-14 Pacific. RESEARCH_DESIGN_NOT_STAGED. Commit before consumer edit.

## Evidence and hypothesis

[D0 reviewed collection](P3_AUX_HARDY_G5_D0_GREEN_43653626212_CANONICAL_ZERO_JOINS_REVIEW_2026_11_14.md) at exact6fda35546c1976fe6e15bf9a2013ed0f8b98b45a independently verifies generic zero sum, native theta specialization and both actual residual exact joins. Seven positive roots use permitted axioms. Raw continuity-proof argument differences do not prevent exact proof matching.

Hypothesis: the same decomposition works in the complete G4J-importing strict consumer when packaged as consumer-private helpers. The change in elaboration/import context is still tested by the new whole strict run.

## Exact delta

Add two private consumer declarations before its examples:
- generic finiteComplexZeroSum body copied from diagnostic Generic, named nativeFiniteComplexZeroSum;
- original nativeThetaZeroSum statement and specialization copied from diagnostic NativeZero, calling that private generic helper.

In both existing zero-input examples retain the original simp step, replace only R4's added `simp only [zero_smul ℂ, Finset.sum_const_zero]` by `exact nativeThetaZeroSum`, as in both successful D0 joins. These helpers introduce no hypothesis; they prove canonical complex-zero identities using zero_smul per summand.

No diagnostic import, source/helper change, existing statement/import/other proof/control removal, new public hypothesis, budget increase or allowed-axiom change. Twelve examples, CAR-one/wrong-two and self-adjoint controls, six/eleven root lists fixed. Existing private nativeUnitRowCAR remains. Workflow delta: expected consumer Git blob only.

## Verification and stop rule

Compare exact helper statements/bodies and zero-control statements/proof tails with D0 successful files. Check unchanged existing declarations, other ten examples, imports/root lists, YAML/bash/three embedded Python blocks and exact hashes. No local Lean toolchain; static checks are administrative. Repeat full strict helper, cold original source and complete native consumer. Qualification only on whole strict success.

Failure at the copied proof pattern requires typed comparison of original G4J import/private helper context with the successful D0 cases; do not resume blind simp permutations. Preserve exact diagnostics before changing scope.

Scope remains pointwise original coefficient-defined Fock potential/tau CAR. Literal Core charge-potential equality, full smooth-core identity, physical Spin9/Hardy/fidelity/zero mode/gap stay separate.
