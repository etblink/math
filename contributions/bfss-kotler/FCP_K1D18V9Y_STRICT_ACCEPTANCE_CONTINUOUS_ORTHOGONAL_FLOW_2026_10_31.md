# K1D18V9Y — strict acceptance: continuity of original paired-Fock orthogonal flows

Date: 2026-10-31 UTC
Branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`
V9Y acceptance SHA: `ca77ec39aad31708ac564d59cecdffe845913bc2`
V9Y exact Lean source hash: `8a09e7db98b842da215d7bc2e23d651d8b3e03ca`
Pinned Lean `leanprover/lean4:v4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
Accepted [Run #41238340160](https://github.com/etblink/math/actions/runs/41238340160) — **GREEN**. Job id `124646741203`; SHA matches source and run head; source remained frozen during qualification.
Preserved evidence artifact: `bfss-v9y-original-paired-continuous-orthogonal-flow-ca77ec39aad31708ac564d59cecdffe845913bc2-1`, id `13056906478`, sha256 `78c6a2f70af78412ca46c99312500f002e8daa37c8b1693e9febe8d439c17bda`.

## Accepted declarations and independent evidence

Exact source and dependency pin preflight, full accepted V9X ancestry compilation, fresh V9Y `-DwarningAsError=true` compilation, and four independent exact-typed specializations and declaration-level axiom audits all passed. All four declarations contain only the permitted `propext`, `Classical.choice`, `Quot.sound`, and no `sorryAx`.

- `pairedMatrixExp_continuous_real` proves `Continuous (fun t : ℝ => exp (t • X))` for arbitrary original paired-Fock 48-label matrix `X`, choosing pinned `Matrix.Norms.Operator` solely for the analytic proof interface.
- `pairedSkewOneParameterOrthogonalHom_continuous_real` proves the exact V9X group-valued hom is continuous under the original real parameter encoding.
- `normalizedPairedPlaneOneParameterOrthogonalHom_continuous_real` proves continuity for every original normalized paired-Fock plane generator, in every ordered index pair.
- `coordinateToPairedCanonicalOneParameterOrthogonalHom_continuous_real` proves continuity for every image of the accepted original source-exact 9-to-48 canonical LieHom.

All statements use the **original** source-label 48 real matrices and the actual Mathlib orthogonal group subtype.

## Preserved negative knowledge: V9Y gate 1

Initial [Run #41237464871](https://github.com/etblink/math/actions/runs/41237464871) RED at commit `f546d1ab1ae5352268c240c72097a3190ffa0168`. V9X ancestry and pins passed, but fresh V9Y compilation failed. Source line 19 mistakenly used `open scoped Norms.Operator` rather than the exact pinned `Matrix.Norms.Operator`. Subsequent continuity expression was also underconstrained and generated a stuck `TopologicalSpace` metavariable. Failed V9Y declarations printed `sorryAx`; the independent audit was skipped. This was a namespace/type elaboration failure, not proof of mathematical discontinuity. Corrective commit `ca77ec39aad31708ac564d59cecdffe845913bc2` repaired the exact scope and made the first matrix exponential continuity composition fully typed. The four theorem statements were not weakened. Preserve the red log.

## V9Z next bounded frontier (PROPOSAL ONLY)

Pinned `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean` defines an actual `ContinuousMonoidHom A B` extending a `MonoidHom` and a `ContinuousMap`. Pinned `Mathlib/Topology/Constructions.lean` proves `Multiplicative.continuous_toAdd`. The accepted V9X real-source one-parameter `MonoidHom` and accepted V9Y continuity proofs can now be bundled into a **genuine typed continuous one-parameter orthogonal hom** with domain `Multiplicative ℝ` and codomain `Matrix.orthogonalGroup Source48Label ℝ`. Six proposed V9Z items: three typed continuous hom definitions (generic skew X, normalized plane generator, canonical V9T image), with three exact matrix evaluation theorems.

This is an individually parametrized real continuous hom for a *fixed generator*. It is **not** a global `Spin(9) → SO(48)` homomorphism, a source `Spin(48)` lift, determinant-one proof, global smoothness or a BFSS physical theorem. A separate strict V9Z gate must pass to qualify V9Z.

## Open mathematical obligations

Determinant-one and special-orthogonal membership, Lie-group compatibility/global integration, original Clifford Spin(48) lift with the exact original paired-Fock labels and basis permutation, covering kernels, gauge covariance, and spectral claims all remain open. Do not change main, FCP provenance, or upstream mathcommunity. Preserve all prior red and green evidence.
