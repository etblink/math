# ADJ-A2b — original source finite theta-pair double-sum skew adjoint

**Date:** 2026-11-21 (America/Los_Angeles). **Initial status:** independent source proof candidate, not qualified until exact original strict CI and artifact verification.

## Qualified prerequisites

- **ADJ-A0**: original strict Mathlib-only run [#44981248994](https://github.com/etblink/math/actions/runs/44981248994), source blob `373e9929a9d2aa5a6d9bb3e1b01c4748d44fcea0`, proves `FCP.BFSSAdjointA0.finitePairSum_star_skew`.
- **ADJ-A1**: original source strict GREEN [#44982026198](https://github.com/etblink/math/actions/runs/44982026198), source blob `0441b0d067dcd9e1d1e721b3c576a6e8a0600a53`, proves typed original `theta` pair adjoints.
- **ADJ-A2a**: original source strict GREEN [#44983132507](https://github.com/etblink/math/actions/runs/44983132507) at exact tested `45e51eab58ddd5e39cca48125420484cd6e6774d`, source blob `dc7b35d295af72109f600da06098ae752971e60f`, artifact [#14738512689](https://github.com/etblink/math/actions/runs/44983132507/artifacts/14738512689) SHA-256 `6dcd3270fc0ab70216a490013467b8a0c4811b1f50a9f1fdd8cbb4a5a0abd17b`.
- **D1S3**: original `fermionCoefficient x` skew source strict GREEN [#44976962312](https://github.com/etblink/math/actions/runs/44976962312), not imported into this gate.
- **D1S4**: R1 [#44978109630](https://github.com/etblink/math/actions/runs/44978109630) and R2 [#44979114078](https://github.com/etblink/math/actions/runs/44979114078) are RED and FROZEN. Do not modify or import. No D1S4 R3.

## Exact source theorem target

A new file `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSAdjointA2bOriginalFrequencyDoubleSumSkew.lean` imports exactly the accepted A0 and A2a files, and proves one source theorem `FCP.BFSSAdjointA2b.originalSkewFrequencyMatrix_finiteSum_star_skew`:

```lean
(M : AlgebraData N) (K : FrequencyMatrix N)
(hK : K.transpose = -K) :
star (∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
  (K r s : ℂ) • (M.theta r.1 r.2 * M.theta s.1 s.2))
= -(∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
  (K r s : ℂ) • (M.theta r.1 r.2 * M.theta s.1 s.2))
```

Define `let U : FrequencyIndex N → FrequencyIndex N → (Fermion N →L[ℂ] Fermion N)` as the original theta product with source `K` scalar. Prove `star (U r s) = -(U s r)` by `change` plus the exact accepted A2a pointwise theorem, avoiding any `rw` under source matrix lookup. Pass `U` and the pointwise proof to A0, with only one definitional expansion in the conclusion. No repeated manual `star_sum` proof.

## Gate constraints

Dedicated new path-scoped workflow and exact original source SHA, pins for `Core`, `FermionFrequency`, `FrequencyContraction`, `FermionQuantization`, A0 and A1 and A2a imports; Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; native build of the original source theorem; warning-as-error strict recompile, exactly one independent `#print axioms` root limited to `[propext, Classical.choice, Quot.sound]`; original logs, source pinning, tested SHA and archived artifact. Stop after two native RED attempts, at most one evidence-driven proof-only repair. Do not raise resource ceilings, weaken linting or alter sources.

## Acceptance boundary

A2b GREEN proves only that the **source exact finite original theta-pair double sum** is star-skew on the finite original Fock carrier for a real skew frequency matrix. It **does not yet prove** `M.quantizeFrequency K` is self-adjoint. ADJ-A2c must check the exact source definition and the complex (i/2) scalar conjugation, then separately import qualified D1S3 to instantiate physical coefficients and run an independent consumer. No unbounded Hamiltonian, gauge-domain, spectral, mass-gap, physical Hopfion, Standard Model or GUT claim.


## Candidate implementation and original strict R1 launch receipt

Proof implementation commit [`3c06f47ca95119b09becc54d1f750f7fe2751c21`](https://github.com/etblink/math/commit/3c06f47ca95119b09becc54d1f750f7fe2751c21) introduces only the one exact-source theorem and its single axiom report. Dedicated new workflow `.github/workflows/bfss-adj-a2b-original-frequency-double-sum-strict.yml` committed at exact source/workflow SHA `5d96def503b529495afedb8d63884f145e503566`. [R1 #44984349166](https://github.com/etblink/math/actions/runs/44984349166) **PENDING at launch**, no original native/axiom/artifact GREEN yet. All prerequisite source files pinned in the workflow: original BFSS Core, FermionFrequency, FermionQuantization, FrequencyContraction, accepted A0, A1 and A2a. Source imports exactly A0 and A2a, no D1S4. One `#print axioms` root required, only `propext`, `Classical.choice`, `Quot.sound` allowed; source and strict logs must be archived unconditionally. Qualification requires exact tested SHA, verified native and strict logs, true original axiom report, and original evidence digest, not a workflow link alone.


## Independently verified original strict R1 — QUALIFIED GREEN

[Run #44984349166](https://github.com/etblink/math/actions/runs/44984349166), exact tested commit `5d96def503b529495afedb8d63884f145e503566`, job `137091538864` completed successfully. Original frozen-source and sole A0/A2a import preflight, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, native **8,955 jobs**, warning-as-error source recompilation, one exact theorem axiom report and sentinel `BFSS_ADJ_A2B_SOURCE_ONLY_STRICT_GREEN` all PASS. `FCP.BFSSAdjointA2b.originalSkewFrequencyMatrix_finiteSum_star_skew` reports precisely `[propext, Classical.choice, Quot.sound]`; no `sorryAx`. Original six-file [artifact #14738419623](https://github.com/etblink/math/actions/runs/44984349166/artifacts/14738419623), ZIP 6,026 bytes, original SHA-256 `da9e1b926fea675c758e50f528a6805623358f0d43ace72422b5a54f7e0148a9` independently recomputed and matched. Original source blob `a179985c31b6d8f0cd4092530c761155b320dc1c`.

**Acceptance:** original finite Fock theta-pair double sum is star-skew for source real skew `K`. This is not the original `quantizeFrequency K` self-adjointness theorem. Distinct ADJ-A2c and source/consumer checks remain mandatory. D1S4 original R1/R2 stay frozen RED.
