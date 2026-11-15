# HARDY-G10 R2 — exact strict launch binding

Date: November 15, 2026 Pacific. Status: PENDING_STRICT_CI, not qualification.

[Strict #43700520096](https://github.com/etblink/math/actions/runs/43700520096), attempt 1, job `132770419918`, tests exact workflow head `232c40b89bbdc3579f9ba59f5063967351c644cd`. Observed in progress at checkout. Preflight and all proof stages pending at this observation; expected163 pins must be measured afresh. Administrative run `43700520075` is separate.

[R1 red and full evidence](P3_AUX_HARDY_G10_R1_RED_43699086864_DEPRECATED_ONE_APPLY_2026_11_15.md) and the [R2 contract](P3_AUX_HARDY_G10_R2_PRE_GATE_CURRENT_ONE_APPLY_LEMMA_2026_11_15.md) were committed at `ec6af36c579d35cdee9ad6eb87efd08092dbb57a` before repair.

The entire source delta is the compiler-recommended replacement `ContinuousLinearMap.one_apply` -> `one_apply_eq_self`. New source `59aaed1da894e8b91b2df51eda6f47a37cf4c517`; complete consumer `ed4507504ac58eef9bcb4299bb8092c9b9679b75` unchanged; workflow `5e126c42ae799170ee6d4aeca33172747eaa3fc4` changes only its expected source pin. Statements, imports, other proof text, all twelve controls, donor/helper sources and resources are fixed.

[Static receipt](diagnostics/P3_AUX_HARDY_G10_R2_STATIC_CHECKS_2026_11_15.json): exact source/workflow delta, hashes/imports/roots/examples, YAML/bash/four Python blocks, literal preflight assertions using the earlier measured closure, positive/five-negative strict-auditor fixtures and five checkpoint rejection fixtures PASS. Local Lean and a complete local recursive closure recomputation are unavailable. These checks do not qualify the repair.

Require the complete163-pin preflight, early helpers1+3, cold original build, fresh source6/native12 standard-axiom reports, all twelve native examples and final scope audit. R1's source proofs elaborated, but its native consumer was never run; do not infer native success. Repeated identity-evaluation/deprecation failure requires an isolated variable-operator diagnostic before another full retry.

G9 remains accepted. G10 remains limited to the pointwise orbital CAR coefficient; coefficient-derivative fermion contraction, full core rotation, tau norm, physical covariance/energy domains and Hardy/fidelity/spectral conclusions remain outside this gate.
