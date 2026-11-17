# BFSS LB1P1 R2 — donor theorem name-resolution repair, no source normalization change

Date: 2026-11-16 Pacific. **PENDING_STRICT_CI**, no theorem qualified at this staging. Unified branch `integration/bfss-unified-research-20261108`.

Original R1 strict RED [#43996551474](https://github.com/etblink/math/actions/runs/43996551474) at tested `c34911208aae4964283b39454ed41d990eb1306e`: exact 11 donor+toolchain preflight and restoration PASS, cold original source failed at 41:6 due to an incorrectly line-split `Namespace.` donor identifier; same at lines 75 and 77. No source/consumer qualification. [R1 negative receipt](BFSS_M4_LB1P1_R1_RED_43996551474_LINE_SPLIT_DONOR_IDENTIFIER_2026_11_16.md), original 3547-byte ZIP artifact `14290412981`, SHA256 `0d873a2259c24bc4ccdbb3be175869ad413504dcd0cd12fe8b25830e557e7420`, exact archive/git blob `300e166ae9069ee9880b13039411e0acb6fefcb6`, full original log and independently rehashed GREEN #43998088476 all committed in Git.

## Only source change

Replace the full namespace names **broken by a newline immediately after the period** by explicitly opening exactly the two already imported qualified donor namespaces:

```lean
open FCP.BFSSP3M4LB1L2AbstractOriginalFockCovarianceLeibniz
open FCP.BFSSP3M4LB0OriginalSource48MajoranaBivectorCAR
```

Then invoke their original established public theorem names directly: `originalFock_product_covariance_from_two_hypotheses` and `originalMajorana_bivector_commutator` twice. No change to the two P1 theorem statements, original Source48 `Γ_i`, arbitrary-label/repeated-index handling, source Fock operator algebra, P0B, original 1/4 factors or any accepted donor or toolchain. P1 R2 remains a new candidate requiring full strict compilation.

## Strict R2 evidence contract

- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1P1OriginalFourMajoranaCommutator.lean`, new exact Git blob `9a2899e24c02cb5a5dd58159605a34195fce3856`.
- Unchanged independent importing consumer `lean/diagnostics/BFSSP3M4LB1P1OriginalFourMajoranaIndependentConsumer.lean`, Git blob `5822a7290c04e5fc88b297ad14d9d16b8c290bbd`.
- Updated strict workflow `.github/workflows/bfss-m4-lb1p1-four-original-majorana-strict.yml`, new Git blob `24c143df6ddf8fb4c9254b7f3a1738d34dbbdc37`; all other nine donor/toolchain blob pins unchanged.
- Canonical active `P3-M4-LB1P1 R2 PENDING_STRICT_CI`, with original R1 receipt/ZIP/SHA256/job log pinned. CT1-G0's two-RED stop and original archives still enforced by the workflow.
- Cold original source build bounded 1100 s; separate warning-as-error source and consumer each bounded 360 s, strict 2 source + 2 consumer only permitted axioms `propext`, `Classical.choice`, `Quot.sound`, four independent source-label controls, positive + six negative auditor controls and original artifact on failures.

If R2 fails in a *materially analogous native Source48 binding* way, stop after architecture review; if distinct, preserve and evaluate against the bounded repair policy. **Do not claim any source theorem qualified merely from preflight or the general Clifford symbolic checks.**

[Parallel forward research](BFSS_M4_BIVECTOR_ANTISYM_DERIVATION_AND_HALF_SUM_FORWARD_RESEARCH_2026_11_16.md) proposes a shorter antisymmetric-`B_ij` bracket with no-ordering finite half-sum extension to general skew matrices. This is not implemented or qualified. The full K Lie homomorphism, Spin(9), physical gauge/charge domains and G16/fixed-regulator fidelity remain unproved; `main` untouched.
