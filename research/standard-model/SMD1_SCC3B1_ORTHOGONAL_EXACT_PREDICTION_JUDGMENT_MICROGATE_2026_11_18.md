# SM-D1-SCC3B1 — orthogonal marginal/uncertainty judgments microgate

**November 18, 2026 | STAGED, NOT YET QUALIFIED.**

Create a **new**, source-independent SCC3B1 comparator at `research/standard-model/tools/smd1_scc3b1.py`, preserving accepted SCC0 `smd1_scc0.py` byte-for-byte. The old SCC0 source remains the source of truth for witness/prediction/categorical constructors and historical verdicts; this successor must not reinterpret an unavailable physical map as a supplied prediction.

## Exact mathematical decision contract

- `exact`: `WITNESS_PRESENT` if any fully typed present selected marginal differs by exact rational TV>0; `COMPLETE_AGREEMENT` only when all selected marginals are valid, present, and equal; otherwise `UNDETERMINED`.
- `integrity`: `VALID` or `INVALID` when any present selected observation has incompatible observable identity, declared protocol, units, or outcome alphabet.
- `completeness`: `COMPLETE` or `PARTIAL` when any selected prediction is unavailable or unmapped.
- `joint`: `REQUIRES_EXPLICIT_JOINT` when two selected observables share a non-null dependence group; otherwise `NOT_ASSESSED`. No independent/product joint likelihood is inferred in either case.
- `experimental_evidence` is always `NO_EXPERIMENTAL_INFERENCE`; computed TV distances concern exact predictive *mathematical* distributions, not data or finite-sample power.
- Family-level uniform exact marginal separation requires at least one valid distinguishing witness for **each** explicitly listed cross-family pair and all comparisons fully typed and complete. An invalid unrelated witness may coexist with a local positive witness, but blocks a complete global certificate.

## Independent adversarial consumer

`research/standard-model/tests/test_smd1_scc3b1.py` compares old versus new behavior on positive+missing, positive+dependent-group, missing-without-positive, all valid equal, correlated versus anti-correlated joint laws with identical marginals, wrong units/outcomes, positives with an invalid unrelated witness, finite uniformly separating families, one unknown pair preventing uniformity, exact half-TV and unit-TV examples, duplicate/empty selections, invalid normalization and missing source-specific physical maps.

The policy is to **preserve negative history**, including SCC0's conservative old priority verdict, without changing it. An exact known differing marginal is mathematical positive evidence only; no statistical likelihood, confidence claim or physical framework validation.

## Qualification

Run exact pinned independent Python standard-library tests, the original accepted SCC0 independent consumer in parallel within the same original run, a negative auditor that verifies intentionally invalid inputs are rejected, and 27 BFSS anchors/SM-Y0/SM-D0/SCC0/SCC1→SCC3B0 original evidence pin checks. Preserve original RED and GREEN ZIP/full-job SHA evidence independently. Formal SCC3B0 is accepted; SCC3B1 is not accepted until original native GREEN, separate archival verification and ledger promotion.

Review boundary after SCC3B1: decide if the next effort should be a **real, versioned Standard Model model-to-observable calculation** rather than more abstract witness machinery. Full physical SM-D1 remains PROSPECTIVE_UNSTAGED.
