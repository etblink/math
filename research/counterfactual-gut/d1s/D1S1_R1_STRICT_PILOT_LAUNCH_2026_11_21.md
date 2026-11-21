# D1S1 R1 — exact original 48-index quantizeFrequency gauge transport pilot

**Date:** 2026-11-21. **Disposition at launch:** SOURCE/CONSUMER CANDIDATE, **NOT STRICTLY QUALIFIED**. This checkpoint must not be promoted if native CI fails or remains in progress.

## Frozen source and executable gate

- Isolated branch: `research/bfss-hopfion-gut-counterfactuals-20261121`.
- Exact D1S1 implementation commit: `b25ce884e01afd12106863934c58c18f53ff7331`.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/D1S1OriginalFrequencyGaugeTransportProbe.lean`, exact Git blob `268b873d6cfef9d4f34d7a8fa4f5b45da10d7c5f`.
- Independent consumer `lean/diagnostics/BFSSD1S1OriginalFrequencyGaugeIndependentConsumer.lean`, exact Git blob `9f445edcc7c87ab996f491824255902b1e120ee6`.
- Dedicated strict workflow `.github/workflows/bfss-d1s1-original-frequency-gauge-strict.yml`, exact Git blob `53ce48adb07b85c39fb2f983fbba11cd87e6adc3`.
- [Original workflow run #44963966993](https://github.com/etblink/math/actions/runs/44963966993), exact tested commit as above; launched automatically on isolated-branch push, **in progress** at the initial checkpoint. No approval or mathematical promotion from a queued/running result.
- Source `D1S0OriginalQuantizedCARGaugeBridge.lean` frozen Git blob `9fd3a61f9dac8a370a68920303a39f3c8b81b6bd`, strict GREEN at [#44961701135](https://github.com/etblink/math/actions/runs/44961701135).
- Original `FermionQuantization.lean` blob `c6b72d030225c707ef54f5285a18a7a8175ee280`, `FermionFrequency.lean` blob `cbb82a42f42b3b3d3695081247bd14d0496abc7d`, G3A real source color blob `553869f1287c64893398c3b79c04fe010023bd08`, and G4J exact GaugeData blob `e20c76fb22bc09d16dbcd8657333227cb34ed1ea`. Strict workflow enforces source SHA pins, Lean `4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, warnings-as-errors, source and consumer axioms, and always-upload artifact.

## Mathematical target, precisely scoped

The source coefficient map is **real** and original-indexed:

```lean
noncomputable def sourceTransportFrequency
    (g : GaugeGroup 2) (K : FrequencyMatrix 2) : FrequencyMatrix 2 :=
  fun p q =>
    ∑ A : ColorIndex 2, ∑ B : ColorIndex 2,
      K (p.1, A) (q.1, B) *
        (pairedAlgebraData.adjointCoefficient g A p.2 *
          pairedAlgebraData.adjointCoefficient g B q.2)
```

The substantive original carrier theorem attempted is

```lean
pairedGaugeData.fermion g ((pairedAlgebraData.quantizeFrequency K) v)
  =
(pairedAlgebraData.quantizeFrequency
  (sourceTransportFrequency g K)) (pairedGaugeData.fermion g v).
```

It uses **only** source `Fermion 2`, `FrequencyMatrix 2`, original theta action and original gauge group/unitary, no custom complex quadratic, no Spin(48) substitute. Proof is factored into an abstract exchange of four finite sums, real-to-complex scalar distribution, original 48-label contraction and D1S0's already-accepted ordered pair gauge covariance.

The strict source printed roots are `sourceTransportFrequency_apply` and `originalQuantizeFrequency_gauge`; independent consumer printed roots are `original_frequency_transport` and `original_frequency_gauge`. Every root must typecheck with no axioms beyond `propext`, `Classical.choice`, `Quot.sound`. Static checks found exact imports, matching root lists, balanced delimiters, no `sorry`/`admit`/`axiom` declarations, expected source hashes and path-only CI trigger.

## Prescreen and negative knowledge

The previously frozen [D1S1 Python prescreen](./d1s1_original_quantization_covariance_prescreen.py) was rerun in this interval. It passed 40 original 48-label real-coefficient samples and nine reduced-Fock cases: 0 exact-numerical coefficient residual, at most `1.2075854505306695e-14` Fock covariance residual, at most `1.4582607313108313e-14` source color group-law error, and wrong-transpose negative control at least `16.589984370210203` Frobenius norm. No new independent 24-mode Lean result follows from this Python evidence.

**Local Lean unavailable:** no executable `lean`, `lake`, or `elan` or cached Lean environment is installed in the current research container. Unlike an actual local elaboration, the static contract review cannot certify Lean syntax/proof tactics. The isolated strict CI is the **first native attempt** and must be adjudicated through exact tested logs and archived artifact. If RED, preserve first-causal diagnostic and make at most one architecture-relevant correction under the two-native-RED stop rule; no automatic broad proof campaign.

**Acceptance ceiling:** D1S1 remains unqualified until the actual native source and independent consumer are GREEN. No rank-one Gaussian projector or closed-form BFSS energy bound, no original physical invariant `SmoothCore` section, no stable Hopfion or GUT assertion. D1R0 remains RED/FROZEN; original source, `main`, unified integration and live RHOPF remain unchanged.
