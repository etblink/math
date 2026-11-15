# G13 R2 — preregister typed-origin proof-tail repair

REGISTERED_NOT_EXECUTED. Commit this contract and verified R1 evidence before editing proof code. Predecessor G12 #43740253917 remains accepted. G13 R1 #43743787307 is RED at exact `6da84c396b509436588d7b2ec2e2a1428665e066`; see [red receipt](P3_AUX_HARDY_G13_R1_RED_43743787307_NATIVE_ORIGIN_SPECIALIZATION_2026_11_15.md).

## One permitted change

In consumer example7 only, replace the failing direct proof at literal zero with:

```lean
by
  generalize (0 : Boson 2) = X
  exact originalChargeTauCore_sum_eq_kinetic_apply pairedAlgebraData i j f X
```

Generalization asks for the same already compiled variable-configuration identity before its origin instance. It does not simplify the physics or replace the native carrier. The original example statement remains byte-identical. This is a compiler-boundary hypothesis requiring CI, not a verified repair.

All source bytes `b112d763fe63a864e3b2ed72f551a521995b42b3`, all twelve statements, other eleven proof bodies, imports and twelve audit reports stay fixed. Workflow may change only the consumer blob pin. Existing G12 baseline/donors, expected167-pin closure, early helpers1+3+1, source6/native12/all12 requirements, Lean4.34.1/Mathlib pins, compiler500/cold3600/overall120 and warning/axiom discipline remain fixed.

## Verification and stopping rule

Before publication check exact proof-tail delta, source/consumer/workflow hashes, all statement and root counts, YAML/bash/five Python blocks, literal preflight assertions, accepted helper shape and positive/six-negative strict-auditor fixtures. No local Lean is available; static checks are not qualification. CI must independently recompute167 pins and pass complete fresh source and consumer checks.

Any repeated native origin/conversion failure blocks another full G13 retry until an isolated source-shaped diagnostic and two-red architecture review. No resource escalation, removed control, warning suppression, new assumption or source-model change. On green accept only the original core assembly scope; final kinetic collapse/rotation, tau norm and physical symmetry/energy domains remain separate.
