# TD-C1A D2 — GREEN collection, first positive control RED

**Date:** 2026-11-13 Pacific. **Run:** [#43560114891](https://github.com/etblink/math/actions/runs/43560114891), workflow *BFSS TD-C1A D2 typed expression structural observation*, conclusion **success**, 2026-11-14 05:16:03 UTC.
**Exact tested SHA:** `4afb0db8f9d2797fe69d8e6adf6b3020ac67a1d6`.
**Job:** `132341688078`. **Artifact ID:** `14099924518` (10,177 compressed bytes), provider-reported sha256 `c7bb149f08a388148bb33f5f2a00c100db945e597d17e3785003cc96be9f22be`; ZIP has not been independently downloaded/rehashed in this checkpoint.
**Classification:** `D2_INCONCLUSIVE_INSTRUMENTATION_OR_PREREQUISITE`. **Mathematical qualification:** false; original TD-C1A remains `RED_UNQUALIFIED`.

## Exact case outcome, from completed collection log

| Case | Status | Evidence |
| --- | --- | --- |
| Pinned-source preflight | PASS | `BFSS_TD_C1A_D2_PREFLIGHT_PASS` |
| Bounded inspector Lean build | PASS | rc 0, standard dependency warning exceptions |
| Original BFSS Core | PASS | rc 0, 8,924 jobs built |
| Variable original-Fock control | **FAIL** | rc 1; observer printed a report, then `Unused tactic linter` error at `diagnostics/BFSSTDC1AD2VariableControl.lean:21:2` |
| Original axis build and direct axis control | SKIPPED | gated on failed first positive control |
| Both native expression observations | SKIPPED | no comparison data; no conclusions about native recursion |

**Actual diagnostic report from failed control:**
```text
TD_C1A_D2_EXPR_REPORT witness=hw raw_equal=false alpha_equiv=false witness_mvars=true goal_mvars=false first_difference=root: mvar vs metadata witness_node=mvar goal_node=metadata
diagnostics/BFSSTDC1AD2VariableControl.lean:21:2: error: Unused tactic linter: `td_c1a_d2_compare hw` does nothing
```

This report **cannot classify the native boundary**: `have hw := h ψ` provided an unresolved witness type during inspection, and the goal retained an outer metadata wrapper. The linter rejects an intentionally no-op observation tactic under `-DwarningAsError=true`, even though the variable proof's axiom report mentioned only standard axioms. Avoid declaring a theorem qualified from a failing source.

## Controlled next step

Preregister the narrower D2R1 instrumentation-only microgate before altering the frozen D2 source or running any expensive original-axis build. Explicitly annotate the local witness type; instantiate metavariables in the read-only inspector; report raw and metadata-stripped comparisons separately; ensure no unresolved metavariables; disable **only** `linter.unusedTactic` in observation-only diagnostic source where necessary (the Lean error itself names this option); keep all other warning/axiom audits. D2R1 must pass a source-control proof/axiom audit on the actual `Fermion 2` variable-data carrier before any D2 native investigation is reconsidered. Do not rerun D2 unmodified, attempt the all-vector theorem, loosen recursion limits or redefine the physical carrier.

**Separate administrative checkpoint:** roadmap consistency run [#43560838888](https://github.com/etblink/math/actions/runs/43560838888) concluded success at `d33feb2a30f9d0fe69a2694e8135c5b767d3403c` after the D2 registry-schema repair. This checks metadata, not mathematics.
