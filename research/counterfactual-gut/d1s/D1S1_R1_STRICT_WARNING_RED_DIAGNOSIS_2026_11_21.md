# D1S1 R1 strict RED — native source proof compiled, strict unused-simp warning

**Date:** 2026-11-21 (Los Angeles local time; CI finished 2026-11-22 UTC). **Disposition:** R1 strict **RED**; R2 one-line native-warning repair **LAUNCHED, NOT QUALIFIED**.

## Exact identity, frozen pins, evidence

- [Original strict run #44963966993](https://github.com/etblink/math/actions/runs/44963966993), native job `137028701300`, GitHub conclusion `failure`, tested **exact commit** `b25ce884e01afd12106863934c58c18f53ff7331`, first attempt, original-source preflight PASS; Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restore PASS.
- Source `D1S1OriginalFrequencyGaugeTransportProbe.lean` Git blob `268b873d6cfef9d4f34d7a8fa4f5b45da10d7c5f`; independent source consumer blob `9f445edcc7c87ab996f491824255902b1e120ee6`; dedicated strict workflow blob `53ce48adb07b85c39fb2f983fbba11cd87e6adc3`.
- Native cold build **COMPLETED SUCCESSFULLY** (`Build completed successfully (9074 jobs)`), including the complete actual source gauge covariance theorem.
- Original source `#print axioms FCP.BFSSHopfD1S1.sourceTransportFrequency_apply` and `#print axioms FCP.BFSSHopfD1S1.originalQuantizeFrequency_gauge` both emitted **only** `propext`, `Classical.choice`, and `Quot.sound`; **no `sorryAx`**.
- Strict `warningAsError=true` recompilation **RED** on an unused simplifier in the private helper `sourceQuantize_apply`; independent consumer **NOT RUN**; therefore this source+consumer gate is **NOT STRICT GREEN**.
- [Original CI artifact #14731156132](https://github.com/etblink/math/actions/runs/44963966993/artifacts/14731156132): GitHub-reported SHA256 `4fe81c0a5a3c25cc595035ff12873f3b77f92ce1ab0c6c2868614a69c7ba59ed`, 11,205 bytes. Do not rewrite artifact or history.

## First-causal compiler diagnostic

```text
OAI/MathematicalPhysics/BFSS/Contrib/Kotler/D1S1OriginalFrequencyGaugeTransportProbe.lean:125:4:
error: This simp argument is unused:
  IsSMulApply.smul_apply
Hint: Omit it from the simp argument list.
```

Source at R1:

```lean
private theorem sourceQuantize_apply
    (K : FrequencyMatrix 2) (v : Fermion 2) :
    (M.quantizeFrequency K) v =
      (Complex.I / 2) • sourceRawQuadratic K v := by
  simp [AlgebraData.quantizeFrequency, sourceRawQuadratic,
    Fintype.sum_prod_type, _root_.sum_apply,
    IsSMulApply.smul_apply, mul_apply_eq_comp]
```

**Classification:** strict linter/unused simp argument, not incorrect CAR, sign, finite-sum theorem or failed theorem elaboration. The native theorem compiled with allowed axioms, but independent qualification is still missing.

## R2 — exact controlled one-line repair

The unique `IsSMulApply.smul_apply,` argument was removed from this private lemma's simp list. No other tokens were modified in the Lean source. Source blob `268b873d6cfef9d4f34d7a8fa4f5b45da10d7c5f` → `c2946bab3f82bf1ba57574a6a9d18258c185ef99`; repair commit **`295976741c98d5282983cfa519746d98f8c17678`**. Independent consumer, strict workflow, original D1S0 source and all original BFSS sources are unchanged.

[R2 run #44965032924](https://github.com/etblink/math/actions/runs/44965032924) launched on this precise corrected commit. The first native source/axiom result cannot be promoted until the warning-as-error source recompile, consumer recompile, source/consumer exact axiom parser, and unconditional artifact all pass. This is a second strict attempt; if RED, preserve first-causal logs and reassess before a third.

## Scientific boundary

The proposed theorem is only source-exact SU(2) covariance of the `quantizeFrequency` quadratic operator with real 48-index coefficients. Even strict GREEN would not establish a rank-one CAR projector, a global Kato section in source Lean, original `SmoothCore 2` gauge-invariant normalizable trial, physical Hamiltonian bound, hopfion, or GUT. D1S0 GREEN and D1R0 RED/FROZEN remain unchanged.
