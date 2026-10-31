# Project Lead — V8L Gate 1 RED: three unused simp arguments; minimal Gate 2 recovery

**Research local date:** 2026-10-30 PDT. **Disposition:** `GATE1_RED_PRESERVED__GATE2_PENDING`.

## Failed immutable gate and first failing step

- [V8L Gate 1 #41163775125](https://github.com/etblink/math/actions/runs/41163775125) **completed/failure**, exact tested SHA `86d8de845822fed7e56667ef30afbb643f470bca`, attempt 1, job `124426812615`.
- Candidate `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9FourIndexDistinctCasesProbe.lean` at exact Git blob **`601025e7f934aa9704bb6a1af52b4696ee12ffc5`**.
- The exact source pin preflight, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restore, accepted V8I and V8K ancestors and their compilation all **PASSED**.
- `Fresh compile exact V8L source with warnings as errors` **FAILED**. `Fresh independent Lean theorem specialization and axiom gate` was **SKIPPED**. Five formal theorem statements remain **UNQUALIFIED** until a new strict gate passes.
- Actual Lean compiler diagnostics at:
  - **line 48:53**, `error: This simp argument is unused: Ne.symm hrs` in `zeroDiagonalFourIndex_adjacent_case`.
  - **line 76:38**, `error: This simp argument is unused: hrs` in `zeroDiagonalFourIndex_shared_left_case`.
  - **line 90:38**, `error: This simp argument is unused: hrs` in `zeroDiagonalFourIndex_cross_right_case`.
- These are correct strict-linter failures from redundant explicitly listed simp arguments; no outstanding mathematical goal is evidenced by those three diagnostics. Do **not** disable `linter.unusedSimpArgs`, weaken warnings-as-errors, or raise limits. The accepted V8J red had the analogous unnecessary trailing `abel` problem.
- Retained red compiler/log [artifact #13028315711](https://github.com/etblink/math/actions/runs/41163775125/artifacts/13028315711), ZIP SHA256 **`c1e378667f260729495a85d4e3584453e9d771a787f906044fc4d34a8f4b4ab2`**, size 703 bytes.

## Exact isolated proof-preserving correction

- Removed **only** the unused `Ne.symm hrs` at line 48 and unused `hrs` at lines 76 and 90 from `simp [zeroDiagonalFourIndexRHS,...]`.
- Kept all five original source theorem statements, matrix types, `Source48Label` pairing, accepted V8I/V8K imported lemmas, and exact four-index `zeroDiagonalFourIndexRHS` unchanged.
- Corrected source blob **`35b6e9acd0504885521727ec0e655f7e51813ea0`**.
- Companion workflow updates **only** its literal candidate source pin, workflow blob **`1b44e816eee36cf381593396dfe39545f02f32a8`**. No changes to pinned ancestors or gate configuration.
- Atomic fast-forward repair commit **`4fa9a84d98f13f7531c62be8e9e76955cab3ea41`**, created from the exact immediate parent HEAD's tree (not an outdated base tree). Complete `compare_commits` review against the red SHA confirms exactly two files modified: **three source lines plus one workflow pin**; zero other additions, removals or edited acceptance docs.
- [V8L Gate 2 #41164408088](https://github.com/etblink/math/actions/runs/41164408088) automatically triggered on this exact two-file correction. **Do not accept it** without terminal success, exact tested SHA, fresh warnings-as-errors `.olean` compile, five independent Lean `example` type assertions, five declaration-level allowed axioms/no `sorryAx`, and preserved artifact.

## Program context, strict boundaries and negative-knowledge lesson

- Accepted V8A–V8K cumulative **24 theorem roots**. V8L proposes five additional exact four-index cases: four one-shared-index orientations and a four-distinct case. The all-indices theorem remains **open**.
- The V8I strict [green #41161070164](https://github.com/etblink/math/actions/runs/41161070164) accepted the original source-label, zero-diagonal L brackets. V8J [green #41162392473](https://github.com/etblink/math/actions/runs/41162392473) and V8K [green #41163119628](https://github.com/etblink/math/actions/runs/41163119628) accepted the diagonal and pair-coincidence cases. These must be combined only after V8L's distinct cases are qualified.
- Preserving both failed and passing variants is useful. With `-DwarningAsError=true`, avoid `simp` argument lists padded by explicit facts when Lean's simplifier derives them or they are unnecessary; delete only the unused argument highlighted by the compiler. Do not conflate an unused tactic with a failed theorem, yet never count a red compile as formal acceptance.
- For future atomic writes: use the exact current parent commit and matching tree SHA, inspect complete Git diff for any accidental removals (the prior V8J accident), maintain `main` and original accepted Lean blobs unchanged. No edits to frozen FCP or upstream mathcommunity without owner authorization.
- Even successful source-exact algebra does **not** prove a continuous global Spin(9)→Spin(48) integration, original Fock operator implementation, gauge covariance, topological covering, or BFSS spectral existence.

This file records a red result and correction; it is not a replacement for any strict acceptance report.
