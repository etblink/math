# F10AR Gate 2 accepted; F10AS native total triple-collision bracket candidate

Date 2026-11-01. Owner research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`. Qualified parent `0111b319228e0dfed5f7c235ade2e6060748aa75`.

## F10AR accepted, independently verified
[Run #41363706083](https://github.com/etblink/math/actions/runs/41363706083) SUCCESS attempt 1 at qualified parent. All original source and F10E/F10AJ–F10AR hash pins, frozen Lean v4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, accepted F10AQ ancestry rebuild, fresh `-DwarningAsError=true` source compilation and FOUR independent declaration-type/root-axiom audits PASSED. Exact marker `V10H_F10AR_FOUR_NATIVE_ORIENTATION_ZERO_TYPES_AXIOMS_PASS`. Allowed axioms only `propext`, `Classical.choice`, `Quot.sound`; no sorryAx. [Artifact #13106179051](https://github.com/etblink/math/actions/runs/41363706083/artifacts/13106179051), ZIP SHA256 `4455ab98f0b231fc0955ef64bae422f5c1dd602c4df5c03b8b126d1b7f0a09d1`.

F10AR qualified: reversal of either original gamma pair negates its native bracket; all original disjoint pairs have zero bracket for arbitrary orientation; all arbitrary original gamma pairs have zero self bracket.

## Negative provenance retained
[Gate 1 RED #41362594482](https://github.com/etblink/math/actions/runs/41362594482), SHA `6e0dfdb9d76de23d0a30529a8c443e8d5ec8b5d7`, failed at `exact neg_lie`, `exact lie_neg` because the pinned Mathlib LieRingModule typeclass was underdetermined. Diagnostic `sorryAx` appeared; independent audits were skipped. Two proof-line repairs used goal-driven `simp only [neg_lie]` and `simp only [lie_neg]`, preserving all native Lie theorem types. Red artifact #13106495239, SHA256 `e1ccd425af136ee90d50d4e52bd4593b8b7361349dd9f41bce58149d5dba6552`.

## F10AS: four exact candidate obligations
1. Native bracket of any source gamma pair `ab` and its orientation reversal `ba` is zero, using the accepted original source sign reversal.
2. Full native chain `[ab,bc]` if `a≠b` and `b≠c`, equals zero for collision `a=c` and otherwise `2 * ac`; dependent-if RHS so the output pair only exists for distinct endpoints.
3. Full native fork `[ab,ac]` if `a≠b` and `a≠c`, equals zero for `b=c` and otherwise `-2 * bc`.
4. Full native shared-right `[ac,bc]` if `a≠c` and `b≠c`, equals zero for `a=b` and otherwise `-2 * ab`.

These are strictly MORE general than the accepted F10AP/F10AQ pairwise-distinct native triple brackets and explicitly eliminate the endpoint-collision gap. This does NOT alone give all 36x36 bracket cases or a genuine source so(9) LieHom; global Spin group lifts and BFSS physics remain OPEN.

Strict new gate must pin exact original gamma, F10E and F10AJ–F10AS SHA, frozen Lean/Mathlib, build accepted F10AR ancestry, freshly compile candidate with warnings as errors, independently re-elaborate four COMPLETE dependent-if statement types and declaration root axioms (permitted only `propext`, `Classical.choice`, `Quot.sound`), preserve SHA-bound compiler and audits. Do not mutate accepted modules, introduce sorry/axioms, disable warnings, raise resource limits, merge main or create upstream PR.
