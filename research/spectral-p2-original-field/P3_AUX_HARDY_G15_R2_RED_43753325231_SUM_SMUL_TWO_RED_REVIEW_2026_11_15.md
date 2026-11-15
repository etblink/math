# G15 R2 — RED confirmed; full retries BLOCKED

[Run43753325231](https://github.com/etblink/math/actions/runs/43753325231), attempt1, exact `271ee0174f173cf2917514cd225be76385a1592f`, job132931880950. G14 remains last qualified.

Complete14-file [artifact ZIP](diagnostics/P3_AUX_HARDY_G15_R2_43753325231_evidence.zip), artifact14178240278,23763 bytes. Independently rehashed SHA256 `db2ec23889c6611ebcc2533d89c6678129dd8e0ffd3c0f3d19948282b1190d8d`. [Independent audit](diagnostics/P3_AUX_HARDY_G15_R2_RED_43753325231_AUDIT_2026_11_15.json) records all entry hashes, manifest, roots and causal excerpt.

169-pin preflight/helpers1+3+1 PASS. Cold source51:33 fails at the same Finset.sum_smul entry in simp_rw: `simp made no progress`. First four reports standard; failed sum-binding and dependent norm roots carry recovery sorryAx. Fresh strict source/native consumer not reached. No partial G15 acceptance.

## Two-red architecture review

| Attempt | Observation | Consequence |
| --- | --- | --- |
| R1 #43751403932 | Concrete tau unfolding; source48:31 scalar-sum rewrite fails, with an implicit-transparency matrix-entry diagnostic | A source substitution/type boundary was plausible; abstract-table comparison was permitted once |
| R2 #43753325231 | Neutral table removes that matrix diagnostic; source51:33 same scalar-sum rewrite still makes no progress | Concrete matrix transparency does not explain the remaining failure; isolate the finite calculation before further source changes |

Do not keep retrying the same multi-lemma simp_rw normalizer inside the full source build. Do not infer that a mathematically valid sum identity has been refuted. A passing isolated alternative will validate its exact proof/interface, not by itself identify every internal cause of the old tactic behavior.

Apply the established three-layer method: (1) Mathlib-only scalar and double-sum identities with explicit, ordered rewrites; (2) exact source Clifford and tau adapters; (3) full G15 norm consumer only after the missing interface has independently qualified. Earlier generic-helper gates demonstrated why the first layer must run before the expensive native build.

Main G15 source `3137f2fa64f3d1cbf08f06588c31303e06df4caa`, consumer `7e873eae9001339a0f746637b9ac906311ec106b`, workflow `898e8882e6d5512e98b016a1ad918a7247aff33c` are now FROZEN. No full G15 R3 before separately accepted D0 diagnostic and a separate prospective R3 contract. No compiler/time/recursion/heartbeat escalation or warning suppression.
