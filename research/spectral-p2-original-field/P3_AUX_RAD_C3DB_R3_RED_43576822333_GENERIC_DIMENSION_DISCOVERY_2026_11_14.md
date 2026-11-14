# P3-AUX-RAD-C3D-B R3 — First-causal RED, generic-N route discovered

**Date:** 2026-11-14 Pacific. **Status:** RED_UNQUALIFIED, not an original BFSS counterexample.

- [Strict run #43576822333](https://github.com/etblink/math/actions/runs/43576822333), attempt 1, tested SHA `9b290d4997f3d2b662f5ac4423f8caac387eaf58`, job `132392756965`, completed **failure** on cold native source.
- Exact source blob `97bd29e6b90254575dafed8dc861eb89ae91d5ff`, frozen preflight and pinned Lean 4.34.1/Mathlib restore PASS. First/only source error at line **58:12**, deterministic `whnf` timeout at 200000 heartbeats in the now-isolated `originalSourceInvariantCoreGraph_mem` private helper on exact source original `AlgebraData 2`:
```lean
private theorem originalSourceInvariantCoreGraph_mem
    (M : AlgebraData 2) (G : M.GaugeData) (f : G.invariantCore) :
    (coreToL2 f.val, M.chargeVector f.val) ∈
      originalMinimalCoreGraph M G := by
  exact ⟨f, rfl⟩
```
- The two actual sixteen-charge output and reciprocal roots printed only standard allowed axioms `[propext, Classical.choice, Quot.sound]`. The weighted physical graph and domain roots printed `sorryAx`, thus **NOT qualified**; independent paired SU2 consumer not reached.
- [Evidence artifact #14107641141](https://github.com/etblink/math/actions/runs/43576822333/artifacts/14107641141), 9,925 bytes, published digest `sha256:cbb3386aa8dc9b29d085cc7edc50bb2d2e2be4f4857f1a906064f7bdee34c70b`. Metadata and job log reviewed; artifact ZIP not independently downloaded/rehashed.
- [Roadmap consistency #43576822294](https://github.com/etblink/math/actions/runs/43576822294) passed at same SHA; this is **administrative only**.

## R4 new differential, not a repeat of inline hcore

The original source H5E8AZ file blob `b69166ba7b1118e3542ba826e73aa4f95f575c3c` successfully compiles the same `⟨f,rfl⟩` shape at a **polymorphic** `{N:ℕ} (M:AlgebraData N)`, and only afterwards specializes to original SU2 rank 2. R1-R3 fixed N=2 while elaborating `originalMinimalCoreGraph M G`, likely encouraging excessive definitional reduction of original heavy algebra. This is an engineering hypothesis, not a proven cause. Test ONLY changing the helper to generic N, preserving its exact original source meaning and ALL four public N=2 roots. No new axiom, longer heartbeat, changed charge/vector/physical space or new external model. If R4 fails, stop repeating elaboration tweaks and investigate source-certified graph pair interfaces or the exact reducibility path.
