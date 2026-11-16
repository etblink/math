# BFSS M4-LB0 R2 RED — explicit zero-scalar-action normalization missing

**Date:** 2026-11-15 Pacific / GitHub CI 2026-11-16 UTC.  
**Canonical branch:** `integration/bfss-unified-research-20261108`, with every red and repair preserved in Git history; `main` untouched.  
**Status:** **R2 RED / UNQUALIFIED**; not a counterexample to original CAR or a physical Fock-vector theorem.

## Exact immutable evidence
- [Strict LB0 R2 #43810371539](https://github.com/etblink/math/actions/runs/43810371539), `completed/failure`, exact tested commit `df5cc2f31135b5e0108716497c1b38d25bb0b80b`, attempt 1, job `133110500058`.
- Preflight and pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration passed. Actual original LB0 native cold source build failed, before the separate independent consumer was reached.
- **First causal Lean diagnostic at line 97, col 4**: `Type mismatch: After simplification, term sourceNormalizedGamma_pairwise_CAR p q has type c_p*c_q+c_q*c_p = 0 • 1 but is expected to have type c_p*c_q+c_q*c_p = 0`. The R2 tactic `simpa [hpq] using (sourceNormalizedGamma_pairwise_CAR p q)` did not discharge the operator zero-scalar-action equality.
- **Both source commutator declarations** `originalMajorana_bivector_commutator_CAR` and `originalMajorana_bivector_commutator` compiled and printed only the allowed `propext`, `Classical.choice`, `Quot.sound`; third `originalMajorana_bivector_skewAdjoint` reported `sorryAx` because its proof was incomplete. No independent original-Fock consumer compiled; 3+3 strict gate RED.
- [Evidence artifact #14200487209](https://github.com/etblink/math/actions/runs/43810371539/artifacts/14200487209), size 2877 bytes, GitHub-reported ZIP SHA-256 `0ef0ff0c7e842079b8a1663fb9f86b06dbd5b60865b38e2d495009d4a7bed06f`. GitHub-provided digest, not independently recomputed in local container.
- Exact R2 source blob `b78e1364fe028cdaff94c0dbb9f590216f8879b1`, independent consumer blob `7875dfc64ca1a6c56f02306bf7c35c4b11dd996d`, strict workflow blob `d6514d5aad546676a9d937ac9722b2787fea7090`.
- Earlier [R1 RED #43809206569](https://github.com/etblink/math/actions/runs/43809206569) was a different error, a commutative ring tactic on noncommutative Fock operators. [R1 diagnosis](BFSS_M4_LB0_R1_RED_43809206569_NONCOMMUTATIVE_RING_TACTIC_2026_11_15.md). R2's additive `abel` replacement was *not* the cause of the R2 error; only the CAR-to-zero proof failed.

## Narrow R3 repair contract
Rewrite **only** the third theorem's `hcar` local derivation to exhibit the scalar-action zero explicitly:
```lean
  have hcar :
      sourceNormalizedGamma p * sourceNormalizedGamma q +
        sourceNormalizedGamma q * sourceNormalizedGamma p = (0 : Op) := by
    calc
      sourceNormalizedGamma p * sourceNormalizedGamma q +
        sourceNormalizedGamma q * sourceNormalizedGamma p =
          (0 : ℂ) • (1 : Op) := by
            simpa [hpq] using
              (sourceNormalizedGamma_pairwise_CAR p q)
      _ = (0 : Op) := zero_smul ℂ (1 : Op)
```
This is a proposed proof body; it must pass compiler/strict warning-as-error and restricted-axiom tests before acceptance. Keep all statements, two earlier source proofs, full skew proof's additive `abel` rearrangement, and original independent consumer byte-identical. Do not replace noncommutative Fock operators by a commutative proxy or change the original sqrt(2) normalization/48-label order. Update only the exact LB0 source Git blob preflight in workflow, then rerun cold LB0 source and 3 native independent consumers, auditing all 6 standard-only `#print axioms`.

**Decision boundary:** the finite bivector skew-adjointness and triple CAR theorem remain unqualified as a combined package until all native source and consumer reports are green. Even once qualified, the full real-skew K(A), Lie bracket, global Spin9 Fock-vector action, physical common charge domain and BFSS spectrum remain open.

## R3 exact repair launch — not qualified

- Source proof-only commit `5c842de9c1d9b8246ecfdee78344c77b68cf3c6c`, source Git blob `d08200fae8ef6c9c9544414307ad537f1eeaa4a4`. Third proof's local CAR normalization is now split into two **typed** equalities: `c_p c_q + c_q c_p = (0:ℂ) • (1:Op)` via existing pairwise CAR and `p ≠ q`, and `(0:ℂ) • (1:Op) = (0:Op)` using `zero_smul ℂ (1:Op)`. The previous `abel` additive conclusion is unchanged.
- Exact strict source-pin workflow update `a0279b211a81922b17bff24c735bc1c4569f80f0`. [R3 run #43811766549](https://github.com/etblink/math/actions/runs/43811766549) is the intended full cold-build and 3+3 independent original-Fock consumer test; the intermediate source-only push run [#43811749230](https://github.com/etblink/math/actions/runs/43811749230) may be cancelled by same-workflow concurrency. Cancellation is not proof failure.
- No theorem statement, independent consumer, initial two already clean proof bodies, source normalization or source index changed. The R3 result must be checked for native compiler errors, warning-as-error, all six standard-only axiom reports, and persisted artifact before acceptance.
