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
