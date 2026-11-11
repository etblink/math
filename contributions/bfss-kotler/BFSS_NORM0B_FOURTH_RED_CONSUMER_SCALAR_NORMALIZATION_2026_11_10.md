# NORM-0B fourth strict RED: source fully qualified-by-compilation; independent consumer scalar normalization

**Date:** 2026-11-10 Pacific. **Tier:** strict RED; consumer-only repair candidate. **Do not equate source compilation with full gate acceptance.**

## Forensic receipt

- [NORM-0B strict run #42964853683](https://github.com/etblink/math/actions/runs/42964853683), tested exact commit `164a75c6e2a7f75e2ee810875548beba2a5b7bdd`, job `130339571738`, conclusion failure at 2026-11-11 05:35:11 UTC.
- Source closure marked `NORM0B_ORIGINAL_106_BLOB_CLOSURE_PASS`; all 106 exact Git blobs and pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored. Qualified source ancestry through NORM-0A remains intact.
- **All four new NORM-0B source roots cold-built** and printed only the standard allowed axioms `propext, Classical.choice, Quot.sound`: `originalColorQuadratic_add`, `originalColorQuadratic_real_smul`, `originalColorQuadratic_zero`, `originalFockGramObservable_sum`. The original 81-term Gram/Fock decomposition is now source-built, though NOT separately qualified as a gate until its consumer passes.
- **Independent downstream consumer failed only**:
  1. Diagnostic line 29, `originalColorQuadratic_neg_from_real_smul`: `simpa` applied source real scalar lemma with `r=-1`, but returned `Q(-J)=(-1) • Q(J)`, while goal is `Q(-J)=-Q(J)`. This requires the real/complex `-1` scalar action normalization, not a new Q identity.
  2. Diagnostic line 35, `originalFockGramObservable_zero_B`: after the new Q sum and `Q(0)=0`, leaves `∑ i, ∑ j, (M_ij(x):ℂ) • 0 = 0`. This requires a COMPLEX scalar acting on the zero actual bounded Fock operator and two explicit Finset sum-zero steps.
- Consumer `sorryAx` in failed diagnostics is purely elaboration failure; all four SOURCE axiom audits were permitted-only. No physical Hamiltonian or FullL2 claim.
- Artifact ID `13831117772`; uploaded ZIP SHA-256 `38fe8407ee57c35ec8e4fe92fc1003455c3d88f5c820391ee1b13990ac148dc2`.

## Minimal consumer-only repair

The original accepted NORM-0B SOURCE blob `78cf0db748fc7d98bcd1f6c2629d75742c6d8097` is untouched. The independent consumer `lean/diagnostics/BFSSNORM0BOriginalFockQuadraticRealLinearGramSumConsumer.lean` changes only its two downstream proof bodies:

```lean
  simpa only [Complex.ofReal_neg, Complex.ofReal_one, neg_one_smul] using
    (originalColorQuadratic_real_smul (-1 : ℝ) J)
```

The `neg_one_smul` theorem was inspected at the EXACT frozen Mathlib commit in `Mathlib/Algebra/Module/Defs.lean` line 148: for an `R`-module `M`, `(-1:R) • x = -x`. The `Complex.ofReal_neg` and `Complex.ofReal_one` rewrites expose the correct literal complex scalar.

```lean
  rw [originalFockGramObservable_sum]
  simp only [mul_zero, zero_mul, originalColorQuadratic_zero]
  apply Finset.sum_eq_zero
  intro i _
  apply Finset.sum_eq_zero
  intro j _
  exact smul_zero ((originalSpatialGram x i j : ℝ) : ℂ)
```

No unqualified source replacement. This isolates complex scalar `smul_zero` with the EXACT real-Gram coefficient cast and the original Fock endomorphism goal, and proves both finite sums zero explicitly. This avoids the same broad `simp` stagnation that repeatedly affected earlier source/consumer gates.

## Freeze and stop rule

- Previously failed consumer blob `fca47c1d976aaced0f1a9720a1ed457d16039910`.
- New **uncompiled** consumer candidate blob `8cb24a936153d73c37e97a753a5e99daf34158d6`.
- Strict workflow previous blob `e293a0f22df1dbd6c782089a7255b6c0bf174622`, new blob `b870ccb4e47e5cb62a38831716c031a3bb689de4`. **Only one consumer pin** changes among exactly 106 frozen pinned source+consumer blobs; all 104 qualified ancestry pins and now fully compiling NORM-0B source blob are frozen.
- Separate independent consumer compilation and its two axiom roots must be strictly green before marking NORM-0B QUALIFIED. If red, inspect precise first causal diagnostic, repair that term only, and preserve this as negative knowledge.
- The unstarted NORM-0C fixed-B uniform pointwise bound and NORM-0D original `FullL2 2` multiplier remain contingent; nothing here proves Hamiltonian spectrum, spectral confinement or mass gap.

**Reusable lesson:** Distinguish a mathematically established scalar law from the precise literal `ContinuousLinearMap` scalar action the Lean simplifier recognizes. Spell out `neg_one_smul` and `smul_zero` with correct complex coercions, then apply `Finset.sum_eq_zero` separately at each nesting depth.
