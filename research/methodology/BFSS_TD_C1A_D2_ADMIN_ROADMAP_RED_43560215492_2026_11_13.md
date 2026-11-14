# BFSS TD-C1A D2 — administrative roadmap RED and bounded registry repair

**Date:** 2026-11-13 Pacific.
**Scope:** administrative experiment-registry schema, **not** Lean source or native BFSS mathematics.
**Run:** [#43560215492](https://github.com/etblink/math/actions/runs/43560215492) completed/failure, attempt 1.
**Exact tested SHA:** `5f155f16c36638bdcc9f1c453e8d9a3995b4cc7e`.
**Workflow:** `.github/workflows/bfss-roadmap-watch.yml`.
**Job:** `132341996494`, `checkpoint-consistency`, failed at "Check project-lead roadmap and active gate".
**First causal line:** `BFSS_ROADMAP_CHECK_FAIL: unregistered experiment status`, exit 1.

## Diagnosed cause

The added D2 experiment registry record used `RUNNING_DIAGNOSTIC_NOT_QUALIFIED` as its top-level `status`, whereas `research/methodology/BFSS_EXPERIMENT_REGISTRY.json` provides a fixed `allowed_statuses` list: `PROPOSED`, `REGISTERED_NOT_EXECUTED`, `EXECUTED_UNREVIEWED`, `SURVIVED_FINITE_TESTS`, `FALSIFIED`, `INCONCLUSIVE`, `LEAN_QUALIFIED`. The checker `tools/check_bfss_roadmap.py` requires membership at its exact check line 305.

**Second latent failure (verified by inspecting the checker):** the D2 entry lacked a `stages` dictionary with nine mandatory keys (`observation`, `question`, `background`, `hypothesis`, `falsifiers`, `experiment`, `analysis_plan`, `conclusion_rule`, `communication`). This would have been rejected by line 306 after the first status repair. The earlier D2 registration had those fields at the top level instead of inside `stages`.

This follows an earlier R0A administrative schema correction lesson: every registry write must locally validate against both the allowed vocabulary and the complete stage schema **before committing**. The checkpoint run is independent of D2 experimental run [#43560114891](https://github.com/etblink/math/actions/runs/43560114891), at tested `4afb0db8f9d2797fe69d8e6adf6b3020ac67a1d6`; administrative RED neither invalidates nor qualifies its Lean observations.

## Bounded repair and evidence limits

- Preserve the original failed run, source commit and failure string above.
- Change only the D2 *experiment-registry* entry; do **not** change the allowed-status vocabulary or weaken the validator.
- Record the registry experiment as `REGISTERED_NOT_EXECUTED` until verified results are available; keep the launched workflow, exact tested SHA, and `WORKFLOW_LAUNCHED_IN_PROGRESS` separately in execution metadata. Run launch alone is not a diagnostic conclusion.
- Move the source observations/hypothesis/analysis into the nine-stage schema, restoring the independent/dependent variables, controls, falsifiers and prospective conclusion rule.
- Check **every entry** against permitted statuses, unique IDs, and nine required stage fields before publication.
- Preserve full D2 source, 14 frozen manifest blobs, original TD-C1A theorem/consumer, accepted M5BF0 and G0B2 and active integration branch. No proof retry, mass-gap claim or source adaptation is authorized by this repair.

**Acceptance rule:** a new, independently observed completed/success [roadmap consistency workflow](https://github.com/etblink/math/actions/workflows/bfss-roadmap-watch.yml) at the repair SHA is needed before declaring the administrative repair CI-green. Static validation by a client script or JSON parsing is necessary but not sufficient.
