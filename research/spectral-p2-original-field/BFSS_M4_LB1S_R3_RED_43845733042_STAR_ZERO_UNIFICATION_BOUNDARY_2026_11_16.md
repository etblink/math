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
