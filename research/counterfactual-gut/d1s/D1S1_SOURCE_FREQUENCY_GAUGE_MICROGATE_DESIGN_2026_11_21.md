# D1S1 — original SU(2) frequency coefficient transport: bounded next proof design

**Date:** 2026-11-21. **Status:** **DESIGN ONLY — NOT LEAN-COMPILED; NO D1S1 CI LAUNCHED.** D1S0 is strictly GREEN at exact run #44961701135, commit `9ad30d3720166f7046c7e26f709dea589a0f40d4`. D1R0 remains RED/FROZEN.

## Exact source definitions

- `FermionFrequency.lean` blob `cbb82a42f42b3b3d3695081247bd14d0496abc7d`: `FrequencyIndex N := SpinIndex × ColorIndex N`; `FrequencyMatrix N := Matrix (FrequencyIndex N) (FrequencyIndex N) ℝ`. For SU(2), the index has `16 × 3 = 48` values.
- `FermionQuantization.lean` blob `c6b72d030225c707ef54f5285a18a7a8175ee280`: `M.quantizeFrequency K := (Complex.I/2) • Σ_(r,s) (K r s : ℂ) • (M.theta r.1 r.2 * M.theta s.1 s.2)`.
- `GaugeCore.lean` blob `e4990dadf1d8bde849e351467282ab3f14989c3b`: `G.fermion_adjoint` acts on original theta operator with input-color `A` and output-color `B`.
- `SU2BFSSG3AAdjointColorRepresentationProbe.lean` blob `553869f1287c64893398c3b79c04fe010023bd08`: real adjoint matrix `R_g B A := M.adjointCoefficient g A B` (**output row B**, input column A), with group law and orthogonal columns.
- `D1S0OriginalQuantizedCARGaugeBridge.lean` at exact Git blob `9fd3a61f9dac8a370a68920303a39f3c8b81b6bd`: **independently GREEN** original CAR, ordered theta-pair gauge covariance and exact real `quantizeFrequency (-C)` carrier identification.

## Mathematical theorem to prove before the Gaussian projector

For `g : GaugeGroup 2`, define the **real** `48×48` map `T_g` by

```
T_g (β,B) (α,A) := (if β = α then M.adjointCoefficient g A B else 0)
```

(Exact Fin/Matrix definitions require a local Lean elaboration; this is a math formula, **not tested Lean syntax**.) For `K : FrequencyMatrix 2` define the input-to-output pushforward

```
transportFrequency(g,K) (β,B) (δ,D)
  := ∑ A : ColorIndex 2, ∑ C : ColorIndex 2,
       (M.adjointCoefficient g A B)
       * (M.adjointCoefficient g C D)
       * K (β,A) (δ,C).
```

This is algebraically `T_g K T_gᵀ` when all indices are arranged as specified. No general 48-dimensional Spin/Pin implementer is needed.

**Target identity on the literal original carrier:**

```
pairedGaugeData.fermion g (pairedAlgebraData.quantizeFrequency K v)
  =
pairedAlgebraData.quantizeFrequency (transportFrequency g K)
  (pairedGaugeData.fermion g v)
```

for every original `K : FrequencyMatrix 2`, `g` and `v : Fermion 2`. A second theorem can specialize `K = -C` and fold `originalSourceFlattened C`, preserving the original normalization and sign. Do not restrict to a special BFSS covariance until the general finite coefficient proof is compiled.

## Source proof architecture, designed to avoid D1R0's failed simplification

1. Work first at the **pointwise vector level** with `v : Fermion 2`, so `ContinuousLinearMap.sum_apply` / `smul_apply` are handled explicitly. Import qualified D1S0, `G4J`, `FermionQuantization`, and source color G3A only if required. Avoid importing frozen D1R0 or unqualified Clifford equivalences.
2. Isolate a small **abstract finite-sum rearrangement theorem** for four indices, with `[Fintype]` and a commutative additive codomain. In particular, map the source sum over `(α,A),(β,B)` to an outer sum over output `(α,C),(β,D)` and inner input-color sums; do not rely on `simp` alone to interchange nested sums.
3. Apply D1S0's **originalThetaPair_covariant** once per ordered theta-theta monomial, then commute *scalar coefficients* and fold the two input-color summations. Use the original `G.fermion` isometry and `map_sum`, `map_smul`, `smul_smul`, `Finset.sum_smul`, `Finset.smul_sum`, `Finset.sum_comm`, `Fintype.sum_prod_type`, and explicit `Finset.sum_congr`. Keep operator composition **ordered**; never commute noncommuting theta products.
4. Explicitly prove the real-to-complex coefficient conversion, e.g. `(K r s : ℂ) * (R_g A C : ℂ) * (R_g B D : ℂ) = (((R_g A C) * (R_g B D) * (K r s) : ℝ) : ℂ)`; do not silently assume scalar equalities `rfl`.
5. Only after the vector theorem and closed axiom reports, use extensionality for the continuous-linear operator identity or the special `originalSourceFlattened` specialization.
6. Create an independent consumer naming the original `pairedAlgebraData.quantizeFrequency`, `pairedGaugeData.fermion`, `FrequencyMatrix 2`, and `Fermion 2`, and require exactly `propext`, `Classical.choice`, `Quot.sound`; source hash, independent consumer and archive strict gate.

## Falsifiers and stop conditions

The D1S1 Python prescreen (`d1s1_original_quantization_covariance_prescreen.py`, archived in the same folder) passed 40 full 48-label source-color coefficient cases and nine separate reduced Fock-model unitary tests; transpose-color negative control failed by ≥16.59 in Frobenius norm. These checks validate sign and orientation only; they **cannot** validate Lean term elaboration.

Before any new strict CI, locally type-check the finite-sum lemma and each source coefficient cast under Lean 4.34.1 and pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Do not launch a large source build if local terms have not passed an appropriate preflight. If two native attempts on the new source theorem fail, preserve both first causes and **stop** rather than brute-force tactics.

### Physical interpretation guardrail

This is *operator-level algebraic covariance*. It is not gauge-invariant `SmoothCore` membership, spectral flow, an actual original-H form bound, physical BFSS hopfion, first Chern charge, Standard Model embedding or unification proof.
