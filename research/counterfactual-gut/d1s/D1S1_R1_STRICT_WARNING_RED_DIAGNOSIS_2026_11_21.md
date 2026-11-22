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


## R2 — second strict RED confirmed; native source strict PASS, consumer elaboration RED

[Run #44965032924](https://github.com/etblink/math/actions/runs/44965032924) completed **failure** at exact tested commit `295976741c98d5282983cfa519746d98f8c17678`, attempt 1, source/consumer job `137032009864`. Frozen source/hash/import preflight **PASS**; Lean `4.34.1` and pinned Mathlib restore **PASS**. Native source cold build **PASS** (`Build completed successfully (9074 jobs)`), strict source recompile with `-DwarningAsError=true` **PASS**.

Both SOURCE theorem roots independently appeared in strict source axiom log with only `[propext, Classical.choice, Quot.sound]`: `FCP.BFSSHopfD1S1.sourceTransportFrequency_apply` and the **substantive** `FCP.BFSSHopfD1S1.originalQuantizeFrequency_gauge`. No source `sorryAx`, no unsolved source goal.

**First-causal failure was in the independent consumer's second declaration at line 26:0**, NOT the source theorem:

```text
diagnostics/BFSSD1S1OriginalFrequencyGaugeIndependentConsumer.lean:26:0:
error: maximum recursion depth has been reached
use `set_option maxRecDepth <num>` to increase limit
use `set_option diagnostics true` to get diagnostic information
```

Consumer declaration `FCP.BFSSHopfD1S1Consumer.original_frequency_transport` reported `[propext, Classical.choice, Quot.sound]`; the second `original_frequency_gauge` reported `does not depend on any axioms` *after a failed elaboration*, which **is not a successful proof or axiom-free acceptance**. The strict source/consumer green sentinel was NOT printed, and the gate therefore remains **RED / UNQUALIFIED**.

Original source/consumer/workflow blobs at this R2 exact commit:

- SOURCE: `c2946bab3f82bf1ba57574a6a9d18258c185ef99`
- CONSUMER: `9f445edcc7c87ab996f491824255902b1e120ee6` (unchanged across both attempts)
- WORKFLOW: `53ce48adb07b85c39fb2f983fbba11cd87e6adc3` (unchanged across both attempts)

Unconditionally preserved original [R2 artifact #14731523640](https://github.com/etblink/math/actions/runs/44965032924/artifacts/14731523640), 11,684 bytes, GitHub-reported SHA-256 `9a2c49b912f8ccdbf01d1b8e5254bb389c0c3ff8581390254683734cbe49ee3c`. The R1 artifact #14731156132 and its strict unused-simp RED remain independently archived.

### Adjudication / enforced stop

D1S1 has **two strict RED attempts** on the same source + consumer gate: R1 source strict warning on an unused simp argument; R2 strict SOURCE PASS but independent CONSUMER RED during elaboration. These are two different procedural causes; neither establishes a mathematical counterexample. The original source SU(2) real-frequency quadratic covariance theorem is **native Lean compiled and strict-source-checked with permitted axioms**, but the **complete independent strict qualification is NOT accepted**.

**STOP: no automatic D1S1 R3, no new CI, no change to D1S1 Lean source/consumer/workflow in this interval.** Avoid `maxRecDepth`/`maxHeartbeats` escalation or relaxing warning-as-error/axiom checks.

### New consumer proof architecture — design only (not run)

The consumer's second declaration expands both exact original names `pairedGaugeData.fermion` and `pairedAlgebraData.quantizeFrequency` in its statement while the source proof uses private typed abbreviations `G` and `M`. The source theorem elaborates and compiles, but the consumer expansion incurs excessive definitional unification/reduction. This is a **plausible cause**, not independently proven because Lean reports only a recursion-limit error.

Candidate route for a **separate future qualified consumer microgate**: first name local strongly-typed abbreviations `M : AlgebraData 2 := pairedAlgebraData` and `G : M.GaugeData := pairedGaugeData`, matching the source theorem's signature; consume the exact `D1S1.originalQuantizeFrequency_gauge` proof through a syntactically aligned signature; then separately prove a small noncomputable source adapter/equivalence from those typed names to the *literal original* public names, to prevent a single large definitional equality check. Another route is a source-level named exact-public-interface wrapper with a deliberately small definitional bridge and an independent consumer of that wrapper. Select by local diagnostics/Lean preflight, not a blind CI retry. The independent consumer must ultimately state or explicitly connect to literal `pairedGaugeData.fermion`, `pairedAlgebraData.quantizeFrequency`, original `FrequencyMatrix 2`, and `Fermion 2` and pass allowed-axiom checks.

Keep the scalar finite-sum and source covariance mathematics unchanged unless diagnostics indicate otherwise. No Gaussian rank-one projector, original invariant SmoothCore test function, normalized BFSS Hamiltonian form bound, physical hopfion, or GUT conclusion has been established.