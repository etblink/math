# K1D18V10H post-F10BB — pinned integration API audit and F10BC algebraic SO(16) candidate

**Date:** 2026-11-02 UTC / 2026-11-02 Pacific  
**Repository:** `etblink/math`  
**Branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`  
**Disposition:** `API_AUDIT_COMPLETE__LIE_INTEGRATION_BLOCKED__CONSTRUCTIVE_SO16_PACKAGING_CANDIDATE`

## Starting point

F10BB is frozen at its accepted interface:

```lean
LieAlgebra.Orthogonal.so SpaceIndex ℝ →ₗ⁅ℝ⁆
  LieAlgebra.Orthogonal.so SpinIndex ℝ
```

It is an exact original-gamma `so(9,ℝ) → so(16,ℝ)` Lie algebra homomorphism. It does not itself produce a group homomorphism.

## Exact pinned Mathlib census

The audit used Lean 4.34.1 and Mathlib revision
`d13f23b723b8a846827a245b89c10fc7d3f11612`.

| Pinned source | Exact capability | Missing for direct F10BB integration |
|---|---|---|
| `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean` | Defines `LieGroup` as a manifold with smooth multiplication and inversion. | No theorem integrating an arbitrary `LieHom` to a group homomorphism. |
| `Mathlib/Geometry/Manifold/GroupLieAlgebra.lean` | Defines `GroupLieAlgebra I G` as the tangent space at the identity with the invariant-vector-field bracket. | No comparison equivalence with `LieAlgebra.Orthogonal.so`; no integration theorem. |
| `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean` | Defines algebraic `spinGroup Q`, its `Group` instance, and `spinGroup.toUnits`. | No topology, charted-space, Lie-group, simply-connectedness, or covering instance for this source group. |
| `Mathlib/LinearAlgebra/UnitaryGroup.lean` | Defines algebraic `Matrix.orthogonalGroup` and `Matrix.specialOrthogonalGroup` submonoids/groups. | No manifold or `LieGroup` instance for the exact SO(16) subtype. |
| `Mathlib/Topology/Homotopy/Lifting.lean` | Lifts continuous maps through an already supplied covering under simply-connected/local-path-connected hypotheses. | Does not construct the Spin(9) or Spin(16) covering, continuity, or required group compatibility. |
| `Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean` | Supplies generic simply-connected-space notions and consequences. | No source-specific `SimplyConnectedSpace (spinGroup source9Quadratic)` result. |

The recursive pinned source tree contains the two Lie-group/Lie-algebra files above but no separate Lie-algebra-homomorphism integration development. Therefore a direct “F10BB integrates globally” gate is not presently justified by the pinned library.

## Route decision

### Route A — abstract Lie integration

**Blocked.** Before a theorem gate, this route would require all of:

1. a genuine manifold and `LieGroup` structure on the exact source `spinGroup source9Quadratic`;
2. a manifold and `LieGroup` structure on the exact target `Matrix.specialOrthogonalGroup SpinIndex ℝ`;
3. Lie-algebra equivalences between their `GroupLieAlgebra` tangent types and the canonical skew-matrix `so` types;
4. source connectedness/simply-connectedness at the exact required strength;
5. an integration existence/uniqueness theorem;
6. a proof that the integrated map's differential is exactly F10BB.

None of these may be inferred from the current algebraic group or Lie algebra declarations.

### Route B — constructive Clifford representation

**Available and source exact.** The repository already has independently accepted pieces:

- V10C: the exact original nine-gamma algebra homomorphism
  `CliffordAlgebra source9Quadratic →ₐ[ℝ] GammaMatrix`;
- V10D/V10E: a global algebraic homomorphism
  `spinGroup source9Quadratic →* Matrix.orthogonalGroup SpinIndex ℝ`;
- F10Q: determinant `+1` for every exact source-spin gamma image.

Thus the immediate missing statement is only the canonical subtype packaging

```lean
spinGroup source9Quadratic →*
  Matrix.specialOrthogonalGroup SpinIndex ℝ
```

on the original 16-real gamma carrier.

## F10BC candidate

The new bounded candidate defines and audits exactly:

- `source9SpinGammaMatrix_mem_specialOrthogonalGroup`;
- `source9SpinGammaSpecialOrthogonalHom`;
- `source9SpinGammaSpecialOrthogonalHom_apply`.

The candidate deliberately does **not** import F10BB. The global algebraic Clifford construction and the infinitesimal F10BB construction remain independent accepted/candidate lanes until a future differential-comparison theorem is possible.

F10BC is **not qualified** until its exact pinned workflow finishes green, the fresh source compiles with warnings as errors, all three exact types independently elaborate, and every root axiom report contains only the accepted kernel axioms with no `sorryAx`.

## Scope ceiling after a possible F10BC success

Even a green F10BC would establish only a global **algebraic** source-group homomorphism into matrix SO(16). It would not establish:

- continuity or smoothness;
- a `LieGroup` structure on the source or target;
- equality of its differential with F10BB;
- source simply connectedness or a covering theorem;
- a lift to a separately defined Spin(16);
- Fock implementation, gauge-domain compatibility, or BFSS spectral existence.

## Next decision rule

1. Qualify or reject F10BC on exact compiler evidence.
2. If green, freeze the algebraic SO(16) interface.
3. Do not open a differential-equality or topological-integration gate until an exact manifold/API bridge exists.
4. If such infrastructure is pursued, begin with a diagnostic-only source proving the required typeclass instances and tangent/skew comparison, not with a global theorem candidate.


## Qualification result — superseding the candidate status

F10BC Gate 2 is accepted at [run #41453417697](https://github.com/etblink/math/actions/runs/41453417697), exact tested commit `0504e72d34679fdb0684c5ee29e4d7e7f93ff534`, repaired source blob `7798089cb8ac4ec4fffc3ead4caa474def81b3f8`. Fresh warnings-as-errors compilation and all three independent exact type/root-axiom checks passed. The immutable acceptance record is [F10BC Gate 2 acceptance](FCP_K1D18V10H_F10BC_GATE2_ACCEPTANCE_GLOBAL_ALGEBRAIC_ORIGINAL_GAMMA_SO16_HOM_2026_11_02.md).

The API-audit conclusions and scope ceiling above remain unchanged.
