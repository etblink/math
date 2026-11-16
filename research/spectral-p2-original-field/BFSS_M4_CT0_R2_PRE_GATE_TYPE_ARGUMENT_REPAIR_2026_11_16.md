# BFSS M4 CT0 R2 — source-exact cyclic-trace argument repair

Date: 2026-11-16 Pacific. Branch: `integration/bfss-unified-research-20261108`. **PROSPECTIVE R2 / UNQUALIFIED** at staging. GitHub push of this registration/source/workflow commit triggers a new strict workflow; do not infer result from launch.

## Evidence and diagnosis

- Original R1 STRICT **RED** [#43980155870](https://github.com/etblink/math/actions/runs/43980155870), exact tested SHA `144d2d1d9c7b14199ad5ebf9e0c0dfe13410e55e`, first causal Lean error at source line 41: wrong explicit argument to `LinearMap.trace_mul_comm`. Its *first explicit* argument in pinned Mathlib is the coefficient ring `R`, not the first operator. The typed underlying statement, for `R=ℂ` and `M=Fermion 2`, remains valid.
- R1 [complete original job log](research/spectral-p2-original-field/diagnostics/BFSS_M4_CT0_R1_43980155870_complete_job.log) is committed, its [red receipt](research/spectral-p2-original-field/BFSS_M4_CT0_R1_RED_43980155870_SOURCE_TRACE_TYPE_MISMATCH_2026_11_16.md) is committed; original provider artifact `14284665134` preserved externally, reported ZIP SHA-256 `8657ba3a6002428c8e7194d88460ac7998ed2ed4b86aeeaf6816613a3953e3b3`. **No claim that ZIP bytes are stored locally in this repo**. The generic finite double sum had standard-axiom-only output in R1, but native source and independent consumer never qualified.
- Last accepted mathematical gate **P3-M4-LB1P0B R3 GREEN #43962066769** and its original evidence unchanged.
- The roadmap/governance repair independently passed [#43982431503](https://github.com/etblink/math/actions/runs/43982431503), and earlier roadmap negatives remain retained.

## R2 sole Lean source change

```lean
-- R1 (incorrect explicit argument ordering)
exact LinearMap.trace_mul_comm
  (originalFockEndAlgEquiv.symm X)
  (originalFockEndAlgEquiv.symm Y)

-- R2 (pinned Mathlib expects explicit coefficient ring ℂ)
exact LinearMap.trace_mul_comm ℂ
  (originalFockEndAlgEquiv.symm X)
  (originalFockEndAlgEquiv.symm Y)
```

All other source theorem terms, the actual original Fock carrier, source 48 label, immutable `1/4` K(A), real-to-complex scalar bridge, 3 source targets and 4 independent controls are **byte-identical in content** beyond this one-line insertion. No `sorry`, `admit`, new axiom, global instance, commutative-operator assumption or heartbeat escalation.

## Frozen R2 pins and scope

- Revised source path `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4CT0OriginalSkewBivectorTrace.lean` Git blob `a6f93c62c83bf51a0b89691196f875399d2896fa`.
- Independent consumer path `lean/diagnostics/BFSSP3M4CT0OriginalSkewBivectorTraceIndependentConsumer.lean` Git blob **unchanged** `f2ddadc880c62632dd91547526ee97bc92a0d504`.
- Revised strict workflow `.github/workflows/bfss-m4-ct0-original-skew-bivector-trace-strict.yml` Git blob `ff7a9b5c612ee9a6050cc3622b7004150b03f46c`, changing only the revised source SHA and active checkpoint R2 preflight assertions. Same bounded cold source, warnings-as-errors, independent consumer and standard-only axiom reports.
- Original T1 and LB1S donors untouched. Lean `4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` unchanged.
- New canonical schema-2 checkpoint active `P3-M4-CT0 R2 PENDING_STRICT_CI` includes original R1 run/SHA/artifact digest/receipt/job-log blob, and retains P0B as `last_qualified`.
- R2 acceptance requires exact preflight, cold proof compile, 3 source + 3 independently imported consumer axiom reports, 4 controls, and full original artifact/receipt preservation; no green inferred before all checks.

If R2 has the same underlying boundary failure, stop and review the trace-transfer proof architecture; preserve exact original source red before further repair. The full bivector bracket, physical Spin(9) lift, charge-domain reduction, Hardy/fidelity inequality and spectrum are separate unqualified obligations.
