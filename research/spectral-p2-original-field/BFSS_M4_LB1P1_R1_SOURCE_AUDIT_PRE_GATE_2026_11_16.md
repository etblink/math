# BFSS M4 LB1P1 R1 — source-interface audit, exact frozen pre-gate

Date: 2026-11-16 Pacific. **PENDING_STRICT_CI, not proved by staging.** Only branch `integration/bfss-unified-research-20261108`.

## 1. Owner-priority and safe architecture decision

The accepted M4 last-qualified theorem remains **CT0 R2 `Tr_{original Fock} K(A)=0` for real skew Source48 matrices**, strict [#43983772199](https://github.com/etblink/math/actions/runs/43983772199) with original ZIP independently rehashed and stored. Native CT1-G0 R1 [#43988822460](https://github.com/etblink/math/actions/runs/43988822460) and R2 [#43991790285](https://github.com/etblink/math/actions/runs/43991790285) both failed cold source adapter elaboration due to recursion, not mathematics. Both full original RED ZIPs, full logs, separate independent rehashes, receipts, and [architecture decision](BFSS_M4_CT1_TWO_REDS_ARCHITECTURE_DECISION_2026_11_16.md) are preserved; **CT1 R3 forbidden** under the stop rule.

This P1 gate uses a different proof boundary: four individually normalized original Majoranas and only two original source triple covariances. There is **no general skew-matrix sum `K(A)`** in any new P1 theorem. P0B provides the qualified sparse-plane 1/4 and 1/2 normalizations for a later stage; no P1 coefficient is retrofitted into P0B.

## 2. Exact mathematical target, source-by-source

On genuine `Op := Fermion 2 →L[ℂ] Fermion 2`, for opaque `T,X,Y,U,V:Op` and `a,b,c,d:ℂ`, under **explicit** premises `[T,X]=a•U-b•V` and `[T,Y]=c•U-d•V`, the first source theorem derives

```text
[T,X*Y] = a • (U*Y) - b • (V*Y) + c • (X*U) - d • (X*V).
```

This uses **accepted** LB1L2 `originalFock_product_covariance_from_two_hypotheses`, exact `smul_mul_assoc` and `mul_smul_comm`, then additive normalization. The original Fock multiplication is noncommutative and never assumed commutative.

The second source theorem instantiates only literal original Source48 gamma factors `T=Γ_iΓ_j, X=Γ_k, Y=Γ_l, U=Γ_i, V=Γ_j`. The two premises are **accepted** LB0 `originalMajorana_bivector_commutator i j k` and `...i j l`. Its exact native four-Majorana conclusion is

```text
[Γ_iΓ_j,Γ_kΓ_l] =
  (if j=k then 2 else 0) • (Γ_iΓ_l)
  - (if i=k then 2 else 0) • (Γ_jΓ_l)
  + (if j=l then 2 else 0) • (Γ_kΓ_i)
  - (if i=l then 2 else 0) • (Γ_kΓ_j).
```

Each scalar is explicitly `ℂ`; all four source labels are arbitrary `Source48Label=Fin 24 × Fin 2`. No pairwise inequality hypothesis is hidden. The preflight checks **four** original consumer controls: pairwise distinct, shared `j=k`, identical ordered bivectors, and diagonal `i=j`. These controls instantiate the native identity and its exact indices; they are not separate simplifications to zero or standalone physical tests.

## 3. Frozen blobs, source donors and strict acceptance

| Component | Path | Git blob |
| --- | --- | --- |
| New P1 original Fock source | `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1P1OriginalFourMajoranaCommutator.lean` | `c30f23f118cea33c388f391e81b406495d52de99` |
| New independent importing consumer | `lean/diagnostics/BFSSP3M4LB1P1OriginalFourMajoranaIndependentConsumer.lean` | `5822a7290c04e5fc88b297ad14d9d16b8c290bbd` |
| New strict workflow | `.github/workflows/bfss-m4-lb1p1-four-original-majorana-strict.yml` | `b8339568106000863475857ee05513f2fdfc4ab9` |
| LB0 original CAR triple commutator | `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB0OriginalSource48MajoranaBivectorCAR.lean` | `d08200fae8ef6c9c9544414307ad537f1eeaa4a4` |
| LB1L2 original Fock Leibniz | `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1L2AbstractOriginalFockCovarianceLeibniz.lean` | `b4012951a26aa7573db513adab3d7ce27396db7e` |
| P0B sparse skew plane | `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1P0BOriginalSource48SkewPlaneNormalization.lean` | `1c47a8645bb8ae18110f29083c95887b8a0e3a15` |
| Active source48 normalized gamma | `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSSource48NormalizedFockGammaProbe.lean` | `7abc03723b3111e4a03389b722054e50d6a9bf30` |

Additional accepted P0A, LB1S and LB1C1 bytes are pinned. Lean **4.34.1**, Mathlib **d13f23b723b8a846827a245b89c10fc7d3f11612** and their exact Git blobs are frozen. No prior proofs or source inputs modified.

Strict CI requires exact preflight of all **11** pin paths and stop-rule snapshot, unchanged old CT1 RED original SHA-256/ZIP, cold original source compile under 1100-second bound, warnings-as-errors source and independently imported consumer, **2 source + 2 consumer standard-only axiom reports** (`propext`, `Classical.choice`, `Quot.sound`), four exact-index native controls, six negative auditor controls and original artifact upload even on failure.

**Never promote from run status alone.** GREEN acceptance additionally requires original ZIP and job logs preserved and separately rehashed, same as CT0. If P1 R1 fails, preserve first causal proof/log, source/consumer hashes and provider artifact, no weakened axiom or resource policy; two analogous native source failures stop P1 too. All older RED and GREEN knowledge retained.

## 4. Scientific ceiling

P1 would establish only the **original four-Majorana commutator**; it does not prove sparse-plane K(E) bracket, finite extension to arbitrary skew A/B, scalar commutant, full K Lie homomorphism, Spin(9) Fock-vector group integration, physical gauge/charge domains, G16/Hardy auxiliary bound, ground-state fidelity, mass gap or ground-state existence. The next P2 sparse plane is **prospective not staged**. Physical equal-norm Gauss/charge-square and fixed-positive-regulator trial fidelity remain independent leading physics objectives. Edition 0.8 remains dated and `main` untouched.
