# BFSS OP3-B2 — original source48 isometry packaging and OP3-C interface audit

**Date:** 2026-11-09  
**Research branch:** `integration/bfss-unified-research-20261108`  
**Status:** OP3-B1 STRICTLY QUALIFIED; OP3-B2 a **new UNQUALIFIED** source/consumer candidate. OP3-C Clifford automorphism NOT STARTED.  
**Inputs:** Original `source48Quadratic`, original `spinGroup source9Quadratic`, source-paired 48-label F10R SO(48) matrix action, accepted OP3-A1/A2 original Clifford generators.  
**Lean:** `4.34.1`; **Mathlib:** `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## 1. Accepted green #42675821883

[Run #42675821883](https://github.com/etblink/math/actions/runs/42675821883), attempt 1, tested commit `3d2566d472ce4132596bba7f434624da31977707`, job `129356778804`, terminal **SUCCESS**. 11 exact pinned original parent/new source and consumer Git blobs, Lean and Mathlib, clean source cold build, separately checked independent consumer and two exact roots in each of source/consumer axiom reports passed. Only `propext`, `Classical.choice`, `Quot.sound` permitted, no `sorryAx`. Receipt markers `OP3B_ORIGINAL_SOURCE48_QUADRATIC_PINS_PASS 11`, `source-axioms.log OP3B_EXACT_TWO_ROOT_AXIOM_GATE_PASS`, `independent-consumer.log OP3B_EXACT_TWO_ROOT_AXIOM_GATE_PASS`, `OP3B_ORIGINAL_PAIRED_SOURCE48_QUADRATIC_INDEPENDENT_STRICT_PASS`. Artifact [#13700432984](https://github.com/etblink/math/actions/runs/42675821883/artifacts/13700432984), runner-reported ZIP SHA256 `96142b9a81d2d52a8b792c43a1678ea289ef157a3509a1697e1c6116091e5450` (not separately downloaded).

**Qualified exact theorem roots:**

1. `FCP.BFSSOP3BOriginalSource48Quadratic.orthogonal_matrix_preserves_source48Quadratic`: for any original `A : Matrix Source48Label Source48Label ℝ` with `A∈Matrix.orthogonalGroup Source48Label ℝ`, `source48Quadratic (A.mulVec v)=source48Quadratic v`, all original `v : Source48Vector`.
2. `FCP.BFSSOP3BOriginalSource48Quadratic.source9SpinOriginalPaired48_preserves_source48Quadratic`: the **existing** F10R `Spin(9) → SO(48)` exact original G1A paired-label action satisfies the identical original-source quadratic preservation.

**Not established:** a packaged isometry equivalence; an original complex Clifford automorphism; a continuous star-preserving Spin(9) action on the full Fock operator algebra; center parity, gauge-physical commutation, original closed Hamiltonian domains, any spectrum claim.

## 2. Interface-First audit and reason for OP3-B2

The accepted F10R source action gives a concrete `Matrix.orthogonalGroup Source48Label ℝ` member and the precisely paired 48-label matrix. The accepted OP3-B1 theorem connects that same matrix action to `source48Quadratic`. The remaining **type-level bridge** before invoking the pinned Mathlib Clifford algebra functor is `source48Quadratic.IsometryEquiv source48Quadratic`.

**Mathlib API evidence (exploratory, verify against exact toolchain):**
- `QuadraticMap.IsometryEquiv Q Q` packages a linear equivalence with `map_app'` proving Q preservation.
- `CliffordAlgebra.equivOfIsometry` accepts that isometric equivalence and yields an original *real* Clifford algebra equivalence.
- `CliffordAlgebra.map_apply_ι` gives the exact generator action from a quadratic isometry.
- `Matrix.mulVecLin A` is already a real-linear map on `Source48Vector`, and `A.transpose` is its actual inverse for a real orthogonal A. Both left/right identities are explicit `Aᵀ A = I`, `A Aᵀ = I`.

The first three API statements are documented in upstream Mathlib; this **does not** replace qualification with the repository's pinned mathlib build. The remaining source compiler obligation is to package the exact matrix and its inverse without a new group representation. No arbitrary equivalent Clifford vector space, no altered source quadratic, and no arbitrary source-generator normalization.

## 3. Proposed OP3-B2 three-root bounded gate

File `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP3B2OriginalSource48QuadraticIsometryEquiv.lean`:

- `orthogonalMatrix_source48IsometryEquiv`: for any original real orthogonal 48×48 matrix A, define the `source48Quadratic.IsometryEquiv source48Quadratic` with forward `Matrix.mulVecLin A`, inverse `A.transpose.mulVec`, the two orthogonal-matrix inverse identities and the **qualified OP3-B1 quadratic preservation theorem**. Do not reprove orthogonality from scratch.
- `source9SpinOriginalPaired48IsometryEquiv`: specialize that generic equivalence to the **existing** original F10R paired-label `source9SpinOriginalPaired48OrthogonalHom g` group member; no new Spin/Matrix representation.
- `source9SpinOriginalPaired48IsometryEquiv_apply`: assert the resulting isometry acts on every original vector by **exactly the F10R source** `source9SpinOriginalPaired48SpecialOrthogonalHom g` underlying `mulVec`, using the already-proved F10R identity.

Independent consumer `lean/diagnostics/BFSSOP3B2OriginalSource48IsometryIndependentAudit.lean`: import the source separately; check three exact statement types and the derived actual `source48Quadratic` preservation at the original `spinGroup source9Quadratic` and `Source48Vector`.

New workflow `.github/workflows/bfss-op3b2-original-source48-isometry-equiv-strict.yml`: pin 11 exact Git blobs (original BFSS, original 48-vector Q, exact paired-label source Spin group maps, OP3-B1 accepted parent, OP3-A2 interface, new source and consumer), Lean/Mathlib; source cold build, independent consumer, exact **3-root** `#print axioms` both ways, no `sorryAx`, original source warnings or unapproved axioms; receipt must explicitly state OP3-C and full operator action remain unqualified.

**If green:** This produces a canonical, source-faithful `IsometryEquiv` directly suitable as input to the pinned real `CliffordAlgebra.equivOfIsometry`. It does **not** establish `g↦IsometryEquiv` group law or complex Clifford/Fock action. Move to OP3-C0 (real Clifford generator covariance) only after independently auditing the exact API and same-order group-action orientation.

**If red:** Check the first causal goal (in particular `Matrix.mulVecLin` struct update, `Matrix.mem_orthogonalGroup_iff` orientations, or definitional evaluation of the real isometry). Use the smallest matrix-only lemma; do not increase recursion budgets or substitute a different 48-dimensional model. Record and classify the red, then repair a single diagnosed boundary or hold per the two-red rule.

## 4. Post-OP3-B2 / OP3-C guardrails

The intended next dependency ladder is:

1. OP3-C0: `CliffordAlgebra.equivOfIsometry (source9SpinOriginalPaired48IsometryEquiv g)` on the **real** source Clifford algebra, verify `ι` covariance on the original 48-label source vectors, with exact g-action orientation and no arbitrary sign.
2. OP3-C1: verify the algebra-equivalence composition law `g*h` versus `g∘h` on original generators using the source F10R `MonoidHom`, and preserve the inverse/identity coherences.
3. OP3-C2: construct the **complexified** original-source Clifford automorphism, ensuring correct base change `source48Quadratic.baseChange ℂ` and the tensor generator `1 ⊗ₜ[ℝ] v`. This requires its own exact compatibility theorem; real Clifford equivalence alone does not establish it.
4. OP3-D: transport the complex action through the already-qualified M3I `ℂ`-`AlgEquiv` to the complete original `Fermion 2 →L[ℂ] Fermion 2` algebra, check the original normalized generator.
5. OP3-E: **independently** establish star preservation (not implied by `AlgEquiv`), correct negative center action by parity conjugation on operators, continuity/topology and source gauge compatibility. The original source physical quadratic form/domain and sector spectral results remain separate.

Retain strict distinction between algebraic action, topological group action and physical operator-domain theorems. In the analytical lane, the corrected full Fock-operator weight bound is `M=12`, not the Fock-vector-only `M=6`; no source spectral conclusion follows from OP3-B2.

**Methodological lesson:** Recover the qualified interface and apply the smallest existing universal construction. Do not rebuild a complex Clifford model or force giant finite-sum equalities when a canonical isometry lift is already present.

## OP3-B2 initial RED #42678500270 — nested isometry construction recursion

**Exact failure evidence:** [Run #42678500270](https://github.com/etblink/math/actions/runs/42678500270), attempt 1, exact tested commit `1828e0b40c2ea73c2f41132f0f0c649cc2382739`, job `129366291181`, terminal **FAILURE**. Frozen source integrity preflight **passed with all 11 pinned Git blobs**; Lean `4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored; original F10R and qualified OP3-B1 cold built successfully. The new `OP3B2OriginalSource48QuadraticIsometryEquiv.lean` failed, so its independent consumer and strict root audit were **not** reached. Artifact [#13700689983](https://github.com/etblink/math/actions/runs/42678500270/artifacts/13700689983); runner-reported ZIP SHA256 `00b3268445582a6e082e01f02f2909637b1d896bc779fec363acee99778e17f1` (not independently downloaded).

**First causal error:** `OP3B2OriginalSource48QuadraticIsometryEquiv.lean:36:18: maximum recursion depth has been reached`, at the first declaration of `orthogonalMatrix_source48IsometryEquiv`. Its original body attempted a nested Mathlib `QuadraticForm.IsometryEquiv` structure built from `{ A.mulVecLin with invFun := A.transpose.mulVec, left_inv := ..., right_inv := ... }`, then `map_app' := orthogonal_matrix_preserves_source48Quadratic A hA`. Missing `orthogonalMatrix_source48IsometryEquiv` at line 65, failing `rfl` at line 79 and subsequent `sorryAx` are **not independent acceptance evidence**; they stem from the first definition's failure. Do not infer a false original quadratic preservation theorem: OP3-B1's exact quadratic-preservation roots remain cold/independently qualified.

**Pinned Mathlib interface inspection:** The exact source file `Mathlib/LinearAlgebra/QuadraticForm/IsometryEquiv.lean` at Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` defines `QuadraticMap.IsometryEquiv` as a structure **extending `LinearEquiv` with a single `map_app'` quadratic preservation field**, with a corresponding coercion/evaluation contract. Therefore the specific nested structure elaboration and its 48-dimensional dependent source expressions can be avoided without weakening the theorem: separate the linear equivalence and then add exactly the already-qualified quadratic preservation proof.

**Bounded architecture repair — do not increase recursion budget:**

1. Introduce the reusable same-carrier `orthogonalMatrix_source48LinearEquiv : Source48Vector ≃ₗ[ℝ] Source48Vector` for original orthogonal A, with **exact** forward `A.mulVecLin`, inverse `A.transpose.mulVec`, and both proven original transpose-product identities. Its theorem root is independently printed and consumed.
2. Rebuild `orthogonalMatrix_source48IsometryEquiv` as the thin structure `{ orthogonalMatrix_source48LinearEquiv A hA with map_app' := orthogonal_matrix_preserves_source48Quadratic A hA }`. Do not rewrite or unfold original weighted-sum quadratic formulas.
3. Keep `source9SpinOriginalPaired48IsometryEquiv` and `source9SpinOriginalPaired48IsometryEquiv_apply` as the same exact Spin9/source-48 scoped statements.
4. Extend the independent consumer to check the new original `LinearEquiv`; strengthen both source and independent `#print axioms` checks to **four exact roots**; re-pin only the two modified candidate source/consumer blobs. All original parents, matrix action, Mathlib, Lean versions, source semantics, axiom policy and cold build requirements remain frozen.

**Decision on subsequent red:** If this split still exhausts recursion or reveals a genuine incompatibility, **HOLD** OP3-B2 under the two-red review rule. Perform a source-level comparison with prior qualified source `LinearEquiv` and the pinned Mathlib constructor definitions, and isolate one low-cost matrix-only carrier example before another strict gate. Never raise `maxRecDepth` or substitute a different quadratic form/group carrier merely to obtain green. A future green could qualify only the exact four-root matrix/isometry/source action statements, not the OP3-C Clifford automorphism, complex M3I transport, star/continuity/central parity or spectrum.

## OP3-B2 second RED #42680558526 — HOLD, preserve independently valid linear-equivalence boundary

**HOLD DECISION — TWO SAME-MECHANISM REDS:** [Run #42680558526](https://github.com/etblink/math/actions/runs/42680558526), attempt 1, tested exact commit `330cce0a90879a270c93303a44638656e01b3474`, job `129373627244`, terminal **FAILURE**. The gate again passed all **11 exact source/consumer Git blob pins**, Lean 4.34.1, pinned Mathlib, and inherited F10R/OP3-B1 cold source compilation. It failed in the new OP3-B2 source *before* the standalone independent consumer or the exact four-root acceptance audit. Artifact [#13701809103](https://github.com/etblink/math/actions/runs/42680558526/artifacts/13701809103), runner-reported ZIP SHA256 `aacf9e5cd5b37c5cebec88b3a25690fafad39586488f9aefd79dcc6b45cf2b44` (not independently downloaded).

**New information is highly discriminating:**
- `orthogonalMatrix_source48LinearEquiv` **elaborated successfully** in the failing module; the compiler printed axioms `[propext, Classical.choice, Quot.sound]` for that newly separated declaration. Because the **whole OP3-B2 gate is red and the independent consumer was not reached**, this is preliminary compiler evidence, **not a qualified standalone theorem**.
- The **first causal failure** moved from the original nested `IsometryEquiv` declaration's opening (first red line 36) to the new thin wrapper field `OP3B2OriginalSource48QuadraticIsometryEquiv.lean:68:16: maximum recursion depth has been reached`. That is the field `map_app' := orthogonal_matrix_preserves_source48Quadratic A hA` inside `{ orthogonalMatrix_source48LinearEquiv A hA with ... }`.
- Errors at new lines 75 (unknown `orthogonalMatrix_source48IsometryEquiv`), 89 (`rfl` failed to expand the failed wrapper) and 92 (unknown constant) are downstream error recovery. Subsequent `sorryAx` traces **are not accepted proof artifacts**.
- Compared with first red [#42678500270](https://github.com/etblink/math/actions/runs/42678500270), this isolates the bottleneck to **elaboration of a high-dimensional dependent quadratic-isometry structure's `map_app'` interface**. It does **not** show failure of the original 48D orthogonal representation, of its inverse matrix, of `source48Quadratic` preservation, or of the actual Clifford physics.

### Read-only pinned Mathlib interface audit (2026-11-09)

At exact pinned Mathlib revision `d13f23b723b8a846827a245b89c10fc7d3f11612`:

- `Mathlib/LinearAlgebra/QuadraticForm/IsometryEquiv.lean` defines `QuadraticMap.IsometryEquiv` **extending** `LinearEquiv` with `map_app' : ∀ m, Q₂ (toFun m) = Q₁ m`. The successful separate linear-equivalence elaboration and failed wrapper localize the immediate problem.
- `Mathlib/LinearAlgebra/QuadraticForm/Isometry.lean` defines the *weaker* `QuadraticMap.Isometry` (`Q →qᵢ Q`), extending just `LinearMap` with the same type of quadratic preservation field. It has `Isometry.comp`, `Isometry.id` and pointwise extensionality.
- `Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean`, pinned lines 325–352, defines `CliffordAlgebra.map : (Q₁ →qᵢ Q₂) → CliffordAlgebra Q₁ →ₐ[R] CliffordAlgebra Q₂`, **without requiring `IsometryEquiv`**. Its `map_apply_ι`, `map_comp_map`, and `map_id` supply the original-source generator and group-composition interface. Lines 359–367 prove `leftInverse_map_of_leftInverse`; lines 381–391 construct `CliffordAlgebra.equivOfIsometry` by transporting two inverse `Isometry` maps. This is evidence that **the proposed packaged isometric equivalence may be an unnecessary prerequisite**, not evidence that a substitute group/action is legitimate.
- Even an `Isometry` constructor still carries `map_app'` and might produce a similar elaboration failure. An alternative pinned source construction is `CliffordAlgebra.lift` (same `Basic.lean`): create the algebra map from the original `CliffordAlgebra.ι Q ∘ₗ A.mulVecLin` and prove the Clifford square relation using accepted OP3-B1, without packaging either quadratic-isometry structure. Any such alternate construction needs its own exact generator/identity/composition and inverse proofs and cold independent acceptance.

### Revised Project Lead decision: stop modifying OP3-B2 and review proof architecture

**Current disposition: OP3-B2 HOLD.** Do not submit a third `IsometryEquiv` wrapper variant, increase recursion/heartbeat limits, use `convert!`/whole-structure `simpa` to mask the elaboration issue, or change any accepted source statements. No new source or workflow run is authorized by this diagnostic alone.

**Research direction (not an acceptance):** Before implementation, prepare a minimal source-level interface comparison of `QuadraticMap.Isometry` versus direct `CliffordAlgebra.lift` on the **exact original** `Source48Vector` / `source48Quadratic`, with the original F10R paired-label `Spin(9) → SO(48)` group map and an explicit same-order action. Prefer the *least* elaboration-intensive interface that produces a generator-covariant real Clifford `AlgHom`; verify identity and composition on original generators, then inverse via actual `g⁻¹`, all without postulated equivalences. Independently verify group law and parent pins before promoting an `AlgEquiv` or an action. This proposal **bypasses the unqualified `IsometryEquiv` convenience package** but must not bypass the mathematics of quadratic preservation or inverse correctness.

**Decision gate for renewed implementation:** Record the exact pinned Mathlib method signature, the original vector/source types, the smallest two algebra/map generator statements, the original group law convention, and a minimal *cheap* Lean diagnostic plan. Then choose **one architecturally distinct** candidate (likely direct quadratic `Isometry` → `CliffordAlgebra.map`, with direct `CliffordAlgebra.lift` as fallback) on a bounded gate; do not treat a new tactic string for the same wrapper as an architectural pivot. Retain OP3-B1 qualified and OP3-A2 qualified. OP3-C original real Clifford automorphism, complex M3I transport, star, central parity, topology, gauge/physical domains and any spectral theorem remain **unqualified**.

**Negative-knowledge takeaway:** The separate orthogonal `LinearEquiv` is demonstrably elaboratable, whereas *both* the nested and thin `IsometryEquiv` packaging attempts recurse. The scientific input is intact; the proof-engineering bottleneck has moved to an optional abstraction. **When a convenience abstraction blocks the critical path, inspect the target theorem's minimum actual interface before spending another expensive proof gate.**
