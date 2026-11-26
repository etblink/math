# UGC4 R1 native RED — R2 bounded repair

2026-11-26 Pacific. UGC4 R1 is unqualified. UGC3 remains the preceding qualified gate.

- R1 tested commit: `439be129e7f6d3b04b29c63bfec51ffb2826527c`.
- Run: https://github.com/etblink/math/actions/runs/45864555070 ; job: 140063921101.
- Original preserved artifact: https://github.com/etblink/math/actions/runs/45864555070/artifacts/15140687549 ; 9804 bytes.
- SHA-256 digest reported by GitHub artifact metadata (not independently recomputed from ZIP): `cf58218bc2f028ea2171ce682dd8230013c662f5280a084d292e469d21a2281b`.
- Checkout, frozen preflight, pinned Lean/Mathlib restoration and evidence upload passed. Native build failed at job 9007/9007; independent consumer did not execute.

First-causal native diagnostics, independently read from job log:

```
50:10: (deterministic) timeout at `whnf`, maximum number of heartbeats (200000) has been reached
65:45: (deterministic) timeout at `whnf`, maximum number of heartbeats (200000) has been reached
52:0: (deterministic) timeout at `whnf`, maximum number of heartbeats (200000) has been reached
68:8: (kernel) unknown constant 'FCP.BFSSUGC4.graph_haar_restricted_mem'
```

The clean R1 axiom report for `core_haar_charge_commutes` is retained as evidence, not standalone gate qualification. The failed `graph_haar_core_mem` report contains sorryAx and is rejected.

R2 reuses the exact UGC2 componentwise equality and closed-preimage/subset_closure patterns. For the second product component it introduces the spin index explicitly and applies the already-proved charge equality pointwise. For the restricted closure it introduces a typed range submodule R and uses an explicit set inclusion into its closure, avoiding expensive implicit submodule closure elaboration. The five theorem statements, independent consumer, frozen imports/dependencies, workflow, allowed axioms and resource bounds are unchanged. No claim of local compilation. R2 is CANDIDATE_UNQUALIFIED until strict CI and original evidence checks pass. No weighted-domain, spectral or physical existence conclusion.
