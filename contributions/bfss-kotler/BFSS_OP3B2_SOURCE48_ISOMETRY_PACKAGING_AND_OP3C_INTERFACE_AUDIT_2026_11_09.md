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
