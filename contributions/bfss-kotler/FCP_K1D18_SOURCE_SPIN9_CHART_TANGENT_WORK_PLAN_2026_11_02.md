# Actual source Spin9 chart and tangent work plan

**Planning baseline:** accepted F10BS, [run #41560403653](https://github.com/etblink/math/actions/runs/41560403653), exact commit `100347bf0cfadb49083802eaaf823cefca36f502`.  
**Pinned environment:** Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.  
**Current qualification ledger:** [authoritative handoff](FCP_K1D18_PROJECT_LEAD_CURRENT_STATE_HANDOFF_2026_11_02.md). This document records the geometric work plan at the stated baseline; acceptance and active-run status remain in that ledger.

## 1. Qualified interfaces

| Interface | Qualified scope | Geometric obligation still separate |
|---|---|---|
| F10BB | Canonical original-gamma `so(9) →ₗ⁅ℝ⁆ so(16)` | Identification with a group differential |
| F10BC | Actual algebraic `spinGroup source9Quadratic →* SO(16)` | Source/target charts and smoothness |
| F10BE–F10BG | Named PBW norm/topology, Clifford topological ring, actual source topological group | A subgroup manifold atlas |
| F10BI/F10BJ/F10BM | Actual distinct-plane curves, Clifford velocity and inverse formula/velocity | Full tangent-space identification |
| F10BR | Actual nine-vector algebraic `Spin → O(9)` homomorphism, literal coordinate action | Determinant, kernel, covering and global smoothness |
| F10BS + F10BK | On the same actual curve, whole nine-matrix velocity is full native `F_rs`; original-gamma velocity is F10BB applied to that canonical plane | An identification of the full source tangent with native `so(9)` |

The coordinate-curve comparison is now a qualified normalization result. Further geometric claims need the missing structures and proofs, rather than another restatement of the same curve data.

## 2. Bounded source census

The following pinned sources were inspected:

- `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean`: `LieGroup` requires a topology and `ChartedSpace`, with smooth multiplication and inversion. Its group structure alone supplies no charts.
- `Mathlib/Geometry/Manifold/Instances/UnitsOfNormedAlgebra.lean`: the unit group of a complete normed algebra has an atlas and Lie-group structure. The file requires `NormedRing`, `CompleteSpace`, and `NormedAlgebra`. It explicitly supports units of the continuous-endomorphism algebra of a Banach space.
- The inventories of `Geometry/Manifold/Algebra` and `Geometry/Manifold/Instances` identify the available LieGroup and UnitsOfNormedAlgebra files. No applicable proper-subgroup atlas constructor was identified in these inspected sources. This is a bounded census, not a proof of absence throughout Mathlib.
- `CliffordAlgebra/SpinGroup.lean` defines the actual source using Pin membership, evenness and the algebraically generated Lipschitz subgroup. Its `Subgroup.closure` is algebraic subgroup generation. Topological closedness must be proved separately; it is not supplied by the word “closure.”
- F10BF proves joint multiplication continuity for the named PBW topology. It does not supply a submultiplicative norm with constant one.
- `Analysis/Normed/Operator/BoundedLinearMaps.lean` supplies `ContinuousLinearMap.isBoundedBilinearMap`. `Analysis/Calculus/ContDiff/Basic.lean` proves bounded bilinear maps are `ContDiff` at every order.

The earlier F10BD diagnostic remains evidence about the instance synthesis it actually ran. No subsequent gate has constructed a source or orthogonal/special-orthogonal subgroup atlas. A new atlas construction must state its actual model, topology, domains, inverse and transition obligations.

## 3. Chosen next bounded obligation: F10BT

Under exactly the accepted named PBW norm:

1. Bundle actual left multiplication by a fixed Clifford element as a continuous real-linear map, using accepted finite-dimensionality.
2. Bundle the dependence on the left factor as a continuous real-linear map into continuous endomorphisms.
3. Check the resulting curried map evaluates literally to the existing Clifford product.
4. Use the existing bounded-bilinear calculus to prove joint `ContDiff ℝ n` multiplication for every order `n`.

This supplies ambient calculus needed for smooth finite products of the actual coordinate-plane curves. The bound furnished by a continuous bilinear map has some finite constant; it does not assert the PBW norm has submultiplicativity constant one. No `NormedRing` instance, new norm, or new topology is to be registered.

**Candidate source:** [F10BT](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BTPBWBilinearMultiplicationSmoothness.lean). Its qualification remains pending the strict gate and independent PBW/type/axiom audit recorded in the handoff.

## 4. Ambient routes after F10BT

### Preserve the PBW topology

For a fixed embedded vector `ι(z)`, the actual source action has the ambient expression
`a ↦ projection (a * ι(z) * reverse(a))` when restricted to actual Spin elements. F10BG supplies the inverse/reversal identity on that source. Reversal, vector projection and original gamma evaluation are real-linear maps; continuity and smoothness must use the named PBW structure explicitly.

Once multiplication is qualified as smooth, these formulas can be used to qualify smooth ambient extensions of the source-action coordinates. This is useful chart calculus, but smooth ambient extensions alone do not install a manifold on a proper subgroup.

### Continuous-endomorphism ambient algebra

A second ambient route preserves the original PBW norm on the Clifford vector space: construct the actual left-regular map into its continuous endomorphisms. That endomorphism algebra has the standard operator-norm algebra infrastructure, and its unit group is the existing manifold example in UnitsOfNormedAlgebra.

Before invoking that unit-group instance, qualify the needed completeness, actual algebra-homomorphism laws, injectivity and topological embedding. The source Spin subgroup would still need its own geometric construction. Do not equip all Clifford units with an unproved PBW `NormedRing` instance or identify the source Spin carrier with the ambient unit group.

## 5. Proper-group chart work

### Orthogonal and special-orthogonal matrix targets

A prospective reusable route is a Cayley chart on a neighborhood of the identity, modelled on the native skew-matrix space. The construction must prove:

- exact open domains and invertibility conditions for the chosen Cayley formula;
- image membership, inverse formulas and local-homeomorphism laws;
- smooth chart maps, transitions and translated charts;
- smooth multiplication and inversion;
- the exact derivative normalization of the chosen Cayley convention.

A formula such as `(1+A)*(1-A)⁻¹` has a factor-two normalization at zero; that factor must be derived and matched to the qualified full `F_rs` velocity. Do not silently identify a chart coordinate with a tangent vector before this calculation.

For SO(16), restricting an orthogonal-group atlas requires the appropriate open/submanifold argument for the determinant-one carrier. F10BC's actual image membership is qualified; that membership alone does not construct target charts.

The classical dimensions 36 for `so(9)` and 120 for `so(16)` are planning expectations. A concrete model-space equivalence and its formal properties must be established for whichever chart implementation is selected.

### Actual source Spin carrier

A prospective source route combines finite products of the qualified plane curves with a local chart on the natural nine-vector orthogonal action. F10BS gives the required coordinate-plane velocity data. The route still needs:

1. A smooth multivariable product parameterization and its full derivative.
2. A chosen ordered-coordinate identification for the native skew model, with the existing spanning results reused.
3. A genuine local inverse theorem in the relevant model coordinates.
4. A proof that the lifted parameterization covers a neighborhood in the actual source subtype topology.

The last point cannot be replaced by a section into the orthogonal target. Kernel/fiber control or another local uniqueness theorem is needed to identify nearby source elements with the lifted section. The actual natural-action kernel has not been classified. In particular, neither discrete-kernel nor local-covering claims are qualified.

A direct Clifford-submanifold construction is an alternative, but it must prove its defining equations have the required rank and describe the actual source carrier locally. No subgroup manifold follows merely from algebraic membership or a topological-group structure.

## 6. Final tangent and differential obligations

After source and target atlases and smoothness are proved:

- Identify the actual source tangent Lie algebra with the native `so SpaceIndex ℝ`, checking the real normalization and bracket.
- Identify the target tangent with native `so SpinIndex ℝ`.
- Prove that the actual group map's manifold differential is linear under those identifications.
- Use the qualified same-curve velocities and native plane spanning to compare that differential with F10BB.

The determinant-one theorem for the new nine-vector action is a separate track. F10Q's determinant theorem concerns the original gamma character; no equality with the new natural-action determinant is qualified.

## 7. Qualification controls

Every new gate must retain exact carriers, named topology, pinned Lean/Mathlib, source/audit hashes, fresh warnings-as-errors compilation, complete independent proposition checks and the three-axiom whitelist. Keep both F10BR audit failures as methodological evidence: full theorem types and explicit parameters must be inspected before direct proof-term projections.

No chart, LieGroup instance, tangent equivalence, scalar/multiplication bound, connectedness, covering, kernel or smoothness hypothesis may be introduced as an assumption and then reported as a constructed geometric result.
