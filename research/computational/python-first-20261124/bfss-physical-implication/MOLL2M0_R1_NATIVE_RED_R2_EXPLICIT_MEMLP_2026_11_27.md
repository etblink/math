# MOL-L2M0 R1 native RED — R2 explicit MemLp proof arguments

2026-11-27 Pacific. Run 45948713785, job 140339301239, exact tested SHA 9de4639a632792f2fd50b80d426e5778e069269a. Frozen preflight and pinned toolchain passed; native source failed and independent consumer not reached. Original artifact 15175514465, 7525 bytes, independently downloaded and verified with Python hashlib and zipfile: SHA256 7e738b8626a16d62d4e69c8232222286096749d1bea914583c09ac7d40140d26 matches provider; six ZIP members testzip None. Tested source/consumer/workflow blobs verified at exact candidate: 4195b93bc64707d0577e30fb92754cee5a7085c6, 26a1373b7cc6013311b84ba4b007a6d92443dde8, 00b58c142fda4ef89c4f5b6293eefac4b7ad28a1. Provider original https://github.com/etblink/math/actions/runs/45948713785/artifacts/15175514465 (retention-limited).

```text
error: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2M0OriginalCompactFullGraph.lean:25:54: unsolved goals
2026-11-27T06:02:52.7753791Z case hg
2026-11-27T06:02:52.7754141Z N : ℕ
2026-11-27T06:02:52.7754431Z M : AlgebraData N
2026-11-27T06:02:52.7754748Z a : SpinIndex
2026-11-27T06:02:52.7755053Z u v : Boson N → Fermion N
2026-11-27T06:02:52.7755513Z hsmu : StronglyMeasurable u
2026-11-27T06:02:52.7755817Z h2u : MemLp u 2 volume
2026-11-27T06:02:52.7756116Z h2v : MemLp v 2 volume
2026-11-27T06:02:52.7756415Z R : ℝ
2026-11-27T06:02:52.7756761Z hR : tsupport u ⊆ Metric.closedBall 0 R
2026-11-27T06:02:52.7757123Z hw : MemLp (v - potentialField M a u) 2 volume
2026-11-27T06:02:52.7757518Z hV : MemLp (potentialField M a u) 2 volume
2026-11-27T06:02:52.7757895Z ⊢ MemLp (potentialField M a u) 2 volume
2026-11-27T06:02:52.7758807Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2M0OriginalCompactFullGraph.lean:82:0: 'FCP.BFSSMOLL2M0.kinetic_potential_target_cancel' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
2026-11-27T06:02:52.7760224Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2M0OriginalCompactFullGraph.lean:83:0: 'FCP.BFSSMOLL2M0.concrete_fullWeak_charge_tendsto' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
2026-11-27T06:02:52.7761819Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2M0OriginalCompactFullGraph.lean:84:0: 'FCP.BFSSMOLL2M0.concrete_fullWeak_graph_tendsto' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
2026-11-27T06:02:52.7763162Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2M0OriginalCompactFullGraph.lean:85:0: 'FCP.BFSSMOLL2M0.compact_fullWeak_mem_closed_graph' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
2026-11-27T06:02:52.7764009Z Some required targets logged failures:
2026-11-27T06:02:52.7764499Z - OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2M0OriginalCompactFullGraph
2026-11-27T06:02:52.7765023Z error: build failed
2026-11-27T06:02:52.8351214Z
```

R2 repair: instantiate MemLp.toLp_sub with h2v and hV explicitly, matching the qualified MOL-L2H0 use and the pinned theorem's signature. The previously unresolved hg is exactly hV, already established by potentialField_memLp. No definition, statement, dependency, independent consumer, resource limit or verification policy change. All four R1 source reports unqualified; dependent sorryAx reports are not independent failures. No promotion of compact graph membership or physical claims. Local native Lean unavailable; R2 pending strict CI.
