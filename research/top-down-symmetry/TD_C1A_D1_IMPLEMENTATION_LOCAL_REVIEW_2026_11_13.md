# TD-C1A D1 implementation and local review

**Date:** November 13, 2026 Pacific. **Status:** implemented, Lean compilation pending CI.
Prospective contract and D0 evidence were committed first at 43313263b73a539395e097a178fe8d1744de8b92.

Three new files test four named roots: two variable original-carrier application controls, the literal original axis operator lift, and literal original all-vector conditional evaluation. Each uses only the source-reviewed nondeprecated public equalities ContinuousLinearMap.mul_def, ContinuousLinearMap.comp_apply and LinearIsometryEquiv.coe_coe''. No deprecated mul_apply alias is used. Explicit normalization is applied to the goal or typed intermediate evaluation fact, before matching the already qualified original source statement.

The dedicated runner reuses the unchanged D0 warning/axiom auditor, recompiles/audits both frozen generic and native helpers, and collects each new file independently after its dependencies. Exact per-file compiler caps remain 90 seconds; standard Lean elaboration limits remain unchanged. The manifest freezes 30 blobs, including every D0 frozen blob, all new sources/runner, the original D0 workflow and the preregistered D1 contract. The new executed workflow is copied and fingerprinted separately.

Python AST, YAML/branch/all six trigger-path checks, inherited error/axiom/warning rejection fixtures and six simulated outcome scenarios passed. Simulations cover all leaves passing, each new leaf failing, both native leaves failing and axis dependency failure; independent collection, dependency skips, per-log hashes and qualification=false are checked. No local Lean executable is available; these checks are not Lean compilation.

D1 is diagnostic only. Conditional evaluation assumes its operator identity; no all-vector operator identity or unchanged full strict consumer is attempted. TD-C1A remains RED_UNQUALIFIED. A failed native leaf requires an exact receipt and stop, with no cosmetic same-turn retry. A passing leaf permits separately designed assembly after evidence review.
