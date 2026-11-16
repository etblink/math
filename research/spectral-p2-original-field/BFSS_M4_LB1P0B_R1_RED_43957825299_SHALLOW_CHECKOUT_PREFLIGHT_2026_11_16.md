# P0B R1 — RED before Lean: shallow checkout omitted HEAD^

2026-11-16 Pacific. Run [43957825299](https://github.com/etblink/math/actions/runs/43957825299), attempt 1, tested e11593f778bf3434654366b67fa8f93eee0bf840, job 133616957724.

## Exact causal boundary

All twelve source/consumer/donor/toolchain Git-blob assertions and source/consumer shape assertions completed before the watchdog call. That call failed at tools/check_bfss_m4_checkpoint.py:85: git diff --name-only HEAD^ HEAD returned exit 128, "fatal: ambiguous argument 'HEAD^'". The strict workflow used actions/checkout's default fetch-depth 1. The standalone roadmap watcher separately specifies depth 2.

Frozen Lean/Mathlib restoration, source compilation and independent consumers were NOT REACHED. Source c27ebd4b909b157d70efb5ad5db0ce836468f4d3 and consumer 056d7692125f723c91e1d4a50540b9bcfaaf09da are unqualified; no mathematical counterexample or Lean error was observed.

Complete decoded job log is committed at diagnostics/BFSS_M4_LB1P0B_R1_43957825299_complete_job.log, Git blob 8385cc945437746a3d330b74bcb08f761aaa7adc. Artifact [14272324214](https://github.com/etblink/math/actions/runs/43957825299/artifacts/14272324214) is 189 bytes, reported SHA256 4b8fae8a8523bce02b2aa973e30cec4b068d6b233156ca5b5cb08d9deb10b729. It contains only tested-commit.txt: the failing preflight stdout was not previously teed into the upload directory. Provider hash observed, original ZIP not independently rehashed in this executor-unavailable session. The complete job log preserves the actual failure instead of treating the one-file artifact as complete causal evidence.

## Bounded R2 correction authorized by this preserved receipt

1. Add fetch-depth: 2 to this strict workflow's checkout.
2. Tee preflight stdout/stderr into preflight.log under the existing artifact directory, with pipefail retained.
3. Make the first negative watchdog fixture explicitly clear previous_red_run when testing an unsupported R2. Require accepted_predecessor_run to match the last qualified run for pending first attempts and retries, so the other predecessor fixture remains meaningful.
4. Preserve source/consumer bytes, donor pins, matrix/gamma/scalar normalization, theorem statements, 2+2 roots, three consumer controls, warning/axiom policies and all resource budgets.

The checkpoint may preserve a preflight-only RED via a complete Git-blob-pinned job log and exact provider artifact reference when the failed job did not produce Lean logs. Full mathematical acceptance still requires the complete source/consumer artifact and strict audits; that rule is unchanged.

P0A R4 remains the last qualified gate. Record this negative before staging R2; no unchanged retry.
