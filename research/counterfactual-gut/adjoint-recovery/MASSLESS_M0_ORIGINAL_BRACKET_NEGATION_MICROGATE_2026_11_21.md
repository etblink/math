# MASSLESS-M0 — original source bracket coefficient, negative quadratic sum, and donor contraction

**Date:** 2026-11-21 (America/Los_Angeles). **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.  
**Type:** isolated original-source diagnostic. **Initial status:** candidate only, not yet strict qualified.

## Why this is a distinct test, not D1F R4

Three historical D1F native REDs are preserved: [R1 #44934836209](https://github.com/etblink/math/actions/runs/44934836209), [R2 #44935867919](https://github.com/etblink/math/actions/runs/44935867919), [R3 #44937500313](https://github.com/etblink/math/actions/runs/44937500313). The first two failed to transport a negative scalar through original nested Majorana sums; R3 attempted several dependent unqualified lemmas and failed in scalar normalization, at zero bosonic configuration, and in namespace resolution. **No D1F R4 is permitted.** Do not import its unqualified source, alter it, or treat any `sorryAx` results as proved.

Original frozen donor `FermionQuantization.lean`, blob `c6b72d030225c707ef54f5285a18a7a8175ee280`, already has:
- `AlgebraData.frequency_bracket_contraction x` — exact positive real contraction of source `structureConstant * x * gamma` equals source sum of `cubicFermionComponent` on literal `Fermion N`.
- `AlgebraData.deformedFermionField_bracket x` — **massless** `h=1,m=0` source field equals the real-scalar restriction of `(-Complex.I)/2` times the sum of source cubic components.
- `AlgebraData.fermionCoefficient x` contains a `(3/2)·massT` mass term. It cannot be silently substituted for the massless coefficient.

The successful accepted A0–A2d strict source/consumer chain is preserved; original `FrequencyOperators.quantizeFrequency_selfAdjoint` already establishes generic skew-`K` finite-Fock self-adjointness. **Novel test here is the exact massless field comparison**, not another generic adjoint theorem.

## Two exact isolated M0 proof atoms

New module `BFSSMasslessM0OriginalBracketNegationProbe.lean` imports only original `FermionQuantization.lean` and defines a *positive bracket coefficient*, on the exact original `FrequencyMatrix N`, by the same source contraction:
```lean
sourceBracketCoefficient (M : AlgebraData N) (x : Boson N) r s :=
  ∑ j : SpaceIndex, ∑ C : ColorIndex N,
    M.structureConstant s.2 r.2 C * x (j,C) * M.gamma j r.1 s.1
```
Atom 1, `sourceThetaQuadraticSum_neg`: for **arbitrary** original real `K`, the source finite theta quadratic sum with coefficient `-K r s` is the negative of the corresponding source sum with `K r s`. Prove by **local** `Complex.ofReal_neg`, `neg_smul` and `Finset.sum_neg_distrib`, without a `module` or `ring` tactic.

Atom 2, `sourceBracketCoefficient_negative_contraction`: instantiate atom 1 using the source `sourceBracketCoefficient M x`, then rewrite only the **positive** sum using the already-compiled `M.frequency_bracket_contraction x`. This tests the exact first-causal old R2 obstruction, but no total quantizer, source-field restriction, physical Hamiltonian, or D1F declarations are imported. The two roots are checked independently by `#print axioms`.

## Strict stop / promotion contract

One new path-scoped workflow with original frozen BFSS Core/FermionFrequency/FrequencyContraction/FermionQuantization pins, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Original native source build, warning-as-error recompilation, two exact axiom roots restricted to `propext`, `Classical.choice`, `Quot.sound`, source pin preflight, required `BFSS_MASSLESS_M0_SOURCE_ONLY_STRICT_GREEN` sentinel, and unconditional original artifact archive including tested SHA/preflight/strict/native/environment/cache. Preserve and diagnose first original RED; one evidence-driven proof-only repair maximum; two REDs STOP with both original artifacts. No `sorry`, `admit`, `axiom`, linter suppression, added resource limits, original BFSS changes or D1F R4.

## What M0 cannot establish

Even if both roots are GREEN, this is only an original finite theta **negative-scalar identity** plus a source-exact cubic contraction. A later separately designed MASSLESS-M1 must identify `fermionCoefficient x − fermionCoefficient 0` with the negative source bracket coefficient and explicitly prove the **real-linear restriction** equality with `deformedFermionField 1 0 x` using `deformedFermionField_bracket`. M1 must have its own native/independent consumer. Neither M0 nor a prospective M1 proves full bosonic `FullL2` operator-domain self-adjointness, gauge-physical invariance, an energy bound, a mass gap, physical Hopfion, SM or GUT.


## Original implementation and exact strict R1 launch

Candidate source implemented at [`9579ca3328edb496bb2d84deadb4379c4430baf3`](https://github.com/etblink/math/commit/9579ca3328edb496bb2d84deadb4379c4430baf3) with only one original `FermionQuantization` import, one `sourceBracketCoefficient` definition, and exactly two public axiom roots. New path-scoped strict workflow `.github/workflows/bfss-massless-m0-original-bracket-negation-strict.yml` committed at exact tested source/workflow SHA `1beffd6416c1cb676688d5e26158b258630dddbb`. [Original strict R1 #44987939282](https://github.com/etblink/math/actions/runs/44987939282) **PENDING / UNQUALIFIED at launch**. Original BFSS Core/FermionFrequency/FrequencyContraction/FermionQuantization pins, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, original native build, warning-as-error source recompile, two exact source axiom reports and unconditional original artifact are mandatory. Distinct tiny negative-scalar and donor-contraction atoms, no D1F imports, no `module` or `ring`, no field-restriction theorem. Qualification requires exact source CI GREEN, each permitted axiom report, sentinel and independently verified original ZIP digest; original D1F R1–R3 remain RED/frozen and cannot be reclassified.



## MASSLESS-M0 R1 native source RED — independently diagnosed, single bounded R2 decision

[Run #44987939282](https://github.com/etblink/math/actions/runs/44987939282) completed **failure**, original job `137102507531`, exact tested commit `1beffd6416c1cb676688d5e26158b258630dddbb`, original M0 source blob `8aed0ca5f56c4d9dee9d65d700f21870b9e84a2d`. Frozen original source preflight, Lean 4.34.1/Mathlib pin and 8,951 original dependencies all **PASS**; the new 8,952nd source file **NATIVE RED** at `BFSSMasslessM0OriginalBracketNegationProbe.lean:30:60`: residual goal `∑ r, ∑ s, -↑(K r s) • (theta_r*theta_s) = -(∑ r,∑ s, ↑(K r s) • (theta_r*theta_s))`. Original single `simp only [Complex.ofReal_neg, neg_smul, Finset.sum_neg_distrib]` only rewrote the real-to-complex negation and left the two finite sums unnormalized; Lean explicitly flagged both `neg_smul` and `Finset.sum_neg_distrib` as unused arguments. Both printed candidate theorem axiom reports include **`sorryAx`**, since the first theorem is incomplete and the second depends on it; no new theorem is accepted. Strict recompilation and GREEN sentinel were **not reached**.

Original archived [artifact #14739789534](https://github.com/etblink/math/actions/runs/44987939282/artifacts/14739789534) 6,393 bytes, 5 files (`cache.log`, `environment-sha256.txt`, `native-source.log`, `preflight.log`, `tested-sha.txt`), ZIP SHA-256 **`db5630ceb3649470530829459d8ea7fb69db07df159c4767f2be0ab14c0af9ef`** independently recomputed and matches GitHub. Archived tested SHA and preflight sentinel verified.

**Precise R2 only:** replace just the first theorem's failing `simp only` line with **explicit outer then inner `←Finset.sum_neg_distrib` rewrites, `Finset.sum_congr` binders for `r` and `s`, and a final typed `neg_smul` for the individual original theta product**. Retain exact imported source and second theorem; no broad `ring`/`module`, no source or workflow contract change, no linter suppression. The R1 RED is permanent negative knowledge, not a physical counterexample. **If R2 is native or strict RED, two-RED STOP**; do not launch R3 without a separately authorized architecture review. The historical D1F R1–R3 and D1S4 R1/R2 remain frozen.


## R2 exact proof-only repair and strict launch

The single permitted repair modifies **only** the `sourceThetaQuadraticSum_neg` proof in new M0 source module; `sourceBracketCoefficient_negative_contraction`, theorem statements, exact original donor import, CI workflow and frozen original pins remain unchanged. [Implementation commit `aaf409edc3f388ce05d2f93fcf108a364382b8f1`](https://github.com/etblink/math/commit/aaf409edc3f388ce05d2f93fcf108a364382b8f1), new source Git blob `948671c8173dd69bba380a1b08fd46c7b63efb57`:
```lean
  simp only [Complex.ofReal_neg]
  rw [← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro r _
  rw [← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro s _
  exact neg_smul (K r s : ℂ)
    (M.theta r.1 r.2 * M.theta s.1 s.2)
```
This follows Lean's exact R1 remaining goal instead of relying on the simplifier to rewrite nested sums. [Strict original R2 #44988662078](https://github.com/etblink/math/actions/runs/44988662078), tested exact `aaf409edc3f388ce05d2f93fcf108a364382b8f1`, **QUEUED/PENDING at launch**. Only 2 standard-permitted `#print axioms` roots, original native/strict GREEN, original ZIP archive/tested-SHA integrity and pinned source preflight can qualify M0. **Second RED => STOP/FROZEN**, no R3 and no M1 implementation.
