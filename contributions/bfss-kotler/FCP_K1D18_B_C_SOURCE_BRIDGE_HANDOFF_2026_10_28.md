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

Scope at the K1D18B checkpoint: this identifies the original polar coordinate scalar and true Clifford conjugation formula. At B alone, the exact S1V37 rank-one matrix identification and all-group determinant orientation were still open; the following K1D18C section records that the matrix realization was subsequently proved. The 81 older cached roots and the eight new A–C roots have not been repackaged as a new cache.

## K1D18C accepted — original matrix realization and determinant -1

**Verified accepted at [green strict run #40700492377](https://github.com/etblink/math/actions/runs/40700492377), job `122858662964`, exact tested commit `1aacbe0bf222b0959a5e30eaafe0c13e76b08169`, terminal `completed/success` on 2026-10-28 (around 14:00 UTC).** The accepted candidate lives at:
`lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D18CRankOneActualCliffordGeneratorProbe.lean`.
Exact accepted source blob `9455998333da80845ab6b7514c13ef990c951019`; repair source commit `a35a5bbcf17dcea62455eb6013b43c23c57d859c`, workflow re-pin commit `1aacbe0bf222b0959a5e30eaafe0c13e76b08169`.

The immutable workflow records `FCP_CACHE_PILOT_WARM_REVALIDATION_PASS modules=37 roots=81`, `K1D18C_ORIGINAL_SOURCE_PARENT_AND_CANDIDATE_FRESH_COMPILER_PASS`, and `K1D18C_SOURCE_EXACT_ALL_EIGHT_ROOTS_STRICT_AXIOMS_PASS`. Exact original K1D18A, K1D18B, K1D18C sources freshly compiled with warning-as-error; all eight A–C declarations had independent `#check` types and `#print axioms` results inspected. The three **new K1D18C roots** use only `propext`, `Classical.choice`, and `Quot.sound`. No unproved root, placeholder, alternate source form, dimension or index order was admitted.

1. `source48_rankOneConjugationMatrix_mulVec`: for arbitrary original source vectors `a ell b`, the actual S1V37 rank-one 48×48 matrix acts as `(ell ⬝ᵥ b) • a - b`, via the exact original source labels.
2. `source48_rankOneMatrix_matches_original_clifford_conjugation`: under invertibility of `CliffordAlgebra.ι Q a` and `Q a`, applying **the original Clifford `ι Q`** to that rank-one matrix-vector result yields the original Clifford conjugation product `ι Q a * ι Q b * ⅟(ι Q a)`. This is a **Clifford-embedded equality**; any additional identification with the named source Spin action or group generator remains a separate bridge unless established from already-qualified source theorems.
3. `source48_original_generator_rankOneMatrix_det`: substituting the exact K1D18B normalized source polar row into the original S1V37 rank-one matrix yields determinant `-1`.

### Preserved red/repair and CI publication lesson

- [Red #40659345057](https://github.com/etblink/math/actions/runs/40659345057) passed original source pins, pinned environment, cache provenance/81 roots, and A/B compilation, but failed at K1D18C line 36. The first causal error was `rw [← Matrix.vecMulVec_eq (ι := Fin 1)]` failing to locate the rank-one product pattern; generated `sorryAx` in that failed compile output is **not** an accepted theorem.
- The minimally corrected proof adds explicit source-typed `hmatrix : Matrix.replicateCol (Fin 1) a * Matrix.replicateRow (Fin 1) (-ell) = Matrix.vecMulVec a (-ell)`, proved by exact symmetry of the pinned `Matrix.vecMulVec_eq`, then `rw [hmatrix]`. No additional elaboration allowances, statement changes, extra axioms or source refactors.
- [Red #40700467476](https://github.com/etblink/math/actions/runs/40700467476) was the automatic source-commit trigger **before** the corresponding workflow source pin was updated, so it failed preflight at the intentionally stale hash and does **not** imply any proof failure. The subsequent correctly pinned strict run is #40700492377 and is green.
- Future source+strict-hash edits should be published as a **single atomic repository commit** (Git blob/tree/commit plus compare-and-swap ref update, with unchanged branch restrictions) rather than separate source and workflow commits that create a known stale-hash red. This is operational negative knowledge, not mathematics.

Current newly qualified A/B/C declaration roots: **2 + 3 + 3 = 8**, *in addition to* the 81 previously source-cache-qualified roots. No new 89-root shared ancestry cache has been sealed or advertised; the original accepted 81-root cache and its exact key remain unchanged.

## Remaining actual scientific obligation

C success establishes the matrix action and its equality *after applying the original Clifford generator embedding* to the genuine generator conjugation product, plus sign-correct determinant `-1` for that matrix. Any direct equality with the separately named `sourceSpin48VectorAction` still requires a source-exact bridge, unless already obtained from accepted ancestry. In particular, the odd-generator sign cannot by itself establish even Spin orientation. Pinned Mathlib `lipschitzGroup Q` is a **subgroup closure** of invertible degree-one source Clifford generators, while `spinGroup Q` is the intersection of the pin group and even-grade subalgebra; it is **not by definition** a list of even generator words. Next establish the true Lipschitz closure determinant/grade-sign character and restrict to `spinGroup.involute_eq`. This is the missing proof of `det(originalSourceSpin48QuadraticIsometry s)=+1`, before any SO(48) packaging, topology, covering, global Spin(9), source Fock/gauge action, or BFSS spectra.

**Standing policy:** truth over green CI, preserve negatives, proof source pins and original label order, typed/field bridges before recursion budgets, separate mathematical formalization from physical claims. Existing 81-root cache retains its original trusted branch; the 12.09 GB uncompressed Lean+Mathlib whole-dependency cache proposal was rejected after measured [green size-only run #40657131188](https://github.com/etblink/math/actions/runs/40657131188).
