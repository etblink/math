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
