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


## Project Lead succession: post-F10BC exact-interface re-audit (2026-11-02)

**Disposition:** `SOURCE_ONLY_DIFFERENTIAL_BRIDGE_NOT_ESTABLISHED__ABSTRACT_INTEGRATION_PAUSED__NO_NEW_THEOREM_ROOTS`.

This addendum is a source inspection and dependency decision, **not** a Lean-compiled diagnostic or a theorem acceptance. Source baseline is research branch HEAD `b90d268ec65ac68cff96629a9b93032ee6218d7c`, Lean `4.34.1`, and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. It preserves the F10BB and F10BC acceptance records and all prior red runs.

### Pinned interface facts verified directly

- `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean`: `spinGroup Q` is the intersection submonoid `pinGroup Q ⊓ (CliffordAlgebra.even Q).toSubring.toSubmonoid` (lines 291–294). It has a `Group` instance (lines 384–387) and a `toUnits` homomorphism (lines 402–405). These **algebraic** declarations are not a manifold atlas, a smoothness proof, or a tangent-space identification.
- `Mathlib/LinearAlgebra/UnitaryGroup.lean`: `Matrix.specialOrthogonalGroup n R` is an algebraic submonoid, with its `Group` instance noted at lines 313–325. The group structure alone does not provide the precise needed manifold structure.
- `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean` (lines 69–77): `LieGroup I n G` requires a specified model with corners, `TopologicalSpace G`, `ChartedSpace H G`, a group, and smooth multiplication and inversion.
- `Mathlib/Geometry/Manifold/GroupLieAlgebra.lean` (lines 46–56, 89–100): `GroupLieAlgebra I G` is the tangent space at the identity; its bracket uses invariant vector fields. It is **not** definitionally `LieAlgebra.Orthogonal.so _ ℝ`.
- These source facts reinforce the pre-existing pinned-source API audit: there is no justified direct path from F10BB's canonical `so(9) → so(16)` `LieHom` to a differential equality theorem without source-exact geometric infrastructure. Absence of a particular instance or theorem in the audited files is not a proof of mathematical impossibility.

### Shorter critical path now that F10BC is accepted

F10BC constructs a global **algebraic** map independently of Lie integration. Consequently, a future theorem asserting that its differential equals F10BB does **not** intrinsically require first proving source simply connectedness or an abstract Lie-algebra integration theorem. Those are prerequisites of certain *integration/existence* strategies, **not** of differentiating an already-constructed suitable smooth group map. Differential comparison still needs a precise manifold/tangent formalism and a proof of smoothness (or an independently qualified directional derivative formulation). Do not insert a `LieGroup` or `ChartedSpace` instance without proving its laws.

### Accepted 48-real inventory clarification

The original paired-label global **algebraic** `spinGroup source9Quadratic →* Matrix.specialOrthogonalGroup Source48Label ℝ` map is already qualified as **F10R**: run [#41287580971](https://github.com/etblink/math/actions/runs/41287580971), exact tested SHA `4e79469dae20001d8fcab770b5baae62d50afa22`. Its declaration is `source9SpinOriginalPaired48SpecialOrthogonalHom`. Do not reopen this SO(48) algebraic construction. F10R is **not** a map to `Spin(48)` and establishes no topological lift or physical implementer.

### Bounded next diagnostic and stop rules

1. **Topology/manifold feasibility:** list the exact instances and candidate constructions for the actual source `spinGroup source9Quadratic` subtype and target `Matrix.specialOrthogonalGroup SpinIndex ℝ`. Establish their specified model spaces and charted structures *before* asking for a `GroupLieAlgebra` or `LieGroup` proof. Typeclass elaboration or isolated exact source proofs are required to move beyond this source-only census.
2. **Tangent/skew correspondence:** if legitimate Lie-group structures are qualified, construct and verify the exact source and target tangent-to-canonical-skew equivalences, with brackets and the original coordinate-plane normalization. Do not silently identify the tangent Lie algebra with `so(9)`.
3. **Constructive alternative:** if manifold infrastructure proves disproportionate, investigate a *source-exact* one-parameter Spin(9) path for each coordinate plane and a matching SO(16) matrix path. First verify Spin membership, actual source quadratic normalization, and the precise Clifford/gamma image. A path identity or first-order calculation is **not** a global differential theorem without the relevant definitions.
4. **Stop rule:** if the next test cannot state a source-exact interface or distinguish competing mathematical possibilities, publish no new CI gate. No speculative `#synth` results, guesses about instances, proof-limit increases, new axioms, admitted results, or broad global proof attempts.

**No new Lean declaration has been compiled by this re-audit; no CI run was launched; no additional theorem root is claimed.**


## Post-F10BG — topology qualified; exact-carrier manifold route still unconstructed

**Baseline:** `d872b38d3ff65c2e0b122e7731975ce8cf012732`; Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

This supersedes the earlier topology-absence portion of this historical audit. F10BE qualifies the named PBW normed structures, Hausdorff separation and gamma continuity; F10BF qualifies the ambient Clifford topological ring; F10BG now qualifies the actual source `spinGroup source9Quadratic` as a topological group for the inherited PBW topology. Exact runs and artifacts are recorded in [the current-state handoff](FCP_K1D18_PROJECT_LEAD_CURRENT_STATE_HANDOFF_2026_11_02.md). None of these constructs charts.

### Targeted source audit and decision

- Pinned `Mathlib/Geometry/Manifold/Instances/UnitsOfNormedAlgebra.lean` constructs `ChartedSpace R Rˣ`, `IsManifold`, and `LieGroup` on the **whole unit group** of a complete normed algebra. Its assumptions include `NormedRing R`, `CompleteSpace R` and `NormedAlgebra 𝕜 R`. The accepted PBW data and topological-ring theorem are not a proof of all these normed-algebra assumptions.
- More decisively, that theorem does not furnish charts on the proper exact `spinGroup source9Quadratic` carrier. The existing algebraic `spinGroup.toUnits` injection is not a proof that its image is an open subset or an embedded submanifold. No such atlas/image theorem has been constructed here.
- The previously accepted one-parameter exponential flows inspected in the local project are on the **original paired 48-label matrix carrier**. They do not prove that a proposed curve lies in the actual source Clifford Spin9 carrier, nor do they identify its original 16-real gamma derivative. Reuse their exponential-composition method only where the exact carrier permits it.
- This is a targeted source/interface audit, not a new exhaustive library-absence claim and not a mathematical impossibility result. Do not repeat the abstract-integration census or start a generic Lie-group synthesis gate.

**Routing decision:** preserve the qualified topological-group interface, and use the previously authorized constructive alternative. First qualify a source-exact normalized-vector-pair membership lemma. Then define a coordinate-plane source curve, prove its quadratic normalization, actual Spin membership, value at zero and exact original-gamma image. Only after those facts pass should an exact first-order curve/image statement be proposed.

A candidate future distinct-plane parameterization is the Clifford product of the coordinate vector `e_r` with `cos(t/2) e_r + sin(t/2) e_s`. This is a **plan**, not an accepted declaration. It requires `r ≠ s`, the actual `source9Quadratic` norm-one proof, and explicit sign/half-angle checks against the accepted original-gamma source-plane convention. No global differential equality follows from a successful curve calculation.

### F10BH prerequisite scope

Pinned `SpinGroup.lean`, `Star.lean`, `Even.lean` and `Basic.lean` support an exact bounded obligation: for `source9Quadratic u = 1` and `source9Quadratic v = 1`, show `ι u * ι v ∈ spinGroup source9Quadratic`, then compute its F10BC matrix image.

Each positive unit vector squares to one, hence gives a Clifford unit and an actual generator of the defined Lipschitz group. A single such vector has Clifford star equal to its negative; it must not be assumed unitary or in the Pin subgroup. For a pair, the two signs cancel, and the existing even-grading theorem supplies evenness. The candidate proves each membership layer explicitly.

This algebraic prerequisite has no dependency on the PBW/topological modules; its workflow rebuilds its actual F10BC algebraic ancestry without rebuilding unrelated manifold or paired-flow modules. It remains a candidate pending strict compilation and independent type/axiom checks. It adds no accepted root at publication.
