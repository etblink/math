# BFSS ADJ-A0 — D1S4 two-RED stop, retrospective proof-method audit and atomic recovery

**Date:** November 21, 2026 (America/Los_Angeles).
**Program identity:** FCP–BFSS, exploratory Hopfion/GUT branch. Truth-seeking, exact source semantics and negative knowledge take precedence over GREEN volume.
**Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.
**Status:** D1S4 **FROZEN after two native strict REDs**. ADJ-A0 is an **independent, coefficient-free microgate CANDIDATE**; no qualification until its own strict result.

## 1. R1/R2 original evidence — never overwrite with new proof attempts

| Gate | Exact tested commit | Root cause | Evidence |
| --- | --- | --- | --- |
| [D1S4 R1 #44978109630](https://github.com/etblink/math/actions/runs/44978109630) | `b3c5eeaae14a46ee4c0b2f2bbbf4195b508e0efd` | Original source import/preflight and pinned environment PASS, but generic proof RED on four tactic failures: `rw [neg_smul]` (line 41), `simp` of nested `star_sum` (line 48), scalar sign (line 65), and final smul negation (line 66). All three D1S4 roots print `sorryAx`. | [Original artifact #14736927094](https://github.com/etblink/math/actions/runs/44978109630/artifacts/14736927094), GitHub SHA-256 `00f3ba1c20120502b230d14987abd40d32469b1dfe9d0c693e79bc1b332f699e`, 8,595 bytes |
| [D1S4 R2 #44979114078](https://github.com/etblink/math/actions/runs/44979114078) | `c8a92c991ba1dae72627a4f5b81efc4fe7851d2e` | Preflight and pinned environment PASS. Explicit nested star-sum and scalar-sign repairs eliminated **three** earlier tactic failures. The **remaining first causal failure** at line 41:52 is `simp made no progress`, with Lean's underlying `function expected K s` and `target expression is not type-correct under the implicit transparency level`. The original real `FrequencyMatrix N` coefficient is being rewritten **inside** the original `Fermion N →L[ℂ] Fermion N` scalar multiplication. Three D1S4 root reports still contain `sorryAx`; native source build RED; no accepted theorem. | [Original artifact #14736879317](https://github.com/etblink/math/actions/runs/44979114078/artifacts/14736879317), GitHub SHA-256 `674bc154852888374f9b80a916f3081b1e2e532579b9e9c75ac5109a75306add`, 8,690 bytes |

The D1S4 source is **FROZEN** at R2 Git blob `de987a392a2e3510aafa835f8522e753725021cc`. Its strict workflow remains blob `48034f0a42aa6c88257092aba460dd1002f0ffe6`. Earlier D1S3 original coefficient-skew source `f35d70284bec100dc617935cf41a6c933c618e5b` remains qualified by [#44976962312](https://github.com/etblink/math/actions/runs/44976962312), source-only; R2 failure did **not** invalidate the mathematics of D1S3.

**No D1S4 R3, no renaming the same source proof as a different gate, no raised recursion/heartbeat limits, no linter disables, no new axioms or altered original-source semantics.** D1S1/D1T0/D1T1 and D1R0 consumer freezes remain effective.

## 2. Retrospective audit: reusable positive evidence

This review read the canonical [evergreen qualified-reuse ledger](../../../contributions/bfss-kotler/BFSS_PROJECT_LEAD_EVERGREEN_QUALIFIED_REUSE_LEDGER_2026_11_10.md), [NORM-0B nine-RED method audit](../../../contributions/bfss-kotler/BFSS_NORM0B_NINTH_RED_METHOD_AUDIT_AND_TYPED_SCALAR_INTERFACE_2026_11_10.md), [JOIN-0B3 original-Fock independent consumer](../../../lean/diagnostics/BFSSJOIN0B3OriginalFockGramSelfAdjointConsumer.lean), [Interface-First Protocol](../../../contributions/bfss-kotler/BFSS_INTERFACE_FIRST_PROOF_PROTOCOL_AND_OP3A_LESSON_2026_11_09.md), and [Proof-DAG-First Protocol](../../../contributions/bfss-kotler/BFSS_PROOF_DAG_FIRST_METHOD_AND_C48_FAILURE_LEDGER_2026_11_10.md). The ledger is a *historical* record; a dated PENDING annotation is not evidence that the gate remains pending today.

| Previously successful technique | Verified precedent / why it matters here |
| --- | --- |
| Small typed operator interfaces before original source instantiation | [NORM-0B GREEN #42980174540](https://github.com/etblink/math/actions/runs/42980174540) succeeded after 9 reds by extracting a **coefficient-independent exact Fock-operator scalar-zero lemma**. The old failure said `function expected originalSpatialGram x i`, nearly identical to D1S4 R2's `function expected K s`. |
| A generic finite sum first; concrete coefficient source second | The independently qualified JOIN-0B3 diagnostic source at blob `99ebef817b33dc56ef04e38c8b716ceb8d84f491` defines a typed `F α β : Fermion 2 →L[ℂ] Fermion 2`, and uses explicit `Finset.sum_congr` / `Finset.sum_neg_distrib`, not broad source expansion. JOIN-0B2 had several reds before the finite sum and scalar typing were isolated. |
| Tiny proof atoms and separate source/consumer qualification | F1A [#42533991101](https://github.com/etblink/math/actions/runs/42533991101), F1F C3 [#42651438879](https://github.com/etblink/math/actions/runs/42651438879), and later NORM-0C [#43017992525](https://github.com/etblink/math/actions/runs/43017992525) preserve source carriers and accepted ancestor hashes, proving distinct interfaces with exact strict source+consumer roots. |
| Freeze the theorem statement and apply only the first-causal fix | D1S3 R1 [#44976005358](https://github.com/etblink/math/actions/runs/44976005358) compiled mathematically but RED due four deprecated `if_pos`/`if_neg` calls; replacing **only** those calls led to strict source GREEN [R2 #44976962312](https://github.com/etblink/math/actions/runs/44976962312). |
| Use real source lemmas and pinned Mathlib, not conjectured theorem names | Pinned Mathlib `Mathlib/Algebra/Star/BigOperators.lean`, exact Mathlib commit `d13f23b723b8a846827a245b89c10fc7d3f11612`, contains `star_sum` and `isSelfAdjoint_sum`; our actual compiled D1S4 R2 source had no errors after the pair-identity part, indicating nested `star_sum` and double negation tactics themselves were no longer the critical issue. |

## 3. Recurrent failures and explicit prohibitions

1. **`rw` / `simp` cycling on an ill-elaborated source coefficient.** NORM-0B [#42977121959](https://github.com/etblink/math/actions/runs/42977121959) and D1S4 R2 exhibit the same implicit-transparency/function-expected diagnostic. Repeated tactic rearrangements have low expected value. Instead, separate the source matrix entry into a typed real/complex intermediate **after** the generic lemma is qualified.
2. **Proof monoliths that fail late after an expensive cold build.** D1S4 imported the original physical source and ran 8,995 native jobs just to learn the first issue was a coefficient-dependent rewrite. Start the new gate with a Mathlib-only generic atom to keep the elaboration surface small.
3. **Invalid declaration type inference and linter bypasses.** D1T1 R1 `theorem : _` failed because Lean does not infer theorem propositions from proofs; D1T1 R2 proposition-valued `def` was rejected by `defProp` under strict warnings. A valid typed `theorem` statement is required.
4. **Treating `sorryAx` emitted after elaboration failure as a theorem or copying deprecated rewrites.** Both D1S4 roots are unqualified; any subsequent source result must independently pass `#print axioms` without `sorryAx`, warning-as-error, and exact artifact provenance. Do not weaken the checker.
5. **Using external conceptually similar operator models as source substitutes.** Keep original delta-one CAR, original `quantizeFrequency` normalization `i/2`, exact 48 paired labels and genuine `Fermion 2`. A generic algebraic lemma is a tool, not a physical-equivalence claim.
6. **Ignoring negative knowledge after two reds.** This memo closes D1S4 formally. ADJ-A0 is a genuinely **distinct abstract double-sum lemma**; the physical-source adapter will not be staged until this math-only interface qualifies.

## 4. Proof DAG and implementation protocol

| Node | Exact claim | Allowed source imports | Current state | Gate to advance |
| --- | --- | --- | --- | --- |
| **D1S3** | Original `M.fermionCoefficient x` is real skew for all `AlgebraData N` | Original BFSS + accepted G1A | **SOURCE STRICT GREEN** | Frozen [#44976962312](https://github.com/etblink/math/actions/runs/44976962312) |
| **ADJ-A0** | Any pairwise star-skew `U : ι → ι → A` has `star (∑r∑s U r s) = -(∑r∑s U r s)` | **Only pinned `Mathlib.Algebra.Star.BigOperators`** | **NEW, PENDING** | Single-root cold module build + strict `#print axioms`, one original artifact |
| **ADJ-A1** | A typed real scalar and original self-adjoint pair of theta operators satisfy `star U(r,s) = -U(s,r)` | Exact original `FermionQuantization`, frozen D1S3, qualified A0 (not D1S4) | **DESIGN ONLY** | First isolate `c : ℝ`, `z : ℂ`, `F : Fermion N →L[ℂ] Fermion N`, establish `-(c • F) = (-c) • F` with explicit arguments. Do **not** rewrite `K` inside the operator expression. |
| **ADJ-A2** | Literal physical `M.quantizeFrequency(M.fermionCoefficient x)` is self-adjoint on original finite `Fermion N` | Qualified A0/A1 and frozen D1S3 plus original quantizer | **BLOCKED / DESIGN** | Source-only strict gate, later distinct independent public-name consumer |
| **PHYSICS** | Full original Hamiltonian domain/closure, sector, spectrum and physical Hopfion/GUT tests | Actual `SmoothCore`, physical `FullL2`, original charges and nonlinear bosonic terms | **NOT ESTABLISHED BY ADJ-A0** | Separate analytical and physical gates |

**Separation policy:** an ADJ-A0 GREEN proves an abstract finite-sum identity and **nothing about the original Fock operator**. It must not promote D1S4, ADJ-A1/A2, or the physical milestone. If A0 RED, save its first causal evidence; one targeted repair maximum, then stop and assess local Lean tooling. Do not launch a full original BFSS 9,000-job run while ADJ-A0 is pending.

## 5. Exactly implemented new atom and strict contract

New source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSAdjointA0AbstractPairSumStarSkew.lean`, Git blob `373e9929a9d2aa5a6d9bb3e1b01c4748d44fcea0`, imports **only** `Mathlib.Algebra.Star.BigOperators`; one explicit theorem `FCP.BFSSAdjointA0.finitePairSum_star_skew` and one `#print axioms` root. Its calculation copies the successful explicit outer star-sum, inner star-sum, finite `sum_congr`, nested negation and `Finset.sum_comm` architecture from the D1S4 R2 subproof, **without** any original matrix coefficient or Fock source.

New path-scoped workflow `.github/workflows/bfss-adj-a0-abstract-pairsum-star-strict.yml`, Git blob `aacba0b3a05fc4958906f37206fac71b88193257`. It checks a one-import/one-root contract, exact Lean 4.34.1 and pinned Mathlib, prohibits axioms, `sorry`, recursion/linter bypasses, runs a **narrow Mathlib-only native module build** and warning-as-error recompilation, requires axiom set ⊆ `{propext, Classical.choice, Quot.sound}`, and unconditionally archives original logs. Exact CI run/commit are to be recorded after deployment; **no GREEN claim at design time**.

**Immediate stop and observation:** ADJ-A0 is the only runnable new obligation in this interval. Freeze all original BFSS definitions, frozen D1S4, earlier consumer gates, main, unified integration, RHOPF and toolchain. Route the next physical lemma only after a verified abstract source GREEN.

## 6. Launch receipt — abstract microgate only

New [ADJ-A0 R1 strict run #44981248994](https://github.com/etblink/math/actions/runs/44981248994) launched at **exact source/workflow tested commit** `66edb4caf5c59aba3bc3cddb902435f6da3618f7`, GitHub job `137082003730`. At the launch audit, contract preflight **PASS**, checkout **PASS**, pinned Lean/Mathlib restoration in progress; native build/strict axiom result **PENDING**, no accepted A0 theorem. This is an independent coefficient-free sum lemma, not D1S4 R3. Preserve first-causal diagnostics if RED and accept only original successful run and single-root axiom report if GREEN.


## 7. ADJ-A0 R1 strict GREEN — accepted original proof at exact commit

**CURRENT DISPOSITION: QUALIFIED ABSTRACT THEOREM (source-only, not BFSS physical)**. Earlier "PENDING" text above records launch-time status, now superseded by this exact receipt.

- [Original ADJ-A0 strict GREEN #44981248994](https://github.com/etblink/math/actions/runs/44981248994), `completed/success`, exact tested SHA `66edb4caf5c59aba3bc3cddb902435f6da3618f7`, run attempt 1, job `137082003730`; job checkout/preflight, pinned Lean 4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, native and strict stages, and artifact archive all **PASS**.
- Native module build: `Build completed successfully (904 jobs)`. Strict `lake env lean -DautoImplicit=false -DwarningAsError=true` recompilation **PASS**. Literal `BFSS_ADJ_A0_ABSTRACT_PREFLIGHT_PASS` and `BFSS_ADJ_A0_ABSTRACT_STRICT_GREEN` markers both present in original job output.
- Exactly one strict source root: `FCP.BFSSAdjointA0.finitePairSum_star_skew`; axioms **exactly** `[propext, Classical.choice, Quot.sound]`; `sorryAx` absent from the actual axiom report.
- Original [artifact #14737403671](https://github.com/etblink/math/actions/runs/44981248994/artifacts/14737403671), 5,056 bytes, GitHub-reported digest `sha256:1b064c9191eb8bd536d73a5673b0976f6f34087ad88a0eb8ded61fab4bc18f99`; artifact upload job output reports the identical hash, artifact ID and size. This is the GitHub-provided digest, not an independently recomputed downloaded ZIP.
- Accepted new source Git blob `373e9929a9d2aa5a6d9bb3e1b01c4748d44fcea0`, dedicated workflow blob `aacba0b3a05fc4958906f37206fac71b88193257`, both frozen and unchanged.

**Exactly what was proved:** for any finite index type and an additive abelian group with compatible star operation, every `U` satisfying `star (U r s)=-(U s r)` has skew-star double sum. The proof makes no mention of original `FrequencyMatrix`, theta, BFSS Fermion or scalar multiplication. It does **not** establish ADJ-A1, ADJ-A2, original finite-Fock Hermiticity, gauge covariance, physical-domain invariance, spectral gap, Hopfion, SM or GUT.

**Next allowed gate (design):** ADJ-A1 must use fully typed scalar/coefficient-independent helpers first; only after their exact source CI accepts may the original `K r s` matrix entry be introduced at a controlled boundary. No D1S4 R3; its two original REDs and artifacts remain frozen. A later physical source theorem needs independent source and public-consumer qualification.


## 8. ADJ-A1 source-exact coefficient-independent original theta pair adapter staged

ADJ-A0 strict GREEN has been promoted (Section 7). Next bounded target now staged as a **new** source-only ADJ-A1 theorem pair with explicit coefficient `c : ℝ`, and `d : ℝ` satisfying `c=-d`: the original theta pair on original `Fermion N →L[ℂ] Fermion N` obeys the real-scalar adjoint and negative reverse order identities **without any source matrix entry in the rewrite**. [ADJ-A1 full scoped report](./ADJ_A1_TYPED_ORIGINAL_THETA_PAIR_SOURCE_PLAN_2026_11_21.md).

[ADJ-A1 R1 #44982026198](https://github.com/etblink/math/actions/runs/44982026198), exact tested `5afd9befcc2b16e52cdc991e6d18234d373dfb6f`, launched and **PENDING**; source blob `0441b0d067dcd9e1d1e721b3c576a6e8a0600a53`, strict workflow blob `39766e82b3992e29e39b36034f0468ca3ef96dcf`. The original full D1S4 `K r s` proof is not touched or restarted. Strict original physical theorem and public consumer remain unqualified.
