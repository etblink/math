# TD-C1A D2R2 — GREEN differential collection; both native joins unqualified

**Date:** 2026-11-13 Pacific. **Run:** [#43562804737](https://github.com/etblink/math/actions/runs/43562804737), completed 2026-11-14 05:56:08Z, conclusion SUCCESS. **Tested SHA:** `8de590a9eb5fa7d7d244a68017f3d98b388e1e20`. **Job ID:** 132350007126. **Artifact:** ID 14101940448, 26,233 bytes ZIP, provider-reported digest `sha256:682058318f4e9006eba1aae64e8de41940a24200878a347a864fbf9953a6e1e0` (not independently downloaded or rehashed in this review). **Strict original TD-C1A:** `RED_UNQUALIFIED`.

## Actual case-level outcome (reviewed job log)

| Case | Outcome | Exact meaning |
| --- | --- | --- |
| Frozen 18-blob source preflight | PASS | Original source/toolchain pinned |
| D2R2 bounded Lean inspector | PASS | Instrument compiled |
| Original BFSS Core | PASS | Genuine source `Fermion 2` |
| Variable original-Fock control | PASS | Actual proof `exact hw` with allowed axioms |
| Original C48 axis dependency build | PASS | Source built; 8-minute stage |
| Literal direct original-axis control | PASS | Actual proof `exact hw` with allowed axioms |
| Native axis observation | OBSERVED_STOP_UNQUALIFIED | Report emitted; deliberate error at line 36 |
| Native conditional evaluation observation | OBSERVED_STOP_UNQUALIFIED | Report emitted; deliberate error at line 34 |

The positive control axiom inventories were exactly `[propext, Classical.choice, Quot.sound]`. All four bounded observations have `witness_mvars=false` and `goal_mvars=false`. The native cases were intentionally stopped with `TD_C1A_D2R2_EXPECTED_STOP_OBSERVATION_ONLY`; no theorem, proof or kernel-correctness assertion was established by the nonzero diagnostic return codes. The collection checks rejected unexpected errors and `sorryAx`.

**Variable source-positive:**
```text
witness=hw raw_equal=false raw_alpha=false outer_metadata_equal=false outer_metadata_alpha=false witness_mvars=false goal_mvars=false
first_difference=root.arg[1].arg[5].arg[0].arg[6].fn:
lhs=const:PiLp.topologicalSpace:universes=2
rhs=const:UniformSpace.toTopologicalSpace:universes=1
```
The source-Fock `exact hw` proof nevertheless passes, so expression-tree inequality alone does **not** imply definitional incompatibility.

**Literal original-axis positive:**
```text
witness=hw raw_equal=false raw_alpha=false outer_metadata_equal=true outer_metadata_alpha=true witness_mvars=false goal_mvars=false first_difference=root:SAME_AFTER_METADATA
```

**Native operator-to-axis observation:**
```text
witness=hsource raw_equal=false raw_alpha=false outer_metadata_equal=false outer_metadata_alpha=false witness_mvars=false goal_mvars=false
first_difference=root.arg[1].arg[5].arg[0]:
lhs=const:_private.OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSSource48RealLinearGammaProbe.0.FCP.BFSSSource48RealLinearGamma.Op:universes=0
rhs=app-of:ContinuousLinearMap:universes=4
```

**Native conditional operator-evaluation observation:**
```text
witness=heval raw_equal=false raw_alpha=false outer_metadata_equal=false outer_metadata_alpha=false witness_mvars=false goal_mvars=false
first_difference=root.arg[1].arg[5].arg[0]:
lhs=app-of:ContinuousLinearMap:universes=4
rhs=const:_private.OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSSource48RealLinearGammaProbe.0.FCP.BFSSSource48RealLinearGamma.Op:universes=0
```

## Scientific interpretation

D2R2 succeeded **as a calibrated structural-observation experiment**, not a covariance theorem. The native cases have a distinct and reciprocal source-wrapper-versus-CLM application fingerprint, different from the known-success variable control. That is a bounded candidate interface mismatch; the test neither proves that this is the causal source of historical Lean recursion nor demonstrates a failure of mathematical BFSS gauge covariance. An exact `Expr.equal=false` has no bearing on definitional equality absent an independently controlled checker.

**Next TD-C1A decision:** preserve original source definitions unchanged, no repeat strict full-48 retry. A separately preregistered very small wrapper/CLM *typed interface* control should exercise both source-side representations without invoking the native all-vector theorem, and only return to the native theorem if that control has an independently accepted proof. Diagnostic cost is subordinate to the auxiliary physical-operator program.

**Separate administrative scope:** successful workflow proves only that collector completed; original strict TD-C1A remains RED. Previous R1–R4 failures, D0/D1 control results and D2 inconclusive collection remain preserved unchanged.
