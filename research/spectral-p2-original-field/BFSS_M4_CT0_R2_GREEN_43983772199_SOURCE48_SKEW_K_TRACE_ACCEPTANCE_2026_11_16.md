# BFSS CT0 R2 — STRICT GREEN accepted

Date: 2026-11-16 Pacific. **Source-exact machine-checked gate qualification.** No peer review or independent human mathematical review is asserted.

## Exact tested execution

- Original strict workflow: [run #43983772199](https://github.com/etblink/math/actions/runs/43983772199), SUCCESS. Tested commit: `7f7ae98f77858f79beccd9e1efdd334b513e2f56`. Job ID: `133706582858`, all steps PASS.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4CT0OriginalSkewBivectorTrace.lean`, Git blob `a6f93c62c83bf51a0b89691196f875399d2896fa`.
- Independent consumer `lean/diagnostics/BFSSP3M4CT0OriginalSkewBivectorTraceIndependentConsumer.lean`, Git blob `f2ddadc880c62632dd91547526ee97bc92a0d504`.
- Workflow `.github/workflows/bfss-m4-ct0-original-skew-bivector-trace-strict.yml`, Git blob `ff7a9b5c612ee9a6050cc3622b7004150b03f46c`.
- Pinned Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. All accepted original donor bytes unchanged.
- Exact preflight PASS; original-source cold build **9180/9180 PASS**. Warning-as-error standalone source and independent consumer checks PASS. **Three source + three independent consumer** standard-axiom reports (only `propext`, `Classical.choice`, `Quot.sound`), no `sorryAx`. Four native controls: zero, coincident labels, concrete paired skew plane and reversed plane. Auditor positive/six negative controls PASS.
- Original success marker: `BFSS_M4_CT0_ORIGINAL_FOCK_SKEW_K_TRACE_3_SOURCE_3_CONSUMER_4_CONTROLS_STRICT_GREEN`.
- Separate contemporaneous roadmap consistency [#43983772069](https://github.com/etblink/math/actions/runs/43983772069) GREEN on exact tested commit.

## Immutable complete original evidence

- Original GitHub artifact `14285716957` (17,839 bytes); SHA-256 `9e0a0118673c45300ff90414d039a64987d41dc04dd4559368c4bb2e595a7b8d`.
- **Exact original ZIP bytes committed** at [original evidence archive](research/spectral-p2-original-field/diagnostics/BFSS_M4_CT0_R2_43983772199_evidence.zip), Git blob `e0e0f0da963b7895eae425f4392b3b12866a2116`. All five original contents: `tested-commit.txt`, `preflight.log`, `cold-source.log`, `source-axioms.log`, `consumer.log`. ZIP digest independently checked against provider SHA-256.
- [Complete original strict job log](research/spectral-p2-original-field/diagnostics/BFSS_M4_CT0_R2_43983772199_complete_job.log), Git blob `a8f63cfafe8a914b9b155f43d213b7e3fd218ac1`.
- [Preservation and per-entry digest manifest](research/spectral-p2-original-field/diagnostics/BFSS_M4_CT0_R2_43983772199_evidence_manifest.json), Git blob `83db728c5e087968086ed58bae492952315c03cd`.
- [Independent rehash run #43987114193](https://github.com/etblink/math/actions/runs/43987114193), job `133718010686`, SUCCESS. Re-downloaded provider ZIP, verified SHA-256, tested SHA, ZIP integrity, cold proof, source/consumer reports and original entries. [Complete independent preservation job log](research/spectral-p2-original-field/diagnostics/BFSS_M4_CT0_R2_43987114193_preservation_job.log), Git blob `a3fbb1a64a81954a9b7aa2a73b5f26c19fbda5bb`. This independently validates evidence integrity, not mathematics.

## Accepted mathematical theorem

On the **original** finite-dimensional complex `Fermion 2` Fock carrier for the original 48 normalized Majoranas, with immutable generator

```text
K(A) = ∑ p : Source48Label, ∑ q : Source48Label,
         (A p q / 4 : ℝ) • (sourceNormalizedGamma p * sourceNormalizedGamma q),
```

for any original real skew `A`, `A.transpose = -A`, the ordinary original complex Fock trace vanishes:

```lean
originalFockTrace (originalSource48BivectorK A) = 0
```

The strict source proof uses T1's original endomorphism trace cyclicity plus generic finite contraction of skew coefficients with the symmetric pair trace. It preserves real-to-complex scalar bridge and handles repeated diagonal labels.

**Ceiling:** no complete `[K(A),K(B)] = K([A,B])` identity, original Fock-vector Spin(9) integration, physical gauge/charge-domain results, full G16, regulator Hardy bound, ground-state fidelity, mass gap or ground-state existence follows from CT0 alone.

## Negative history and next route

R1 [#43980155870](https://github.com/etblink/math/actions/runs/43980155870) original strict RED with wrong explicit coefficient-ring argument to `LinearMap.trace_mul_comm`, original source/consumer/workflow SHA and complete job log preserved in [R1 RED receipt](BFSS_M4_CT0_R1_RED_43980155870_SOURCE_TRACE_TYPE_MISMATCH_2026_11_16.md), original ZIP provider `14284665134`, SHA-256 `8657ba3a6002428c8e7194d88460ac7998ed2ed4b86aeeaf6816613a3953e3b3`. R2 introduced the exact explicit ring argument `ℂ` while leaving independent consumer, accepted donors, resource bounds and original 1/4 normalization unchanged.

CT0 R2 becomes canonical **last qualified**; P0B R3 and earlier LB1L2/LB1C1/P0A remain accepted with original evidence. [CT1 Jacobi defect](BFSS_M4_CT1_JACOBI_DEFECT_SOURCE_SHAPED_FORWARD_RESEARCH_2026_11_16.md) is **prospective, not staged**; P1 four-Majorana bracket is fallback, equal-norm charge-square/Gauss is independent comparator. Edition 0.8 remains a historical monograph snapshot; `main` untouched.

**Verdict: CT0 R2 STRICT GREEN — exact original source, independent consumer, complete original artifact and separately rehashed evidence.**
