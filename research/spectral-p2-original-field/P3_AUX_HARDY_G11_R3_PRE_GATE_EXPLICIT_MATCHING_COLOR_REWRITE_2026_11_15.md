# HARDY-G11 R3 — explicit matching-color native rewrite

Date: November 15, 2026 Pacific. Status: REGISTERED_NOT_EXECUTED. Commit with the R2 red checkpoint and two-red review before consumer edits.

## Exact repair

Freeze clean source `fae4dc32dee27c5542f7fffddf217b276ed2bfef`. In complete native consumer old blob `51cebb400a0da2cf35998888bdd81dfbaa591ec4`, replace only example7's failed tail

```lean
  simpa only [ite_eq_left rfl] using
    (originalHardyY_basis_spin_contraction pairedAlgebraData i j hij A A β δ)
```

by the already used explicit rewrite pattern:

```lean
  rw [originalHardyY_basis_spin_contraction pairedAlgebraData i j hij A A β δ,
    ite_eq_left rfl]
```

All twelve example statements, other eleven proof bodies, imports and twelve print reports remain fixed. The entire source and all donor/helper bytes remain fixed. Workflow old blob `81bcb1651f66b105b2b140162b5ab75ff4503c86` may change only its expected consumer hash. Narrowly update the administrative checker for exact R2 red and R3 lineage. Keep baseline `7d5f8f74b9d922a6e7628b7d05e30d2d2d6ab73d`,164 pins, source6/native12, helpers1+3, all twelve controls, toolchain, axioms, strict warnings and resource limits unchanged.

## Hypothesis, falsifier, acceptance and stop

Hypothesis: rewriting the exact native source identity and conditional branch directly avoids the limited simp presentation mismatch observed in R2. Failure to match the source theorem or reduce that branch, any new error/warning, failed control or forbidden axiom falsifies the candidate. Static checks are not Lean qualification.

Require the complete fresh strict gate, including the full consumer and final scope, before acceptance. If the same conditional-normalization/native conversion boundary recurs, stop full-gate retries and preregister an isolated variable-data/actual-carrier typed diagnostic. Do not add another local simp tweak and launch a full retry. Preserve any distinct first failure for review. G10 remains accepted; G11 remains coefficient-level only, with final Fock/core and physical/spectral conclusions outside scope.
