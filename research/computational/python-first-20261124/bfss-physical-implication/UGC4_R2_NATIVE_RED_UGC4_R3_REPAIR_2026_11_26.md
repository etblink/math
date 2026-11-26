# UGC4 R2 native RED — R3 dimension-generic repair

2026-11-26 Pacific. UGC4 R2 remains unqualified; UGC3 remains qualified.

- Exact R2 tested commit: `4f2f1a498a8644f923a0b5c72de507c2d2e8bb72`.
- Run https://github.com/etblink/math/actions/runs/45867033704 ; job 140072394487.
- Original artifact https://github.com/etblink/math/actions/runs/45867033704/artifacts/15141024788 ; 10062 bytes.
- GitHub metadata SHA-256 (not independently recomputed): `d72248d7a3b0888f8e0924f1b6c08b313246f50c42fbe1d78d097bb0dfd51fad`.
- Exact checkout, frozen-source preflight, pinned toolchain restoration and evidence upload passed. Native build failed at 9007/9007. Independent consumer did not run. Separate active-roadmap run 45867033771 passed.

First-causal diagnostics independently retrieved from job log:

```
51:4: (deterministic) timeout at `whnf`, maximum number of heartbeats (200000) has been reached
64:4: (deterministic) timeout at `whnf`, maximum number of heartbeats (200000) has been reached
55:0: (deterministic) timeout at `whnf`, maximum number of heartbeats (200000) has been reached
75:8: (kernel) unknown constant 'FCP.BFSSUGC4.graph_haar_restricted_mem'
```

R2 failed at the explicit pointwise conversion of the restricted product-map application and at conversion of restricted closedness into a set closure via a local range alias. The core Haar charge commutation theorem again had a clean classical axiom report. Failed declarations/axiom recovery placeholders are not accepted.

R3 changes the proof architecture, not the claims: dimension-generic private lemmas isolate the restricted range witness, inclusion into the actual D1 closure, and closedness of that closure. At N=2, prove the Haar-projected pair equality separately using the already checked charge-column and smooth input compatibility identities, then transport the generic range witness along that equality. The continuous preimage argument invokes the generic lemmas rather than comparing concrete expanded range/closure definitions. No additional axioms, resource limits, imports, changes to frozen source, independent consumer or workflow; all five source and two consumer audit roots retained. Candidate not locally compiled; strict CI must qualify it. No weighted-domain or spectral conclusion.

Earlier evidence: research/computational/python-first-20261124/bfss-physical-implication/UGC4_R1_NATIVE_RED_UGC4_R2_REPAIR_2026_11_26.md.
