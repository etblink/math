# BFSS M4-LB1S R3 RED — diagonal star zero and concrete sum unification

**Date:** 2026-11-16 (Pacific). **Canonical branch:** `integration/bfss-unified-research-20261108`; owner directive remains single integrated branch, `main` unchanged. **Status:** R3 RED / full LB1S 5+4 gate NOT qualified.

## Exact immutable source of truth

- [LB1S R3 #43845733042](https://github.com/etblink/math/actions/runs/43845733042), `completed/failure`, attempt 1, exact tested commit **`ddfb808e6a0125e674afe0b8e5fe076167c31c68`**, job `133225329508`.
- Exact-source/donor/consumer pins and frozen Lean **4.34.1**, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` preflight PASS; actual native LB1S cold source build RED, original independent consumer not reached.
- GitHub artifact [#14215452249](https://github.com/etblink/math/actions/runs/43845733042/artifacts/14215452249), ZIP size 3,251 bytes, provider-reported SHA-256 `22b57e34f6515787875a6c4fc7227c731cd3029b6d265a90294febdbce109b86` (not independently rehashed locally).
- Exact source blob **`b357f03941b8ec382d03db823c77da381c83f339`**, unchanged independent consumer blob **`b66be3f0097dbb0a2747e58f7ff21b1bf1d7a1d8`**, frozen qualified LB0 donor **`d08200fae8ef6c9c9544414307ad537f1eeaa4a4`**.
- Source `originalSource48BivectorK` with literal real 48×48 coefficient **1/4**, and `originalSource48_matrixSkew_entries`, both printed only `propext, Classical.choice, Quot.sound`. The two skew-adjointness declarations remain dependent on `sorryAx` due to incomplete proofs. No source/consumer GREEN is asserted.

## First-causal diagnostics

1. `P3M4LB1SOriginalSource48SkewMatrixFockBivector.lean:127:4`: diagonal real coefficient is 0 and the previous helper reduces `0 • Γ_pΓ_p` to 0, but the goal remains **`star (0:Op) = (0:Op)`**. The `simp only` chain leaves this residual and reports `star_zero` as unused. Isolate a local named **operator zero** equation and close explicitly using the star-zero API (not new axioms or class instances).
2. `...:135:8`: `maximum recursion depth has been reached` when applying the already compiled **generic** double-sum star-neg lemma to the concrete 48×48 source definition. Do NOT raise `maxRecDepth`, increase heartbeats, change summand normalization or use operator commutativity. First prove a small typed **definitional identity / change-of-representation** from `originalSource48BivectorK A` to a local `f : Source48Label → Source48Label → Op` sum. Then apply the generic lemma to the local function with explicit `Source48Label` type arguments before transporting the result via that identity. This is proof elaboration, not mathematical change.
3. `...:132:8`: unused `star_zero` simp argument, which would also fail strict `warningAsError=true`. Remove it from the broad simplifier; use exact `star_zero` in the typed local zero proof.
4. The earlier R2 zero-matrix sum failure is no longer logged at line 159: the newly introduced `originalRealZero_smul_FockOp` and bounded sum reduction appear effective. Full R3 still RED because source compilation failed first. No independent consumer was compiled.

## Recovery and stop rule

The new helpers `originalRealZero_smul_FockOp` and `originalFockStar_doubleSum_neg` compile inside the tested R3 module; **preserve them**. The original real-to-complex scalar bridge from the source `L9E5B0` is valid in the R3 proof and requires no synthetic `StarModule ℝ`. Repair only the skew-adjointness theorem's local diagonal goal and final generic-sum lemma application; preserve all five source theorem statements, the literal K(A) definition, original paired labels, mathematical 1/4 coefficient, four independent consumers, strict source pins and fixed resource limits. Update the actual source Git blob in the strict workflow and run a fresh original cold + 5 source / 4 independent consumer restricted-axiom audit. Treat any subsequent RED as new first-causal evidence; do not hide R1/R2/R3 records. Only full 9/9 strict GREEN authorizes acceptance.

The full `[K(A),Γ_k]=Σ_p A[p,k]Γ_p` contraction, `so(9)→so(48)` source Lie binding, global Fock-vector Spin9 group representation and original BFSS physical charge domains are **not yet proved**.

## Bounded R4 source-proof repair and new strict test — NOT YET ACCEPTED

- Mathematical source proof-only repair commit `b1e4efabbd26fa67f79e13a70af539c403d4216f`, source Git blob `b5494b0eb84d7d43174403e472021d973ddf777f`; the **literal definition** `originalSource48BivectorK`, the earlier matrix-skew proof, all five statements, the qualified LB0 donor and all four original independent consumers remain unchanged.
- **Diagonal source term:** prove a named `hz : ((A p p / 4 : ℝ) • Γ_pΓ_p) = (0 : Op)` with the source `originalRealZero_smul_FockOp` theorem, rewrite the full goal with `rw [hz, neg_zero]` and explicitly close `star (0:Op)=0` using `exact star_zero` rather than a brittle simplifier that produced an unused-argument warning.
- **Concrete K(A) instantiation:** name a local **opaque source-typed** `f : Source48Label → Source48Label → Op`; separately prove the pointwise star-neg property `hf`, the generic star-neg result `hsum` on `∑p∑q f p q`, and the exact definitional equality `hk : originalSource48BivectorK A = ∑p∑q f p q`. Only then rewrite with `rw [hk]` and close by `exact hsum`. This avoids asking the elaborator to unify a large original gamma expression directly at the generic lemma call.
- Frozen exact-source workflow-pinning commit **`64507e11ab8076df13dfbcb7d3a6a418a85facf0`**, [LB1S R4 strict run #43847454942](https://github.com/etblink/math/actions/runs/43847454942). Source-only workflow run #43847423014 was cancelled by same-branch workflow concurrency after the pin commit and is not a separate mathematics failure.
- Acceptance still requires the true cold source build, warning-as-error, all **5 source / 4 independent original-Fock consumer** restricted-axiom reports, no `sorryAx` or nonallowlisted warning, preserved artifact and exact tested immutable commit. R1, R2 and R3 remain RED with permanent diagnostic records, even if R4 succeeds. If R4 fails, preserve its new first-causal error and reconsider the proof architecture rather than repeating unbounded elaboration attempts.

R4 is **pending**, not a confirmed theorem result. The full finite-`K(A)` commutator, original so9 infinitesimal representation, Spin9 group lift and original physical charge covariance remain open.
