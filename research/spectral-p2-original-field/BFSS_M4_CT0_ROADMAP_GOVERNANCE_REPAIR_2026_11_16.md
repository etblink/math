# BFSS CT0 — roadmap-consistency governance repair and negative history

Date: 2026-11-16 Pacific. Only branch: `integration/bfss-unified-research-20261108`.

## Verified result

**Roadmap consistency GREEN**: [run #43982431503](https://github.com/etblink/math/actions/runs/43982431503) completed **SUCCESS** at commit `0538f80ad160e2ae3e47331d18d138edd97bf289`. The job `checkpoint-consistency` and its `Check project-lead roadmap and active gate` step both succeeded. This is **governance qualification**, not a mathematical CT0 theorem qualification.

The resulting schema-2 checkpoint registers CT0 R1 as `PENDING_STRICT_CI`, with exact active source/consumer/workflow Git blob pins. The unchanged last-qualified anchor is **P0B R3 STRICT GREEN #43962066769**; all accepted anchor entries remain intact. The original CT0 proof run [#43980155870](https://github.com/etblink/math/actions/runs/43980155870), tested commit `144d2d1d9c7b14199ad5ebf9e0c0dfe13410e55e`, was still running its cold source/audit/consumer stage at the post-repair check. The strict workflow/source/consumer were **not edited or retriggered** by this governance-only repair.

## All observed governance REDs and exact causes

1. [#43979915272](https://github.com/etblink/math/actions/runs/43979915272), tested `ac7708b5067bc43785b5d49ffa58b8f9d62abd13`: `BFSS_ROADMAP_CHECK_FAIL: source changed outside active contract: lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4CT0OriginalSkewBivectorTrace.lean`. Source staged before CT0 registration.
2. [#43979979963](https://github.com/etblink/math/actions/runs/43979979963), tested `c609f4e5f4e9bb09dfd1172c8aa672f03b867beb`: `BFSS_ROADMAP_CHECK_FAIL: source changed outside active contract: lean/diagnostics/BFSSP3M4CT0OriginalSkewBivectorTraceIndependentConsumer.lean`. Independent consumer staged before CT0 registration.
3. [#43982339512](https://github.com/etblink/math/actions/runs/43982339512), tested `93e756b314e7f67e843fb254a868c5c275aabddd`: `SyntaxError: unterminated string literal (detected at line 49)` in `tools/check_bfss_m4_checkpoint.py`. An initial generated checker rewrite accidentally inserted extra source text into a Python string. The first causal error is unambiguous in the original [complete job log](research/spectral-p2-original-field/diagnostics/BFSS_M4_CT0_ROADMAP_43982339512_COMPLETE_JOB.log).

**Repair of the third RED:** commit `0538f80ad160e2ae3e47331d18d138edd97bf289` replaced the malformed checker with a **restricted static AST parser** for the pre-existing CT0 multiline `pins={...}` dictionary (including the literal `base+"..."` path prefix). It retains the original single-line accepted workflow path and verifies each resolved donor/source/consumer blob via the *same* exact byte hash comparisons. The validator still rejects missing/duplicate pins, unsupported dynamic key expressions, source or consumer drift, unrecognized status and attempted promotion to qualification.

## Non-promotion and next audit

- **No formal theorem was promoted** by these changes; source proof, independent consumer, and mathematical CI evidence still require their own completed strict verdict.
- The previous P0B R3 acceptance receipts/artefacts, failed P1/LB1L0 evidence, original frozen toolchain, branch policy and the physical fidelity endpoint remain unchanged.
- A new CI RED on the original CT0 source should be handled on its own first causal Lean error, after preserving the original artifact, not conflated with this resolved governance issue.
- No change to `main`, no workflow trigger modification, no time-limit escalation and no forced branch ref update.

**Governance conclusion:** road map mismatch repaired and independently CI-validated at #43982431503. **Mathematical CT0 remains unqualified.**
