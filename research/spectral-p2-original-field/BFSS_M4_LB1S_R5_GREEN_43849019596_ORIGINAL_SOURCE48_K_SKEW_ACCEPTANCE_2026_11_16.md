# BFSS M4-LB1S R5 — source-exact original 48×48 Fock bivector K(A) skew-adjointness

**Local date:** 2026-11-16 (America/Los_Angeles). **Canonical working branch:** `integration/bfss-unified-research-20261108`; owner requires one integrated research branch, no separate branch or `main` writes.

**Project Lead decision:** **STRICT GREEN / QUALIFIED**, exactly on the original `Fermion 2` Fock **operator** carrier, with real skew 48×48 original Majorana coefficient matrices and the literal 1/4 generator. The complete commutator, group-integrated physical Spin9 action, and original sixteen-charge domain remain OPEN.

## Immutable acceptance evidence

- [LB1S R5 strict run #43849019596](https://github.com/etblink/math/actions/runs/43849019596): `completed/success`, attempt 1; tested immutable Git commit **`13e79693918135c375db702c377cffa11ffd9d83`**, successful job **`133236781915`**.
- GitHub Actions preflight marker `BFSS_M4_LB1S_SOURCE_DONORS_CONSUMER_PIN_PREFLIGHT_PASS`; all eight job steps passed, including exact new source/original qualified donors/independent consumer pin preflight, Lean+Mathlib cache restore, genuine source cold build and separate independent consumer.
- `Build completed successfully (8959 jobs)` for the original newly compiled **LB1S** `.olean`; strict audit marker `BFSS_M4_LB1S_ORIGINAL_FOCK_SKEW_BIVECTOR_5_SOURCE_4_CONSUMERS_STRICT_GREEN`.
- **Five source** `#print axioms` reports plus **four separately compiled original Fock independent consumer** axiom reports (**9/9 standard-only**): each contains exactly only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`, no original Lean source/consumer compiler errors or unallowlisted source warnings. Cache restoration outputs benign package local-change warnings, not source/consumer warnings.
- Frozen toolchain **Lean 4.34.1**, Mathlib **`d13f23b723b8a846827a245b89c10fc7d3f11612`**.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1SOriginalSource48SkewMatrixFockBivector.lean`, exact tested Git **blob `d7d460fc8d2806234816e8bd2088f9cebb6addd4`**.
- Separate consumer `lean/diagnostics/BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivectorIndependentConsumer.lean`, exact tested Git **blob `b66be3f0097dbb0a2747e58f7ff21b1bf1d7a1d8`**; unchanged across R1–R5.
- Strict workflow `.github/workflows/bfss-m4-lb1s-original-source48-skew-bivector-strict.yml`, exact tested Git blob **`b23922195100948acbb7c5b64d81ce3101a6ba0a`**, correct LB1S cold module and `.olean` target.
- Qualified source donor `P3M4LB0OriginalSource48MajoranaBivectorCAR.lean`, blob **`d08200fae8ef6c9c9544414307ad537f1eeaa4a4`**. Original normalized gamma source `SU2BFSSSource48NormalizedFockGammaProbe.lean`, blob `7abc03723b3111e4a03389b722054e50d6a9bf30`; physical Fock star source `SU2BFSSSource48FockGammaSelfAdjointProbe.lean`, blob `98889cb8607ccc64091165fbca585acb898b9ddc`.
- [R5 preserved evidence artifact #14217203070](https://github.com/etblink/math/actions/runs/43849019596/artifacts/14217203070), 3,369 bytes, GitHub-reported archive SHA-256 **`ee94d20d24a4696b8af022413e0a3455bcd53d5067a63ff20d67efe1a3bb0c18`**. This is provider-reported, not independently rehashed from a ZIP downloaded to a local runner.

## Exactly qualified source statements

For the original `Source48Label = Fin 24 × Fin 2` paired `sqrt(2)`-normalized Majorana operators `Γ_p := sourceNormalizedGamma p` on the ACTUAL `Fermion 2` carrier and a **real** `Matrix Source48Label Source48Label ℝ`, the exact source definition is

```lean
noncomputable def originalSource48BivectorK
    (A : Matrix Source48Label Source48Label ℝ) : Op :=
  ∑ p : Source48Label, ∑ q : Source48Label,
    (A p q / 4 : ℝ) •
      (sourceNormalizedGamma p * sourceNormalizedGamma q)
```

The following five original source declarations are now strictly qualified:
1. `originalSource48BivectorK`: literal **1/4** normalized real 48×48 contraction into the genuine complex-linear Fock-vector endomorphism algebra; multiplication is NONCOMMUTATIVE.
2. `originalSource48_matrixSkew_entries`: actual matrix condition `A.transpose = -A` implies `A p q = -(A q p)` with the original source index type.
3. `originalSource48BivectorK_skewAdjoint`: entrywise real skew `A` implies `star (K A) = -(K A)` for the actual physical Hilbert adjoint.
4. `originalSource48BivectorK_skewAdjoint_of_transpose`: same for native transpose-skew real 48×48 matrices.
5. `originalSource48BivectorK_zero`: `K(0)=0` on genuine original `Fermion 2` bounded operators.

Four source-typed independent consumer declarations are **`originalSource48BivectorK_raw_consumer`**, **`originalSource48BivectorK_entrySkew_consumer`**, **`originalSource48BivectorK_transposeSkew_consumer`**, and **`originalSource48BivectorK_zero_consumer`**.

These results constitute a source-exact **infinitesimal skew-adjoint operator** construction for arbitrary real skew matrices. They do NOT yet prove that `A ↦ K(A)` preserves Lie brackets, is a source exact Spin9 differential, exponentiates compatibly to the global original Fock-vector group action, fixes a nonzero physical Fock-vector singlet, or intertwines genuine BFSS charges.

## Preserved R1–R4 negative research

- [R1 #43840918666](https://github.com/etblink/math/actions/runs/43840918666) RED: original real scalar star and diagonal zero/large-sum tactic boundary. [Receipt](BFSS_M4_LB1S_R1_RED_43840918666_SCALAR_STAR_SUM_BOUNDARY_2026_11_16.md).
- [R2 #43843745397](https://github.com/etblink/math/actions/runs/43843745397) RED: diagonal zero and 48×48 elaboration recursion; source real/complex star bridge partly succeeded. [Receipt](BFSS_M4_LB1S_R2_RED_43843745397_DIAGONAL_AND_DOUBLE_SUM_2026_11_16.md).
- [R3 #43845733042](https://github.com/etblink/math/actions/runs/43845733042) RED: diagonal `star 0=0` and concrete generic double-sum unification; original real-zero helper and abstract finite-sum star lemma first compiled. [Receipt](BFSS_M4_LB1S_R3_RED_43845733042_STAR_ZERO_UNIFICATION_BOUNDARY_2026_11_16.md).
- [R4 #43847454942](https://github.com/etblink/math/actions/runs/43847454942) RED: concrete K(A)-to-double-sum bridge compiled; sole remaining failure was missing explicit type argument to polymorphic `star_zero`. [Receipt](BFSS_M4_LB1S_R4_RED_43847454942_STAR_ZERO_TYPE_ARGUMENT_2026_11_16.md).
- R5 exact one-line repair `exact star_zero Op` compiled fully. No history rewritten, failed evidence erased, recursion/resource limits raised, invented commutative operator multiplication or new axioms supplied.

## Next bounded research: LB1C full infinitesimal covariance (UNQUALIFIED)

Reuse the **byte-identical qualified `originalSource48BivectorK`** and previously green LB0 original 48 CAR triple commutator:

```text
[(Γ_p Γ_q), Γ_k] = 2 δ(q,k) Γ_p - 2 δ(p,k) Γ_q.
```

For the exact real skew matrix `A`, linearity gives

```text
[K(A), Γ_k] = (1/2) ∑_p A[p,k] Γ_p
            - (1/2) ∑_q A[k,q] Γ_q
            = ∑_p A[p,k] Γ_p
```

under `A[k,q]=-A[q,k]`. The **factor 1/4 must stay fixed**. Implementation should first qualify an abstract additive finite-sum commutator-distribution and Kronecker-collapse lemma, then independently source-type the original `Source48Label` and original `Fermion 2`, with a cold strict independent consumer. Do not re-expand the full 48×48 original gamma sum in a `change`/unification-heavy tactic; use named local summands and bounded row-sum lemmata, as learned from R1–R4.

Then investigate the original `so(9)→so(16)→so(48)` source derivative and strict central-sign consistency against CS0 before global Fock-vector Spin9 lift. The unbounded original physical `FullL2 2` charge-domain and spectral obligations remain separately OPEN; no mass-gap, ground-state existence, Hardy estimate or theory-of-everything theorem follows.

**Provenance scope:** This acceptance receipt and roadmap updates are post-qualification DOCUMENTATION commits on unified. They do not claim that those newer documentation SHAs were independently cold requalified. The mathematical acceptance belongs to the exact tested R5 SHA stated above.
