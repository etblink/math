# SM-D1-SCC3B1 — separate exact mathematical difference from missing predictions and joint likelihood

**2026-11-18 | FORWARD RESEARCH ONLY; NOT A QUALIFIED GATE**

## Historical basis

The accepted SCC0 Python comparator `research/standard-model/tools/smd1_scc0.py` (Git blob `95569dffd88af133df3dd56d23e1f61ca8c4a207`) currently returns `JOINT_LIKELIHOOD_REQUIRED` as soon as two selected observations have a repeated `dependence_group`, before inspecting actual predictions. After checking all selected witnesses, it returns `UNKNOWN` if any prediction is absent even when another valid marginal already differs. That was an intentionally conservative guard against unsupported global/statistical inference, but it conflates *existence of an exact positive marginal witness* with *complete joint/likelihood comparison*.

SCC1→SCC3A finite Boolean mathematical results are independently archived, and SCC3B0 exact rational total variation has been **staged only** as tested native run #44413642677; this memorandum is **not** evidence of qualification.

## Decision interface: orthogonal judgments, not a single overloading enum

For two named scenarios and a typed finite witness set, consider returning one record with at least these independent fields:

- `protocol_integrity`: `VALID` / `INVALID`, with exact offending observable IDs, outcome identities, units and versioned protocol.
- `exact_marginal_difference`: `WITNESS_PRESENT` / `NO_DIFFERENCE_ON_COMPLETE_DECLARED_SET` / `UNDETERMINED`. The first requires one fully comparable pair of *present, valid, normalized* categorical predictions with distinct distributions, optionally quantified by exact rational `dTV>0`. The second demands all selected marginals be present, valid and equal. The third means no positive witness but at least one unavailable selected prediction.
- `prediction_completeness`: `COMPLETE` / `PARTIAL` with missing/out-of-scope IDs and no invented predictions.
- `joint_likelihood_readiness`: `AVAILABLE_EXPLICIT_JOINT` / `REQUIRES_JOINT_OR_COVARIANCE` / `NOT_REQUESTED`, with dependence groups and explicit joint protocol. A repeat group must never be silently treated as independent.
- `evidence_status`: `NO_EXPERIMENTAL_INFERENCE` until actual observations, sampling design, uncertainty, calibration, nuisance/model parameter domains and a validated source-derived map exist.

**Invariant:** a known good differing marginal can coexist with a missing other marginal or an unavailable joint likelihood. This is not a contradiction: different marginals entail different joint laws where those joint laws exist, but give no justified number for likelihood ratio or finite-sample significance.

## Adversarial test corpus for a future separately qualified successor

1. A valid first witness differs exactly, the second witness is NOT_PREDICTED: retain `WITNESS_PRESENT`, report `PARTIAL`, do not report complete equality.
2. A valid first witness differs and two selected witnesses share a declared dependence group: retain `WITNESS_PRESENT`, require joint likelihood for statistics.
3. Every valid present marginal agrees, one is missing: `UNDETERMINED`, never observational equality.
4. All selected valid marginals present and equal: equality **on those declared marginals only**, not theory equivalence or joint-distribution equivalence.
5. Two distinct joint distributions with identical one-dimensional marginals (e.g. perfectly correlated versus perfectly anti-correlated binary pairs): reject inference that joint laws agree from equal marginals.
6. Wrong protocol/unit/outcome alphabet, duplicate IDs or invalid normalization: `INVALID` flagged independently; do not use the invalid witness as positive evidence.
7. One valid differing marginal plus an invalid unrelated one: preserve the local mathematical witness, mark global typed comparison invalid and do not issue a global family-level verdict.
8. Empty scenario family, even if universal quantification is vacuous in abstract Lean: reject as a physical comparison.
9. Family-level uniformity requires a valid differing witness *for every admissible cross-family scenario pair*. One unresolved pair must block a complete uniform verdict, even if many other pairs have known differences.
10. Distinguish exact numerical positive `dTV>0` from a bounded practical detection rate; as distances approach zero, no uniform finite-sample power follows without extra quantitative hypotheses.

## Governance and ordering

- **Do not edit accepted SCC0 code or its existing independent consumer.** Introduce a new SCC3B1 implementation and adversarial compatibility tests with a visible old-vs-new behavior matrix.
- Require SCC3B0 source+consumer strict original GREEN and independent ZIP/full-job preservation before depending on the TV theorem. If SCC3B0 fails, retain RED evidence and repair/stop by the existing strict rules.
- Run a bounded independent source/consumer qualification with source SHA pins, negative mutation audits, deterministic fixtures, provenance checks, and original CI archival.
- The scientific target is a truthful comparison procedure that makes falsifying predictions testable while preserving what remains unknown. No SCC, NFC, BFSS or Standard Model success may be inferred from the algorithm.
