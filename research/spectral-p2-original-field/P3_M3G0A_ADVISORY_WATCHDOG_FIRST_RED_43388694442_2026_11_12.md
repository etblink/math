# BFSS M3G0A advisory watchdog — first causal administrative red and bounded repair
**Date:** 2026-11-12 Pacific / 2026-11-13 UTC.
**Type:** administrative roadmap/watchdog consistency only; **NOT** a Lean theorem red, mathematical disproof or failed physical claim.

## Evidence
- [Roadmap run #43388694442](https://github.com/etblink/math/actions/runs/43388694442), tested `dfa0f53937fe128e72aa03dcfeed716acd3fef99`: **RED**.
- Job `checkpoint-consistency` #131763161165; checkout succeeded; `python3 tools/check_bfss_roadmap.py` failed.
- First causal marker: `BFSS_ROADMAP_CHECK_FAIL: M2C1 qualified requires M3-G0 source gauge research-only handoff`.
- The prospective receipt correctly set `next_planned.gate=P3-M3G0A` with a non-qualified research status while the checker still hardcoded `P3-M3G0` / `RESEARCH_DESIGN_NOT_STAGED`.
- The subsequent candidate source commit `78f5b7dfad811f67203a6013ee797c0073d67938` also introduces a `P3M3...` file. The original checker would reject it under the older *active* source-path guard because the last accepted mathematical gate remains M2C1.
- [Run #43389407971](https://github.com/etblink/math/actions/runs/43389407971) was in progress at the time of this repair plan; do **not** claim its outcome until independently verified.

## Bounded correction
Extend the advisory checker to accept precisely two strictly non-qualified M3G0A checkpoint variants: `PROSPECTIVE_RECEIPT_RECORDED_NOT_STAGED` and `UNCOMPILED_SOURCE_AND_CONSUMER_CANDIDATE_STAGED_WORKFLOW_NOT_STAGED`. Require the prospective receipt and exact named source/consumer paths to exist when staged. Preserve M2C1 exact accepted run, immutable source, milestone transition, full original Fock independent consumer requirement, source-drift protection for any unrelated P3 file, and the false M3 mathematical qualification flag. Allow only the named uncompiled M3G0A source as an additional permitted source-path change.
Do **not** promote M3G0A from an administrative green; no strict M3 source/consumer/workflow or new physical theorem has qualified.
