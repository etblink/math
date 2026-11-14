# TD-C1A D2R1 — original-Fock instrumentation control GREEN

**Date:** 2026-11-13 Pacific.
**Run:** [#43561741732](https://github.com/etblink/math/actions/runs/43561741732), completed success 2026-11-14 05:34:10 UTC.
**Exact tested SHA:** `52f15317425b7e2be5af5c43ce2edfd0da2b43f9`. **Job:** `132346756846`.
**Artifact:** ID `14100737285`, compressed 7,407 bytes, provider-reported sha256 `dbf49eb7b409b2ade8880f3fc1f904fe6825591bcf1fe16d71ef58bd276e2127` (artifact not independently rehashed here).

## Case-level evidence

| Case | Result | Scope |
| --- | --- | --- |
| Frozen-source/toolchain preflight | PASS | `BFSS_TD_C1A_D2R1_PREFLIGHT_PASS` |
| Bounded expression inspector | PASS (rc 0) | New diagnostic-only Lean metaprogram compiled |
| Original BFSS Core build | PASS (rc 0) | Original source `Fermion 2` |
| Variable original-Fock theorem | PASS (rc 0) | Root `FCP.BFSSTDC1AD2R1.variable_control`, standard axioms audited |
| Original gauge-axis source | NOT ATTEMPTED | Out of D2R1 scope |
| Native axis/operator joins | NOT ATTEMPTED | Out of D2R1 scope |

Axiom audit: `[propext, Classical.choice, Quot.sound]`. The control ends with accepted `exact hw`, not `sorry/admit/unsafe`; the only suppressed diagnostic linter is `linter.unusedTactic` for an intentional no-op observation tactic. All other warning-as-error checks remain.

**Exact bounded report:**
```text
TD_C1A_D2R1_EXPR_REPORT witness=hw raw_equal=false raw_alpha=false outer_metadata_equal=false outer_metadata_alpha=false witness_mvars=false goal_mvars=false first_difference=root.arg[1].arg[5].arg[0].arg[6].fn: constructor_or_data_difference
```

**Critical interpretive rule:** A checked, accepted original-Fock theorem can have raw and outer-metadata-stripped type syntax differing at a deep application path. Therefore `Expr.equal=false` and `Expr.eqv=false` *alone* are insufficient evidence for a physical operator obstruction, failed mathematical covariance, instance diamond, or Lean compiler defect. Native failures must be assessed in a controlled **successful versus unsuccessful** comparison, naming the differing application head and arguments. The original D2 #43560114891 remains INCONCLUSIVE (not retroactively fixed by R1); the positive-control microgate D2R1 is qualified only in its instrumentation scope.

**Administrative consistency:** [#43561741673](https://github.com/etblink/math/actions/runs/43561741673) completed success on the same tested SHA, for the roadmap, independent of the mathematical proof.

**Next preregistered gate:** [D2R2 differential-expression audit](research/top-down-symmetry/TD_C1A_D2R2_DIFFERENTIAL_EXPRESSION_AUDIT_PREREGISTRATION_2026_11_13.md). Retain TD-C1A `RED_UNQUALIFIED`, full original theorem/consumer frozen, and M5BF0/G0B2 accepted.
