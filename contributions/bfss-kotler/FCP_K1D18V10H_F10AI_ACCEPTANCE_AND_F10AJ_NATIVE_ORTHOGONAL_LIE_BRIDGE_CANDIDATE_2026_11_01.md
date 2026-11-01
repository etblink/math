# F10AI accepted and F10AJ source-original so(16) native Lie-subalgebra bridge candidate

Date 2026-11-01, branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`, accepted parent `ec3b73a6e4418dba225ba4d9da912611f4c0291b`.

## Accepted F10AI
[Strict run #41348817693](https://github.com/etblink/math/actions/runs/41348817693) SUCCESS at parent, attempt 1. Original source hash pins, Lean 4.34.1 and frozen Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, F10AH ancestry, fresh warning-as-errors compiler and TWO independent exact theorem-type and root axiom audits passed; `V10H_F10AI_TWO_LINEAR_INDEPENDENT_TYPES_AXIOMS_PASS`. Only `propext`, `Classical.choice`, `Quot.sound`; no sorryAx. [Artifact #13100805943](https://github.com/etblink/math/actions/runs/41348817693/artifacts/13100805943), zip SHA256 `d08430d3c12c757800d137e34f55690fc81756270aaf4234136461a40013228b`.

Qualified source mathematical result: `LinearIndependent ℝ source9OrderedGammaPairMatrix` on ALL canonical source SpaceIndex=Fin9 pairs a<b (36). The corresponding source-matrix finite coefficient uniqueness is also qualified. This does NOT imply the full 256 even gamma-image basis, any faithful Spin(9) or Spin(48) lift, or BFSS physical claims.

## F10AJ — THREE unqualified source-exact targets

The pinned Mathlib file `Mathlib/Algebra/Lie/Classical.lean` (frozen rev above) declares `LieAlgebra.Orthogonal.so n R : LieSubalgebra R (Matrix n n R)` and `LieAlgebra.Orthogonal.mem_so` characterizes membership by `Aᵀ=-A`.

1. `source9OriginalGamma_ordered_pair_transpose_neg`: prove each source-original canonical gamma pair has transpose equal negative of itself from ORIGINAL source `gamma_symmetric`, `source9OriginalGamma_anticommute`, `Matrix.transpose_mul`. The proof must not inspect private signed-permutation gamma implementation.
2. `source9OriginalGamma_ordered_pair_mem_so`: prove each source-original pair is in Mathlib's `LieAlgebra.Orthogonal.so SpinIndex ℝ` using EXACT native membership equivalence.
3. `source9OriginalGamma_ordered_pairs_so_linearIndependent`: construct actual native `so(16,R)` subtype gamma pair representatives, use the native subtype inclusion real-linear map and `LinearIndependent.of_comp` to transfer F10AI's qualified 36-word source-real-matrix linear independence.

The resulting theorem if accepted proves a genuine 36-element linear-independent source family inside so(16), NOT an isomorphism of Lie algebras or a `LieHom` from so(9), and NOT any full global Spin(9)/Spin(48) group lift. Lie bracket compatibility and source-label ordering are separate next gates.

Strict gate: hash pinned source original gamma, F10E, F10AI, candidate F10AJ; Lean v4.34.1 + exact Mathlib; accepted ancestry rebuild; fresh warning-as-error compiler; independent exact three declaration types and allowed axioms (`propext`, `Classical.choice`, `Quot.sound`), no sorryAx. Preserve immutable SHA and artifact. No source modifications to accepted modules, resource-limit raising, main merge or upstream PR.
