# NORM-0C strict green acceptance and original FullL2 NORM-0D proof-interface reconnaissance

**Date:** 2026-11-11 Pacific
**Repository:** `etblink/math`
**Research branch:** `integration/bfss-unified-research-20261108`
**Accepted exact NORM-0C commit:** `b93c796519071ac758977f27f8ea37471c0d6bae`
**Gate status:** NORM-0C **STRICTLY QUALIFIED**; NORM-0D **RESEARCH ONLY, NOT LEAN COMPILED**.

## 1. Confirmed strict evidence

- [NORM-0C strict run #43017992525](https://github.com/etblink/math/actions/runs/43017992525), completed **SUCCESS** at 2026-11-11 12:26:48 UTC. Exact tested commit `b93c796519071ac758977f27f8ea37471c0d6bae`, job `130513793620`.
- `NORM0C_ORIGINAL_108_BLOB_CLOSURE_PASS`: 106 independently qualified NORM-0B ancestor blobs plus exact current NORM-0C source and consumer; frozen Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Full cold NORM-0C source completed `Build completed successfully (9070 jobs)`. Independent consumer compiled under warning-as-error.
- Source `originalFockGammaBoundConstant_nonneg`, `originalFockGram_norm_le_trace`, `originalNormalizedFockGram_norm_le`, and independent consumer `originalNormalizedFockGram_vector_bound`, `originalNormalizedFockGram_gauge_covariant` each emitted only `propext`, `Classical.choice`, `Quot.sound`. Strict consumer gate printed `NORM0C_ORIGINAL_NORMALIZED_FOCK_FIELD_STRICT_PASS`; no `sorryAx` or forbidden consumer warning.
- Evidence artifact `13855205592`; ZIP SHA-256 `563b57c143021f44cdb60b1270a1f8520bcec2545bea9299d376a475f25f0139`.
- Frozen source path `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSNORM0COriginalNormalizedFockField.lean`, blob `84de66e73be2018b03ced898ebf70e691c07b40f`; consumer path `lean/diagnostics/BFSSNORM0COriginalNormalizedFockFieldConsumer.lean`, blob `307870a4cb93e1ead38253b9d94b5e79c3c2c11c`; strict workflow blob `29b5e76730dd894c0c953d1c9ff17d9f4521bc7e`. Original BFSS `Core.lean` remains blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`.

**Precisely qualified:** For every original `x : Boson 2` and each fixed real `B : GammaMatrix`, define `T(x)=∑_i M_ii(x)`, `C_B=∑_ij ‖originalColorQuadratic (γ_i * B * γ_j)‖`, and `Otilde_B(x)=(Complex.I/((1+T(x):ℝ):ℂ)) • originalFockGramObservable x B`. NORM-0A's `|M_ij|≤T` and NORM-0B's literal 81-term decomposition now give `‖Otilde_B(x)‖≤C_B` on the genuine original `Fermion 2 →L[ℂ] Fermion 2`, plus actual vector norm bound and G2A/G4E pointwise gauge covariance. This does **not** prove a corresponding `FullL2 2 →L[ℂ] FullL2 2` map.

## 2. Failure-to-acceptance mini-ledger

| Run | Status | First cause / remedy |
| --- | --- | --- |
| [43006735344](https://github.com/etblink/math/actions/runs/43006735344) | RED before Lean | Missing comma in 108-pin manifest Python dictionary; independently parsed corrected entire 108-key dictionary while matching 106 qualified ancestors |
| [43015220730](https://github.com/etblink/math/actions/runs/43015220730) | RED after source+consumer elaboration | Consumer's deprecated `ContinuousLinearMap.smul_apply` was warning-as-error; exact pinned replacement `smul_apply`; frozen original NORM-0C source |
| [43017992525](https://github.com/etblink/math/actions/runs/43017992525) | **STRICT GREEN** | Full 108-pin evidence closure, 9070 cold jobs, independent vector and gauge consumers, all 5 allowed-axiom reports, final strict marker and retained SHA-256 artifact |

Method lesson: Validate generated embedded manifest code offline before CI; read the first actual error; never rework a fully compiling source for a consumer-only deprecated API. Preserve both reds as negative knowledge, not physical/mathematical counterexamples.

## 3. Actual original physical-space interface

Original pinned `Core.lean` (blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`) fixes:

```lean
abbrev Boson (N : ℕ) := EuclideanSpace ℝ (SpaceIndex × ColorIndex N)
abbrev Fermion (N : ℕ) := EuclideanSpace ℂ (Fin (2 ^ (8 * colorDim N)))
abbrev FullL2 (N : ℕ) := Lp (Fermion N) 2 (volume : Measure (Boson N))
```

For SU(2), original `Fermion 2` dimension is `2^24`. `FullL2 2` is **not** the finite Fock space: it is a vector-valued Lebesgue `L²` space on the original real 27-dimensional bosonic configuration space. Lebesgue volume is not a finite measure. A bounded pointwise field itself is generally *not* an `L²` vector-valued function; what becomes `L²` is its product with an `L²` argument. Do NOT apply a theorem requiring `[IsFiniteMeasure volume]` to the whole bosonic space.

The existing `AlgebraData.smoothMultiplier` in the original Core multiplies `SmoothCore N` by a **scalar smooth complex function**, not an operator-valued bounded function on `FullL2 N`. Do not substitute that map as a shortcut. `Core.coreToL2` uses `MemLp.toLp` only on already-verified compactly supported smooth test functions.

## 4. Pinned Mathlib API survey (exact source d13f23b7…)

Read-only verified at `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean` and `Mathlib/MeasureTheory/Function/LpSeminorm/Monotonicity.lean` under exact pinned Mathlib revision:

- `MemLp.toLp` (LpSpace/Basic lines 109–111): builds a genuine `Lp` object from a raw function and its `MemLp` proof.
- `MemLp.coeFn_toLp` (lines 116–117): the output is a.e. equal to the original raw representative.
- `MemLp.toLp_congr` (lines 119–121) and `Lp.ext`: changes on null sets cannot change the output class.
- `MemLp.toLp_add` (lines 132–134) and `MemLp.toLp_const_smul` (lines 489–491): exact linearity interfaces.
- `MemLp.of_le_mul` (LpSeminorm/Monotonicity lines 210–213): if `g` is `MemLp`, `f` is strongly measurable a.e., and `‖f(x)‖≤c‖g(x)‖` a.e., then `f` is `MemLp`; no finite-total-measure hypothesis.
- `Lp.norm_le_mul_norm_of_ae_le_mul` (LpSpace/Basic lines 348–355): exactly the needed global `‖Mf‖₂≤C_B‖f‖₂` norm estimate once both `Lp` objects exist.
- `Lp.mem_Lp_of_ae_le_mul` (lines 366–368) likewise proves Lp membership from a.e. domination on an `AEEqFun`.
- `Lp.aestronglyMeasurable`, `Lp.memLp` (lines 186–190): the input `f` supplies the measurability/integrability side.
- `MemLp.continuousLinearMap_comp` (LpSpace/Basic lines 714–718) and `ContinuousLinearMap.compLp` are **for a fixed L**, not an x-dependent `Otilde_B(x)`; cannot be used directly to construct the desired multiplier.

These are **API inspection facts, not proofs on the original BFSS field**. Notable design gain: global Lebesgue measure finiteness is unnecessary for multiplication if the field is pointwise uniformly bounded and measurable.

## 5. NORM-0D proof DAG — no premature full-operator gate

**D0: Field continuity / measurability interface, first boundary.**

Target exact theorem:

```lean
theorem originalNormalizedFockGram_continuous (B : GammaMatrix) :
  Continuous (fun x : Boson 2 =>
    originalNormalizedFockGramObservable x B)
```

Use source-exact coordinate projections `x (i,A)` to prove continuity of each `spatialColor x i`; then continuity of the original real inner product `originalSpatialGram x i j`, trace `T(x)`, complex coefficient casting, `originalColorQuadratic` finite 81-term original operator sum (with **fixed** `H_ij(B)`), and nonvanishing `1+T(x)>0` from qualified NORM-0A. Prefer `originalFockGramObservable_sum`, scalar-weighted finite sums and existing typed `OriginalFockOp`; do not unfold original 48-Majorana Fock algebra. The proof may require a smaller generic lemma on continuous finite weighted sums. D0 independent consumer: the resulting field is `AEStronglyMeasurable` under original volume, plus some concrete scalar norm measurability consequence. **Not yet implemented.**

**D1: Representative-safe `L²` map, second boundary.**

Given a fixed B, define for `f:FullL2 2` the raw representative `m_B[f](x)=Otilde_B(x)(f x)`. Establish `AEStronglyMeasurable` using continuous joint evaluation of a bounded linear operator and f's `Lp.aestronglyMeasurable`. Use original NORM-0C vector bound `‖m_B[f](x)‖ ≤ C_B ‖f x‖`; apply pinned `MemLp.of_le_mul (Lp.memLp f)`. Build the output using `MemLp.toLp` and prove a.e. equality. Show the result is independent of `Lp` representative choice via `MemLp.toLp_congr` / `Lp.ext`. **Do not confuse a chosen representative with an identity of functions everywhere.**

**D2: Original continuous complex-linear multiplier, third boundary.**

Prove additivity, complex linearity using the literal `Fermion 2 →L[ℂ] Fermion 2`, and `‖M_B f‖≤C_B‖f‖` via pinned `Lp.norm_le_mul_norm_of_ae_le_mul`. Package a genuine `FullL2 2 →L[ℂ] FullL2 2`, with `‖M_B‖≤C_B` if the exact API permits. Independent consumer: `FullL2` vector norm bound and a.e. pointwise action on `coreToL2` of a test function. Only after this is the *multiplier* claim qualified.

**D3: Physical/gauge and spectral bridges, separately.**

Use the accepted NORM-0C pointwise G2A/G4E covariance and establish/verify an actual measure-preserving diagonal SU2 representation on `FullL2 2`; transport the multiplier via that source action. Then separately prove physical gauge-subspace preservation, original closed-charge graph/domain invariance, graph/closed-form commutator, Hamiltonian identification, and only then investigate spectral coercivity. None follows automatically from D2.

## 6. Critical false shortcuts and decision gates

- **Avoid `[IsFiniteMeasure volume]` proofs**: original boson volume is infinite; the Lp domination argument is the correct one.
- **Avoid fixed-operator `compLp` substitution**: the operator depends on the bosonic variable x.
- **Avoid redefinition of normalized field, Fock operators, gamma matrices or original Hamiltonian**: source already qualified.
- **Avoid `L²` norm of the coefficient field itself**: uniform `L∞` operator norm does not imply `L²` over infinite volume.
- **Avoid conflating pointwise equivariance with `FullL2` gauge action**: a.e. maps and measure-preserving transport require their own interfaces.
- **Avoid inference of spectral gap or compactness**: normalization by `1+T(x)` bounds the field but generally leaves nonzero limits along radial rays; boundedness does not imply decay at infinity, compact resolvent, confinement or a mass gap.
- **No further new expensive 110-blob strict workflow yet**. Complete D0 API/type crosswalk or smallest compilable D0 microgate first; freeze the full accepted 108 ancestors. Generated Python-in-YAML manifest should be syntax-validated and pin-diffed offline before any new strict CI.

## 7. Project Lead disposition

**Accept NORM-0C at exact SHA and receipt**, preserve the source/consumer frozen. **Choose D0 field-continuity as the next bounded Lean implementation**, not D1–D3 all at once. The pinned Mathlib `MemLp` and `Lp` interfaces make the subsequent path concrete. Begin with a minimal exact `spatialColor`/Gram continuity proof on the source `Boson 2`; only after that advance to the original `L²` representative construction. Maintain negative-knowledge provenance and no spectral or mass-gap claim.

## 8. NORM-0D D0-A original Gram continuity — strict GREEN and unified-branch recovery (2026-11-11)

**Newly qualified, and superseding the dated D0 "not implemented" checkpoint above only for the stated D0-A subgoals:** [strict run #43025162724](https://github.com/etblink/math/actions/runs/43025162724) completed SUCCESS at exact tested commit `c358abc211192ca35d1307420438e6d3c52364be`, job `130537962765`, attempt 1. Its full 108/108 previously qualified NORM-0C source/consumer Git-blob preflight, Lean 4.34.1 / pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, cold source build (**8,994 jobs**), independent consumer compilation under warning-as-error, four complete source/consumer axiom reports with only `propext`, `Classical.choice`, and `Quot.sound`, and final `NORM0D_D0A_ORIGINAL_GRAM_CONTINUITY_MICROGATE_PASS` succeeded. Historical package checkout warnings are covered by the established allowlist, not interpreted as novel Lean source warnings.

- Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSNORM0D0OriginalGramContinuity.lean` — `originalSpatialGram_continuous` (for each original SpaceIndex pair) and `originalGramTrace_continuous`, using the existing upstream `spatialColorMap` and actual `Boson 2`.
- Independent consumer: `lean/diagnostics/BFSSNORM0D0OriginalGramContinuityConsumer.lean` — `originalGramTrace_one_add_continuous` and `originalGramTrace_one_add_pos` on the original bosonic carrier.
- [Evidence artifact `13857122944`](https://github.com/etblink/math/actions/runs/43025162724/artifacts/13857122944), ZIP SHA-256 `6c4aa51cc8bc3ab6fed58491872ce6a949d4deff3cbcb0167f9a0e5f50bda33c` (reported expiry 2026-11-25 UTC).
- Workflow: `.github/workflows/bfss-norm0d-d0-original-gram-continuity-microgate.yml`; original 108 frozen sources, original Core, and existing NORM-0C strict workflow remain byte-identical.

**Branch governance and recovery:** The candidate was initially committed on an unnecessarily separate `research/bfss-norm0d-d0-continuity-20261111` branch. Comparison showed it was exactly one commit ahead of the unified parent `0a1fa7ddee3a5463068a9f6fa76453973c586048`, zero behind. After verifying strict green, Project Lead fast-forwarded `integration/bfss-unified-research-20261108` from that exact expected parent to the *same* accepted `c358abc` commit. No merge/rebase, changed source bytes, or requalification was involved. The candidate branch remains as preserved provenance; work resumes exclusively on the existing unified research branch. Because this historical D0-A workflow's push filter names the temporary branch, it is **not** the trigger for subsequent unified-branch edits; any future D0-B or whole-D0 gate must be correctly scoped and explicitly qualified separately.

**Qualification ceiling / next gate:** This proves original Gram/trace/positive-denominator continuity, **not** `originalNormalizedFockGramObservable` operator-field continuity, whole-field strong measurability, `FullL2 2` multiplication, original gauge-physical domain preservation, Hamiltonian covariance, or a spectral conclusion. Next, perform read-only source/Mathlib crosswalk for a finite coefficient-weighted sum of the *fixed* original Fock operators, then implement the smallest D0-B full-field continuity proof and independent consumer on the unified branch after cheap type/API checks. No new research branch is justified.

## 9. D0-B qualified; D1-A original representative-level L² membership candidate (2026-11-11)

**Strict D0-B acceptance:** [run #43029098036](https://github.com/etblink/math/actions/runs/43029098036) completed SUCCESS at exact tested commit `e36b0ed9e0df0cd640dc5c741040747038877508` (job `130551200053`, attempt 1). The 108 original NORM-0C parent Git blobs, two original D0-A blobs, and two new D0-B roots passed the frozen **112-blob** preflight. Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` were verified. The cold build succeeded (**9,072 jobs**); the independent warning-clean consumer reported four theorem roots with only `propext`, `Classical.choice`, and `Quot.sound`; final marker `NORM0D_D0B_ORIGINAL_FOCK_FIELD_CONTINUITY_STRICT_PASS` passed. Retained [artifact `13861193853`](https://github.com/etblink/math/actions/runs/43029098036/artifacts/13861193853), ZIP SHA-256 `805972fed6a78b8bdbbd2a8597576d82843bb4c3642ade719bd309bd7176183a` (reported expiration 2026-11-25 UTC).

**Accepted exact roots:** source `BFSSNORM0D1OriginalFockFieldContinuity.lean` has `originalFockGramObservable_continuous` and `originalNormalizedFockGramObservable_continuous` on original `Boson 2` and `Fermion 2 →L[ℂ] Fermion 2`. Independent `BFSSNORM0D1OriginalFockFieldContinuityConsumer.lean` has `originalNormalizedFockGram_norm_continuous` and `originalNormalizedFockGram_aeStronglyMeasurable` for actual bosonic `volume`. Original source blob `7cd3197dbef31af0fb25d8a47c41e037d8162f4e`; independent consumer blob `37353573501efaecc795fca6dbfc8e7b4e9f08bc`. All qualified parents remain unmodified.

**Current mathematical boundary:** D0 (continuity and a.e. strong measurability of the original normalized Fock operator field) is **STRICT GREEN AT THIS EXACT SOURCE COMMIT**. D0 alone does not define `FullL2 2` multiplication, identify a physical subspace or preserve an unbounded Hamiltonian domain. The previous D0-B "candidate" and "pending" paragraphs are historical, superseded only for these precisely accepted declarations.

**D1-A next bounded proof contract (CANDIDATE, NOT YET QUALIFIED):** On the **same unified branch** `integration/bfss-unified-research-20261108`, new `BFSSNORM0D2OriginalPointwiseL2Membership.lean` seeks (1) `AEStronglyMeasurable` of the exact pointwise representative `x ↦ originalNormalizedFockGramObservable x B (f x)` for `f : FullL2 2`; (2) original pointwise domination `‖Otilde_B(x)(f x)‖ ≤ C_B ‖f x‖`; (3) `MemLp` of that representative at `2` and original `volume`, without any finite-measure assumption. Pinned Mathlib routes: `isBoundedBilinearMap_apply.continuous.comp_aestronglyMeasurable`, `Lp.aestronglyMeasurable`, `Lp.memLp`, and `MemLp.of_le_mul`. An independent consumer specializes to the original `SmoothCore 2` and transports from the canonical `coreToL2_ae` via `MemLp.ae_eq`. The intended new 114-blob strict gate isolates these roots; qualification requires its own exact cold build, consumer, warnings and axioms.

**Hold D1-B and D2 until D1-A qualification.** D1-B will use `MemLp.toLp`, `MemLp.coeFn_toLp`, `MemLp.toLp_congr` to make a representative-independent actual `FullL2 2` class. D2 alone may package a bounded complex-linear multiplier and a global norm estimate. Neither makes the operator gauge-physical or spectral. No new branch, main write, accepted source modification, or historical workflow retirement is justified.

## 10. D1-A first red: explicit operator evaluation repair (2026-11-11)

[Run #43033168801](https://github.com/etblink/math/actions/runs/43033168801) at exact commit `46388669b9f7b73087ce6df12d106435567107c7` is **RED / NOT QUALIFIED**. The 114-blob source closure and pinned Lean/Mathlib restoration passed. The first causal source failure occurred in `BFSSNORM0D2OriginalPointwiseL2Membership.lean:36:8`: **maximum recursion depth reached** during elaboration of `isBoundedBilinearMap_apply.continuous.comp_aestronglyMeasurable`. As expected for an unsuccessful Lean declaration, `sorryAx` appeared in the dependent axioms reports. The report does not refute a mathematical theorem; it prevents formal acceptance. The independent consumer was not reached. Artifact `13862513556` (ZIP SHA-256 `e5ee019a75611fce8a24735f650acebeb6ab8d7fd2109578b5b3f5aec31cae4e`) preserves first-red diagnostics.

**Bounded repair candidate:** Replace only the costly, implicitly elaborated bilinear expression with an explicitly typed `ContinuousLinearMap.flip (ContinuousLinearMap.apply ℂ (Fermion 2))`, then apply the **pinned** `ContinuousLinearMap.aestronglyMeasurable_comp₂` to the already established D0-B field measurability and `Lp.aestronglyMeasurable f`. The pinned definition/rewrite interface `ContinuousLinearMap.flip_apply` and `ContinuousLinearMap.apply_apply` identifies the operator action. No `maxRecDepth`/heartbeat override, axiom, theorem weakening, model replacement, or alteration of accepted source/consumer blobs. Update **only** the candidate source SHA in the D1-A strict manifest; retain the same independent consumer and all prior source pins. Do not interpret this as qualification until a fresh exact-commit run passes.

## 11. D1-A original representative MemLp accepted; D1-B L² equivalence-class gate (2026-11-11)

**D1-A strict GREEN:** [run #43047181537](https://github.com/etblink/math/actions/runs/43047181537) succeeded at exact tested unified-branch commit `6a2da4839c1f96969384072f4a9640082a6311e3`, job `130614137636`, attempt 1. The frozen 108 NORM0C ancestor + 6 accepted NORM0D D0A/D0B/D1A source and consumer Git blobs passed the **114-blob closure**, Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` passed, cold build succeeded (**9,073 jobs**), and warning-clean independent original SmoothCore consumer emitted five permitted-axiom reports (`propext`, `Classical.choice`, `Quot.sound` only), ending with `NORM0D_D1A_ORIGINAL_FULLL2_MEMLP_STRICT_PASS`. Retained [artifact `13869355690`](https://github.com/etblink/math/actions/runs/43047181537/artifacts/13869355690) ZIP SHA-256 `b50a6179fac31fc83ce3336966814fb314bc736f98c7b42b57990828997c9797` (reported expiration Nov 25, 2026 UTC). Exact accepted D1-A Lean source `BFSSNORM0D2OriginalPointwiseL2Membership.lean` blob `597c1e771b2bf0c366a354fcc991a5b77a71ff9f`; independent consumer `BFSSNORM0D2OriginalPointwiseL2MembershipConsumer.lean` blob `1b0579ddb1421288a665971437f82c06406d759a`. Workflow blob `ff3d074005a3940450d417a37e9049b7a45965a5`.

**Precisely accepted D1-A facts:** For `B : GammaMatrix` and `f : FullL2 2`, the source-original function `fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x)` is `AEStronglyMeasurable` and `MemLp … 2 volume`, dominated pointwise by the fixed constant `originalFockGammaBoundConstant B` times `‖f x‖`. The independent consumer verifies `SmoothCore 2` transport using `coreToL2_ae`. The red #43033168801 remains a useful negative-knowledge record: syntactically unbounded elaboration of `isBoundedBilinearMap_apply` hit maximum recursion depth and introduced `sorryAx`. The subsequent repair used explicitly typed `ContinuousLinearMap.apply.flip` and `ContinuousLinearMap.aestronglyMeasurable_comp₂` without changing theorem hypotheses or raising depth; run #43047181537 qualified the repair.

**D1-B next bounded contract (CANDIDATE; NOT QUALIFIED UNTIL ITS OWN STRICT GATE):** A new module `BFSSNORM0D3OriginalFockL2Representative.lean` defines `originalFockL2Action B f : FullL2 2` by applying pinned `MemLp.toLp` to the accepted D1-A membership certificate and exactly the original pointwise source field. It tests `MemLp.coeFn_toLp` for genuine a.e. output action, `MemLp.ae_eq` for alternative input representatives, and `MemLp.toLp_congr` for literal equality of resulting original L2 classes. A separate D1-B consumer exercises actual `SmoothCore 2` a.e. transport and output on the `FullL2 2` zero input. The 116-blob strict gate inherits 114 accepted roots unchanged, checks pinned toolchain/dependencies, cold builds both modules and audits their axioms.

**Ceiling / decision:** D1-A is strictly accepted; D1-B is only a candidate. Even a successful D1-B does not establish complex linearity, a bounded continuous operator on the whole original `FullL2 2`, covariance on the physical Hilbert space, or original Hamiltonian-domain results. Those remain D2/D3. Continue exclusively on `integration/bfss-unified-research-20261108`; no branch proliferation, rewrites, or historical retirement.

## 12. D1-B first red: wrapper-definitional recursion; bounded unfolding repair (2026-11-11)

**[Run #43058756975](https://github.com/etblink/math/actions/runs/43058756975) RED, exact tested commit `963d22a3e57361f5ae3dc7aebfc14fe00d473ebc`, job `130655254599`.** The original 116-blob closure and exact pinned Lean 4.34.1/Mathlib restoration succeeded. At the end of the cold source build (**9,074th target**), the new `BFSSNORM0D3OriginalFockL2Representative.lean` failed: `maximum recursion depth has been reached` during `originalFockL2Action_ae` (reported at source line 31) and the `MemLp.toLp_congr` proof (line 58). An `unknown constant originalFockL2Action_ae` at line 67, followed by `sorryAx` or unqualified theorem roots, is a consequence of the preceding failure. The independent D1-B consumer did not compile. This is a proof elaboration failure, **not a mathematical counterexample** to representative independence. D0 through D1-A retain their strict-green status.

**Correction candidate:** `originalFockL2Action B f` is *by definition* the exact output of `(originalPointwiseFock_memLp B f).toLp` on the original pointwise field. Explicitly `unfold originalFockL2Action` inside the two failing proofs before applying their existing pinned `MemLp.coeFn_toLp` and `MemLp.toLp_congr` theorems. This preserves the original proposition, source carrier, D1-A `MemLp` certificate, and a.e. input equivalence argument. It changes no accepted file, other source proof, independent consumer, theorem hypotheses, axiom whitelist, or compiler resource limit. Update precisely the new D1-B source SHA in the current workflow's 116-blob manifest; require a fresh cold strict run to decide the candidate.

**Reusability lesson:** When a new wrapper definition on an enormous original Fock fiber causes recursive definitional-equality elaboration, expose the wrapper at the proof boundary rather than increasing `maxRecDepth` or changing the physical model. Preserve red-run logs and exact remedy, and distinguish cascading kernel errors from first causes.
