# K1D6 — genuine Spin48 scalar-star and square-one consequences

**Status: CANDIDATE, independent strict gate not yet accepted.**
Research branch: `research/fcp-k1d6-spin48-scalar-norm-20261027`, descendant of the qualified K1D5 checkpoint `research/fcp-k1d5-clifford-scalar-20261027@98521f141e4bc1e732a710cc83774f94e8e5cc2f`.

## Qualified dependencies

The owner baseline contains **52 accepted contributor modules** after K1D5 strict gate [40616712698](https://github.com/etblink/math/actions/runs/40616712698), tested SHA `203d5d6d6f8550b616433005ed83163a17ec0299`. The selected strict closure contains 22 ancestry modules / 47 roots, K1D3/K1D4 / 2 roots, and K1D5 / 2 roots. The original K1D5 proof gives that each source Spin(48) element acting trivially on source vectors is a **Clifford scalar**, not merely an exterior scalar.

Exact pinned Mathlib 4 source `d13f23b723b8a846827a245b89c10fc7d3f11612`:
- `Mathlib/LinearAlgebra/CliffordAlgebra/Star.lean`: `CliffordAlgebra.star_algebraMap` ensures real Clifford scalars are star-fixed.
- `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean`: `spinGroup.star_mul_self_of_mem` proves the actual Spin membership unitary property.

## New bounded theorem candidates

Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D6OriginalSpin48ScalarStarNormProbe.lean`, Git blob `bf9e72fc088fe3254e5a4c81a2d398379ba15fd0`.

1. `FCP.BFSSS1V52K1D6.originalSourceSpin48_trivialAction_clifford_star_fixed`: trivial source vector action implies the genuine Spin(48) element is fixed by Clifford star.
2. `FCP.BFSSS1V52K1D6.originalSourceSpin48_trivialAction_clifford_square_eq_one`: the same element has square equal to one **as an element of the original Clifford algebra**.

Neither theorem asserts its real scalar coefficient is exactly `+1` or `-1`. A future proof must establish scalar injectivity/faithfulness and use a sound real-field square-one separation. Explicit negative-central-element Spin membership and the complete two-sign kernel remain separate.

## Acceptance contract

Workflow `.github/workflows/bfss-kotler-k1d6-spin48-scalar-norm-owner-strict.yml` pins the candidate source and independent verifier `contributions/bfss-kotler/tools/qualify_fcp_k1d6.py` (blob `5e86a6aaefcb4202c021adde49d64a20217b6ad0`), the 4.34.1 Lean compiler and exact Mathlib SHA. It freshly rebuilds all qualified selected ancestors and checks the new 2 roots with warning-as-error, compiled `.olean`, source token scan, exact permitted axiom reports and root-type evidence.

Only a **terminal green independent run at an identified tested commit**, after logs and axioms inspection, admits this candidate and increases the 52-module count. Preserve any failure; do not weaken theorems for a green status.

## Upstream publication boundary

Preserve the complete owner evidence on this research branch. No change to `main`, previous qualified branches, or the sibling `mathcommunity/oai-math-revised` is part of this research step. An upstream PR will require explicit owner authorization and a clean branch based on the community's then-current `main`, with the smallest complete qualified theorem closure and automation disclosure.
