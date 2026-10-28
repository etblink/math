# FCP BFSS K1D18 — source polar row to genuine Clifford rank-one matrix

**Project Lead live handoff, 2026-10-28 UTC.**
Branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.
Maintains original K1D17 checkpoint and exact sealed 81-root source ancestry.
No changes to `main` or community upstream.

## K1D18A accepted gate

[Green run #40656053445](https://github.com/etblink/math/actions/runs/40656053445), tested SHA `ed53aa8c7b88a9484b7503ee1c20ea444ff9871c`, establishes the original `Source48Label = Fin 24 × Fin 2` coordinate reconstruction and exact normalized source polar-row self-contraction equal to 2. Candidate source blob `9dc33c924c22e8823ddc905440feb05fb8ce3d0f`. The previously red #40655061607 was caused by the nonexistent pinned identifier `Matrix.dotProduct`; correction to the actual open-scoped `dotProduct` was strict green. Two independent new declaration roots; no arbitrary Spin determinant.

## K1D18B accepted gate

[Green owner strict run #40658419494](https://github.com/etblink/math/actions/runs/40658419494), job `122715067756`, tested exact commit `6e9b0426c3c4fe5333cfdda15aede5fdc17baec1`, terminal `completed/success` around 2026-10-28T08:46 UTC. Candidate source blob `d0531752fa8f63df4f94294d6cd748fed1af223e`.

The job demonstrated the exact branch-scoped cache key `bfss-fcp-k1d17-source-accepted-ancestors-v1-389ecdcc-lean4341-d13f23b-Linux-X64`, printed `FCP_CACHE_PILOT_WARM_REVALIDATION_PASS modules=37 roots=81`, freshly compiled original K1D18A + new K1D18B warning-as-error with both new nonempty `.olean` outputs, and independently checked five new-or-parent exact declaration roots, with allowed axioms only `propext`, `Classical.choice`, `Quot.sound` and no unproved axioms. Terminal marker: `K1D18B_SOURCE_EXACT_NEW_THREE_ROOTS_PARENT_TWO_STRICT_AXIOMS_PASS`.

**Three K1D18B qualified roots**, in namespace `FCP.BFSSS1V52K1D18B`:

1. `source48NormalizedPolarRow_dot`: for all source original `a,b` with invertible original `source48Quadratic a`, `source48NormalizedPolarRow a ⬝ᵥ b = ⅟(Q a) * QuadraticMap.polar Q a b`. This uses the exact source 48-label finite vector space and no surrogate form.
2. `source48NormalizedPolarRow_dot_self`: the source row has self-contraction exactly 2, rebased from K1D18A.
3. `source48_clifford_generator_conjugation_from_row`: for `[Invertible (CliffordAlgebra.ι Q a)]` and `[Invertible (Q a)]`, original Clifford conjugation of an arbitrary source vector `b` agrees with `((row a ⬝ᵥ b) • a - b)`, using the accepted S1V37 source Clifford conjugation theorem.

Scope: this identifies the original polar coordinate scalar and true Clifford conjugation formula. It does **not yet** identify the exact S1V37 rank-one matrix with the true source action, or prove determinant orientation for all `spinGroup Q`. There are 81 older cached roots, plus 2 K1D18A, plus 3 K1D18B qualified new scoped roots; they have not yet been packaged as a new immutable 86-root shared cache.

## K1D18C candidate — matrix realization and determinant -1

Unaccepted source module:
`lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D18CRankOneActualCliffordGeneratorProbe.lean`
Git blob `eaf0e0190fce57f7548ce478e8e75497c95e6fc7`, source creation commit `18be2e8284d16e60f6c77f61f26089257c8031fc`.

[Strict candidate run #40659345057](https://github.com/etblink/math/actions/runs/40659345057) triggered by workflow creation commit `24c19db60641bc848650f8514e0f5a3e51c1c098`; **not accepted until terminal strict result and exact log inspection**. The candidate's three targeted declarations:

1. `source48_rankOneConjugationMatrix_mulVec`: source-exact `S1V37.source48_rankOneConjugationMatrix a ell *ᵥ b = (ell ⬝ᵥ b) • a - b`, using pinned `Matrix.vecMulVec_eq`, `Matrix.vecMulVec_mulVec`, and explicitly typed scalar/function bridges.
2. `source48_rankOneMatrix_matches_original_clifford_conjugation`: substitute the **actual K1D18B original source row** to identify the original rank-one matrix's vector action with the true source Clifford generator conjugation, under both invertibility hypotheses.
3. `source48_original_generator_rankOneMatrix_det`: apply original `S1V37.source48_rankOneConjugationMatrix_det` with verified K1D18B original row self-contraction to obtain determinant `-1` for the generator matrix.

Candidate C's first proof introduces explicit typed intermediate `hprod` for the `replicateCol * replicateRow` matrix-vector product and `hscalar` to bridge `MulOpposite.op` scalar action to the commutative real source, **without raising elaboration budgets**. If red, inspect the first compiler error (especially the `MulOpposite` scalar bridge or a lemma invocation) and repair only the exact API/coercion problem; do not generalize the theorem or claim a counterexample.

## Remaining actual scientific obligation

Even a C success only proves each genuine invertible original Clifford generator's vector action has the sign-correct rank-one representation and determinant `-1`. Pinned Mathlib `lipschitzGroup Q` is a **subgroup closure** of invertible degree-one source Clifford generators, while `spinGroup Q` is the intersection of the pin group and even-grade subalgebra; it is **not by definition** a list of even generator words. Next establish the true Lipschitz closure determinant/grade-sign character and restrict to `spinGroup.involute_eq`. This is the missing proof of `det(originalSourceSpin48QuadraticIsometry s)=+1`, before any SO(48) packaging, topology, covering, global Spin(9), source Fock/gauge action, or BFSS spectra.

**Standing policy:** truth over green CI, preserve negatives, proof source pins and original label order, typed/field bridges before recursion budgets, separate mathematical formalization from physical claims. Existing 81-root cache retains its original trusted branch; the 12.09 GB uncompressed Lean+Mathlib whole-dependency cache proposal was rejected after measured [green size-only run #40657131188](https://github.com/etblink/math/actions/runs/40657131188).
