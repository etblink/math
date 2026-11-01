# K1D18V10H–F10Q acceptance and F10R original paired SO(48) research gate

**Date:** 2026-11-01. **Target research branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## F10Q: ACCEPTED after independent exact audit

[Run #41286707897](https://github.com/etblink/math/actions/runs/41286707897), committed SHA `c492bdeed885bcae4ea849563c83e2404b0f2456`, passed every job step including pinned original gamma ancestry, frozen Lean v4.34.1 and Mathlib d13f23b7, fresh `-DwarningAsError=true` Lean compilation, three independently elaborated exact theorem types, and each exact declaration axiom whitelist. The independent audit printed `V10H_F10Q_THREE_EXACT_TYPES_AXIOMS_PASS`. Root axioms for all three declarations: `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`.

**Evidence:** [artifact #13075492544](https://github.com/etblink/math/actions/runs/41286707897/artifacts/13075492544); ZIP SHA-256 `c8c49fce781cd1e8fa0adf02cea9a0b9832618410efddb2b0ed765b5f257fd81`.

**Qualified source-exact results:** `gammaDetDirectHom_eq_one`, `source9OrientationSubgroup_eq_top`, `source9SpinOriginalPaired48_det_one`.

## F10R: CANDIDATE, new strict gate

The accepted V10G theorem `source9SpinOriginalPaired48_mem_specialOrthogonal_of_gamma_det_one` is conditional on exactly the source 16-real gamma determinant-one hypothesis. F10Q now supplies that hypothesis. The new F10R experiment has three exact declarations:

1. `source9SpinOriginalPaired48_mem_specialOrthogonal`: original **paired-label** 48×48 matrix is in Mathlib's genuine `Matrix.specialOrthogonalGroup Source48Label ℝ`.
2. `source9SpinOriginalPaired48SpecialOrthogonalHom`: a genuine, global **algebraic** `MonoidHom` from source `spinGroup source9Quadratic` into that exact source-labeled SO(48) subtype. Reuse the V10F accepted O(48) map; do not replace its matrix or its color/Fock label order.
3. `source9SpinOriginalPaired48SpecialOrthogonalHom_apply`: prove that the SO-valued map's actual original matrix is the accepted V10F O(48) matrix.

**Strict qualification required:** pinned actual V10F/V10G/F10Q blobs, fresh warning-as-error compiler, exact theorem/definition types independently elaborated, three root axiom whitelists; preserve red diagnostic if not green. Never infer type verification from formatted printed theorem text.

**Preserved negative knowledge:** F10 private signed-permutation table's three reds, failed legacy `import all`, F10N linter reds, and V9Z's six reds remain unmodified. No new axioms, sorry, unproved isomorphism, invented theorem or changed warning flags.

**Unproved even if F10R passes:** continuous/topological source Spin9 → SO48 map, original Spin48 lift, global center action and covering, 48-Majorana Fock implementation, SU2 gauge intertwining, BFSS physical spectrum. Keep FCP scientific inference independent.

**Publication boundary:** owner research branch only. No merge to `main`; no upstream PR.
