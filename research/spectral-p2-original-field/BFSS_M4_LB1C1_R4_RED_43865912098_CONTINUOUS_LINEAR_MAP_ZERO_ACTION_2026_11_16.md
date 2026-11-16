# BFSS M4-LB1C1 R4 RED — ContinuousLinearMap complex smul_zero instance mismatch

**Date:** 2026-11-16 Pacific. **Only branch:** `integration/bfss-unified-research-20261108`. **Status:** R4 strict RED; source K-gamma covariance UNQUALIFIED.

## Immutable R4 test evidence

- [Strict run #43865912098](https://github.com/etblink/math/actions/runs/43865912098), exact tested source/workflow commit **`d027322fa644b1ad10cadbd5639ef239e2c6377e`**; candidate source Git blob **`2e534187ab97d205c633ecbccd55cd343aeb44c3`**. Exact source, immutable donor, consumer and toolchain preflight PASS; frozen Lean 4.34.1 and Mathlib cache PASS. Cold native LB1C1 source FAIL; independent consumer not reached.
- [R4 original failure artifact #14226296480](https://github.com/etblink/math/actions/runs/43865912098/artifacts/14226296480), 3176 bytes, GitHub-reported ZIP digest `sha256:c2dd251d22847576bfce188c70f3521f68f1faf1509ac0ec032bd0f1efe4c31d` (not independently rehashed). Three source axiom reports included `sorryAx` after compilation failure; gate RED.
- [Roadmap-consistency #43865912023](https://github.com/etblink/math/actions/runs/43865912023) passed but does not qualify source proof.

## First-causal diagnostic and architecture decision

At LB1C1 **line 68:19**, the explicitly typed `smul_zero` assertion fails because Lean selects a polymorphic `SMulZeroClass.toSMul` instance for `ℂ` and an unresolved carrier, while the actual original Fock operator target uses `ContinuousLinearMap.instSMul`:
```text
smul_zero ↑a has type:
  @HSMul.hSMul ℂ ?m ?m (@instHSMul ℂ ?m SMulZeroClass.toSMul) (↑a) 0 = 0
expected:
  @HSMul.hSMul ℂ Op Op (@instHSMul ℂ Op ContinuousLinearMap.instSMul) (↑a) 0 = 0
```
This is a genuine proof-interface mismatch: adding `Op` as an explicit argument, removing it, and annotating the overall theorem still did not make the overloaded scalar action elaborate correctly. The **R4 complex `sub_smul` repair passed** (no line-172 diagnostic), so preserve it unchanged.

**R5 architectural switch:** after the accepted real→complex Fock scalar bridge, prove the zero-operator scalar action **extensionally** as an equality of actual original `Fermion 2 →L[ℂ] Fermion 2` continuous linear maps, using `ext v <;> simp` instead of the mismatched polymorphic `smul_zero`. This tests the *true target instance* pointwise without changing the original source or inserting an instance. It is a candidate and requires an independent cold native run.

Only that helper proof body changes; three public theorem statements, `K(A)=¼∑A[p,q]Γ_pΓ_q`, source gamma normalization/order, qualified LB0/LB1S/LB1C0, consumer source, strict resource caps and standard-only axiom tests are unchanged. **If R5 RED, apply the stop rule and isolate a minimal typed continuous-linear-map scalar adapter before any further full gate.** The Lie bracket, global group action, gauge/supercharge domains and spectral program remain open.
