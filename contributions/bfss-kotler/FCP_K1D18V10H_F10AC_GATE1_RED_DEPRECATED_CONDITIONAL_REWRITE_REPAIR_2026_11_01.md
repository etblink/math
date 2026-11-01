# F10AC Gate 1 RED — pinned Lean deprecated conditional-rewrite repair

Date: 2026-11-01. Research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## Preserved failed gate
[Run #41338265065](https://github.com/etblink/math/actions/runs/41338265065), attempt 1, exact SHA `9722f7eea18ab887878d0123c739ae70ca49c54d`, completed FAILURE. [Artifact #13096756449](https://github.com/etblink/math/actions/runs/41338265065/artifacts/13096756449), ZIP SHA256 `194f49797a674f6e66dca886621e63d2e3e26d02529de7ed0fea02a0436ff4c3`.

Source pin verification, Lean 4.34.1 and frozen Mathlib revision d13f23b723b8a846827a245b89c10fc7d3f11612, accepted F10AB ancestry rebuild all PASSED. Fresh F10AC warnings-as-errors Lean compile failed. Independent three-declaration exact type and axiom audit SKIPPED.

**First two errors only:** F10AC original source lines 43 and 45: `if_pos` and `if_neg` deprecated in pinned Lean/Mathlib; warning-as-error escalated both. No theorem counterexample, no unproved goal or missing math result was reported. Compiler subsequently printed the three candidate axiom lists containing only `propext`, `Classical.choice`, `Quot.sound`; this does not qualify F10AC because independent audit was skipped.

## Bounded Gate 2 candidate repair
Replace only the two deprecated conditional rewrite invocations inside `source9OriginalGamma_fixed_left_pair_trace_gram` with `simpa` following `subst c` in the equality branch and `simpa [hbc]` in the inequality branch. Both branches cite the ALREADY ACCEPTED F10AB original source trace lemmas, with no coercion tricks, new assumptions, private gamma tables or source-index changes. All THREE F10AC theorem statements are unchanged, along with the other TWO theorem proof bodies.

Update only the exact F10AC Lean blob pin in the strict workflow. Preserve the old red run and evidence; no main merge, upstream PR, resource-limit relaxations, `sorry`/admitted axiom or weakened theorem. The new Gate 2 remains CANDIDATE pending fresh strict Lean and independent declaration-type/axiom PASS.

**Research boundary:** Fixed-left two-word nonproportionality is not full eight-word simultaneous independence, 36-pair independence, 256 even-word gamma injectivity, faithful source Spin9 action, Spin48 lift, Fock realization or BFSS physics.
