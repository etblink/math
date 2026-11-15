# HARDY-G11 R3 — exact matching-color rewrite launch

Date: November 15, 2026 Pacific. Status: PENDING_STRICT_CI, not qualification.

[Strict #43708533905](https://github.com/etblink/math/actions/runs/43708533905), attempt1, job `132794815882`, tests exact workflow head `7459e472085a6ef9b3c5c8352073ea1bafa6645e`. Observed in progress at checkout; preflight and all proof stages pending at this observation. Administrative run `43708533789` is separate.

[R2 red evidence and two-red review](P3_AUX_HARDY_G11_R2_RED_43706576557_NATIVE_TRUE_CONDITIONAL_2026_11_15.md) and the [R3 contract](P3_AUX_HARDY_G11_R3_PRE_GATE_EXPLICIT_MATCHING_COLOR_REWRITE_2026_11_15.md) were committed at `9f79c202888e40d59064b77bb62abc2434439c17` before consumer edits.

- Source remains `fae4dc32dee27c5542f7fffddf217b276ed2bfef`, byte-identical to R2's clean strict source.
- Consumer `27b63114ea4635beed31bc9cef954b8499e8194e` changes only example7: replace limited `simpa only` transfer by explicit rewriting of the same source theorem and positive conditional branch.
- All twelve statements, other eleven proof bodies, imports and twelve print reports are unchanged.
- Workflow `d0f14e9aa39fe01e1c7d5f41a3d0fe31cb26c75c` changes only its expected consumer pin. Donor/helper bytes, normalization and resources remain fixed.

[Static receipt](diagnostics/P3_AUX_HARDY_G11_R3_STATIC_CHECKS_2026_11_15.json) checks exact one-tail delta, source freeze, hashes/imports/roots/examples, YAML/bash/four Python blocks, literal preflight assertions, positive/five-negative strict-auditor fixtures and five checkpoint rejection fixtures. Local Lean and complete local recursive closure recomputation are unavailable. These checks do not qualify the repair.

Require fresh164-pin preflight against accepted G10 baseline `7d5f8f74b9d922a6e7628b7d05e30d2d2d6ab73d`, helpers1+3, cold original build, fresh source6/native12 standard-axiom reports, all twelve native controls and final scope audit. If the same matching-color conditional/native conversion boundary recurs, stop full-gate retries and preregister an isolated variable-data/actual-carrier typed diagnostic; no further local simp tweak followed by a full retry.

G10 remains accepted; G11 remains unqualified and coefficient-level only. Final Fock bilinear, core rotation, tau norm, physical covariance/energy domains and Hardy/fidelity/spectral conclusions remain separate obligations.
