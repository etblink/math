# W0B0 R2 — acceptance-roadmap RED caused by stale pending-only condition

Date: 2026-11-17 Pacific. **ROADMAP CHECKER RED ONLY; strict mathematical W0B0 R2 remains original GREEN.**

[Original strict mathematical run #44109519633](https://github.com/etblink/math/actions/runs/44109519633) completed GREEN with exact source and independent consumer, two roots each and permitted axioms only. Original six-member provider ZIP was independently byte-for-byte archived by [GREEN preservation run #44114511786](https://github.com/etblink/math/actions/runs/44114511786), before promotion. W0B0 acceptance commit `d150b3c574c627c3197b124a42dd6ff29037fc05` promoted `last_qualified` to W0B0 R2.

[First post-acceptance roadmap run #44115465461](https://github.com/etblink/math/actions/runs/44115465461), job `134152185411`, RED with `BFSS_ROADMAP_CHECK_FAIL: W0B0 R2 scalar-only repair exact source/consumer/parent drift`. Diagnosis: the R2 repair *pending* guard in `tools/check_bfss_m4_checkpoint.py` had condition `if a['gate']=='P3-M4-W0B0' and a.get('attempt')=='R2':` and still required `last_qualified == W0A3`, which was correct before acceptance but invalid after the promotion. A separate exact strict GREEN guard already verifies W0B0's full qualified provider original evidence.

**Bounded checker correction:** add `and a['status'] == 'PENDING_STRICT_CI'` to this one R2 historical repair guard, retaining the separate green guard, historical R1 RED and W0A4 STOP checks. No mathematical Lean source, independent consumer, frozen workflow, tested commit, provider ZIP or axioms changed. Full original failed roadmap job log preserved verbatim under `research/quantum-information/diagnostics/BFSS_W0B0_R2_44115465461_ACCEPTANCE_ROADMAP_job.log` as Git blob `fb7a5a47b89a610f99c5e07e10533e6e9ec33eb0`.

W0B0 R2 is **strict math GREEN**; canonical acceptance is contingent upon a fresh independent roadmap GREEN. The last-qualified checkpoint currently states W0B0 R2 but must pass its check before the Project Lead describes it as independently qualified. W0B1 full Clifford induction remains prospective.
