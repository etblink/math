# BFSS M4-LB1C1 R2 RED — original Fock scalar zero and complex subtraction rewrite

**Date:** 2026-11-16 Pacific. **Canonical repository:** `etblink/math`. **Only work branch:** `integration/bfss-unified-research-20261108`. **Result:** R2 strict RED; original-source gamma covariance NOT qualified.

## Immutable R2 receipt

- [Strict original Source48 K-gamma covariance run #43858870801](https://github.com/etblink/math/actions/runs/43858870801) completed **failure**. Exact tested workflow/source commit `43a4679adf9fa202d67386e4f82fde1396cfd16c`; job ID `133270163494`.
- Original LB1C1 source Git blob `eb6a4c804cb8b87616fd1c3ae5bb45029ade307f`. Original three-declaration independent consumer blob `a1c186bf3a630b251e4596ecf63a1dd48c12e701`. The accepted LB1C0/LB1S/LB0 and gamma source pins were preserved in the exact workflow.
- Job checkout, exact source+donor+consumer+toolchain preflight and frozen Lean 4.34.1/Mathlib cache PASS. Native cold source module compilation **FAILED**. Independent source consumer and its three axiom reports were never reached.
- [Uploaded R2 failure artifact #14223186275](https://github.com/etblink/math/actions/runs/43858870801/artifacts/14223186275), 3518 bytes. GitHub-reported ZIP digest `sha256:117fb9c4d4ca3a7c1128e892c0bef68676d944f152c770670f801f2e48472d3e`; **provider-reported, not independently rehashed**.

## First-causal diagnostics from native compiler

1. `P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean:68:8`: `smul_zero ↑a` is already a theorem, and applying the additional explicit `Op` argument produces `Function expected`. The source line was `exact smul_zero (a : ℂ) Op`.
2. Same file at **172:18**: `rw [sub_smul]` expects a coefficient-difference scalar action on the left, whereas the actual goal is `↑(a p k / 2) • x p - ↑(a k p / 2) • x p = (↑(a p k / 2) - ↑(a k p / 2)) • x p`. The appropriate rewrite direction is `rw [← sub_smul]`.
3. Three intended source declaration axiom reports printed `sorryAx` because the source proof was not compiled. **Do not interpret these reports as accepted theorems.** The required 3-source/3-consumer standard-only axiom gate did not pass.

These are proof-script diagnostics, not mathematical disproof of `[K(A), Γ_k] = ∑_p A[p,k] Γ_p`.

## Bounded R3 repair and stopping rule

- Change **only** `exact smul_zero (a : ℂ) Op` to `exact smul_zero (a : ℂ)` and `rw [sub_smul]` to `rw [← sub_smul]`. No theorem statement, normalization, `Op` type, scalar bridge, original `Source48Label` order, global instances, qualified source module or independent consumer change.
- Update only LB1C1 workflow's source Git blob pin to the candidate R3 source blob; keep donor, consumer, toolchain, absence-of-sorry/warning, cold build and six standard-only axiom checks unchanged.
- R3 acceptance requires cold new original-source `.olean`, three source and three separately compiled original-Fock consumers, six axiom reports limited to `{propext, Classical.choice, Quot.sound}`, no `sorryAx` or unallowlisted warnings, and stored logs. **Do not accept on preflight alone.**
- If R3 is RED, preserve exact tested SHA, first compiler error, artifact digest and resulting axiom reports before planning further repairs. If R3 is GREEN, preserve acceptance evidence before pursuing `[K(A),K(B)]=K([A,B])`.

Beyond the successful current donors, source group Spin(9) Fock-vector unitarity, SU(2) gauge/16-supercharge common-domain covariance, physical singlet/Hardy bounds and spectral conclusions remain OPEN. The incidence-first Yukawa tensor stabilizer classification is a separate research hypothesis, not an accepted theorem.
