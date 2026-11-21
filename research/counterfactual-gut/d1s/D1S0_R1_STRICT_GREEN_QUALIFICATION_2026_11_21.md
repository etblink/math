# BFSS D1S0 R1 — strict GREEN original quantizeFrequency/CAR bridge qualification

**Date:** 2026-11-21. **Disposition:** **STRICT GREEN — accepted, bounded three-theorem source interface**.
**Scope:** isolated research branch `research/bfss-hopfion-gut-counterfactuals-20261121`; original sources, pinned toolchain, `main`, unified integration and live RHOPF untouched.

## Exact source and run identity

- [Native strict CI run #44961701135](https://github.com/etblink/math/actions/runs/44961701135): **completed / success**; original `push` event, first attempt, job `original-source-independent-consumer` ID `137021700566`.
- **Exact tested commit:** `9ad30d3720166f7046c7e26f709dea589a0f40d4` (not the later documentation branch HEAD).
- Native source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/D1S0OriginalQuantizedCARGaugeBridge.lean`, Git blob `9fd3a61f9dac8a370a68920303a39f3c8b81b6bd`.
- Independent literal original source consumer: `lean/diagnostics/BFSSD1S0OriginalQuantizedCARIndependentConsumer.lean`, Git blob `c8d02f00021e43cacf818b28197253613faaa965`.
- Exact gate workflow: `.github/workflows/bfss-d1s0-original-quantized-car-strict.yml`, Git blob `36208976de7a3d706bbf71adee06a97fb08b71b9`.
- Source-preflight freeze **PASS** (`BFSS_D1S0_SOURCE_PIN_PREFLIGHT_PASS`); Lean `4.34.1`, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` verified in the workflow.
- Native Lean cold source build **PASS**; strict source recompile with `warningAsError=true` **PASS**; independent consumer with `warningAsError=true` **PASS**; all six `#print axioms` reports parsed and exactly matched expectations. CI emitted `BFSS_D1S0_SOURCE_INDEPENDENT_CONSUMER_STRICT_GREEN`.
- [Original archived artifact #14730197595](https://github.com/etblink/math/actions/runs/44961701135/artifacts/14730197595), name `bfss-d1s0-original-quantized-car-9ad30d3720166f7046c7e26f709dea589a0f40d4-1`, 11,209 bytes, GitHub-reported SHA-256 `21355b1a88a1c637d6042053a6d4efd5c78ccca707b47fb1bfd4a0e0038b719f`. Unconditional artifact upload job step **PASS**.

## Six independently checked declarations

| Source/consumer | Exact Lean root | Strict output |
| --- | --- | --- |
| Original source | `FCP.BFSSHopfD1S0.originalThetaCAR` | PASS |
| Original source | `FCP.BFSSHopfD1S0.originalThetaPair_covariant` | PASS |
| Original source | `FCP.BFSSHopfD1S0.originalSourceFlattened_eq_originalQuantization` | PASS |
| Independent consumer | `FCP.BFSSHopfD1S0Consumer.original_theta_car` | PASS |
| Independent consumer | `FCP.BFSSHopfD1S0Consumer.original_theta_pair_gauge` | PASS |
| Independent consumer | `FCP.BFSSHopfD1S0Consumer.original_quantized_carrier` | PASS |

Every root reports the **only permitted Lean axioms** `[propext, Classical.choice, Quot.sound]`. No `sorryAx`, `admit`, `unsafe` or new kernel assumptions. Source and consumer theorem *types* use literal original `Fermion 2`, `pairedAlgebraData`, `pairedGaugeData`, and real `FrequencyMatrix 2` rather than a substitute Fock model.

## Exactly what is accepted

1. The 48 source-paired theta generators satisfy the original source anticommutation law on the genuine `Fermion 2` carrier.
2. The original unitary `pairedGaugeData.fermion` transports **ordered theta-theta products** with the correct input/output color coefficients.
3. The new `originalSourceFlattened C` is **definitionally exactly** `pairedAlgebraData.quantizeFrequency (-C)` for each real source `C : FrequencyMatrix 2`. This replaces the duplicate complex quadratic from the failed D1R0 architecture, without claiming rank one.

The last theorem is a definitional source identification, not yet a proof that `quantizeFrequency` is gauge covariant, self-adjoint for a given skew C, or equivalent to a rank-one Gaussian projector. The D1S1 **nontrivial coefficient transport** has not been Lean-qualified. Nor have a global Kato section, original `SmoothCore 2`, Gauss-invariant physical test function, full normalized 16-charge form estimate, BFSS spectrum, hopfion or GUT result.

## Negative knowledge preserved

The historical D1R0 R1 preflight RED [#44958704889](https://github.com/etblink/math/actions/runs/44958704889), R2 native RED [#44958805038](https://github.com/etblink/math/actions/runs/44958805038), and R3 second native RED [#44960222120](https://github.com/etblink/math/actions/runs/44960222120) **remain RED/FROZEN**, with their original CI artifact evidence and the two-native-RED stop enforced. D1S0's independent strict GREEN validates a **new source file on a changed proof architecture**, not retroactive success for the failed D1R0 file.

**Accepted next action:** prepare a separate D1S1 source-exact finite coefficient transport microgate with an independent consumer. Do not treat the Python prescreen as formal qualification and do not launch a broad projector/continuum gate.
