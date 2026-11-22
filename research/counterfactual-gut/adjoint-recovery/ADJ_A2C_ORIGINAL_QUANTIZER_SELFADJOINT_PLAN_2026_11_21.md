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


## Exact candidate source and first CI launch receipt

New source implementation commit [`1be36f8006d9d3e4d17b1839378504b887ca3074`](https://github.com/etblink/math/commit/1be36f8006d9d3e4d17b1839378504b887ca3074). Dedicated path-scoped strict workflow committed at `7d73df4b282a8611cdb43040fc7d70008d8a673e`, [original R1 #44985235000](https://github.com/etblink/math/actions/runs/44985235000), **PENDING at launch**. Its source preflight requires exactly one ADJ-A2b import and one `#print axioms` of `originalSkewFrequencyMatrix_quantize_isSelfAdjoint`; pins original source Core/FermionFrequency/FermionQuantization/FrequencyContraction and A0/A1/A2a/A2b accepted blobs, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Evidence archive is unconditional and must be independently inspected. No A2c theorem or physical consumer is qualified as of this launch.


## Strict R1 original RED independently verified; single bounded proof repair

[Run #44985235000](https://github.com/etblink/math/actions/runs/44985235000), exact tested SHA `7d73df4b282a8611cdb43040fc7d70008d8a673e`, job `137094252185`: original preflight, pinned Lean/Mathlib and **8,956-job native build PASS**, theorem's exact `#print axioms` `[propext, Classical.choice, Quot.sound]` PASS, but strict warning-as-error recompilation RED at original source `line 35:9`. The exact diagnostic is `Used tac1 <;> tac2 where (tac1; tac2) would suffice`, caused by `simp <;> ring` inside the tiny proof of `star (Complex.I/2) = -(Complex.I/2)`. This is not a mathematical failure or a `sorryAx` report. Source blob of the R1 candidate `2a7aab9ef274519d98fb20824838efaca1c30c04`. Original [artifact #14739049113](https://github.com/etblink/math/actions/runs/44985235000/artifacts/14739049113), **6,277 bytes**, original ZIP SHA-256 `77c3eca26d79b12b06c8c6248c3dd1a32148c107882b9c61ce9be0e15855978b`; downloaded ZIP hash independently matched and six files inspected. Preserve the RED in perpetuity.

**R2 bounded decision:** change only `simp <;> ring` to `simp; ring` in the same `hI` local proof; no theorem/CI/baseline edits, linter disabling or increase of heartbeats/recursion depth. R2 is the **only** permitted retry for this gate. Two REDs => STOP, preserve both original archives, review proof architecture. Native theorem compilation is insufficient; strict axioms, sentinel and original artifact required.


## R2 implementation and qualified-source safeguard

The single allowed source change to the original A2c file was exactly `simp <;> ring` → `simp; ring` inside local complex scalar `hI`, source commit `5ea5837c028b473b39a855b1bb49d1b7acccccfb`, new blob `94893b6b4f623dfd92122947a4054c4b1a63a5ad`. Unchanged theorem statement `originalSkewFrequencyMatrix_quantize_isSelfAdjoint`, source definition `M.quantizeFrequency K`, and A2b import. Original strict workflow remains unchanged, preserving warnings-as-errors. [R2 #44985982244](https://github.com/etblink/math/actions/runs/44985982244) exact tested commit `5ea5837c028b473b39a855b1bb49d1b7acccccfb`, **PENDING at launch**. Require original strict job GREEN, correct one permitted axiom root, sentinel, original archived artifact and SHA before accepting. A second RED freezes A2c: do not launch R3 or alter linter settings.
