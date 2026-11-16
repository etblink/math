# BFSS M4-LB1C1 R6 — original Source48 K(A) gamma covariance STRICT GREEN acceptance

**Accepted:** 2026-11-16 Pacific. **Repository/branch:** `etblink/math`, `integration/bfss-unified-research-20261108` ONLY, `main` unchanged. **Qualification:** source-exact original 48-Majorana infinitesimal covariance on the genuine `Fermion 2` Fock operator carrier. Does not establish a group-level Spin9 Fock representation, Lie-bracket homomorphism, charge-domain covariance or a spectral theorem.

## Immutable strict execution receipt

- [LB1C1 R6 #43901524171](https://github.com/etblink/math/actions/runs/43901524171), `completed/success`, attempt 1, tested commit **`af8471e0bd30306778b65ace8d7c68ddf1ff2982`**, successful job **`133419110352`**.
- **Exact accepted new source** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean` Git blob **`c2e7a7c665121283cde13ae5dabc183362b6b420`**.
- **Independent original-source consumer** `lean/diagnostics/BFSSP3M4LB1C1OriginalSource48SkewKMajoranaCovarianceIndependentConsumer.lean` Git blob **`a1c186bf3a630b251e4596ecf63a1dd48c12e701`**.
- **Exact strict workflow** `.github/workflows/bfss-m4-lb1c1-original-source48-k-gamma-covariance-strict.yml` Git blob **`e4570d230e9eb8f377a6439f684799d634fa56fc`**. Original pinned donors: qualified LB1C0 **`8b11930128c92bb8a499970593252de942052b1b`**, LB1S **`d7d460fc8d2806234816e8bd2088f9cebb6addd4`**, LB0 **`d08200fae8ef6c9c9544414307ad537f1eeaa4a4`**, source gamma **`7abc03723b3111e4a03389b722054e50d6a9bf30`**, Fock self-adjoint gamma **`98889cb8607ccc64091165fbca585acb898b9ddc`**.
- Frozen **Lean 4.34.1**, **Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`**, source/donor/consumer hashes and original manifest preflight PASS. Exact marker `BFSS_M4_LB1C1_SOURCE_DONORS_CONSUMER_PIN_PREFLIGHT_PASS`.
- New original LB1C1 `.olean` cold built in **8,961 jobs**, marker `Build completed successfully (8961 jobs)`. Subsequently compiled again with `-DautoImplicit=false -DwarningAsError=true`, then separately compiled the original Fock independent consumer. **Three original source and three independent consumer axiom reports = 6/6 PASS**, all only `[propext, Classical.choice, Quot.sound]`, no `sorryAx` and no errors or unallowlisted warnings. External Mathlib package “local changes” notices occurred and were explicitly allowlisted, not source warnings.
- Exact final success marker `BFSS_M4_LB1C1_ORIGINAL_FOCK_SKEW_K_GAMMA_COVARIANCE_3_SOURCE_3_CONSUMERS_STRICT_GREEN` in job logs. [Artifact #14244520439](https://github.com/etblink/math/actions/runs/43901524171/artifacts/14244520439), size **3,552 bytes**, GitHub-reported ZIP SHA256 **`e13e674522b96596ac58f58e67e1eb35e8c5a30e57669c8e3dd54280d9fe706a`** (provider-reported, not independently rehashed).
- [Active-roadmap consistency #43901524331](https://github.com/etblink/math/actions/runs/43901524331) also `completed/success` on the same tested commit; that supporting check is **not** a substitute for the independent source+consumer certification.

## Precisely qualified theorem interfaces

**The actual source data:** `Source48Label=Fin 24 × Fin 2`; `Op = Fermion 2 →L[ℂ] Fermion 2`; `Γ_p=sourceNormalizedGamma p` with literal original sqrt(2) normalization; qualified immutable original

```text
K(A) = originalSource48BivectorK A
     = ∑_(p,q : Source48Label) (A p q / 4 : ℝ) • (Γ_p * Γ_q).
```

The following three public source declarations are now accepted:

1. `originalFock_skew_delta_doubleSum_contract`: generic finite real skew double-sum delta cancellation on the **actual original Fock continuous-linear-map carrier** (not an artificial commutative algebra).
2. `originalSource48BivectorK_skew_commutator_gamma`: for every **entrywise-skew** real `A` and original paired label `k`,
   ```text
   K(A) * Γ_k - Γ_k * K(A) = ∑_p (A p k : ℝ) • Γ_p.
   ```
3. `originalSource48BivectorK_skew_commutator_gamma_of_transpose`: same native original 48-matrix identity from `A.transpose=-A`, using qualified skew-entry adapter.

Three independently compiled original-genuine-Fock consumers recheck exactly the generic contraction, entrywise-skew native covariance, and transpose-skew native covariance.

## Preserve negative knowledge and stop rule

Earlier [R1 RED #43856330483](https://github.com/etblink/math/actions/runs/43856330483), [R2 RED #43858870801](https://github.com/etblink/math/actions/runs/43858870801), [R3 RED #43863772086](https://github.com/etblink/math/actions/runs/43863772086), [R4 RED #43865912098](https://github.com/etblink/math/actions/runs/43865912098), and [R5 RED #43867535620](https://github.com/etblink/math/actions/runs/43867535620) remain valid diagnostics. R5 compiled the three theorems with standard-only axioms but failed a strict linter warning on `ext v <;> simp`; R6 used `ext v; simp` without weakening resource limits or linter policy. Their separately preserved RED receipts must not be overwritten, rewritten into green history, or deleted.

**Next OPEN:** the original 48-Fock bivector **Lie-bracket** representation `[K(A),K(B)]=K(AB-BA)` for real skew `A,B`. This is not a corollary of gamma covariance without an additional argument. [Bounded next-gate decision](BFSS_M4_LB1L0_NEXT_LIE_BRACKET_MICROGATE_DECISION_2026_11_16.md) recommends direct associative product-commutator expansion, generic finite-sum rearrangements, and source-exact typed matrix adapters; verify under a new strictly pinned original source+consumer gate before promotion. Do not infer a global `Spin(9)` Fock-vector unitary, sixteen-supercharge common invariant domain, SU(2) gauge physical singlet, gap, or M-theory unification result from LB1C1.
