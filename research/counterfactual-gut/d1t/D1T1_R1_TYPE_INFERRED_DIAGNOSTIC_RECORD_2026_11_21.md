# D1T1 R1 — type-inferred original BFSS source-theorem diagnostic

**Date:** 2026-11-21 (America/Los_Angeles). **Disposition at launch:** **PENDING DIAGNOSTIC**, not an independent original public-interface qualification. This is not D1T0 R2 or D1S1 R3.

## Exact tested source identity

- Branch `research/bfss-hopfion-gut-counterfactuals-20261121`.
- [Strict diagnostic run #44968639116](https://github.com/etblink/math/actions/runs/44968639116), **launched** at exact source commit `87bf96c761e28407137320622bac8d5cd98b9ec2`. Job ID `137043278951`. No source/consumer GREEN outcome at the launch checkpoint.
- New check-only Lean file `lean/diagnostics/BFSSD1T1SourceDeclarationCheck.lean`, Git blob `12f214dbf97c31aa47435c6abf03d4cc39924969`.
- New source-theorem-inference Lean file `lean/diagnostics/BFSSD1T1InferredGaugeConsumer.lean`, Git blob `cf086b6970c1893a010119a1e5e6e43e1125d852`.
- Dedicated source-pinned, unconditional-archive strict workflow `.github/workflows/bfss-d1t1-source-type-inference-diagnostic-strict.yml`, Git blob `c4d0ec76ee1e4fd8d8319af3ad0373eff1bff0d2`.
- FROZEN original source D1S1 `D1S1OriginalFrequencyGaugeTransportProbe.lean`, blob `c2946bab3f82bf1ba57574a6a9d18258c185ef99`, strictly compiled with permitted axioms in [D1S1 R2 #44965032924](https://github.com/etblink/math/actions/runs/44965032924) and [D1T0 R1 #44966825031](https://github.com/etblink/math/actions/runs/44966825031); no edits to it or original BFSS source.
- Frozen D1S0 source blob `9fd3a61f9dac8a370a68920303a39f3c8b81b6bd`, strict independently GREEN [#44961701135](https://github.com/etblink/math/actions/runs/44961701135). D1R0, D1S1 full consumer and D1T0 full consumer histories remain RED/FROZEN.

## Why a different consumer experiment is warranted

D1S1 R2 independent consumer's theorem restated the large original-name operator equality and failed at declaration line 26:0 with `maximum recursion depth has been reached`. D1T0 R1 restated the same proposition via typed source abbreviations `M/G`; its second consumer declaration also failed, at line 38:0. In both, original source theorem typechecked strictly with only `[propext, Classical.choice, Quot.sound]`; D1T0 successfully compiled its coefficient consumer and two literal-public-source `rfl` alias bridges. Therefore, simply naming the original source interfaces by typed abbreviation does not cure proposition elaboration.

Lean's official language reference requires a type signature for `theorem`; D1T1 accordingly tests the explicit **type hole** `: _` instead of a type-less `theorem foo := ...`. No local Lean toolchain is available; syntax and type-hole inference are only *candidate* until native CI.

## Diagnostic A: source declaration check

Import the same original source D1S1, then separately `#check` its two existing theorems and `#print axioms` them. This stage is explicitly distinct from the inferred consumer stage. A pass verifies ability to inspect the imported theorem but does not create a consumer proof.

## Diagnostic B: small inferred reference and application

Use two separate proof obligations without restating the large equality:

```lean
theorem inferred_source_reference : _ :=
  FCP.BFSSHopfD1S1.originalQuantizeFrequency_gauge

theorem inferred_source_application
    (g : GaugeGroup 2) (K : FrequencyMatrix 2) (v : Fermion 2) : _ :=
  FCP.BFSSHopfD1S1.originalQuantizeFrequency_gauge g K v
```

Then consume the original real 48-index coefficient map and separately compile two exact `rfl` bridges to **literal** `pairedGaugeData.fermion` and `pairedAlgebraData.quantizeFrequency`. These alias the source model; they do not replace it.

The CI checks frozen source pins, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, source cold build, strict warning-as-error source rebuild, diagnostic-A check-only file, diagnostic-B inferred consumer, and exact permitted-axiom reports. Success sentinel `BFSS_D1T1_TYPE_INFERENCE_DIAGNOSTIC_GREEN` is **deliberately not an independent-consumer acceptance sentinel**. First-causal failure logs and artifact always uploaded.

## Stop and acceptance boundaries

- A diagnostic RED means only that the new experiment failed to elaborate; preserve its first cause and artifact, no immediate broad retry.
- A diagnostic GREEN would show the source theorem can be referenced/applied without restating a large type and the two original-source aliases compile; it **would not qualify the explicit original public-name consumer**, nor rewrite historical D1S1/D1T0 RED records.
- Future full acceptance, if scientifically useful, requires a separately typed, explicitly source-public operator identity with an independent consumer, exact original source pins, strict source and consumer Lean checks and allowed-axiom reports.
- No rank-one CAR Gaussian projector, original `SmoothCore` physical trial, normalized BFSS Hamiltonian energy form, spectral theorem, physical Hopfion or GUT inference is established by this gate.
