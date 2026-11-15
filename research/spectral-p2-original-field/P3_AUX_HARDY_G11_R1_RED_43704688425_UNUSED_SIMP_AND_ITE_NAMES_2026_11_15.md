# HARDY-G11 R1 — proofs elaborate, strict source rejects unused/deprecated names

Date: November 15, 2026 Pacific. Verdict: RED_UNQUALIFIED.

[Strict #43704688425](https://github.com/etblink/math/actions/runs/43704688425), attempt1, tested `c171140ef465d1b9bdb0efca4b2749622ef9c913`, job `132783129968`, completed with failure. G10 remains accepted.

Preflight164, early helpers1+3 and cold9,086-job build PASS. All six source roots elaborate and report only propext/Classical.choice/Quot.sound in the build and fresh source logs. No unsolved mathematical goal, sorryAx, recursion or resource failure appears.

The fresh warning-as-error source compiler fails on:

- Line20:28: `PiLp.single_apply` is unused in `simp_all [originalHardyY, PiLp.single_apply]`; the compiler recommends deleting that argument.
- Eight references to deprecated `if_pos`/`if_neg`, recommending `ite_eq_left`/`ite_eq_right`: source lines29/30/40/42/58/60/71/74.

The native consumer and final scope audit are not executed. Named source reports alone do not qualify the gate. A bounded pre-repair scan finds the same aliases in the consumer: three `if_pos` and two `if_neg` references. Their names can be updated without asserting that the consumer has compiled.

## Exact evidence

- Source `6f769ce6641ca327c13fc0a61d77496b85fe63c5`; consumer `c0470c8a91adf6548da0348ae8c02cb59cd97955`; workflow `b741f6366b44d1d0a4afdb6d1a578edf592be95b`.
- Manifest164 SHA256 `de65204afbda816fb1e54184fe1e87572f65045c46f4b5223dcf6978907dbfe5`; tested SHA and source/consumer bytes independently checked against pins.
- Artifact `14157863050`,21,811 bytes; downloaded and independently rehashed SHA256 `64c313fa1f4c1ea8115464caa1b15c6d30ad3391e67eb65f73c537a947cc8f06`, matching GitHub's digest. [Complete twelve-file ZIP](diagnostics/P3_AUX_HARDY_G11_R1_43704688425_evidence.zip); [fresh source log and all six reports](diagnostics/P3_AUX_HARDY_G11_R1_UNUSED_SIMP_AND_ITE_NAMES_43704688425_2026_11_15.txt).

## Bounded decision and lesson

[R2 preregistration](P3_AUX_HARDY_G11_R2_PRE_GATE_CURRENT_ITE_NAMES_AND_MINIMAL_SIMP_2026_11_15.md) replaces only the compiler-identified aliases in the two new candidate files and deletes the one flagged source simp argument. All statements and controls remain fixed; the workflow changes only their two expected hashes. Do not rename dependencies or suppress strict warnings.

When a source warning exposes a deprecated alias, scan the candidate consumer for that exact alias before rerunning, rather than waiting for the next stage to reject it. Historical accepted donor bytes remain immutable. This is a compatibility repair, not new mathematics or physical progress.
