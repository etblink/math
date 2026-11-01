# V10H-F10 Gate 2 RED — eight negative original gamma diagonal cast bridges

Date 2026-10-31 PDT; exact source-provenance research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## Verified failure

- [F10 Gate 2 #41266892206](https://github.com/etblink/math/actions/runs/41266892206) failed, job `124731449857`, attempt 1, tested SHA `fb012c271dac2bf12acf86f46bb3172bb47db6ce`. Preflight, pinned toolchain cache/reconstruction and accepted F9 ancestor rebuild PASS. Fresh `-DwarningAsError=true` F10 compiler FAILED, exact independent declaration and axiom audit SKIPPED. All three F10 declarations remain **UNQUALIFIED** with `sorryAx`; F1–F9 accepted and untouched.
- [Gate 2 artifact #13067761462](https://github.com/etblink/math/actions/runs/41266892206/artifacts/13067761462), SHA256 `7e4b418962c7eab99e006f7ed61b468c9a44449a80a91200fdb0231e0853fc58`. Exact source F10 Gate 2 blob `89de4328dfc7a68f479f3ee427d16722fbfc9dd3`.
- Unlike [Gate 1 #41266215820](https://github.com/etblink/math/actions/runs/41266215820), Gate 2 successfully closed **248/256** original gamma matrix finite entrywise obligations using `rfl`. All 8 remaining errors lie at `gammaInt✝ 8 i i`, for precisely i=8,...,15; the target is `↑(gammaInt✝ 8 i i) = -1 : ℝ`. They are all **negative integer-to-real cast** mismatches, not differing signs; the source's original private integer signed permutation is unchanged.
- The previously missing `Finset.prod_univ_succ` was fixed in Gate 2 using pinned Mathlib `Fin.prod_univ_succ`. No product proof error remains. The third theorem depends on first, so all three `#print axioms` showed `sorryAx` for the incomplete first proof, which is **not acceptable**.

## Third bounded repair (CANDIDATE)

The source's actual immutable `SU2RealGammaProbe.lean` (Git blob `b9b8192055c70f0d001d7982669b9823c55562ed`) defines ninth gamma diagonal as eight +1 then eight -1 integers and transports them to reals. The original attempted `norm_num [gamma, Matrix.diagonal, Matrix.map_apply] <;> rfl` still left these eight cases; the `rfl` proof path closed the other 248.

Change **only** the second branch of the finite entrywise proof:
```lean
  fin_cases i <;> fin_cases j <;>
    first
    | rfl
    | change ((-1 : ℤ) : ℝ) = (-1 : ℝ)
      norm_num
```
This forces the exact original source negative integer cast into an explicit typed comparison, then reduces `Int.cast_neg` without unfolding a deeply nested source composition. The `change` tactic is a **hypothesis to check**, not a verified fix: it must succeed for exactly the eight remaining negative diagonal index pairs. Do not assume this will compile until the new strict gate finishes.

Update solely the F10 workflow's exact Git source hash. Preserve source declarations, determinant product proof and all three independent declaration/axiom checks, no increases to maxRecDepth/maxHeartbeats and no modifications to accepted sources or original 48-label Fock ordering.

## Research gap

Even an accepted original ninth-gamma `det=+1` anchor proves neither all nonzero Clifford source generator determinant signs nor the required source Lipschitz closure transfer. Do not claim global source Spin9 orientation `+1`, original paired SO48, Spin48 lift, continuous action or spectral BFSS results. The positive-sign theorem has yet to be formally verified and remains **UNQUALIFIED**.

Retain immutable red evidence from original nested source determinant V10H gates `#41257058496` and `#41257744030`, F4 identity coercion `#41260509990`, F5 comment guard `#41261931766`, F10 Gate1 `#41266215820` and Gate2 `#41266892206`.
