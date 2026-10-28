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

## K1D18D accepted — actual Spin isometry, Clifford units, two-generator bridge

[**Green source-exact run #40702992656**](https://github.com/etblink/math/actions/runs/40702992656), job `122867516506`, tested commit `d50de079b4a94673eae6547eacd378f5b338039e`, terminal `completed/success` around 2026-10-28T14:14 UTC. Source blob `3e45853f5abbff26bf0dca170217013415736e9c` and strict workflow blob `a488e579af388871bb5e9c759156da3b1184801c` were published atomically in the same commit. No superseded stale-hash run was launched.

The pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` workflow emitted `FCP_CACHE_PILOT_WARM_REVALIDATION_PASS modules=37 roots=81`, `K1D18D_SOURCE_EXACT_ALL_FOUR_FRESH_COMPILE_PASS`, and `K1D18D_SOURCE_EXACT_ELEVEN_ROOT_TYPES_AXIOMS_PASS`. Exact 81-root ancestry receipts were independently reverified. Fresh warning-as-error source compilation covered A/B/C/D, with 11 individually audited root names and types and axiom sets confined to `propext`, `Classical.choice`, `Quot.sound`.

Three **newly qualified D roots**, all under `FCP.BFSSS1V52K1D18D`:

1. `originalSourceSpin48Isometry_clifford_generator`: the **genuine K1D16 original-source quadratic isometry** implements the already defined S1V31 source Clifford-conjugation action, on every actual 48-real source vector, for all original `spinGroup Q` elements.
2. `originalSourceInvertibleCliffordUnit_rankOne_action`: for a genuinely invertible original Clifford generator `ι Q a` and invertible `Q a`, the exact original 48×48 rank-one matrix represents conjugation by the **actual** unit `unitOfInvertible (ι Q a)`. This does **not** claim that an odd generator belongs to the Spin group.
3. `originalSourceSpin48Isometry_twoGeneratorMatrices_of_unitFactorization`: when an actual source Spin unit is explicitly equal to the product of two genuine original invertible Clifford-generator units, its original vector isometry is exactly the composition of the two original rank-one matrices. The unit equality is a **hypothesis**; the theorem makes **no statement about existence of such a factorization for arbitrary Spin elements**.

New qualified A–D roots: 2 + 3 + 3 + 3 = **11** in addition to the unchanged 81 original accepted ancestry roots. No new 92-root source-cache release was created or claimed.

## K1D18E accepted — actual original Spin linear-map determinant +1 **under two-unit factorization**

**Accepted source-exact strict gate:** [green #40705592985](https://github.com/etblink/math/actions/runs/40705592985), job `122876706860`, exact tested commit `ebd0549a42daeb45a3e4031d429024be1412c148`, terminal `completed/success` around 2026-10-28T14:30 UTC. Exact accepted source module `SU2BFSSPhysicalDomainS1V52K1D18EOriginalSpinTwoFactorDeterminantProbe.lean`, blob `4affb7ed6e0ca213e1317a87f313124f8fa844ae`, exact workflow blob `34e114d05e62bdcb93735894d151d619cb4e425f`. Source repair and workflow hash were committed **atomically**, with no intervening stale-hash run.

The strict run emitted `FCP_CACHE_PILOT_WARM_REVALIDATION_PASS modules=37 roots=81`, `K1D18E_SOURCE_EXACT_FIVE_FRESH_COMPILATIONS_PASS`, `K1D18E_EXACT_FOURTEEN_ROOT_TYPES_AXIOMS_PASS`. All five exact A/B/C/D/E Lean modules freshly compiled warning-as-error; all fourteen declaration roots were independently imported with `#print axioms` and `#check`. The new E roots have only `propext`, `Classical.choice`, `Quot.sound`, no added assumptions or `sorryAx`.

Three **newly qualified E theorem roots**, under `FCP.BFSSS1V52K1D18E`:

1. `originalSourceTwoGeneratorMatrices_det_one`: the product of two original rank-one generator-conjugation matrices has determinant exactly `+1` when the source quadratic value is invertible for each generator. The proof uses the accepted original K1D18C `-1` determinants and `Matrix.det_mul`.
2. `originalSourceSpin48LinearMap_eq_twoGeneratorToLin_of_unitFactorization`: for an **actual element of the original Mathlib `spinGroup Q`**, if `spinGroup.toUnits s = unitOfInvertible (ι Q a) * unitOfInvertible (ι Q b)` and both original Clifford generators and quadratic values are invertible, the **actual K1D13 source linear map** is exactly `Matrix.toLin'` of the original two-matrix product. This is proved through the K1D18D source isometry action bridge.
3. `originalSourceSpin48LinearMap_det_one_of_twoUnitFactorization`: consequently `LinearMap.det (FCP.BFSSS1V52K1D13.originalSourceSpin48LinearMap s) = (1 : ℝ)` for an **actual source Spin48 element with the exact stated two-unit factorization**. This uses **`LinearMap.det_toLin'`**, which is the pinned Mathlib 4.34.1 namespace and explicitly bridges the genuine real-linear determinant to the matrix determinant.

**Preserved red/repair, no conjecture falsified:** [red #40704300020](https://github.com/etblink/math/actions/runs/40704300020), original commit `65cfd4db8dd86b92f683a6e8947e3a9ddf1c8056`, passed source pins, dependency setup, exact 81-root ancestor audit, and the earlier E goals, but the final proof at source line 90 invoked a nonexistent `Matrix.det_toLin'`. The **actual pinned declaration is `LinearMap.det_toLin'`**, confirmed directly in Mathlib's `Mathlib/LinearAlgebra/Determinant.lean` namespace. The only source change was that namespace; both source and strict workflow blob pins were updated in one atomic commit `ebd0549...` and its #40705592985 run qualified all E roots. No recursion/heartbeat limits were raised.

**Accounting:** 81 older strict source-accepted cached roots, plus 2 A, 3 B, 3 C, 3 D, 3 E = **14 newly qualified A–E roots**. The 81-root cache remains sealed exactly as before; **no new 95-root cache** or public main merge is claimed. This count is local to the K1D18 A–E research slice, not a recalculation of the entire BFSS corpus.

**Boundary:** The hfactor hypothesis is not discharged for arbitrary `spinGroup Q`. A two-generator unit-factorization conditional theorem does **not** imply universal `det = 1` for `spinGroup Q`. Do not assert full orientation, a map into SO48, surjectivity, two-sheeted covering, global Spin9 or BFSS spectra from this checkpoint.

## Remaining actual scientific obligation

K1D18D now supplies the exact bridge from the independently defined original Spin isometry to Clifford conjugation and the source rank-one generator units. It proves the two-matrix composition identity only *under an explicit, equality-in-actual-units factorization hypothesis*. The missing unconditional statement is a real group-theoretic parity/closure theorem, not an unidentified coordinate transport. The K1D18E determinant result has now been qualified, but **only under the exact two-unit factorization hypothesis**. No universal determinant theorem follows. Pinned Mathlib `lipschitzGroup Q` is a **subgroup closure** of invertible degree-one source Clifford generators, while `spinGroup Q` is the intersection of the pin group and even-grade subalgebra; it is **not by definition** a list of even generator words. Next establish the true Lipschitz closure determinant/grade-sign character and restrict to `spinGroup.involute_eq`. This is the missing proof of `det(originalSourceSpin48QuadraticIsometry s)=+1`, before any SO(48) packaging, topology, covering, global Spin(9), source Fock/gauge action, or BFSS spectra.

**Standing policy:** truth over green CI, preserve negatives, proof source pins and original label order, typed/field bridges before recursion budgets, separate mathematical formalization from physical claims. Existing 81-root cache retains its original trusted branch; the 12.09 GB uncompressed Lean+Mathlib whole-dependency cache proposal was rejected after measured [green size-only run #40657131188](https://github.com/etblink/math/actions/runs/40657131188).


### Recommended next program: original Lipschitz closure and determinant/grade parity

The highest-value remaining bridge is **not** another two-generator calculation. Construct the actual source-vector action of general `u : (CliffordAlgebra Q)ˣ` *with `u ∈ lipschitzGroup Q`*, using pinned Mathlib `lipschitzGroup.conjAct_smul_ι_mem_range_ι` and the accepted source Clifford generator injectivity. Package its actual real-linear action and multiplicativity before a determinant theorem. Then prove, by the **actual `Subgroup.closure_induction''`** over original generator units, an invariant connecting determinant sign with Clifford `involute` parity, including the generator, inverse, identity and multiplication cases. Only after that subgroup-level invariant is qualified should one restrict it to the true `spinGroup Q` and use `spinGroup.involute_eq` to derive determinant `+1`. This is a **plan**, not a claimed theorem or completed gate.

Maintain strict original 48-label order and source form; prove typed/field bridges before any elaboration-limit adjustments. Preserve all source pins, fixed Lean/Mathlib, exact branch-scoped 81-root cached ancestry, fresh candidate compilation, and independent axiom/type audit. Keep negatives in the same authoritative handoff; avoid duplicate files. Do not silently assume every Spin element has a two-generator factorization, substitute a different group action, or publish to `main` or upstream without explicit authorization.
