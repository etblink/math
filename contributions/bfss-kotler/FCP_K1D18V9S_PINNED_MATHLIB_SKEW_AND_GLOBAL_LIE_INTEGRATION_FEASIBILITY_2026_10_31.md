# Project Lead — V9S prospective canonical skew-adjoint interface and global Lie integration feasibility

Date: 2026-10-31 UTC
Research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`
Previously qualified V9R commit: `02a4618401ce4ead4f559d0c341122a17492df14`
Last report-only HEAD: `70c7fdc5de6faaf44ea85a21d690e8ea5adf8a74`

## Source and pinned Mathlib audit (completed; not a theorem)

The accepted V9R `coordinateToPairedSkewLieHom` is a true real `LieHom` between exact original 9-index skew matrices and Fock-paired `Source48Label` skew matrices. V9B proves `coordinateToPairedLinearMap (coordinatePlane9 r s) = normalizedPairedPlane r s`.

Pinned Mathlib 4 revision `d13f23b723b8a846827a245b89c10fc7d3f11612` has independently inspected:

- `Mathlib/Algebra/Lie/SkewAdjoint.lean`: `Matrix.skewAdjointMatricesLieSubalgebra J` is the classical matrix Lie-algebra API; for `J=1`, membership is `Aᵀ * 1 = 1 * (-A)`. This is *definitionally equivalent* to the accepted source skewness property, but the actual equality of subtype carriers remains to be compiled and independently audited.
- `Mathlib/Algebra/Lie/Matrix.lean`: `Matrix.reindexLieEquiv` preserves actual commutators under exact index equivalences; it must be tied to `pairedLabelEquiv`, not a color-major identity. `lieEquivMatrix'` identifies matrix commutators with endomorphism Lie algebra.
- `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean`: `LieGroup` requires a manifold and smooth group operations.
- `Mathlib/Geometry/Manifold/GroupLieAlgebra.lean`: `GroupLieAlgebra I G` is tangent space at group identity with Lie bracket induced by left-invariant vector fields. This is NOT definitionally the matrix skew subalgebra.
- `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean`: algebraic Clifford `spinGroup` and its `Group` instance exist. The inspected file does NOT provide the desired topological covering `Spin(48)→SO(48)` or source-integrating `Spin(9)→Spin(48)` homomorphism.
- `Mathlib/Topology/Covering/Basic.lean` and `Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean`: generic `IsCoveringMap` and `SimplyConnectedSpace` notions exist, but no application to exact original Spin48 map has been demonstrated by this audit.

**Consequence:** the current exact source LieHom is not automatically a group Lie algebra differential, a group hom, nor a topological covering map. A global lift remains OPEN. Do not interpret the inspected files as exhaustive proof that integration theorems are absent elsewhere.

## V9S bounded falsifiable candidate

New source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9MathlibSkewBridgeProbe.lean`; new independent strict workflow: `.github/workflows/bfss-kotler-paired-spin9-mathlib-skew-bridge-strict.yml`.

Three prospective Lean obligations:

1. `coordinateSkewLieSubalgebra_eq_mathlib`: V9R input real Lie subalgebra equals pinned `Matrix.skewAdjointMatricesLieSubalgebra 1` on literal `SpaceIndex`.
2. `pairedSkewLieSubalgebra_eq_mathlib`: V9R output equals that Mathlib canonical subalgebra on exact source `Source48Label`.
3. `coordinateToPairedSkewLieHom_coordinatePlane`: the actual `LieHom`, applied to the native `coordinatePlane9 r s` skew subtype, equals the original normalized `pairedPlaneLie r s` subtype, including diagonals and index reversals. This is a genuine *typed generator interface* for future differential identification, not new physical evidence.

There is no substitute plane generator, alternate gamma representation, color-major assumption or new axiom. Exact source hash preflight and independent Lean+axiom audit must pass before treating V9S as qualified. Count qualified roots **0 additional until strict PASS**. Preserve first failure and its source evidence if red.

## Next critical unknowns after any V9S result

- Identify or construct exact isomorphism `GroupLieAlgebra I (Spin9 source) ≃ₗ⁅ℝ⁆ Matrix.skewAdjointMatricesLieSubalgebra 1`, with actual source group/manifold.
- Integrate the source generator hom into a **continuous** `Spin(9)→SO(48)` action; then a continuous based lift to original `Spin(48)`; verify `-1` center orientation against accepted exact source Pfaffian and CAR Fock pairing.
- Prove original gauge/color action and physical operator/form invariance independently. The frozen FCP finite B-tensor covariance checks and accepted V9R LieHom do not discharge these.

## Governance

Keep V9R theorem/axiom/source and all accepted ancestors frozen, do not raise proof limits, do not edit FCP provenance, main, or upstream mathcommunity. A red compiler diagnostic is feedback, not license to adjust the mathematical statement.
