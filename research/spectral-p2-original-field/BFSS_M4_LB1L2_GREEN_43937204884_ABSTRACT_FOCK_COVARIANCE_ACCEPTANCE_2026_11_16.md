# BFSS M4-LB1L2 — STRICT GREEN acceptance: genuine original Fock abstract covariance

**Acceptance date:** 2026-11-16 (Pacific). **Authority:** Project Lead. **Branch:** `integration/bfss-unified-research-20261108`; **scope:** abstract genuine original `Fermion 2 →L[ℂ] Fermion 2` operator covariance, NOT native 48-label instantiation and NOT full bivector Lie closure.

## Exact immutable green receipt

- [Strict GitHub Actions #43937204884](https://github.com/etblink/math/actions/runs/43937204884), `completed/success`, attempt **1**, exact tested commit **`3f1de41d122d2f00e05b3530039f8dffe8798b53`**, job **`133545003759`**.
- Compiled source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1L2AbstractOriginalFockCovarianceLeibniz.lean`, exact Git blob **`b4012951a26aa7573db513adab3d7ce27396db7e`**.
- Separately compiled original Fock consumer `lean/diagnostics/BFSSP3M4LB1L2AbstractOriginalFockCovarianceLeibnizIndependentConsumer.lean`, exact Git blob **`785052f3c53488b56c36bc11f27a8e2100800d17`**.
- Exact qualifying workflow `.github/workflows/bfss-m4-lb1l2-abstract-original-fock-covariance-strict.yml`, Git blob **`4f31fdf183ccf6d52c676ec0072178db1153dc34`**.
- Frozen Lean `4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, exact source+consumer+LB1C1/LB1C0/LB1S/LB0/source-gamma donor preflight **PASS**. Cold Lean source build **8,962/8,962 jobs PASS**; explicit source audit and independent consumer both compiled using `lake env lean -DautoImplicit=false -DwarningAsError=true`. The final strict checker emitted **`BFSS_M4_LB1L2_ABSTRACT_FOCK_2_SOURCE_2_INDEPENDENT_CONSUMERS_STRICT_GREEN`**.
- **Four of four** `#print axioms` outputs for the exact source theorems and independent consumer theorems each contain **only** `[propext, Classical.choice, Quot.sound]`; **no `sorryAx`**, compiler errors or non-allowlisted warnings. The expected local changes warnings for fetched Mathlib packages were explicitly allowed by the frozen CI policy.
- [GitHub Actions artifact #14261117575](https://github.com/etblink/math/actions/runs/43937204884/artifacts/14261117575), ZIP size **3,582 bytes**, **GitHub-reported** digest `sha256:a3d35817c6889e8387a103810b61fc50f8901be453906c4b0d7e75c153e9242a` (not independently rehashed).

## Accepted theorem interfaces

1. `originalFock_product_covariance_from_two_hypotheses`, for arbitrary actual original Fock continuous linear operators `T X Y U V : Fermion 2 →L[ℂ] Fermion 2`: if `T*X-X*T=U` and `T*Y-Y*T=V`, then `T*(X*Y)-(X*Y)*T=U*Y+X*V`. Original noncommutative multiplication is preserved.
2. `originalFock_indexed_product_covariance`, for arbitrary finite `ι`, genuine original Fock family `x:ι→Op`, real matrix coefficients `a:ι→ι→ℝ` and **hypothesis** `∀k, [T,x_k]=∑_r a[r,k]•x_r`: derives the corresponding indexed product action for any `p,q`.
3. `originalFock_product_covariance_from_two_hypotheses_consumer` and `originalFock_indexed_product_covariance_consumer` are **independently compiled** exact imported-interface consumers.

**Boundary:** The generic indexed hypothesis is NOT discharged for `T=originalSource48BivectorK A`, `x=sourceNormalizedGamma` by this gate. The source-exact original `[K(A),Γ_pΓ_q]` and `[K(A),K(B)]=K(AB-BA)` remain unqualified. No global `Spin(9)` unitary, SU(2) physical Gauss invariance, 16-charge common domain or original Hamiltonian spectral claim is proven.

## Provenance of prior REDs and next method

- Full native LB1L0 R1 [#43916000648](https://github.com/etblink/math/actions/runs/43916000648) elaboration recursion; R2 [#43918477267](https://github.com/etblink/math/actions/runs/43918477267) kernel timeout.
- D0 [#43921140661](https://github.com/etblink/math/actions/runs/43921140661) recursion; D1 attempt 2 [#43924517686](https://github.com/etblink/math/actions/runs/43924517686) kernel timeout.
- LB1L2 R1 [#43936812478](https://github.com/etblink/math/actions/runs/43936812478) had an **invalid workflow YAML**, zero jobs; separately preserved negative operational evidence. A superseded preflight-only [#43937003079](https://github.com/etblink/math/actions/runs/43937003079) was cancelled when the final stronger strict workflow was pushed. These are **not** mathematical failures.

**Project Lead decision:** Freeze accepted new source/consumer exact blobs; do not prematurely re-enter source substitution via tactic rewrites on giant K(A) terms. Investigate **elementary skew-plane basis** under exact original CAR with a separated *source-sparse-generator adapter* before any new full `[K(A),K(B)]` gate. [Bounded proof design](BFSS_M4_LB1P0_ELEMENTARY_SKEW_PLANE_BRIDGE_FORWARD_RESEARCH_2026_11_16.md). Maintain a strict single-source-of-truth roadmap and retain all negative results in original files. No `main` write, branch creation or history rewriting.
