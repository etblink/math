# K1D18V7H accepted; K1D18V7I zero-free unit-normal Cartan list candidate

**Project Lead acceptance / source-exact negative-knowledge handoff, 2026-10-30 UTC.** Seek truth over greens; do not promote conditional results, change original BFSS source definitions, or treat a red as accepted.

## V7H strict Gate 3 accepted
- [Run #41021702581](https://github.com/etblink/math/actions/runs/41021702581), job `123950273284`, success, attempt 1, tested SHA `e5e8b2a380702541129a9c7724253654a26b000e`, finished 2026-10-30T07:53:52Z.
- Accepted V7H source blob `f55cd43b5edd99b12aba51d76ee6b3fa75abb103`. Evidence artifact `12962382371`; SHA-256 `8ed1c9b89daa3ffbc2f0acb21b818d61dc5800e84b8d7963d5faa45a130871dc`.
- Log markers `K1D18V7H_EXACT_SOURCE_PINS_ONE_HUNDRED_TWENTY_NINE_DECLARATIONS_PASS`, `FCP_CACHE_PILOT_WARM_REVALIDATION_PASS modules=37 roots=81`, `K1D18V7H_SOURCE_EXACT_THIRTY_SEVEN_FRESH_COMPILATIONS_PASS`, `K1D18V7H_EXACT_ONE_HUNDRED_TWENTY_NINE_ROOT_TYPES_AXIOMS_PASS`.
- Six new accepted V7H source-root axioms strictly whitelisted to `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`. Exactly 37 fresh warning-as-error source modules, 129 independently qualified declaration roots, 81 sealed accepted ancestry roots.
- Accepted mathematical content: native Euclidean normal `u≠0` may be rescaled by `‖u‖⁻¹` to norm 1 without altering its line, hyperplane or reflection. A **zero** Euclidean normal has **identity** native hyperplane-reflection action. Each native hyperplane reflection is a unit-normal one or identity. No sourceSO generation, determinant parity or original Spin48 surjectivity.

## Three-gate negative knowledge retained
1. [V7H Gate 1 red #41018912569](https://github.com/etblink/math/actions/runs/41018912569): `rw` failed to transport equality of submodules through the dependent `Kᗮ.reflection` instance; prior source blob `36f41add9bd467e8603e511def89cb23ee3199bd`.
2. [V7H Gate 2 red #41020331788](https://github.com/etblink/math/actions/runs/41020331788): `simpa only` fixed elaboration, but `linter.unnecessarySimpa` failed strict warning-as-error; blob `7d23c05c6cde8a6338b0282af8e43e0109b4e516`.
3. Gate 3 green replaced `simpa only` with `simp only` at the typed instance rewrite without suppressing linter, increasing limits or changing theorem statements; accepted source blob above.

## V7I five-root CANDIDATE; NOT accepted
- Candidate source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D18V7INativeCartanZeroFreeUnitNormalListProbe.lean`; source hash `b6272c20faa66ec811b265ae36a0d516a5975998`.
- Exact roots: `sourceEuclideanUnitNormals`, `sourceEuclideanUnitNormals_all_unit`, `sourceEuclideanUnitNormals_length_le`, `sourceEuclideanUnitNormals_reflectionProduct_eq`, `originalSourceEuclidean_Cartan_zeroFreeUnitNormals`.
- Defines a zero-removing order-preserving recursive list transformation on arbitrary native Euclidean Cartan normals. Each nonzero normal is replaced by the accepted V7H unit normal; zeros are eliminated as identity factors. Proves every retained normal has norm one, transformed list length ≤ original, and **entire ordered product** of native hyperplane reflections is unchanged. Applies the accepted V7B pinned `LinearIsometryEquiv.reflections_generate_dim` factorization to obtain a list of true unit normals for any auxiliary Euclidean orthogonal transformation, still bounded by the original 48 dimensional finrank.
- Workflow `.github/workflows/bfss-kotler-k1d18v7i-cartan-zero-free-unit-list-strict.yml` uses 38 fresh warning-as-error source modules, 134 independently checked exact declaration types and axioms, 81 sealed source ancestors; pinned Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; no new proof limits, axioms, source geometry, matrix substitutions or basis reordering. **Require completed terminal strict green** and artifact evidence before accepting any V7I root. On red, diagnose earliest source-compilation error; preserve failed SHA and source.

## Still-open mathematical obligations
Unit-normal list length **parity** is not proved by V7I. Need show each unit hyperplane reflection has determinant -1, use accepted V7E determinant +1 to infer even nonzero factor count for transported original sourceSO, and construct exact paired original-source Q-unit normals from the V7C same-label linear equivalence. Then show original sourceSO unit-pair set generates the whole sourceSO before invoking V7A conditional image-surjectivity. Covering topology, global Spin9 lift and BFSS spectra remain separate unproved questions.

No changes to `main`, accepted Lean source files, FCP original provenance or upstream community. Research branch only.
