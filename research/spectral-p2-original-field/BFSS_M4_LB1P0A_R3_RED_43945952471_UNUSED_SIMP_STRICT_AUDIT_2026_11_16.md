# M4-LB1P0A R3 — STRICT RED, unused simp arguments

Reviewed 2026-11-16 Pacific on unified integration only. No theorem accepted.

- Run [43945952471](https://github.com/etblink/math/actions/runs/43945952471), attempt 1, tested `2325d494224beef60c19a652643164a16db9afc5`, job `133575536412`: completed/failure.
- Exact source `762c3419cf76eb00f2c3b78c30c731c4a169841c`, independent consumer `53da0ec8242c49cfb062257d71d5a22bd4c35500`, workflow `67738b318b3b58d05e0fe7c1fa028adbe924072f`.
- Source/donor/consumer/toolchain preflight and frozen Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 restoration PASS.
- Cold build completed successfully: 8,963 jobs. Both original-source roots report only propext, Classical.choice, Quot.sound, no sorryAx.
- Explicit warning-as-error source audit failed at 41:15 and 51:15: unused simp argument `h'`. These are the two positive branches of scalar conditional symmetry. No dependent rewrite-motive error remains in this run.
- Independent consumer was NOT REACHED. This is strict qualification failure, not a counterexample to skewness.
- Artifact [14265816354](https://github.com/etblink/math/actions/runs/43945952471/artifacts/14265816354), 3,398 bytes; downloaded ZIP independently SHA256-rehashed as `ae276445656ecfe96d8b29674a9965aca52112229384e2ace474882978c9f482`, matching GitHub.
- Complete ZIP preserved at `diagnostics/BFSS_M4_LB1P0A_R3_43945952471_evidence.zip`. It contains cold-source.log, source-axioms.log, tested-commit.txt; there is no consumer.log.

## Bounded next correction

Replace exactly the two positive-branch `simp [h, h']` invocations by `simp [h]`. Preserve both local conjunction proofs, negative branches, theorem statements, source matrix definition, complete independent consumer, donor bytes, toolchain, warning-as-error policy and resource budgets. Update only the corresponding source pin in the strict workflow. Require all two source and two independent consumer reports before acceptance.

## Operational reconciliation

The earlier live JSON stopped at G15/G16 and omitted M4. Schema 2 now records the actual M4 gate and frozen LB1C1/LB1L2 anchors. The entire previous JSON is archived byte-identically under research/methodology/checkpoints. The checker gains explicit M4 source and consumer coverage; it remains advisory metadata validation, never mathematical proof authority. Original G15 qualification and all historical negatives remain preserved.
