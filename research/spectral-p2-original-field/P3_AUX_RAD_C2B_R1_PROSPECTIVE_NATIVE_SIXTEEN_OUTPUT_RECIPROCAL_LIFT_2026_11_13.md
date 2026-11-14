# P3-AUX-RAD-C2B R1 — prospectively staged true original sixteen-output reciprocal

**Date:** 2026-11-13 Pacific. **Status:** STAGED_UNQUALIFIED_PENDING_STRICT_CI. **Baseline:** `9646b365d80494dfe8c69ef74e593ceae55269eb`.

**Exact carrier:** `K=PiLp 2 (fun _ : SpinIndex => FullL2 2)`, the original AY physical charge column's **output**. AY source blob `a9f27a48852ac570aedc8e0ab88d683250e6b138` has `originalMinimalHilbertOutputEquiv : K≃L[ℂ](SpinIndex→FullL2 2)`. Accepted RAD-C2A #43566927415, blob `64905d174965632d19e6bd04d334538018692b16`, proves injectivity of original `Bε`.

**Design:** `B16=J.symm ∘L ContinuousLinearMap.piMap (fun _ => Bε) ∘L J`. Verify exactly three roots: `originalReciprocalHilbertOutputCLM` (bounded native PiLp CLM), `originalReciprocalHilbertOutputCLM_coordinate` (each original spin index equals original bounded reciprocal on FullL2), and `originalReciprocalHilbertOutputCLM_injective`. No sharp operator norm asserted. The coordinate proof tests the actual definitional AY PiLp equivalence; RED must preserve first causal error rather than introducing a proxy.

Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC2BOriginalReciprocalHilbertOutputLift.lean`; independent original `PiLp` consumer `lean/diagnostics/BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLiftIndependentConsumer.lean`; workflow `.github/workflows/bfss-p3-aux-rad-c2b-original-reciprocal-hilbert-output-lift-strict.yml`. Pinned Lean 4.34.1, Mathlib `d13f23b7`, frozen source/Core/R0A/R0B1/R0B2A/G0B0/RAD-C2A/AY; cold source/consumer, three-root allowed-axiom audit, evidence upload. Permitted `propext`, `Classical.choice`, `Quot.sound` only.

**Exclusions:** No full original physical AY weighted graph, maximum domain identification, density, Hardy, Spin9 singlet, zero-regulator closure, or BFSS gap. **Next:** RAD-C3 closed inverse-image graph under `id×B16` if this new source/consumer qualifies.
