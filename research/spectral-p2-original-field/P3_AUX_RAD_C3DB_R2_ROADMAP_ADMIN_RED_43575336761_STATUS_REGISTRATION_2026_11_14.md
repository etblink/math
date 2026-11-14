# P3-AUX-RAD-C3D-B R2 — checkpoint-only ADMIN RED #43575336761

**Date:** 2026-11-14 Pacific. **Status:** ADMIN_ONLY_NOT_MATHEMATICAL_RED; repair staged, requires its own fresh roadmap consistency GREEN. Mathematical RAD-C3D-B R2 source/consumer strict run is a separate independent workflow.

## First-causal evidence

[Roadmap-consistency run #43575336761](https://github.com/etblink/math/actions/runs/43575336761) completed **failure**, tested commit `76f207da39b2ead16e3652ddffdb5c16e8188255`, job `132388226684`. The checkout succeeded and `python3 tools/check_bfss_roadmap.py` failed immediately with `BFSS_ROADMAP_CHECK_FAIL: unregistered experiment status`.

Read-only inspection of the exact current registry `research/methodology/BFSS_EXPERIMENT_REGISTRY.json`, blob `1f867c3dc58d23c0da96482942e7ccc051231e32`, found precisely one status outside the file's `allowed_statuses`: `E-P3-AUX-RAD-C3DB-R1` was correctly recorded as `RED_UNQUALIFIED` following [source CI #43573922855](https://github.com/etblink/math/actions/runs/43573922855), but the registry's global status enumeration omitted `RED_UNQUALIFIED`. All 38 entries have unique experiment IDs and the nine mandatory scientific-method stage fields. This is a schema enumeration omission, not mathematical failure.

## Bounded fix

1. Add `RED_UNQUALIFIED` to the enumerated `allowed_statuses` in the scientific method experiment registry; do not relabel the failed candidate as `FALSIFIED` or `INCONCLUSIVE`.
2. Document its distinct operational semantics in `research/methodology/BFSS_SCIENTIFIC_METHOD_PROTOCOL.md`: a failed source/consumer/axiom qualification with first-causal evidence, **not a counterexample** or physical theorem result.
3. Add this receipt to the live checkpoint's `admin_checks`, retaining all earlier RED/green evidence. The administrative roadmap checker implementation is unchanged, as is the R2 Lean source, original paired consumer, strict workflow, its exact tested parent, and the full experiment R1 red record.

## Verification / stop

The registry now has no statuses outside `allowed_statuses`; the protocol still has the mandatory eight-stage rules and roadmap links. A new checkpoint run is required to verify execution of `check_bfss_roadmap.py`. **Do not call that run green until observed.**

[RAD-C3D-B R2 mathematical strict #43575336639](https://github.com/etblink/math/actions/runs/43575336639) was separately in progress at commit `76f207da39b2ead16e3652ddffdb5c16e8188255` when this administrative repair was prepared. Its status must be checked independently at its own exact SHA. No theorem status, density claim, auxiliary Hamiltonian or mass gap is changed.
