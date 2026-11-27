# MOL-L2J0 R1 native RED — R2 leaf evaluation repair

2026-11-26 Pacific. Run 45943392204, job 140322505689, exact tested SHA ca4af7a3cf9d1b9e5f7f2b9cb7f938581a331651. Frozen preflight and pinned Lean/Mathlib restoration passed; native source failed and independent consumer not reached. Original artifact 15173826507, 7026 bytes, independently downloaded and verified locally with Python hashlib and zipfile: SHA256 c0d760da58b49af9aca572daf358cc6af3c7d449b90c2c7cd3513de2954d61f8 matches provider; six ZIP members, testzip None. Exact tested SHA and blobs from original ZIP: source d39d8f53a377979afe208a2abaf7166f930b2c18, consumer 6bb5f7d42c830420c4aedc999289c242457ce31d, workflow 5150154bdcd3722be1c22dd15dc8b378bda34ea1. Retention-limited provider original https://github.com/etblink/math/actions/runs/45943392204/artifacts/15173826507.

Native first-causal diagnostics (including propagated axiom reports):

```text
error: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:46:45: Used `tac1 <;> tac2` where `(tac1; tac2)` would suffice
2026-11-27T05:09:26.5177770Z 
2026-11-27T05:09:26.5177957Z Note: This linter can be disabled with `set_option linter.unnecessarySeqFocus false`
2026-11-27T05:09:26.5178811Z error: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:54:49: (deterministic) timeout at `whnf`, maximum number of heartbeats (200000) has been reached
2026-11-27T05:09:26.5179341Z 
2026-11-27T05:09:26.5179461Z Note: Use `set_option maxHeartbeats <num>` to set the limit.
2026-11-27T05:09:26.5179653Z 
2026-11-27T05:09:26.5179890Z Hint: Additional diagnostic information may be available using the `set_option diagnostics true` command.
2026-11-27T05:09:26.5180669Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:84:0: 'FCP.BFSSMOLL2J0.kineticCore' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T05:09:26.5181688Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:85:0: 'FCP.BFSSMOLL2J0.potentialCore' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T05:09:26.5182806Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:86:0: 'FCP.BFSSMOLL2J0.charge_split' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T05:09:26.5183796Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:87:0: 'FCP.BFSSMOLL2J0.coreEval' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T05:09:26.5184801Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:88:0: 'FCP.BFSSMOLL2J0.kineticCore_apply' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T05:09:26.5185874Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:89:0: 'FCP.BFSSMOLL2J0.potentialCore_apply' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
2026-11-27T05:09:26.5186966Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:90:0: 'FCP.BFSSMOLL2J0.charge_apply_split' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
2026-11-27T05:09:26.5188000Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:91:0: 'FCP.BFSSMOLL2J0.corePotentialL2_eq' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
2026-11-27T05:09:26.5189109Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:92:0: 'FCP.BFSSMOLL2J0.chargeL2_split' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
2026-11-27T05:09:26.5189725Z Some required targets logged failures:
2026-11-27T05:09:26.5190080Z - OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2J0OriginalChargeDecomposition
2026-11-27T05:09:26.5190471Z error: build failed
2026-11-27T05:09:26.6279804Z
```

R2 repair: use ordinary tactic sequencing for the kinetic evaluation, exactly as suggested by the strict linter. For potentialCore_apply, first transport the finite sums through linear evaluation, then use six explicit Finset.sum_congr steps, with the final scalar/composition simplification and definitional equality restricted to an individual summand. Avoid asking whnf to compare two complete nested sums by definitional equality. This is proof-local; no definitions, theorem statements, independent consumer, pins, resource limits or axiom policy changed. Previously qualified source unchanged. No physical promotion. Local native Lean unavailable; R2 unqualified pending strict CI.
