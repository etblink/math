# K1D18V10H–F10Q: source-exact determinant-one candidate (Project Lead succession)

**Date:** 2026-11-01. **Branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`.
**Parent:** `bceb1c6f35a2cea0f45ba41fe6b731119c8cdabd`.
**Disposition:** CANDIDATE / UNQUALIFIED until the dedicated full strict GitHub Actions gate passes.

## Qualified starting point

- F7: `gammaDetDirectHom_eq_one_or_neg_one` and `source9OrientationSubgroup_eq_top_iff_all_positive`, qualified on the genuine source `spinGroup source9Quadratic`.
- F5: `gammaDetDirectHom_eq_originalPaired48_det` for the exact original paired-Fock label order.
- F10P: `gammaDetDirectHom_pos_of_source_spinGroup` and source Lipschitz positivity, qualified [strict run #41285549468](https://github.com/etblink/math/actions/runs/41285549468), exact commit `bceb1c6f35a2cea0f45ba41fe6b731119c8cdabd`. This predecessor audited both exact types and allowed only `propext`, `Classical.choice`, `Quot.sound`.

## New candidate and intended logical dependence

1. `gammaDetDirectHom_eq_one g`: two-sign disjunction from F7 plus strict positivity from F10P rules out -1. No topology or group perfectness premise.
2. `source9OrientationSubgroup_eq_top`: instantiate F7's already qualified exact equivalence.
3. `source9SpinOriginalPaired48_det_one g`: specialize F5's accepted determinant bridge to the original G1A 48-label orthogonal representation; preserves `pairedColorSpinEquiv`, not a color-major surrogate.

The exact F10Q new module and dedicated workflow are added together. Workflow retains the pinned source/toolchain, fresh `-DwarningAsError=true` proof compilation, three separately elaborated exact proposition checks, three root `#print axioms` whitelist checks and `if: always()` logs. It pins all F9/F10E–F10P named source ancestors plus the new candidate. Green CI status by itself is not mathematical qualification until the tested SHA, logs and declaration audits have been inspected.

## Negative knowledge carried forward

The original F10 3-red private table path and F10D invalid legacy `import all` remain rejected and unchanged. F10N's two linter reds remain red despite its accepted third gate. Do not raise limits, weaken the theorem, introduce `sorry`, `admit`, `native_decide` or axioms, relax warning-as-error or alter the original signed-permutation gamma/Fock indexing. If F10Q is red, inspect the first causal compiler/audit error and make a single minimal correction, preserving this candidate and its evidence.

## Still independent, even on successful F10Q

The theorem would prove a source-exact *algebraic* original paired SO(48) determinant-one fact; it would not construct the original Spin(48) lift or a topological covering, identify the global Fock action or central -1 action, prove SU(2) gauge invariance or establish the BFSS physical spectrum. The FCP scientific ledger remains independent; no framework winner is inferred.

**Publication boundary:** work confined to the owner research branch; no `main` merge, no external upstream PR.
