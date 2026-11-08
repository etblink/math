# BFSS — Procedural success/failure review and optimization policy

**Recorded:** 2026-11-07, America/Los_Angeles  
**Repository:** etblink/math  
**Research branch:** research/bfss-original-gamma-faithfulness-20261107  
**Exact review baseline:** b07f2799853cc4f9665eeb73b67add4c9bf04e98  
**Status:** Dated operational research and a prospective procedure; NOT a new mathematical theorem, CI qualification, altered strict policy, or new cache qualification.

> Seek truth about reality. Preserve results, not theories. Negative knowledge is an asset. Optimize new, source-faithful mathematical knowledge per unit of effort, not the number of green runs.

The [FCP Project Lead evergreen guidance](https://github.com/etblink/Foundational-Convergence-Program/blob/cc608e2282e1b32bb11bbb64424e4775b28138e2/handoffs/FCP_PROJECT_LEAD_EVERGREEN_RESEARCH_GUIDANCE_0_1_0.md) is authoritative on stable general methods. Its pinned blob is f5b53f680e7b3c119491be01306a33d83586bd9a. Keep dated failures, measured timings and live branch states in this **scoped** memorandum, not in the evergreen.

## 1. Current decision and scope

The owner requested examination of successes and failures while [run #42454470502](https://github.com/etblink/math/actions/runs/42454470502), candidate source b07f2799853cc4f9665eeb73b67add4c9bf04e98, was in progress. At the review checkpoint its exact input/preflight step passed; pinned Lean/Mathlib was restoring and cold compilation had not completed. **Do not promote the current candidate to accepted** on this evidence. Its terminal state requires a later verification.

The in-flight gate proposes a faithful continuous homomorphism from the actual original fixed-axis SO(9) subgroup to SO(8) on original labels 0–7, with 14 public roots and 26 independent consumer examples. Its manifest stages 125 original, 9 accepted and 2 candidate sources (136 cold compilations), with 166 pinned inputs. The inverse block embedding, complete SO(8) equivalence and vector-preserving Spin(8) comparison remain separate.

The immediately preceding source-geometry theorem acceptance is the actual original stabilizer two-sheeted covering [run #42452043377](https://github.com/etblink/math/actions/runs/42452043377), tested f47dd34b869a1aec39e95a2ccb852f4ba67f5b22.

**Operating decision:** keep formal qualification unmodified; review unfamiliar pinned Lean interfaces before paying for another full cold rebuild; freeze source mathematics whenever only its consumer fails; use bounded structural diagnostics selectively; and evaluate any new ancestry cache separately from live proof work.

## 2. Recent completed-run census

The GitHub Actions branch listing at this checkpoint contained 21 recent runs: **20 completed**, equally split **10 green and 10 red**, and **one still in progress** (#42454470502). Of the ten greens, nine are strict source-mathematics gates and one is a separately bounded structural diagnostic. These counts describe attempts, not a mathematical proof success probability.

| Qualified step | Green run | Scope |
| --- | --- | --- |
| Source gamma faithfulness | [42408460376](https://github.com/etblink/math/actions/runs/42408460376) | Actual source gamma faithfulness |
| Fixed-axis Cartan diagnostic | [42419684762](https://github.com/etblink/math/actions/runs/42419684762) | Structural diagnostic only, not source Spin theorem |
| Exact eight perpendicular source words | [42421286452](https://github.com/etblink/math/actions/runs/42421286452) | Literal source stabilizer word iff |
| Original PBW path connectedness | [42426258689](https://github.com/etblink/math/actions/runs/42426258689) | Actual source stabilizer connectedness |
| Compact quotient parameterization | [42429216538](https://github.com/etblink/math/actions/runs/42429216538) | Exact eight-word quotient |
| Restricted original vector continuity | [42435908276](https://github.com/etblink/math/actions/runs/42435908276) | Original SO(9) vector action on PBW stabilizer |
| Arbitrary-target Euclidean bridge | [42441345508](https://github.com/etblink/math/actions/runs/42441345508) | Full original matrix/isometry transport |
| Arbitrary fixed-axis target preimage | [42444640879](https://github.com/etblink/math/actions/runs/42444640879) | Noncircular genuine source Spin preimage |
| Stabilizer projection/two-sign fibers | [42448494747](https://github.com/etblink/math/actions/runs/42448494747) | Actual source/target subgroups, kernel and fibers |
| Original two-sheeted topological covering | [42452043377](https://github.com/etblink/math/actions/runs/42452043377) | Genuine compact connected quotient covering |

The **eight failed full strict jobs** consumed about **161 minutes** of observed CI job runtime, roughly 20 minutes per failed job. The two additional failed structural diagnostic jobs each took about five minutes. These measurements come from GitHub job timestamps, across different imports, runners and network conditions; they are not controlled speed comparisons or automatically recoverable costs.

## 3. The ten red runs: first causal mechanism

The retained gate records identify **no mathematical counterexample among these particular reds**; this is not evidence that all candidate claims must be true. Several errors occurred after source proofs already compiled.

| Cause category | Count | First-cause evidence |
| --- | ---: | --- |
| Lean type, API, coercion or subtype interface | 5 | [42419001149](https://github.com/etblink/math/actions/runs/42419001149): Submodule.span_singleton_le_iff_mem explicit argument. [42424031388](https://github.com/etblink/math/actions/runs/42424031388): subspace norm and continuity subtype. [42440025364](https://github.com/etblink/math/actions/runs/42440025364): explicit Matrix.mem_orthogonalGroup_iff' argument. [42443227754](https://github.com/etblink/math/actions/runs/42443227754): independent self-polar and Matrix.col_apply conversions. [42446746331](https://github.com/etblink/math/actions/runs/42446746331): subgroup-vs-set membership via SetLike.mem_coe. |
| Lean resource-heavy elaboration | 2 | [42432065694](https://github.com/etblink/math/actions/runs/42432065694): source ContDiff-to-Continuous whnf timeout at 200,000 heartbeats. [42434082524](https://github.com/etblink/math/actions/runs/42434082524): consumer fixed-vector composition same unchanged limit. |
| Missing import | 1 | [42418408846](https://github.com/etblink/math/actions/runs/42418408846): concrete EuclideanSpace was missing until the pinned PiL2 import was added. |
| Strict style linter | 1 | [42406810092](https://github.com/etblink/math/actions/runs/42406810092): consumer no-op change, though source compiled. |
| Deprecated API | 1 | [42450508588](https://github.com/etblink/math/actions/runs/42450508588): deprecated Set.mem_setOf_eq replaced with pinned Set.mem_ofPred_eq; warning-as-error was retained. |

A printed completion marker, selected successful roots or a recovery-generated sorryAx report never overrides a nonzero compiler exit, uncompiled consumer or incomplete receipt. A subsequent successful commit qualifies **only its own tested SHA**.

## 4. What consistently works

**Source-faithful decomposition:** structure → specialize the literal source → discharge source premises → compose small named interfaces. We kept original Spin(9), original SO(9) matrices, Clifford multiplication order, source labels, PBW topology, two distinct central signs and the physical claim boundary. Separate algebraic, topological and coordinate gates made the first failure easier to isolate.

**Research before proof pressure:** the new fixed-axis surjectivity route did not unnecessarily impose perpendicular support on Cartan normals. Generic factorization on an independently defined arbitrary target isometry, even-list lifting and equality of the whole source nine-vector action supplied the preimage; axis fixing then placed it inside K. This was less work than rebuilding a stronger supported-normal theorem for an arbitrary target.

**Explicit checked bridges:** typed intermediate equalities, continuity pairs and subtypes, matrix arguments, SetLike and Submodule coercions, coordinate isometry equivalences and pinned theorem names routinely beat speculative unfolding, inferred conversion and broad simplification.

**Source freeze after success:** [42434082524](https://github.com/etblink/math/actions/runs/42434082524) compiled the complete original continuity source; the consumer alone timed out. We froze the source and repaired only the typed consumer composition, then qualified [42435908276](https://github.com/etblink/math/actions/runs/42435908276). Similarly [42443227754](https://github.com/etblink/math/actions/runs/42443227754) compiled the complete target-preimage source, and its two consumer conversion fixes qualified at [42444640879](https://github.com/etblink/math/actions/runs/42444640879). The source bytes and exact consumer propositions stayed fixed in both recoveries.

**Strict independent acceptance:** retain Git-blob/SHA-256 input closure, locked Lean 4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 plus all 42 package revisions; cold source and independent consumer compilation; compiler exit and warning-as-error controls; allowed propext, Classical.choice and Quot.sound axiom audit; negative/adversarial examples; and a complete archive and PASS receipt.

## 5. What repeatedly fails, and what not to repeat

The [V8A validator review](FCP_K1D18V8A_THREE_GATE_CAUSAL_REVIEW_AND_VALIDATOR_RECOVERY_2026_10_30.md) records two strict failures caused by regex assumptions about Lean pretty-printing after actual typed Lean propositions had passed. The fix is **kernel-checked independent Lean examples for exact types**, not increasingly permissive text regex. Keep log parsing only for stable, controlled axiom and completion markers.

The [V9Z six-red review](FCP_K1D18V9Z_SIX_RED_METHOD_CAUSAL_REVIEW_GATE7_2026_10_31.md), [F10BY three-red review](FCP_K1D18V10H_F10BY_THREE_RED_METHOD_REVIEW_AND_RECOVERY_PLAN_2026_11_02.md) and [F10DF two-red review](FCP_K1D18V10H_F10DF_TWO_RED_METHOD_REVIEW_AND_AUDIT_CONVERSION_REPAIR_2026_11_05.md) reinforce these warnings: guessing namespace or API arguments, applying another type annotation without diagnosing the missing instance, reattempting the same wrapper failure, or unfolding an entire large original source term are poor strategies.

The evergreen sets a specific stop condition: after **two wrapper-level reds without new mathematical evidence**, stop full retries; repair or discard the wrapper offline and use a discriminating direct source-interface experiment.

Our earlier runtime audit documented Lean 4.34.1 startup failure on the local execution platform because of the /proc/<pid>/exe readlink behavior. Reinstalling the toolchain or changing PATH did not address that cause. Static YAML/Python/manifest checks are useful but **not a Lean compilation**. Never assert a local Lean proof check when the compiler cannot run in that environment.

## 6. Cache optimization: what was actually measured

[DD/AI ancestry-cache pilot](FCP_DD_AI_CACHE_PILOT_2026_11_06.md):

| Run | Duration | Meaning |
| --- | --- | --- |
| [42209582510](https://github.com/etblink/math/actions/runs/42209582510) | 14m05s | Historical original uncached DP run |
| [42233175853](https://github.com/etblink/math/actions/runs/42233175853) | 18m21s | Qualified cold source/ancestor rebuild and cache seed |
| [42236906737](https://github.com/etblink/math/actions/runs/42236906737) | 10m47s | Real same-key warm cache hit with verified object hashes and fresh consumers |

Observed warm improvement versus the cold seed: **7m34s (41.2%)**. The warm run was 3m18s (23.4%) below the earlier uncached observation. These were one-time timings with different runner/network conditions; they do not establish a guaranteed speedup.

The qualified cache contained only 175 sealed accepted ancestry objects (22,828,264 bytes uncompressed, 6,456,057 compressed), with exact source/environment/branch/version/save-path keys, per-object hashes, 666 freshly checked imported-root reports and all newer parent/candidate/audit work fresh. A missing key took the cold route; a corrupt hit failed closed. Cache reuse was explicitly **not** a fresh recompilation of those accepted sources or a new theorem.

The [dependency-cache size review](FCP_PINNED_LEAN_MATHLIB_CACHE_SIZE_DECISION_2026_10_28.md) found approximately **12.09 GB** physical toolchain plus packages and rejected blindly caching the entire environment. The DD/AI cache has a different frozen closure and cannot be transferred to the current SO(8) gate by analogy.

**Cache policy:** no current changes. A new cache deserves a separate size/closure audit, trusted cold-seed gate, exact-key warm run, all input/object proofs rechecked, fresh new candidate and consumer compilation, manual cold route, fail-closed behavior and a measured runtime benefit. No new cache is authorized or implemented by this memorandum.

## 7. Prospective two-lane procedure

### Lane E — inexpensive exploration and interface discovery

1. Name the exact mathematical uncertainty, original type/hypotheses, counterexample/negative cases, boundary of the claim and cost of the next run.
2. Read the **pinned** Mathlib definitions of every new import, theorem, namespace, implicit argument, subtype/set coercion, matrix orientation, deprecated alias and required instance.
3. Perform static input/closure, unique hash, import, manifest, independent example inventory, YAML/Bash/Python and source-root/marker checks **before** expensive CI.
4. If there is a genuinely unfamiliar or resource-sensitive operation, use a narrowly scoped direct Lean diagnostic in a working compiler environment. This is optional for straightforward known interfaces and never substitutes for final qualification.
5. In the explicitly exploratory lane, collect useful compiler warnings where appropriate while still rejecting proof holes, unauthorized axioms and nonzero compiler exits. Do not conflate diagnostic success with strict acceptance.

### Lane Q — complete, unchanged formal qualification

1. Freeze original mathematical statements, accepted ancestors, negative consumers and environment/source pins.
2. Freshly compile the exact closure, candidate source and independent consumer under the strict warning, resource, axiom, root and marker policies.
3. Reject missing inputs, source drift, unexpected axioms, recovery sorryAx, incomplete reports or receipt, failed consumer, linter waiver or proof-limit changes masquerading as evidence.
4. Preserve accepted and failed tested SHAs, complete compiler logs, exit status, exact pins, environment identities, marker and axiom inventories, archive digest and receipt.
5. After full evidence review, commit **scoped** documentation stating what was actually qualified and what remains open; never rewrite earlier red verdicts as green.

### First-cause triage decision table

| Observation | Required response |
| --- | --- |
| Unknown identifier, import, namespace, deprecated theorem | Inspect actual pinned declaration; make exact local correction |
| Subtype, matrix, norm, equality or coercion mismatch | Prove explicit intermediate type/equality at original source carrier |
| Whnf, recursion or heartbeat timeout | Isolate expensive expression, split computation into typed lemmas; no reflexive budget increase |
| Source builds; consumer fails | **Freeze source bytes**, preserve consumer proposition inventory, repair only consumer proof and pins |
| Wrapper or text validator fails after source | Separate proof evidence from wrapper failure; use checked Lean examples for types, not print-format regexes |
| Same wrapper error twice | Stop full retries, repair wrapper offline, require new discriminating evidence |
| Genuine mathematical mismatch or negative witness | Reassess original claim, record negative result, do not patch the theory by covert replacement |
| Full green gate | Verify the exact tested SHA, all outputs, root types, axiom sets, archived evidence and negative checks before qualified status |

## 8. Compact pinned-interface ledger for subsequent gates

These are context-sensitive research reminders, not global rewrite recipes. Reinspect the declared theorem at the exact pinned Mathlib revision before reusing it.

| Problem | Previously successful interface |
| --- | --- |
| Singleton span inclusion | Explicit parameters to Submodule.span_singleton_le_iff_mem |
| Submodule/Euclidean norm equality | Submodule.norm_coe |
| Continuity into an original subtype | Typed base continuity, then Continuous.subtype_mk |
| Composition of continuous source maps | Explicit intermediate Continuous pair and function types |
| Orthogonal-group matrix parameter | Explicit argument to Matrix.mem_orthogonalGroup_iff' |
| Original quadratic form self-polar | QuadraticMap.polar_self and source coordinate-unit theorem |
| Original matrix column evaluation | Matrix.col_apply |
| Subgroup membership vs underlying set | SetLike.mem_coe |
| Deprecated set-membership rewrite | Set.mem_ofPred_eq instead of deprecated Set.mem_setOf_eq |
| Unnecessary proof tactic / linter | Compiler-prescribed local correction, not linter suppression |
| Original SO(8) coordinate block | Ordered Fin.castSucc 0–7, fixed ninth column, orthogonality-derived final row, determinant minor and cross-block product |

## 9. Future measurement and stop rules

Track full strict builds per **new qualified source theorem boundary**, total CI minutes, first-causal failing phase, source-complete/consumer-incomplete events, repeated identical errors, number of failures identified before a full rebuild, and completeness of evidence archives. Do not optimize the green/red ratio by avoiding meaningful independent adversarial testing.

For caches, separately measure sealed source inventory, actual archive size, exact-key hit/miss, restore/verify duration, cold versus warm ancestor cost, current candidate and independent-consumer freshness, and cold fallback safety.

If a new run cannot resolve a different uncertainty or cross an identified proof boundary, do not submit it merely to try again.

## 10. Current execution and scientific boundaries

Run #42454470502 remains **unqualified at this review checkpoint** and must not be modified while running. Once the owner reports its terminal outcome, check actual CI and retained evidence. A green would qualify only the coordinate-exact H to SO(8) **restriction**, leaving inverse diagonal embedding and a full group homeomorphism for a distinct gate. A red demands first-cause classification and the smallest appropriate source/consumer/runner repair.

Even the accepted source Spin(9) stabilizer covering does not establish abstract Spin(8) classification, triality-safe B4/D4 branching, a full complex Fock-operator action, physical domain closure/equality, coercivity, compact resolvent, eigenstate existence or a mass gap.

**Preservation boundary:** this document records a decision method and dated evidence, with a link from the scoped axis-stabilizer recovery plan. No Lean, manifest, CI workflow, resource policy, theorem premise or mathematical acceptance evidence is changed.
