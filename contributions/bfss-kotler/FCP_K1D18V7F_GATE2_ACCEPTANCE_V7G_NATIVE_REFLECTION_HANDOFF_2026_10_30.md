# K1D18V7F — strict acceptance; V7G native Euclidean reflection research

**Project Lead handoff, 2026-10-30 UTC.** The previous red is retained, the exact repaired proof and the resulting green separately identified. Scope is original 48-label source Q, original Clifford rank-one matrix, and exact source Spin representation.

## Accepted K1D18V7F Gate 2

[Run #41008647886](https://github.com/etblink/math/actions/runs/41008647886) verified at SHA `820f9d6bb996cb6e62e42188f0e55ab517f8aa06`; job `123909250315`, attempt 1, completed success at 2026-10-30T05:40:13Z. Accepted source SHA `5712cb4ca7a93e4b610cd977e44cc34054210b4b`. Retained artifact `12957072013` digest `sha256:abd78dd45761f54266c4647d980c0c3add9d88d797040dccc72a64f9b969c569`.

Independent log evidence: `K1D18V7F_EXACT_SOURCE_PINS_ONE_HUNDRED_EIGHTEEN_DECLARATIONS_PASS`; `FCP_CACHE_PILOT_WARM_REVALIDATION_PASS modules=37 roots=81`; `K1D18V7F_SOURCE_EXACT_THIRTY_FIVE_FRESH_COMPILATIONS_PASS`; `K1D18V7F_EXACT_ONE_HUNDRED_EIGHTEEN_ROOT_TYPES_AXIOMS_PASS`. All five new V7F roots compiled and independently audited with only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`.

Accepted mathematical content: original source Q polar form is twice the real inner product in canonical same-label EuclideanSpace. Original source Clifford rank-one matrix on a source-Q-unit vector `u` acts after the accepted V7C linear equivalence `E` as `(2*inner ℝ (E u) (E w)) • E u - E w`. A Q-unit original vector maps to a Euclidean unit vector. Original source line-axis action equals the negative of the *scalar formula* for a hyperplane reflection; native reflection operator correspondence is not yet qualified.

**Negative evidence retained:** Gate 1 [run #41000014744](https://github.com/etblink/math/actions/runs/41000014744), original blob `1a91aca261e0832d31f8194143199dae312dbc42`, failed only at the omitted explicit argument to `invOf_mul_self`. Fix was `invOf_mul_self (Q u)`. Do not interpret the first red or repaired green as full group surjectivity.

## New research candidate K1D18V7G — NOT ACCEPTED pending strict CI

Source file `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D18V7GOriginalSourceNativeEuclideanReflectionCorrespondenceProbe.lean` exact blob `63a1c2e95b5429b9b10dc49957182f89c475a71e`. Five candidate roots: `euclideanUnitLineReflection_apply`, `originalSourceUnitRankOne_eq_nativeEuclideanLineReflection`, `originalSourceUnitRankOne_eq_negativeNativeHyperplaneReflection`, `originalSourceUnitPairMatrices_eq_nativeHyperplanePairAction`, `originalSourceSpinUnitPair_eq_nativeHyperplanePairAction`.

At the pinned Mathlib version `d13f23b723b8a846827a245b89c10fc7d3f11612`, `Mathlib/Analysis/InnerProductSpace/Projection/Reflection.lean` lines 97–107 supply:
- `Submodule.reflection_singleton_apply`: native line reflection at `Eu` is `2 • (inner(Eu,Ew)/‖Eu‖²) • Eu-Ew`.
- `Submodule.reflection_orthogonal_apply`: native hyperplane reflection is the **negative** of the line reflection.

Combine with *accepted V7F* source unit norm and original source rank-one matrix formula. Then show the original source unit-pair matrices, and actual original Spin48 unit-pair action, correspond to two native hyperplane reflections in the correct order. This is a bounded reflection identification; no unproved decomposition, arbitrary normal normalization, parity or group generation premise is inserted.

Workflow `.github/workflows/bfss-kotler-k1d18v7g-source-native-reflection-correspondence-strict.yml` structurally preflighted for 36 fresh warning-as-error source modules, 123 exact declaration/axiom roots and 81 sealed ancestor roots, strict Lean 4.34.1 and exact pinned Mathlib, no new axioms or proof limits. Only independently verified terminal green and axiom evidence can qualify V7G. A red identifies a new type/interface boundary and must be retained as feedback.

## Frontier after V7G

(1) Convert arbitrary native Cartan–Dieudonné hyperplane factors into original Q-unit normals; handle the **zero normal** which yields identity. (2) Extract reflection parity from actual determinant +1 accepted in V7E, handling degenerate/zero factors and orientation. (3) Pair nonzero hyperplanes, transport their action through the source equivalence, construct actual sourceSO unit-pair witnesses, and prove `Subgroup.closure sourceSOUnitPairMatrixSet = ⊤`. (4) Only then apply V7A's conditional Spin48 surjectivity. Covering topology, global Spin9 covariance and BFSS spectra remain unproved.

Owner branch only; no changes to `main`, FCP canonical provenance, accepted Lean modules, upstream community, or original source label ordering.
