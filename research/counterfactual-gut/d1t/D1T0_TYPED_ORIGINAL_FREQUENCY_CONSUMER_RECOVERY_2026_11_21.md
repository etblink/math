# D1T0 — typed original-frequency independent consumer recovery

**Research date:** November 21, 2026 (America/Los_Angeles). **Status at intake:** NEW D1T0 strict gate launched, **PENDING / NOT QUALIFIED**. This is a distinct limited consumer architecture, **not D1S1 R3**.

## Exact source and provenance

- Branch `research/bfss-hopfion-gut-counterfactuals-20261121`, new consumer/workflow-only tested commit `2395ca76ea290ec5a2cc310353b3eeb2dc6b541d`.
- [D1T0 strict source + consumer run #44966825031](https://github.com/etblink/math/actions/runs/44966825031), in progress at initial documentation checkpoint.
- New consumer: `lean/diagnostics/BFSSD1T0TypedOriginalFrequencyConsumer.lean`, Git blob `590678150e6597379c1fc49122dc135c38110a60`.
- Dedicated strict workflow: `.github/workflows/bfss-d1t0-typed-original-frequency-consumer-strict.yml`, Git blob `cb36470ec8deafd0f7a909891f19331bca2d1785`.
- Frozen imported D1S1 source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/D1S1OriginalFrequencyGaugeTransportProbe.lean`, Git blob `c2946bab3f82bf1ba57574a6a9d18258c185ef99`.
- Frozen native-success / independently qualified source predecessor D1S0: Git blob `9fd3a61f9dac8a370a68920303a39f3c8b81b6bd`, [strict GREEN #44961701135](https://github.com/etblink/math/actions/runs/44961701135).
- Frozen original source and Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` pinned in the workflow; no new BFSS definitions, `main`, unified integration, RHOPF or source changes.

## Changed consumer architecture

R2 of D1S1 [#44965032924](https://github.com/etblink/math/actions/runs/44965032924) strictly compiled both source theorems and permitted axioms but the independent consumer failed with `maximum recursion depth has been reached` at line 26, while elaborating a large literal `pairedGaugeData`/`pairedAlgebraData` theorem type. D1S1 remains **RED/FROZEN**; R1 [#44963966993](https://github.com/etblink/math/actions/runs/44963966993) was an unused simp-warning strict RED.

D1T0 names two *exact*, explicitly typed **private abbreviations**:

```lean
private abbrev M : AlgebraData 2 := pairedAlgebraData
private abbrev G : M.GaugeData := pairedGaugeData
```

The gate independently consumes four *small* exact original-carrier declarations:

| Consumer root | Contract |
| --- | --- |
| `typed_frequency_transport` | Original real `FrequencyMatrix 2` input/output-color coefficient formula, consuming D1S1 source theorem |
| `typed_original_frequency_gauge` | Exact source SU(2) covariance of the **literal original** `M.quantizeFrequency K` on `Fermion 2`, with typed original gauge action `G.fermion g`, consuming the strict-source-qualified theorem |
| `exact_original_fermion_alias` | `G.fermion g = pairedGaugeData.fermion g` by definitional equality, no substitute group action |
| `exact_original_quantizer_alias` | `M.quantizeFrequency K = pairedAlgebraData.quantizeFrequency K` by definitional equality, no substitute quadratic/Fock model |

The last two theorems are not physical results: they provide small independent, typed proof obligations connecting the source theorem to the **literal** upstream public definitions without one large definitional expansion. Strict workflow still rebuilds the frozen source and checks `sourceTransportFrequency_apply` and `originalQuantizeFrequency_gauge` alongside all four consumer roots, permitting only `propext`, `Classical.choice` and `Quot.sound`. No `maxRecDepth` or `maxHeartbeats` workaround, `sorry`, `admit`, or new axioms.

## Qualification and stop

**PENDING** until exact GitHub run finishes: verify source-pin preflight, toolchain, cold 9k-job source build, warning-as-error source and consumer compiles, all six printed allowed-axiom reports, unconditional ZIP archival and original exact tested SHA. Static root/import/pin checks at author time are not Lean compilation.

If D1T0 fails, preserve first-causal source/consumer logs and artifact before any rewrite. Do not automatically launch a second run. If successful, accept **the original source theorem through this typed, original-name-bridged consumer**; do not retroactively mark the two D1S1 runs green. This does **not** establish Gaussian projector rank, a source `SmoothCore` physical trial, 16-supercharge Hamiltonian form estimate, physical hopfion or GUT.

## R1 adjudication — strict RED; original source strict PASS; second consumer root recursion RED

**Verified original [run #44966825031](https://github.com/etblink/math/actions/runs/44966825031)** at exact tested commit `2395ca76ea290ec5a2cc310353b3eeb2dc6b541d`, first attempt, job `137037638976`, completed `failure` (2026-11-22T00:42:04Z). Source pins, exact Lean `4.34.1` and Mathlib restore, cold native source build (`Build completed successfully (9074 jobs)`), warning-as-error source recompilation and both source axiom roots all **PASS**. The original D1S1 source covariance theorem is still strictly compiled with only `[propext, Classical.choice, Quot.sound]`. No source mathematical proof error was reported.

**First causal consumer error** occurred at `diagnostics/BFSSD1T0TypedOriginalFrequencyConsumer.lean:38:0`:

```text
error: maximum recursion depth has been reached
use `set_option maxRecDepth <num>` to increase limit
```

Independent consumer axiom reports: `typed_frequency_transport` PASS `[propext, Classical.choice, Quot.sound]`; `typed_original_frequency_gauge` **ELABORATION ERROR** (subsequently prints `does not depend on any axioms`, which is meaningless as proof qualification); `exact_original_fermion_alias` PASS `[propext, Classical.choice, Quot.sound]`; `exact_original_quantizer_alias` PASS `[propext, Classical.choice, Quot.sound]`. No strict-consumer GREEN sentinel; R1 **RED / NOT QUALIFIED**.

Original archived [artifact #14732800726](https://github.com/etblink/math/actions/runs/44966825031/artifacts/14732800726), GitHub-reported SHA-256 `86bdc255ddd6e5edef5a874ed37824f9a8c87836da4a87ae9760f35f7655def6`, 11,266 bytes. The artifact is separate from D1S1 R1/R2 archives and not overwritten.

### Repeated independent-consumer failure: update the hypothesis

D1S1 R2's explicitly expanded original-name consumer failed at its second theorem, and D1T0 R1's syntactically aligned private typed `M/G` consumer also fails at its second theorem. Therefore **simple typed-abbreviation alignment is experimentally rejected as a sufficient elaboration repair**. The two small original-source alias theorems do compile independently, so there is no observed source-model substitution. The precise recursion hot path is not determined: Lean's standard message does not distinguish expansion of `GaugeData`, type inference, definitional equality, or kernel elaboration. Avoid claiming a specific mechanism without diagnostic traces.

### Stop decision and changed consumer architecture (DESIGN ONLY)

**Do not launch D1T0 R2 automatically; no edit to the compiled source, old consumers or workflows.** This was the stated stop condition at launch. Do not raise `maxRecDepth` or `maxHeartbeats` merely to hide the issue.

Possible next *uncompiled* smaller interface experiment: in a separate scratch module, import the compiled D1S1 theorem and first test `#check FCP.BFSSHopfD1S1.originalQuantizeFrequency_gauge` alone; then define a **type-inferred theorem certificate** without restating the large proposition, e.g. `theorem inferred_covariance := FCP.BFSSHopfD1S1.originalQuantizeFrequency_gauge`, and check its inferred type and axioms. Only after that succeeds, add *separate* source-exact `rfl` alias tests and test application to `g`, `K`, `v`; lastly attempt an explicit original-name theorem in a separate gate, with granular diagnosis, not as the first declaration. This may help isolate elaboration versus definitional reduction but is **not equivalent to a fully independent consumer** unless the final literal public-source interface also compiles. Do not promote a mere inferred alias as full independent qualification.

Original D1S1 strict source result remains a validated mathematical source theorem on original 48-label `FrequencyMatrix 2` and `Fermion 2`. The complete independent strict gate is still RED. D1S0 remains strict GREEN, D1R0 RED/FROZEN. No rank-one projector, physical SmoothCore, source Hamiltonian form bound, hopfion or GUT theorem.
