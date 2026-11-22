# ADJ-A2c — original finite-Fock quantizer self-adjointness (skew K)

**Date:** 2026-11-21 (America/Los_Angeles). **Status at creation:** candidate proof / not strictly qualified.

## Accepted evidence chain

- ADJ-A0 abstract skew double sum: [#44981248994](https://github.com/etblink/math/actions/runs/44981248994), source blob `373e9929a9d2aa5a6d9bb3e1b01c4748d44fcea0`.
- ADJ-A1 original theta real-coefficient pair adjoints: [#44982026198](https://github.com/etblink/math/actions/runs/44982026198), source blob `0441b0d067dcd9e1d1e721b3c576a6e8a0600a53`.
- ADJ-A2a original skew source K entry and theta pair: [#44983132507](https://github.com/etblink/math/actions/runs/44983132507), source blob `dc7b35d295af72109f600da06098ae752971e60f`.
- ADJ-A2b exact original finite theta double sum star-skew: independently qualified [#44984349166](https://github.com/etblink/math/actions/runs/44984349166) at `5d96def503b529495afedb8d63884f145e503566`, source blob `a179985c31b6d8f0cd4092530c761155b320dc1c`; artifact [#14738419623](https://github.com/etblink/math/actions/runs/44984349166/artifacts/14738419623), independently verified ZIP SHA-256 `da9e1b926fea675c758e50f528a6805623358f0d43ace72422b5a54f7e0148a9`.
- D1S3 original physical `fermionCoefficient x` transpose-skew theorem is independently accepted at source [#44976962312](https://github.com/etblink/math/actions/runs/44976962312), but **not imported here**.
- D1S4 original proof attempts R1 [#44978109630](https://github.com/etblink/math/actions/runs/44978109630) and R2 [#44979114078](https://github.com/etblink/math/actions/runs/44979114078) remain RED and **frozen**. Do not edit, import, rerun or replace them.

## Exact theorem scope

A new file `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSAdjointA2cOriginalFrequencyQuantizerSelfAdjoint.lean` imports **only** the qualified source A2b module. One theorem, `FCP.BFSSAdjointA2c.originalSkewFrequencyMatrix_quantize_isSelfAdjoint`:

```lean
(M : AlgebraData N) (K : FrequencyMatrix N)
(hK : K.transpose = -K) :
IsSelfAdjoint (M.quantizeFrequency K)
```

Use the source-definitional equality `M.quantizeFrequency K = (Complex.I / 2) • Q(K)` where `Q(K) = ∑ r, ∑ s, (K r s : ℂ) • (M.theta r.1 r.2 * M.theta s.1 s.2)`. The accepted A2b establishes `star Q(K) = -Q(K)`. Independently show `star (Complex.I / 2) = -(Complex.I / 2)`, then use `star_smul` and algebraic `neg_smul`, `smul_neg`, `neg_neg` to prove `star (M.quantizeFrequency K) = M.quantizeFrequency K`.

Do not rewrite `K r s` inside the full CLM. Do not import D1S3 or D1S4, mention a gauge action, or introduce any physical spectral or unbounded-operator theorem. The physical original `M.fermionCoefficient x` and literal paired SU(2) specialization will need a **distinct downstream independent consumer gate**, not this source-only theorem.

## Dedicated strict gate

New path-scoped workflow must verify frozen original BFSS Core/FermionFrequency/FermionQuantization/FrequencyContraction and exact accepted A0/A1/A2a/A2b source blob pins; Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; original cold source build, warning-as-error strict source recompile, exactly one `#print axioms` root with only `propext`, `Classical.choice`, `Quot.sound`, a required source-only GREEN sentinel, original logs and tested SHA archived unconditionally. Zero `sorry`, `admit`, added `axiom`, unsafe declarations, linter weakening or resource-limit increases. On first native RED preserve first causal error; at most one evidence-motivated proof-only repair; second RED triggers STOP and architecture review.

## Claim boundary

A2c source-only strict GREEN, if it occurs, establishes the mathematical **finite bounded original source quantizer self-adjointness for any real skew source K**. Without a separate exact D1S3 consumer theorem, physical original `fermionCoefficient x` specialization is **unqualified**. No implication for gauge-invariant domain of full quantum Hamiltonian, unbounded operator essential self-adjointness, spectral discreteness, mass gap, original BFSS ground state, physical Hopfion, Standard Model or GUT.
