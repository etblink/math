# ADJ-A1 — explicitly typed original Majorana pair adjoint bridge

**Date:** 2026-11-21 (America/Los_Angeles). **Status:** *candidate / strict source R1 running*, NOT qualified. This is a new, independent original-Fock pointwise interface, NOT a D1S4 retry.

## Proven parent and frozen failure

- ADJ-A0 [strict GREEN #44981248994](https://github.com/etblink/math/actions/runs/44981248994), exact commit `66edb4caf5c59aba3bc3cddb902435f6da3618f7`, abstract finite double-sum star-skew theorem `FCP.BFSSAdjointA0.finitePairSum_star_skew`. Native 904 jobs and strict source recompile pass, axioms only `[propext, Classical.choice, Quot.sound]`, archived artifact #14737403671 SHA-256 `1b064c9191eb8bd536d73a5673b0976f6f34087ad88a0eb8ded61fab4bc18f99`.
- D1S3 physical coefficient skewness [strict source GREEN #44976962312](https://github.com/etblink/math/actions/runs/44976962312), original source blob `f35d70284bec100dc617935cf41a6c933c618e5b`.
- D1S4 R1 [#44978109630](https://github.com/etblink/math/actions/runs/44978109630) and R2 [#44979114078](https://github.com/etblink/math/actions/runs/44979114078) are **strict RED / FROZEN**. R2's `simp made no progress` at source line 41:52 and `function expected K s` under implicit transparency show why direct rewrite under `K r s` on a full complex Fock operator is an unqualified architecture. Source blob `de987a392a2e3510aafa835f8522e753725021cc` unchanged. Do not launch D1S4 R3 or import its incomplete theorem.

## Original source objects and precise new proof boundary

New source module `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSAdjointA1OriginalThetaPairRealScalarStar.lean` Git blob `0441b0d067dcd9e1d1e721b3c576a6e8a0600a53`. One import only: original `OAI.MathematicalPhysics.BFSS.FermionQuantization` (not D1S4). This commits neither a surrogate Fock model nor an alternate Majorana normalization.

The actual pinned original `M : AlgebraData N`, `r s : FrequencyIndex N`, and `M.theta r.1 r.2 : Fermion N →L[ℂ] Fermion N` are used. The coefficient `c : ℝ` is introduced as a **separately typed variable**, never an inner matrix lookup. The source pointwise lemmas are:

```lean
originalThetaPairRealCoefficient_star
    (M : AlgebraData N) (r s : FrequencyIndex N) (c : ℝ) :
    star ((c : ℂ) • (M.theta r.1 r.2 * M.theta s.1 s.2)) =
         (c : ℂ) • (M.theta s.1 s.2 * M.theta r.1 r.2)

originalThetaPairRealCoefficient_skew
    (M : AlgebraData N) (r s : FrequencyIndex N)
    (c d : ℝ) (hcd : c = -d) :
    star ((c : ℂ) • (M.theta r.1 r.2 * M.theta s.1 s.2)) =
      -((d : ℂ) • (M.theta s.1 s.2 * M.theta r.1 r.2))
```

The first follows `star_smul`, `star_mul`, source `theta_selfAdjoint` and the reality of `c`. The second is a deliberately small coefficient-independent bridge using the explicitly typed relation `c=-d` and exact `Complex.ofReal_neg`/`neg_smul`. **Neither theorem mentions `FrequencyMatrix`, `K r s`, `quantizeFrequency` or an entire double sum.** The source carrier is real, but the scalar action is explicitly complex. No added axioms, `sorry`, recursion limits or linter disabling.

## Strict gate and bounds

Dedicated path-scoped workflow `.github/workflows/bfss-adj-a1-original-typed-theta-pair-star-strict.yml` blob `39766e82b3992e29e39b36034f0468ca3ef96dcf`: frozen original `Core`, `FermionFrequency`, `FermionQuantization` and `FrequencyContraction` blob pins; Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; native original source module build; warning-as-error recompile; exactly two `#print axioms` roots and permitted `[propext, Classical.choice, Quot.sound]`; unconditional original log archive.

**ADJ-A1 R1:** [run #44982026198](https://github.com/etblink/math/actions/runs/44982026198), exact tested source SHA `5afd9befcc2b16e52cdc991e6d18234d373dfb6f`, **IN PROGRESS at launch receipt**. No qualified A1 theorem or root until original job logs, exact artifact and two axiom roots pass.

If R1 fails, preserve its first causal Lean error and artifact. One narrowly diagnosed repair maximum, then two-RED STOP. If strict GREEN, accept only **the original theta-pair pointwise adjoint bridge**, not original quantizer Hermiticity. A later ADJ-A2 must **explicitly instantiate** `c=K r s`, `d=K s r`, isolate that source matrix entry equality outside any rewrite under a nested original CLM term, import accepted ADJ-A0 finite sum, and prove original quantizer self-adjointness as a distinct theorem. A2 will require independent source and downstream consumer tests and its own accepted receipts.

No changes to original BFSS definitions, main, unified integration, FCP, RHOPF or D1S4 frozen source/workflow. Nothing in A1 establishes a full unbounded Hamiltonian, `SmoothCore` invariance, a spectral gap, physical Hopfion, SM or GUT.
