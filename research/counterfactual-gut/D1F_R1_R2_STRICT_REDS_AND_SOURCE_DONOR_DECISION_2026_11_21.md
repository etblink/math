# D1F R1/R2 — two strict REDs; stop tactical repair, return to original source donor

**Date:** 2026-11-21. **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`. **Disposition:** `STOP_AFTER_TWO_NATIVE_REDS / NO_NEW_GATE_STARTED`.  
**Qualification:** **D1F is UNQUALIFIED.** Two historical exact run receipts below are native source REDs. This memo records diagnostics and a source-donor proof architecture, **not** an accepted mathematical or physical result.

## Exact runs, failure phase, archived original evidence

| R | Strict run / tested commit | Original sources, toolchain and dependencies | First-causal new-source failure | Independent consumer |
| --- | --- | --- | --- | --- |
| R1 | [#44934836209](https://github.com/etblink/math/actions/runs/44934836209), `deff085b1c26b606f81501a68eba50d81c56aedb` | Frozen original preflight PASS, Lean 4.34.1/Mathlib `d13f23b7...` PASS, 8,951 dependencies built | `D1FOriginalMasslessYukawaFockQuantization.lean:39:2`: `ring failed, ⊢ Complex.I * (1 / 2) = 0` | Not reached |
| R2 | [#44935867919](https://github.com/etblink/math/actions/runs/44935867919), `dc5e705cd898fdf81f1f8a04ed1056b5eeb60eaf` | Same frozen pins/toolchain PASS; 8,951 dependencies built | `D1FOriginalMasslessYukawaFockQuantization.lean:44:50`: `unsolved goals` involving negation through the double Majorana sum | Not reached |

The exact **R2** remaining goal after defining `masslessFrequency` was:
\[
\sum_{r,s}
 \big(-\mathop{\mathrm{ofReal}}(C_{rs}(X))\big)\cdot
 (\theta_r\theta_s)
=
-\sum_{r,s}
 \mathop{\mathrm{ofReal}}(C_{rs}(X))\cdot
 (\theta_r\theta_s),
\]
where
\[
C_{rs}(X)=\sum_{j,C} f_{s.2,r.2,C}\,X_{j,C}\,\Gamma_{j,r.1,s.1}.
\]
It is the additive-linearity identity for finite sums in the original continuous-linear-map target, **not** a discovered violation of the CAR/fermion physics.

Both R1 and R2 printed **permitted** Lean axioms `[propext, Classical.choice, Quot.sound]` for the already elaborated first new theorem `masslessFrequency_eq_source_difference`. The two downstream roots `quantize_masslessFrequency` and `deformedFermionField_massless_quantized` contained `sorryAx` because the body failed. **No consumer, no axiom-qualified D1F, no physics theorem.**

- R1 artifact: [#14719612214](https://github.com/etblink/math/actions/runs/44934836209/artifacts/14719612214), Actions-reported ZIP SHA256 `7450906c6fe736eec153362ae6da32aeaabee77ba6becc6a772589a39450fbca`.
- R2 artifact: [#14719599390](https://github.com/etblink/math/actions/runs/44935867919/artifacts/14719599390), Actions-reported ZIP SHA256 `45feb947b14f2dddda7a46f0fbfbb4f943a69b64b8874b15a8a0af7c8547e8d9`.
- Exact log additionally contains **unused simplification** warnings (`neg_smul`, `Finset.sum_neg_distrib`). These were a genuine failure of the simplification plan and should not be disabled or suppressed to force GREEN. Build failure and `sorryAx` are native Lean evidence, not CI runner infrastructure trouble.

## STOP: no third broad-simplifier iteration

R1 used `rw [←M.frequency_bracket_contraction x]` with a broad `simp only` and `module`. R2 replaced it with a purported sum-negation lemma (`hsum`) but again used simplification broadly. Both stalled at the same **finite-sum/scalar normalization boundary**. Therefore the previously declared **two-RED stop rule is triggered**. Do not copy the R2 proof into a fresh source under an R3 name without an actual independent explanation of how the missing algebra will be discharged.

The original mathematics is still plausible and sharply scoped:
\[
F_0(X)=F(X)-F(0),\qquad
\operatorname{Quantize}(F_0(X))
 \overset{?}{=}
\mathrm{deformedFermionField}(1,0,X)
\]
where the right side is *real*-linear and the left side must use `ContinuousLinearMap.restrictScalars ℝ`. No extra source mass deformation or fake Fock carrier is allowed.

## Source-donor architecture instead of speculative tactics

**Accepted donor:** `lean/OAI/MathematicalPhysics/BFSS/FermionQuantization.lean`, frozen Git blob `c6b72d030225c707ef54f5285a18a7a8175ee280`.

Its source-proved `AlgebraData.deformedFermionField_quantized` establishes
\[
V_F(1,1,X)
=\big[\operatorname{Quantize}(F(X))\big]_{\mathbb R},
\]
and its working `have he` proof uses `Complex.ofReal_sub`, `sub_smul`, `Finset.sum_sub_distrib`, **both** `frequency_mass_contraction` and `frequency_bracket_contraction`, then the module tactic. Unlike R1/R2, it already has compiler evidence on exact pinned upstream source.

**Recommended new proof decomposition before any more CI:**

1. From the **actual** definitions, prove `fermionCoefficient X − fermionCoefficient 0 = F_0(X)` (the first R1/R2 theorem already elaborated).
2. Derive a local, purely algebraic **linearity of source quantization** `quantizeFrequency (K−L) = quantizeFrequency K−quantizeFrequency L`, using the donor's `sub_smul` and `Finset.sum_sub_distrib` proof text. This avoids relying on a global rewrite of two nested negated sums.
3. Source-defined `deformedFermionField_linear_parameters` and `deformedFermionField_bracket` show the interaction is homogeneous linear in `X`; the mass term `deformedFermionField 0 1 X` is constant in `X` (verify with original source), so
   \[
   V_F(1,0,X)=V_F(1,1,X)-V_F(1,1,0).
   \]
   Explicitly discharge `V_F(1,0,0)=0` using the source bracket formula, not a physical conjecture.
4. Apply the already-proved **massive-plus-interaction** source theorem at `X` and `0` and subtract. Use complex-linear-to-real-linear restriction as a *linear* map, with actual source type explicitly checked. This yields the desired massless field without reconstructing the bad double-sum rewrite.
5. Validate the **small internal lemma order** in a diagnostic-first Lean consumer on the exact source pin, and get one independently checked proof for the final original `pairedAlgebraData` specialization. Run a new strict gate only when the scripted source equalities have been resolved; the tested commit and first-causal diagnostics must remain immutable.

**Alternative if that proof decomposition is unexpectedly complex:** reuse the donor's exact working `have he` to isolate the frequency-bracket part, with its existing `frequency_bracket_contraction`, rather than guessing rewrite orientation. The mathematical obstruction has not changed.

## Project Lead decision and scientific implications

- **D1F proof:** PAUSED / UNQUALIFIED after two native reds. Preserve `sorryAx` discovery as a failed proof artifact, not as an axiom added to accepted mathematics.
- **R2 code:** left on counterfactual branch as visible red candidate; neither source, consumer, nor CI workflow was modified in this memo.
- **Previous historical green interfaces:** the original massless smooth-core decomposition and physical `H=(1/16)T†T` remain exactly as they were; these two REDs do not invalidate their separately qualified theorems.
- **Research:** no new claim for physical Hopfion, source gap, physical index, Standard Model chirality or unification.
- **Next:** follow donor architectural route, minimize recompilations, preserve any further negative findings without selecting conclusions on aesthetic grounds. No change to `main`, the live RHOPF integration branch, toolchain pins, or accepted proof receipts.
