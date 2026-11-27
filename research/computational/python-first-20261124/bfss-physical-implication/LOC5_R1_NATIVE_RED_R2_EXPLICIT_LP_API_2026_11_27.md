# LOC5 R1 native RED — R2 explicit original Lp API

2026-11-27 Pacific. [Run 46027329253](https://github.com/etblink/math/actions/runs/46027329253), job 140601985235, exact tested SHA a0ccf7ca53e1778495edf762ee014b4fd3dd5f27. Frozen original-source preflight and pinned toolchain passed; native source failed; independent consumer not reached.

Original [artifact 15213176597](https://github.com/etblink/math/actions/runs/46027329253/artifacts/15213176597), independently downloaded and verified locally with Python hashlib and zipfile: 8275 bytes, SHA256 2c817df47e17049fd229803e6844919907af42d3f7548f4b700697ecee5fd424, six members, testzip None. Tested SHA matches. Source blob 2c60bba0247f5bb7f8c59960b28fd72670c2f853; consumer feaaabc2c79bdb17b94c4d293e9564f979470827; workflow 243157a37a66ae4d35999ddef3a4928a0591b8c3. Provider retention limited.

First causal diagnostic at source line 33:32: Invalid field `stronglyMeasurable`: environment does not contain `Subtype.stronglyMeasurable` for u of type ↥(FullL2 N). Same failure for v, and `Subtype.memLp` for u,v at line 34 and u at line 35; unsolved goal from failed conversion. core_hilbert_pairing clean; hilbert_pairing_mem_closed_graph and dependent closed_graph_iff_hilbert_pairing report sorryAx. All remain unqualified as a gate.

R2 uses explicit MeasureTheory.Lp.stronglyMeasurable and Lp.memLp with typed local proofs, then Lp.toLp_coeFn with the same witnesses. Verified API at exact pinned Mathlib commit d13f23b723b8a846827a245b89c10fc7d3f11612, Mathlib/MeasureTheory/Function/LpSpace/Basic.lean. No theorem statement, consumer, workflow, frozen donor, or resource policy changes. Native Lean unavailable locally; R2 unqualified pending CI.
