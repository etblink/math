# K1D7 — source Clifford coefficient-square norm gate

## Independent strict acceptance — 2026-10-28 UTC

**CURRENT STATUS: ACCEPTED, 54 scoped contributor modules.** [Owner strict run #40620376673](https://github.com/etblink/math/actions/runs/40620376673), job `122592687757`, attempt 1, completed `success` on the exact source SHA [`617639e3d168d913a1db22624124d8c1066b6c0e`](https://github.com/etblink/math/commit/617639e3d168d913a1db22624124d8c1066b6c0e). The run requalified all 53 accepted ancestor declaration roots and both new K1D7 roots, yielding **55/55** checked roots. Terminal marker `FCP_K1D7_SCALAR_COEFFICIENT_NORM_STRICT_PASS modules=1 roots=2`; permitted axioms only `propext`, `Classical.choice`, `Quot.sound`. No Lean source warnings or errors. [Compiled evidence artifact 12787337383](https://github.com/etblink/math/actions/runs/40620376673/artifacts/12787337383).

Both original-source scalar algebraMap injectivity and coefficient-level `c*c=1` are now independently qualified. The candidate wording below is retained as a **pre-acceptance historical snapshot**, not current status. No `c=+1 ∨ c=-1` declaration or full two-sign kernel classification has yet been qualified.

### Original pre-qualification handoff


**Current state: CANDIDATE / independent owner CI not yet accepted.** This step is on a fresh descendant research branch `research/fcp-k1d7-scalar-coeff-20261027` of accepted `research/fcp-k1d6-spin48-scalar-norm-20261027@374562442da65a099dea16b2fb793b4d1baaf55e`, with **53 qualified contributor modules** preserved. K1D6 passed independent [run 40618353517](https://github.com/etblink/math/actions/runs/40618353517) on exact tested commit `25ca790ea1f326d48b0bc7f75dc7ce0f125b18bd`, with 53/53 selected declaration checks and only permitted axioms.

## New obligations, exact source

`lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D7OriginalCliffordScalarCoefficientNormProbe.lean`, pinned Git blob `bf67d82af7a45bf875fca7a97d0e549e4c4a58a9`.

1. `FCP.BFSSS1V52K1D7.originalSourceClifford_algebraMap_injective`: the actual original source Clifford `algebraMap ℝ C` is injective. The proof uses only qualified K1D5 scalar preservation through the real-linear `CliffordAlgebra.equivExterior Q` and the true exterior scalar embedding `ExteriorAlgebra.algebraMap_inj` in pinned Mathlib `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean` (approximately lines 150–163), where `algebraMapInv` gives the explicit left inverse. No multiplicative property of `equivExterior` is assumed.
2. `FCP.BFSSS1V52K1D7.originalSourceSpin48_trivialAction_clifford_scalar_coefficient_square_one`: for original Spin(48) elements acting trivially on every original source vector, exhibit `c : ℝ` with `(s : C) = algebraMap ℝ C c` **and** `c*c = 1`. Combine K1D5 and K1D6, and apply the newly qualified scalar injectivity if it passes.

## Qualification contract

Workflow `.github/workflows/bfss-kotler-k1d7-clifford-scalar-coeff-owner-strict.yml` pins this source and verifier `contributions/bfss-kotler/tools/qualify_fcp_k1d7.py` (blob `8dfdffebd68832bb068adbe9c42fb241f77201e0`). With Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, it independently requalifies the selected original ancestry 22 modules / 47 roots, K1D3–K1D4 2 roots, K1D5 2 roots, and K1D6 2 roots; then freshly compiles K1D7 and demands exactly 2 new declaration axiom reports, nonempty `.olean`, theorem-type evidence, no source warnings/errors and no `sorry`, `admit`, `sorryAx`, or new `axiom` declarations. Allowed axioms only `propext`, `Classical.choice`, `Quot.sound`. Archive compiler evidence on both green and red results.

**Fail closed.** Only verified completed successful source-exact CI at the exact tested SHA may promote K1D7, raising scoped acceptance from 53 to 54 modules.

## Explicitly unproved

A real coefficient satisfying `c*c=1` has yet to be qualified as `c=1` or `c=-1` in the original theorem dependency chain. Neither negative central Spin membership nor the converse inclusion of both signs in the source action kernel is proved by K1D7. The entire two-sign classification, covering, global Spin(9), and BFSS spectral results remain separate. No upstream PR or changes to `main`, old checkpoints, or `mathcommunity/oai-math-revised` are authorized here. For eventual upstream review, retain this owner's full evidence but package only smallest verified theorem dependencies on a new community-main-based submission branch with appropriate disclosure.
