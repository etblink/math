# IBI-G1B R2 — RED_UNQUALIFIED, first independent-consumer Fin-index error

Date: 2026-11-15 Pacific.
[Strict run #43699776873](https://github.com/etblink/math/actions/runs/43699776873)
at exact tested commit `3a4027822e3b444611c0e48f5d9dfba600b2c00b`, attempt 1,
job `132768153787`, **failure**. This record does not revise or erase R1.

## What passed

- Exact source/consumer pins and theorem contract preflight PASS; pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored.
- **Original G1B Lean source cold-build passed 9,019 jobs**. All seven named source #print-axioms reports contain only `propext`, `Classical.choice`, `Quot.sound`; neither source declaration failed nor used `sorryAx`.
- The explicit pinned-Mathlib `real_inner_smul_left` change from R1 therefore closed the original source proof boundary in this tested build.

## First causal RED and preserved evidence

- The independently compiled consumer failed at `diagnostics/BFSSIBIG1BOriginalSignedCrossIndependentConsumer.lean:24:7`, and analogously lines 24/32, because `(0 : ColorIndex 2)`, `(1 : ColorIndex 2)`, `(2 : ColorIndex 2)` trigger `OfNat (ColorIndex 2)` instance synthesis failures. Both concrete orientation examples then have unresolved epsilon-sign normalization goals. The two generic original-boson/gauge consumer examples were not themselves the first cause.
- Source definition `Core.lean` pins `ColorIndex N := Fin (N^2 - 1)`, so for N=2 the carrier is a three-element `Fin`; numerical notation here is not guaranteed to elaborate into the expected `Fin` constructor. This is a consumer typing issue, **not** a source-orientation counterexample.
- Uploaded artifact [#14156108418](https://github.com/etblink/math/actions/runs/43699776873/artifacts/14156108418); workflow logs report artifact ZIP SHA256 `ae285ca213b85f3eb0f6da6fe7b03f970a9b03c670b741ec0ff13374d75c4fa0`, not independently rehashed in this review.
- Source blob `b42291fe0aa5f8b22a31bad19b9de5c775372a71`; failed consumer blob `8ab857bdbc77e01ec0e5c4dd1138cc1698f12244`.

## Scientific disposition

R2 is **RED_UNQUALIFIED** despite a clean source build: no G1B promotion before independent consumer and final gate GREEN. The R1 source `simp` boundary and R2 consumer Fin-literal boundary are dissimilar errors; the two-analogous-failures stop rule is therefore not reached. The next proposed repair must be consumer-only, preserve the exact source blob and contract, update the strict workflow's consumer SHA atomically, and requalify. No integration, main, FCP, original pilot or octonion-source alteration.
