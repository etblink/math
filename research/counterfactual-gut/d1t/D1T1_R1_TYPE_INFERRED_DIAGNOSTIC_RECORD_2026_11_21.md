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

## D1T1 R1 strict RED — declaration header metavariables cannot infer from theorem proofs

**Verified [run #44968639116](https://github.com/etblink/math/actions/runs/44968639116)** at exact tested commit `87bf96c761e28407137320622bac8d5cd98b9ec2`, job `137043278951`; GitHub `completed/failure`, attempt 1. Frozen original-source preflight, Lean 4.34.1 and pinned Mathlib, native source cold build (9,074 jobs), and warning-as-error source recompile all **PASS**. Both source axiom roots report `[propext, Classical.choice, Quot.sound]` without `sorryAx`. Independent check-only file `BFSSD1T1SourceDeclarationCheck.lean` **PASS**: actual imported theorem signatures and allowed-axiom reports printed.

**First causal failure** occurred when Lean elaborated the next file `diagnostics/BFSSD1T1InferredGaugeConsumer.lean` at lines 29:36 and 35:65:

```text
error(lean.inferDefTypeFailed): Failed to infer type of theorem `inferred_source_reference`
Note: All parameter types and holes (e.g., `_`) in the header of a theorem
are resolved before the proof is processed; information from the proof
cannot be used to infer what these values should be
error(lean.inferDefTypeFailed): Failed to infer type of theorem `inferred_source_application`
```

The two declarations used `theorem ... : _ := <source proof>` and thus violated Lean's declaration elaboration rules. This is a **syntax/elaboration design mistake**, not a counterexample to original source covariance, nor an indication of source wrong-sign or gauge defect. The three other consumer declarations (`exact_transport_reference`, `exact_original_gauge_name`, `exact_original_quantizer_name`) appeared with allowed axioms; the two failed declarations' subsequently printed allowed-axiom reports **do not qualify them** because their declarations failed. No strict diagnostic success sentinel.

Original archived [artifact #14732839565](https://github.com/etblink/math/actions/runs/44968639116/artifacts/14732839565), 12,523 bytes, GitHub-reported SHA-256 `c87413ec731398acd854a09a69aea048594a6507c9e05e0131603fd521414be8`. R1 remains **RED** regardless of any later diagnostic success.

## D1T1 R2 bounded declaration-level correction — PENDING, not accepted

On the same isolated branch, R2 changed ONLY the two failed diagnostic declarations to a value-inferred **definition**, not a theorem. This is a mathematically distinct *diagnostic export*, not a fresh proof of the original covariance identity:

```lean
noncomputable def inferred_source_reference :=
  FCP.BFSSHopfD1S1.originalQuantizeFrequency_gauge

noncomputable def inferred_source_application
    (g : GaugeGroup 2) (K : FrequencyMatrix 2) (v : Fermion 2) :=
  FCP.BFSSHopfD1S1.originalQuantizeFrequency_gauge g K v
```

The replacement removes precisely the two erroneous theorem-header holes; the original imported source theorem, the source-check-only file, coefficient-transport theorem, literal public-source `rfl` aliases and dedicated strict workflow are **byte-unchanged**. Source / consumer blobs: `cf086b6970c1893a010119a1e5e6e43e1125d852` → `3f99537bd71fa78e9f0504c4f5546c8c49bdc2ad`; R2 exact source commit `f12b925ee0ee7d31c7f7c3eb775b9f07fc053cb7`.

[R2 strict diagnostic #44971625678](https://github.com/etblink/math/actions/runs/44971625678) launched at that exact commit, **in progress at the record checkpoint**. Its native result is not assumed. The same frozen source hashes, independent check-only file, warning-as-error and source/consumer allowed-axiom parser remain in force.

### Disposition and stop

R2 is the **second native attempt for the D1T1 diagnostic**. If RED, preserve original first-causal artifact/log and **STOP**; do not blindly launch R3 or escalate maxRecDepth/maxHeartbeats. If GREEN, record **diagnostic success only**, because an inferred definition simply re-exports the already compiled source theorem and does not independently elaborate a new explicit public-source covariance proposition.

Scientific limit unchanged: source-level gauge covariance of the real original 48-index quadratic operator; no independently qualified explicit public-name consumer, Gaussian rank-one projector, `SmoothCore` physical trial, BFSS spectrum, hopfion or GUT theorem.

## D1T1 R2 strict RED — value-inferred `def` is a proposition; strict linter rejects

**Verified original [R2 run #44971625678](https://github.com/etblink/math/actions/runs/44971625678)**: `completed/failure` at **exact tested commit** `f12b925ee0ee7d31c7f7c3eb775b9f07fc053cb7`, first GitHub attempt, original job `137052472550`; completed 2026-11-22T01:46:19Z (Nov 21 America/Los_Angeles). Frozen BFSS source/hash preflight **PASS**; Lean 4.34.1 and pinned Mathlib restoration **PASS**; native cold original D1S1 source build **PASS** (`Build completed successfully (9074 jobs)`); warning-as-error original source recompile and both source axiom reports **PASS**. The independent *check-only* module `BFSSD1T1SourceDeclarationCheck.lean` inspected both imported source theorems and reported only `[propext, Classical.choice, Quot.sound]`; **PASS**.

**First-causal diagnostic, in next consumer file:**

```text
diagnostics/BFSSD1T1InferredGaugeConsumer.lean:27:0:
error: Definition `inferred_source_reference` is a proposition; use `theorem` instead of `def`
Note: This linter can be disabled with `set_option linter.defProp false`
diagnostics/BFSSD1T1InferredGaugeConsumer.lean:32:0:
error: Definition `inferred_source_application` is a proposition; use `theorem` instead of `def`
```

The revised `noncomputable def` declarations *did* infer proposition-valued types from the existing original source proof references, unlike R1 theorem header holes. Lean's **`defProp` linter** rejects treating proofs as proposition-valued definitions under our unchanged strict `-DwarningAsError=true`. Other consumer coefficient/original-name alias declarations were emitted with the allowed axioms; neither failed `def` is an accepted independent qualification merely because `#print axioms` can list axioms after an error. The D1T1 strict GREEN sentinel was NOT emitted.

Original unmodified archived [R2 artifact #14733948187](https://github.com/etblink/math/actions/runs/44971625678/artifacts/14733948187): 12,103 bytes, GitHub SHA-256 `b1502e9c7b1996ee34dde3319c23bdeef82cc39ebf21f0ab44d57dcc60e18249`. Separate original R1 artifact [#14732839565](https://github.com/etblink/math/actions/runs/44968639116/artifacts/14732839565), 12,523 bytes, SHA-256 `c87413ec731398acd854a09a69aea048594a6507c9e05e0131603fd521414be8`, remains RED, preserved.

### D1T1 two-attempt closure

**D1T1 R1 = RED** (invalid theorem header metavariable `: _`: theorem type resolved before proof). **D1T1 R2 = RED** (the `def` proof re-export inferred a Prop, strict `defProp` linter rejects proposition-valued definitions). These are two separate **Lean-language/strict-lint contract failures**, not gauge covariance counterexamples. **STOP D1T1**: no R3, no source/consumer/workflow changes, no disabling `linter.defProp`, no increasing recursion depth or heartbeats just to force passage.

### Research progress and next architecture (design only)

The original D1S1 `FCP.BFSSHopfD1S1.originalQuantizeFrequency_gauge` continues to compile on literal original `Fermion 2`, `FrequencyMatrix 2`, paired algebra/gauge action with **only** `[propext, Classical.choice, Quot.sound]`. The typed/source-public name aliases also compiled separately in D1T0, while both D1S1 R2 and D1T0 R1 explicit independent consumers were blocked by recursion during elaboration.

For any later independent qualification, require a normal **explicitly typed theorem proposition** that Lean can elaborate without excessive recursive normalization. Before starting a whole cold CI again, isolate the elaborate part with a tiny Lean-only diagnostic or local pinned Lean check, possibly using a source-level named proposition/adapter or a structured `show`/`change` bridge, while retaining exact original public source types. A `def` of proof/Prop or inferred alias is not an independent new mathematical theorem. No further gate is authorized or launched by this diagnostic closure.

No rank-one Gaussian CAR projector, original gauge-invariant `SmoothCore` wavefunction, normalized 16-charge Hamiltonian energy bound, physical Hopfion, Standard Model embedding, or GUT result is established here.
