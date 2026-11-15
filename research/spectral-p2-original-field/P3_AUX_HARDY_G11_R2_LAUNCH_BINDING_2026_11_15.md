# HARDY-G11 R2 — exact conditional-lemma cleanup launch

Date: November 15, 2026 Pacific. Status: PENDING_STRICT_CI, not qualification.

[Strict #43706576557](https://github.com/etblink/math/actions/runs/43706576557), attempt1, job `132788867782`, tests exact workflow head `2092258396c549f3076d10ebcc4b0537ff1053dd`. Observed in progress at checkout; preflight and proof stages pending at this observation. Administrative run `43706576486` is separate.

[R1 red evidence](P3_AUX_HARDY_G11_R1_RED_43704688425_UNUSED_SIMP_AND_ITE_NAMES_2026_11_15.md) and the [R2 contract](P3_AUX_HARDY_G11_R2_PRE_GATE_CURRENT_ITE_NAMES_AND_MINIMAL_SIMP_2026_11_15.md) were committed at `f4cc79e6be261d4bf83580057f4c01ba018f9cf6` before proof edits.

- Source `fae4dc32dee27c5542f7fffddf217b276ed2bfef` replaces eight compiler-identified conditional aliases and removes the one compiler-flagged source simp argument.
- Consumer `51cebb400a0da2cf35998888bdd81dfbaa591ec4` replaces only its five copies of those conditional aliases.
- Workflow `81bcb1651f66b105b2b140162b5ab75ff4503c86` changes only the two candidate hash pins.
- Statements, imports, other proof text, all twelve examples, six/twelve print reports, all existing donor/helper sources, normalization and resources remain fixed.

[Static receipt](diagnostics/P3_AUX_HARDY_G11_R2_STATIC_CHECKS_2026_11_15.json) verifies the exact cleanup, removal of the reported aliases from both candidates, source/consumer/workflow hashes, root/example/import structure, YAML/bash/four Python blocks, literal preflight assertions, positive/five-negative strict-auditor fixtures and five checkpoint rejection fixtures. No local Lean or full local recursive closure recomputation was available. These checks do not qualify the repair.

Require fresh164-pin preflight against accepted G10 baseline `7d5f8f74b9d922a6e7628b7d05e30d2d2d6ab73d`, early helpers1+3, cold original build, fresh source6/native12 standard-axiom reports, all twelve controls and final scope audit. R1's source proofs elaborate but its native consumer never runs; no native acceptance is inferred. A repeated same warning boundary requires an isolated helper and architecture review before another full retry; repeated native conversion requires typed comparison.

G10 remains accepted; G11 remains unqualified and limited to scalar/matrix derivative color/spin contraction. Final Fock bilinear, core rotation, tau norm, physical covariance/energy domains and Hardy/fidelity/spectral conclusions remain separate obligations.
