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

## K1D18F accepted — genuine source Lipschitz vector action and real-linearity

[**Green run #40709423123**](https://github.com/etblink/math/actions/runs/40709423123), job `122890307352`, tested commit `f911898f986a0f621cbc1f896618422cb6447189`, completed/success on 2026-10-28 around 14:54 UTC. Source blob `1562aaf20f77a96b7dd27afde090e59ff1258188`; strict workflow blob `f3581615aedbb17a4dec1ad1149dcf32100b6d94`. Atomically committed on **existing** cache-enabled branch.

Using the actual pinned `lipschitzGroup.conjAct_smul_ι_mem_range_ι` and previously accepted `FCP.BFSSS1V30.source48_cliffordGenerator_injective`, the **four qualified new roots** in `FCP.BFSSS1V52K1D18F` are:

1. `sourceLipschitz_conjugated_generator_unique`: every genuine Lipschitz-subgroup unit has a *unique* original 48-real source vector representing its conjugated Clifford generator.
2. `sourceLipschitzVectorAction_clifford_generator`: the uniquely chosen source vector exactly implements the **actual original Clifford conjugation**, not a new independent action.
3. `sourceLipschitzVectorAction_add`: source vector additivity.
4. `sourceLipschitzVectorAction_smul`: real scalar-linearity on the original source module.

Strict evidence: exact same-branch accepted 81-root cache restored, `FCP_CACHE_PILOT_WARM_REVALIDATION_PASS modules=37 roots=81`; fresh warning-as-error compiler over A–F emitted `K1D18F_SOURCE_EXACT_SIX_FRESH_COMPILATIONS_PASS`; independent 18-root type and axiom audit emitted `K1D18F_EXACT_EIGHTEEN_ROOT_TYPES_AXIOMS_PASS`, allowing only `propext`, `Classical.choice`, `Quot.sound`. No determinant or grade character was claimed.

## K1D18G accepted — actual source Lipschitz group laws and Spin restriction

[**Green run #40710730674**](https://github.com/etblink/math/actions/runs/40710730674), job `122894972826`, tested commit `dbf8f4a59d703a46144ed7934578fb804890931e`, completed/success around 2026-10-28T15:02 UTC. Source blob `91d71119f865d4aec1e09bb55f9297e29e7174a4`; workflow blob `2cdb211097be62a46f5985e4e9dee9768ba34646`. Source and workflow pinned and published atomically on the same branch.

**Five new G roots** under `FCP.BFSSS1V52K1D18G`:

1. `originalSourceSpin48_unit_mem_lipschitz`: the genuine original Mathlib Spin unit is an element of the actual original Lipschitz subgroup.
2. `sourceLipschitzVectorAction_one`: actual Lipschitz unit identity fixes every source vector.
3. `sourceLipschitzVectorAction_mul`: the action respects actual Lipschitz unit multiplication.
4. `sourceLipschitzVectorAction_agrees_originalSpin48`: its **restriction** to the actual Spin group agrees pointwise with the accepted original S1V31 Clifford-conjugation action.
5. `originalSourceLipschitzLinearMap`: packages the original source Lipschitz action as a genuine real-linear endomorphism without introducing a replacement source representation.

Strict evidence: `FCP_CACHE_PILOT_WARM_REVALIDATION_PASS modules=37 roots=81`; fresh warning-as-error A–G compilation `K1D18G_SOURCE_EXACT_SEVEN_FRESH_COMPILATIONS_PASS`; `K1D18G_EXACT_TWENTY_THREE_ROOT_TYPES_AXIOMS_PASS` independently confirms all 23 A–G roots' types and axiom sets, restricted to `propext`, `Classical.choice`, `Quot.sound`. These group laws do **not** classify determinant sign and do not make all Spin elements finite two-generator products.

## K1D18H accepted — actual source Lipschitz linear equivalences and determinant unit character

[**Green run #40712014581**](https://github.com/etblink/math/actions/runs/40712014581), job `122899509129`, tested commit `83c064157126517ef1b5105a99238a258863ad55`, terminal `completed/success` around 2026-10-28T15:11 UTC. Exact accepted source blob `3de8f66a91063845b0aaa8417ed9260cc5d41df6`; exact strict workflow blob `8fd0c0e03fc0f5de69d1ad77a5294754f04d9eca`. The source and workflow were published together atomically on the same cache-enabled research branch.

The gate confirmed `FCP_CACHE_PILOT_WARM_REVALIDATION_PASS modules=37 roots=81`, `K1D18H_SOURCE_EXACT_EIGHT_FRESH_COMPILATIONS_PASS`, and `K1D18H_EXACT_TWENTY_SEVEN_ROOT_TYPES_AXIOMS_PASS`. Original A–H sources compiled freshly warning-as-error and 27 A–H roots had independent type and axiom audits. H's four new roots depend only on `propext`, `Classical.choice`, `Quot.sound`.

The **four newly qualified roots** in `FCP.BFSSS1V52K1D18H` are:

1. `originalSourceLipschitzLinearEquiv`: the original-source Clifford-conjugation Lipschitz action is a genuine real-linear equivalence; inverse uses the **actual inverse unit of the same subgroup**, not a second action.
2. `originalSourceLipschitzLinearEquiv_apply`: the equivalence acts pointwise as the unique original F source vector action.
3. `originalSourceLipschitzLinearRepresentation`: a multiplicative homomorphism from the actual source `lipschitzGroup Q` into real-linear equivalences on the original 48-dimensional module.
4. `originalSourceLipschitzDeterminantCharacter`: composition with pinned `LinearEquiv.det` gives a genuine multiplicative **unit-valued determinant character** `lipschitzGroup Q →* ℝˣ`.

H establishes that the real determinant is invertible for every actual source Lipschitz group element. **It does not classify the determinant as ±1 or prove its relationship to Clifford grade parity**. Universal determinant +1 on the even Spin subgroup remains open.

## K1D18I accepted — actual generator determinant and Clifford grade sign

Source `SU2BFSSPhysicalDomainS1V52K1D18IOriginalLipschitzGeneratorParityProbe.lean`, initial blob `63403a729b0a84e98ae4ab51fc3be93f7fe8e3c4`, was published atomically with workflow `7b67ac23cdedf612d7c11e9a868e9f4f7883f6cc` at commit `de2d8457547173010bb9a5c6d63bed287089801b`. [**Red #40714116950**](https://github.com/etblink/math/actions/runs/40714116950), job `122907011567`, passed exact source-hash preflight, full pinned Lean/Mathlib setup, exact 81-root source ancestry cache and A–H compilation. The **only two** compiler errors were Mathlib `linter.style.haveILetI` at new I source lines 72 and 108: inside tactic-mode proposition proofs, `letI` should be `let`. All five candidate I declarations elaborated and printed allowed axiom reports, but the warning-as-error compiler correctly failed closed, so **I accepted roots = 0 at that run**.

The pinned [Mathlib linter source](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/Tactic/Linter/HaveILetI.lean) explicitly documents that Lean 4 `let` and `have` register local instances automatically, and only `letI`/`haveI` inline. No linter was disabled. We replaced exactly the **two tactic-mode `letI` statements** with `let`; the **term-mode `letI` in the private polar row helper remains intact**. There was no theorem statement or source geometry change, no new axiom, and no elaboration budget increase. Source blob now `9e4d56f27e6f8f4cb3244236c36b29e595a91bc2`, exact workflow blob now `a1e40118598c8b76703a8cec10547bb325b283c8`; both were atomically re-pinned at commit `7a5a9de244b2d4cff5e39252dd6ea4213f39be2d`.

[**Green authoritative replacement strict run #40715643807**](https://github.com/etblink/math/actions/runs/40715643807), job `122912448120`, exact tested SHA `7a5a9de244b2d4cff5e39252dd6ea4213f39be2d`, `completed/success` on 2026-10-28. Exact source pins, same-branch 81-root warm-cache verification (`FCP_CACHE_PILOT_WARM_REVALIDATION_PASS modules=37 roots=81`), fresh A–I warning-as-error compilation (`K1D18I_SOURCE_EXACT_NINE_FRESH_COMPILATIONS_PASS`), and 32-root independent declaration types/allowed axioms (`K1D18I_EXACT_THIRTY_TWO_ROOT_TYPES_AXIOMS_PASS`) all passed. **Five new I roots accepted**, with only `propext`, `Classical.choice`, `Quot.sound`. Red #40714116950 remains preserved as style-linter feedback, not a mathematical counterexample.

I's five accepted roots: (1) genuine original Clifford generator unit membership in the original Lipschitz closure; (2) packaging that unit as the actual `lipschitzGroup Q` subtype; (3) an equality of H's genuine original-source linear map with the accepted S1V37 rank-one source matrix; (4) determinant character equal to `-1` for this genuine generator unit; (5) source Clifford involution negates the same generator unit. The source derives `Invertible (Q a)` from the actual `Invertible (CliffordAlgebra.ι Q a)` using pinned Mathlib `invertibleOfInvertibleι`. A private source polar-row helper keeps this derivation in the statement without introducing another independent quadratic invertibility hypothesis.

I has now passed the required strict source-exact audit but handles *only genuine generator units*. The inverse, identity and multiplication cases, full closure induction, universal even Spin determinant and SO48 target would still be separate obligations.

**Qualified A–I accounting:** 2 A + 3 B + 3 C + 3 D + 3 E + 4 F + 5 G + 4 H + 5 I = **32 new scoped source-exact roots**, beyond the original accepted 81-root cached ancestry. No combined 113-root cache has been sealed or claimed.

## K1D18J accepted — inverse original generator determinant/grade sign

**Green strict qualification** [run #40728371932](https://github.com/etblink/math/actions/runs/40728371932), job `122957663007`, exact tested SHA `1dac593873af29868934eba60b9d2ecc6bf0919e`, terminal `completed/success` on 2026-10-28. Accepted original module `SU2BFSSPhysicalDomainS1V52K1D18JOriginalLipschitzInverseGeneratorParityProbe.lean`, blob `2dd6581775e92df5686267863c14529cde77bd60`; workflow `bfss-kotler-k1d18j-inverse-generator-grade-character-strict.yml`, blob `096a290ae8e8f8f35feaf03df0e7bcc8f542047a`, published in the same atomic commit.

The gate passed original source hash/pinning, restored and independently verified 81 qualified roots across 37 accepted ancestor modules (`FCP_CACHE_PILOT_WARM_REVALIDATION_PASS modules=37 roots=81`), freshly compiled A–J warning-as-error (`K1D18J_SOURCE_EXACT_TEN_FRESH_COMPILATIONS_PASS`), and independently audited all 35 A–J declaration names, types and permitted axioms (`K1D18J_EXACT_THIRTY_FIVE_ROOT_TYPES_AXIOMS_PASS`). The three new J declarations use only `propext`, `Classical.choice`, `Quot.sound`, with no `sorryAx` or supplemental axioms.

Qualified J roots in `FCP.BFSSS1V52K1D18J`:
1. `originalSourceGeneratorInverse_det_neg_one`: the **actual Lipschitz determinant unit character** takes real value `-1` on the inverse of every original invertible Clifford generator.
2. `originalSourceGeneratorInverse_involute_neg`: the **actual source Clifford involute** negates that inverse original generator in the original Clifford algebra.
3. `originalSourceGeneratorInverse_grade_det_agreement`: those two values agree as the scalar action on the **same genuine original Clifford inverse unit**.

### Negative proof evidence and source repair

- [Red #40718401833](https://github.com/etblink/math/actions/runs/40718401833), tested `ac8951098a61a71c93206ddf51edd6cb0046a6f7`, had two Lean API errors after cache revalidation: it used `Units.val_inv` (a structure field, not coercion lemma `Units.val_inv_eq_inv_val`) to rewrite determinant inverse; and the involute `map_invOf` required a constructed `Invertible (involute (u:C))`.
- [Red #40724518190](https://github.com/etblink/math/actions/runs/40724518190), tested `994a398e29b776210d472f5920af3876f7edbadf`, fixed the first mismatch but failed with a **dependent rewrite-motive error**: replacing `involute ↑u` by `-↑u` inside the argument of `Invertible.invOf` invalidated the indexed instance. The failure was a Lean dependent elaboration issue, not a mathematical counterexample.
- Accepted repair: avoid changing the type within `⅟`. Instead prove `involute (↑u⁻¹) * involute ↑u = 1` through homomorphism and actual unit inversion, substitute the original generator's known odd-grade sign in a normal **product equality**, obtain `involute (↑u⁻¹) * ↑u = -1`, and cancel using the actual unit inverse. No changed theorem statements, new assumptions, source geometry, toolchain or cache, or elaboration-limit changes.

**Accounting:** 81 older accepted source-cache roots, plus 2 A + 3 B + 3 C + 3 D + 3 E + 4 F + 5 G + 4 H + 5 I + 3 J = **35 qualified new A–J roots**. The old cache was **not** resealed as a 116-root cache. A universal Lipschitz determinant/grade identity, universal Spin determinant `+1`, SO48 packaging, covering, global Spin9 and spectral existence remain **unproved**.

## K1D18K accepted — exact source Lipschitz grade/determinant stability

[**Green run #40730252400**](https://github.com/etblink/math/actions/runs/40730252400), job `122964308698`, tested `8749132388958624a370c4c04dde43d98398b579`, terminal `completed/success` on 2026-10-28. Source blob `81067e786cac0fbb65b936b6013d028dc3e73fed`, strict workflow blob `32e7bb081198f01e24fda7714acf47e77d01dfd3`, same atomic source/workflow commit.

Strict evidence: exact source pins (`K1D18K_EXACT_SOURCE_PINS_FORTY_DECLARATIONS_PASS`), source-exact revalidation of the original 37-module/81-root accepted ancestry (`FCP_CACHE_PILOT_WARM_REVALIDATION_PASS modules=37 roots=81`), fresh Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` warning-as-error compilation of A–K (`K1D18K_SOURCE_EXACT_ELEVEN_FRESH_COMPILATIONS_PASS`), and independent declaration type/axiom audit of all 40 A–K roots (`K1D18K_EXACT_FORTY_ROOT_TYPES_AXIOMS_PASS`). Only `propext`, `Classical.choice`, and `Quot.sound` permitted; no `sorryAx` or additional axioms.

Five **newly accepted K roots** in `FCP.BFSSS1V52K1D18K`:
1. `originalSourceLipschitzGradeDetInvariant`: exactly `CliffordAlgebra.involute (↑u) = (((χ u : ℝˣ) : ℝ)) • ↑u` for the genuine accepted H original source Lipschitz determinant-character `χ`. Definition only, not universal validity.
2. `originalSourceLipschitzGradeDetInvariant_one`: identity case.
3. `originalSourceLipschitzGradeDetInvariant_generator`: actual original invertible Clifford-generator case using I.
4. `originalSourceLipschitzGradeDetInvariant_generator_inv`: actual inverse-generator case using J.
5. `originalSourceLipschitzGradeDetInvariant_mul`: multiplication stability on actual source Lipschitz elements satisfying the invariant.

**Scientific boundary:** these are four separately qualified induction cases, not yet the theorem for the whole subgroup. Do not infer an unconditional Spin orientation result merely from K.

## K1D18L candidate — actual original Lipschitz subgroup closure induction

The exact source `SU2BFSSPhysicalDomainS1V52K1D18LOriginalLipschitzClosureGradeDetProbe.lean`, Git blob `db0488de5c74681f098ef1762af030d60431d628`, and strict workflow `bfss-kotler-k1d18l-closure-grade-det-strict.yml`, blob `59d3229d9c08b803a4683b323db4aa1b5f12ff66`, were atomically published on the **same research branch** at `f5bd29044c3b7f051cbb9b5e9c7c68cbd0a6eca9`. [**Gate #40732641941**](https://github.com/etblink/math/actions/runs/40732641941) is **unaccepted until terminal success and exact compiler/axiom review**.

L attempts `originalSourceLipschitzGradeDetInvariant_all (s : lipschitzGroup Q)` by the **actual pinned Mathlib `Subgroup.closure_induction''`**, with source-exact conversion of actual generating Clifford units to I's unit subtype, and K's accepted generator, inverse, identity and multiplication cases. L explicitly does **not** assume a generator-word factorization for arbitrary Spin elements or replace the original 48-real source module/group. It does **not** prove full Spin48 determinant sign, SO48, covering, global Spin9 or BFSS spectral existence.

Strict workflow requires fresh A–L compilation, exact existing immutable 81-root accepted ancestry cache revalidation, and independent **41-root** declaration type/axiom audit. No extra axioms, Lean limits, cache rebuilding, main-branch merge or upstream PR are authorized.

**Accounting at this checkpoint:** 40 newly accepted A–K roots beyond the immutable original 81-root cache; L is 0 accepted until its independent gate qualifies. No combined 121-root cache claimed.

## Remaining actual scientific obligation

K1D18D now supplies the exact bridge from the independently defined original Spin isometry to Clifford conjugation and the source rank-one generator units. It proves the two-matrix composition identity only *under an explicit, equality-in-actual-units factorization hypothesis*. The missing unconditional statement is a real group-theoretic parity/closure theorem, not an unidentified coordinate transport. The K1D18E determinant result has now been qualified, but **only under the exact two-unit factorization hypothesis**. No universal determinant theorem follows. Pinned Mathlib `lipschitzGroup Q` is a **subgroup closure** of invertible degree-one source Clifford generators, while `spinGroup Q` is the intersection of the pin group and even-grade subalgebra; it is **not by definition** a list of even generator words. Next establish the true Lipschitz closure determinant/grade-sign character and restrict to `spinGroup.involute_eq`. This is the missing proof of `det(originalSourceSpin48QuadraticIsometry s)=+1`, before any SO(48) packaging, topology, covering, global Spin(9), source Fock/gauge action, or BFSS spectra.

**Standing policy:** truth over green CI, preserve negatives, proof source pins and original label order, typed/field bridges before recursion budgets, separate mathematical formalization from physical claims. Existing 81-root cache retains its original trusted branch; the 12.09 GB uncompressed Lean+Mathlib whole-dependency cache proposal was rejected after measured [green size-only run #40657131188](https://github.com/etblink/math/actions/runs/40657131188).


### Updated next program: determinant character, original closure induction, and even parity

The general Lipschitz conjugation action and its group laws are **qualified in F/G**; H now **qualifies the genuine Lipschitz linear equivalence, group representation and invertible real determinant character**. I is now **accepted** for the original generator case and links the H determinant character and the Clifford grade involution for actual original generator units: both have sign `-1`. Five I roots are qualified at green #40715643807. Red #40714116950 remains recorded as a strict-linter issue. J qualifies the inverse-generator case; K additionally qualifies the identity and multiplication cases. The next unproved obligations are the full actual Lipschitz subgroup closure (L is pending) and restriction to even Spin.

After H, prove a source-exact relation between determinant units and the original Clifford involution. A promising direct route is to establish an invariant connecting `LinearEquiv.det` of the true Lipschitz action to `CliffordAlgebra.involute` on the same original Clifford unit. Prove it on *actual generator units*, extend it to the entire **actual** `lipschitzGroup Q` using the pinned `Subgroup.closure_induction''` (explicitly covering generator, inverse, identity, multiplication), then apply `spinGroup.involute_eq` and source scalar embedding injectivity to derive determinant `+1` for all genuine even Spin units. **That parity invariant, closure proof, and universal Spin theorem are NOT yet proved.**

Maintain the exact original `Fin 24 × Fin 2` source labels and `source48Quadratic`, avoid new groups/representations or invented factorization hypotheses, and handle typed field/structure bridges before increasing elaboration limits. The accepted 81-root cache and pinned Lean/Mathlib remain unchanged; no entire dependency cache is warranted. Use one authoritative handoff and Git history as canonical memory, plus fresh warning-as-error candidate compilation and independent type/axiom audits; do not merge `main` or publish upstream without explicit authorization.
