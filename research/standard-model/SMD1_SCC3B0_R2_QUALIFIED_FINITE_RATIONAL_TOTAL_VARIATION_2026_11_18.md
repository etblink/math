# SM-D1-SCC3B0 R2 — exact finite rational total variation independently qualified

**2026-11-18 | ACCEPTED: original source and importing consumer mathematical proofs only.**

## Original strict native result

- [Original run #44414707214](https://github.com/etblink/math/actions/runs/44414707214): **GREEN**.
- Exact tested commit `ee7d687a8311a1dd3852df6aaaec4b27365fc8ad`; original job `135191818266`.
- Original provider artifact `14478178317` size 2,189 bytes; SHA-256 `0df3e01e26cdae85dd6cb81d6c27120a48bc6703455f0dfb576813c6f0c7e2e2`.
- Source `lean/OAI/MathematicalPhysics/StandardModel/Contrib/Kotler/SMD1SCC3B0FiniteRationalTotalVariation.lean` blob `8417daf98449b51d45b18951bd389cb3bd777405`.
- Independent consumer `lean/diagnostics/SMD1SCC3B0RationalTotalVariationIndependentConsumer.lean` blob `5b8be7515fec5be62c8433c8a5d8bc642e11dad4`.
- Original workflow blob `a6f388f7a593662bf624977034015ffac9b1b12e`.
- Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Cold build 3,092 jobs passed. Exactly **seven source** and **five independent consumer** theorem axiom reports plus **two** independent examples passed. Six adversarial negative-auditor mutants were rejected; all axiom reports only contain the accepted Lean foundations `propext`, `Classical.choice`, `Quot.sound`. No `sorryAx` or other axioms.

## Independent original GREEN artifact archive

[Archive run #44415834582](https://github.com/etblink/math/actions/runs/44415834582) **GREEN**, evidence commit `47a212ff0866b5e32d9104ed41e6dc810ae38a6f`. The archiver independently verified original run, job, exact tested commit, original provider ZIP SHA, six archive members and their individual SHA-256/CRC, all twelve theorem axiom audits, original complete job transcript, and six negative controls.

Pinned canonical files:

- `research/standard-model/evidence/SMD1_SCC3B0_R2_44414707214_ORIGINAL_STRICT_GREEN_evidence.zip`
- `research/standard-model/evidence/SMD1_SCC3B0_R2_44414707214_ORIGINAL_complete_job.log`
- `research/standard-model/evidence/SMD1_SCC3B0_R2_44414707214_ORIGINAL_STRICT_GREEN_evidence_manifest.json`

Manifest blob `47d9259d30c82bfb1b5d6035b7c72689d7ed1638`, complete job SHA-256 `ec8879c63d0439055f483819606f175e93f812df8a7d43adde6b5d4074fa2df8`.

## Independently preserved original RED

The first strict attempt [#44413642677](https://github.com/etblink/math/actions/runs/44413642677) **RED** in its independent consumer because kernel `decide` did not normalize five finite rational sums. Its **seven source theorem checks passed**, but the consumer failed and produced unqualified `sorryAx` dependencies. This RED was independently archived by [#44414837216](https://github.com/etblink/math/actions/runs/44414837216) in Git evidence commit `d69f2965a19a2f49ead49c133ccc6c74d737b370`; the original ZIP and full job log are separately preserved. R2 changed only five consumer proof tactics to explicit `norm_num [Fin.sum_univ_succ, ...]`. The original source theorem statements, source proof bytes, timeouts and axiom ceiling were frozen.

## Mathematical scope and scientific ceiling

A `Categorical n` object has rational, nonnegative, normalized masses on named `Fin n` outcomes. The conventional half-L1 total variation `dTV(P,Q)=1/2∑|P(i)-Q(i)|` satisfies nonnegativity, symmetry, zero exactly for equal outcome weight functions, strictly positive distance for any differing weight, and `dTV≤1` by normalization. The independent consumer checks point masses and a balanced two-outcome law; the exact toy distances are 1, 1/2 and 0 as expected.

**Not proved:** any physically derived Standard Model/BFSS/NFC prediction, experimental significance, numerical finite-sample power, correlations or joint likelihood, any continuous nuisance parameter bound, or a reconciliation of actual observed data with a candidate theory. The existing SCC0 Python comparator's handling of `UNKNOWN` and `JOINT_LIKELIHOOD_REQUIRED` is preserved unchanged.

## Forward boundary

The separate SCC3B1 forward memo `research/standard-model/SMD1_SCC3B1_FORWARD_DECISION_SEMANTICS_AND_ADVERSARIAL_FIXTURES_2026_11_18.md` specifies an orthogonal decision record. The next bounded proof/software gate should distinguish (1) known positive exact marginal evidence, (2) unavailable predictions, (3) protocol invalidity and (4) missing joint likelihood without weakening old SCC0 assertions. Retain a visibly compared compatibility matrix and source-exact independent tests.

Original qualified SM-Y0, empirical SM-D0, executable SCC0, formal SCC1→SCC3A and the **27 accepted BFSS anchors** remain separately traceable. W0C2B2 remains **BLOCKED**; full physical SM-D1 remains **PROSPECTIVE_UNSTAGED**.
