# BFSS K1D18 — imported Lean reuse audit and V7C repair (2026-10-30)

## Scope and truth status

Research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.
This is a **targeted source/dependency reuse review**, not a declaration-by-declaration claim that every FCP research note was ported or that every imported module is strictly qualified.

- The current public `etblink/Foundational-Convergence-Program` `main` tree (`cf06212a57db0ceffad74bd78280a8a240856a17`) contains **445 tracked tree entries and zero paths ending in `.lean`**. It is the research/provenance repository, not a second compilable Lean codebase in its present tracked tree. Some research records may discuss/propose Lean code; this tree test alone does not establish complete transfer of every FCP research claim.
- The exact current `etblink/math` research branch, before the V7C Gate2 commit, contains **97 direct `.lean` source files under** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler` (directory tree SHA `e86e0eb6f87c741b710fd6b6bf8fb5af03457d03`), as well as 75 direct BFSS base entries including the separate `Contrib` subtree. No assumption that these 97 modules are all qualified: the earlier `K1D18V4` candidate is retained and unaccepted; the active V7C Gate1 did not qualify. Depend on tested declarations, not mere file presence.
- K1D17 audited 81 source declaration roots across **37** source modules under a sealed accepted predecessor gate; 64 is a historical cumulative contributor-module total and must not be confused with 37 or the current 97. Later gates add fresh candidates and independently audit their types/axioms. Source code imported into the repository and a qualifying strict CI proof are distinct states.

## Reusable source inventory examined

| Existing original source | Exact reusable declarations / role | Use and limits |
| --- | --- | --- |
| `S1V0StandaloneOrthogonalGeometryProbe` | `Source48Label = Fin 24 × Fin 2`, `Source48Vector`, `source48Quadratic` | **Canonical** original form; never silently replace with an inferred default Euclidean metric. |
| `S1V31CanonicalAllSpin48RealVectorActionProbe`, `S1V37Original48CliffordGeneratorRankOneDeterminantProbe` | Original Clifford Spin48 action and source rank-one matrix | Exact action and matrix; do not swap in another basis/action. |
| `K1D12`, `K1D13`, `K1D14` | Original source action laws, GL real-linear representation, two-sign kernel | Accepted ancestry, reusable for genuine Spin homomorphism and fibers. |
| `K1D15`, `K1D16`, `K1D17` | Source quadratic preservation, `originalSourceSpin48QuadraticIsometry`, isometry action one/mul/inv | Source-exact Q.IsometryEquiv. **K1D17 already explicitly prescribes typed structure-field bridges before increasing limits**; K1D16 historically used high recursion for a different declaration, which is not permission to raise V7C limits. |
| `K1D18Q` | `quadraticPreservingGLGeneric` and generic source-form membership bridge | **Key technique**: prove on an abstract typed quadratic form, then instantiate at source Q. Source-Q elaboration is not required inside the generic proof. This motivates V7C Gate2. |
| `K1D18R`, `K1D18S`, `K1D18T` | `source48SpecialOrthogonalWitnessGL`, genuine source Spin→sourceSO hom, exact two-sign fibers | Reuse the actual target/hom; neither original-source group surjectivity nor covering is established. |
| `K1D18V1–V3` | Actual rank-one Clifford matrix axis and polar-orthogonal actions, involution, Q-preservation | Useful for the later reflection correspondence. The original rank-one map is **line-axis reflection**, not automatically Mathlib's hyperplane reflection. |
| `K1D18V4A`, `K1D18V5` | Source-Q positivity, normalization of nonzero original source vectors | Reuse without expanding all 48 finite weighted squares. `V4` (without A) has a distinct negative history and must not be promoted from file presence. |
| `K1D18V6A–V6D` | Actual two-unit Spin membership, exact original matrix action, determinant +1, no-instance-premise helper | Already discharge pair-image and determinant obligations for constructed pairs; not general Spin generation. |
| `K1D18V7A` | `sourceSOUnitPairMatrixClosure_le_sourceSpinImage`, explicitly conditional `sourceSpinSO_surjective_of_unitPairMatrixGeneration` | **Accepted boundary**: source SO generation, not inclusion, remains open. |
| `K1D18V7B` | `source48Quadratic_eq_euclidean_norm_sq`, pinned `LinearIsometryEquiv.reflections_generate[_dim]` for auxiliary 48-label EuclideanSpace | Exact L² norm-square bridge and auxiliary Cartan theorem already accepted; reusable without re-deriving reflection generation. |

The upstream pinned Mathlib file `Mathlib/LinearAlgebra/QuadraticForm/IsometryEquiv.lean` defines `QuadraticMap.IsometryEquiv.map_app'` as the exact preservation field and `QuadraticMap.IsometryEquiv.map_app` as its public theorem. Pinned `Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean` has the Cartan–Dieudonné `LinearIsometryEquiv.reflections_generate_dim` and `reflections_generate` already. These two libraries must be applied through explicit source-to-auxiliary equivalences.

## V7C Gate 1 causal red

[Strict run #40992526624](https://github.com/etblink/math/actions/runs/40992526624), job `123858056169`, SHA `bc062169e8f19496bcc37eab3c85dce4493b8dce`, attempt 1, completed failure 2026-10-30T02:45:24Z, source blob `b615f1fd0b774f4529aa018e8b50e598a3f3bdb6`. Log archive [artifact #12950027251](https://github.com/etblink/math/actions/runs/40992526624/artifacts/12950027251), ZIP SHA256 `0372b98bad110018cec987ac6d8555eb9b939037eb577acb5f4f19718b91b4aa`.

- Exact source pins and restored original 81-source-root ancestry passed; 31 previous source modules compiled warning-as-error.
- At source V7C **66:29**, direct source-specialized elaboration `have hQ : Q (i x) = Q x := i.map_app' x` failed **maximum recursion depth reached**.
- The first four V7C declarations emitted only allowed `propext, Classical.choice, Quot.sound` axiom reports; their containing module nevertheless failed. The V7C norm-preservation theorem and dependent real-linear-isometry packaging had `sorryAx` because of the compiler error and are NOT accepted. The independent **103 root** audit was SKIPPED.
- This is a source-specialization elaboration failure; it is not a disproof of Q-isometry transport and does not justify raising `maxRecDepth`.

## V7C Gate 2 reuse-led proof candidate (NOT ACCEPTED)

1. Lift the preservation argument **out of the concrete source expression**: generic `quadraticIsometry_norm_map_of_linearEquiv_norm_sq`, with explicit `q : QuadraticForm ℝ V`, `e : V ≃ₗ[ℝ] W`, premise `∀x, ‖e x‖²=q x`, and genuine `i : q.IsometryEquiv q`, proves `‖e(i(e.symm v))‖=‖v‖`. It uses only `i.map_app'`, typed norm-square premises, and nonnegativity in the generic context.
2. Original V7C `originalSourceQIsometry_toEuclidean_norm_map` becomes a small exact specialization using accepted V7B and explicit original same-label `WithLp.linearEquiv`. **No theorem weakening, extra mathematical premise, surrogate Q, source-action or basis replacement.**
3. Add independent `#check` and `#print axioms` for the new generic root. Strict gate contract becomes **32 fresh modules / 104 independent source type/axiom roots / 81 accepted original ancestor roots**, pinned Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; no recursion/heartbeat increases.
4. Status is **CANDIDATE until the complete strict gate is green and declaration/axiom evidence independently inspected**. If it remains red, review first causal line and distinguish helper generic failure from source specialization; do not fix by silently assuming the still-open sourceSO generator equality.

## Unproved research boundary

Do not claim original Spin(48)→SO(48) image surjectivity, Cartan reflection equivalence in the original 48-label Clifford source, group-generation equality, topological covering, global Spin(9) lift, or BFSS spectral existence. V7B has an auxiliary Euclidean reflection factorization, but transport and original reflection parity matching remain necessary.
