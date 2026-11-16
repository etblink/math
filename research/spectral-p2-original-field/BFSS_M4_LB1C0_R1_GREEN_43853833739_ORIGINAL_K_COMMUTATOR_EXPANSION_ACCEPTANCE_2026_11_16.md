# BFSS M4-LB1C0 R1 — original K(A) Majorana commutator expansion STRICT GREEN

**Date:** 2026-11-16 Pacific. **Canonical owner-directed branch:** `integration/bfss-unified-research-20261108` exclusively. **Scope:** accepted formal original Fock-vector operator double-sum commutator expansion and source CAR substitution; NOT the final skew-matrix Kronecker-delta contraction, Lie hom, Spin9 group Fock unitary, physical charge domains or spectral results.

## Exact frozen acceptance

- [Strict LB1C0 R1 #43853833739](https://github.com/etblink/math/actions/runs/43853833739), `completed/success`, attempt 1, tested exact Git commit **`373e9b017586812bbfe47646fb5d80c76609e7e9`**, successful job `133252922642`.
- Source/donor/independent consumer SHA and Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` preflight PASS, `BFSS_M4_LB1C0_SOURCE_DONORS_CONSUMER_PIN_PREFLIGHT_PASS`. Correct actual newly built LB1C0 `.olean`, cold source `Build completed successfully (8960 jobs)`.
- Exact source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1C0OriginalSource48BivectorCommutatorExpansion.lean`, immutable Git blob **`8b11930128c92bb8a499970593252de942052b1b`**.
- Independent original Fock consumer `lean/diagnostics/BFSSP3M4LB1C0OriginalSource48BivectorCommutatorExpansionIndependentConsumer.lean`, immutable blob **`4011e62c0680c27d17a3d63e41f5bac8ac7036e5`**.
- Workflow `.github/workflows/bfss-m4-lb1c0-original-source48-k-commutator-strict.yml`, tested Git blob **`3371a326bda9dd6ac35c6184842224a93ab44c93`**; no optional rerun substitutions and no overlapping workflow target.
- Source donors: accepted LB1S `P3M4LB1SOriginalSource48SkewMatrixFockBivector.lean` blob `d7d460fc8d2806234816e8bd2088f9cebb6addd4`, accepted LB0 `P3M4LB0OriginalSource48MajoranaBivectorCAR.lean` blob `d08200fae8ef6c9c9544414307ad537f1eeaa4a4`, exact original normalized Majorana `SU2BFSSSource48NormalizedFockGammaProbe.lean` blob `7abc03723b3111e4a03389b722054e50d6a9bf30` and physical Hilbert-star source `SU2BFSSSource48FockGammaSelfAdjointProbe.lean` blob `98889cb8607ccc64091165fbca585acb898b9ddc`.
- **3 source + 3 independently compiled consumer axiom reports = 6/6 standard-only** `{propext, Classical.choice, Quot.sound}`, no `sorryAx`/compiler error/unallowlisted source warnings, strict warning-as-error accepted. Final audit marker `BFSS_M4_LB1C0_ORIGINAL_FOCK_K_COMMUTATOR_EXPANSION_3_SOURCE_3_CONSUMERS_STRICT_GREEN`.
- [Immutable evidence artifact #14220157294](https://github.com/etblink/math/actions/runs/43853833739/artifacts/14220157294), 3,437 bytes, GitHub-reported archive SHA-256 **`2b25def3db7e30032c8e0fe73fda9290c314b0d48dc4fb958dab182deebd2134`** (provider-reported, not independently rehashed in local container).

## Qualified original mathematics

In genuine original `Fermion 2 →L[ℂ] Fermion 2`, `Source48Label = Fin 24 × Fin 2`, `Γ_p = sourceNormalizedGamma p` with the actual source sqrt(2) normalization, and arbitrary original REAL `A : Matrix Source48Label Source48Label ℝ`, reuse the byte-identical accepted generator
```lean
originalSource48BivectorK A =
  ∑ p : Source48Label, ∑ q : Source48Label,
    (A p q / 4 : ℝ) • (sourceNormalizedGamma p * sourceNormalizedGamma q)
```
without redefining K(A). The following source declarations are qualified:
1. `originalSource48BivectorK_commutator_doubleSum`: the exact original `[K(A),Γ_k]` distributes across both finite sums to `∑p,q(A[p,q]/4)•[Γ_pΓ_q,Γ_k]`. It does NOT require A skew (pure distributivity).
2. `originalSource48BivectorK_commutator_CAR_sum`: substitute LB0 `[Γ_pΓ_q,Γ_k]=2δ(q,k)Γ_p−2δ(p,k)Γ_q` inside the exact source real-scalar sum.
3. `originalSource48BivectorK_zero_commutator`: `[K(0),Γ_k]=0` on actual Fock operators.

The 3 source-typed independent consumers repeat each statement on the same original matrix, original source gamma labels and genuine Fock operator carrier. No substitute Clifford representation, fake commutative multiplication, new real/complex scalar action axioms, `sorry` or recDepth increase. The generic finite commutator-distribution lemmas work on an abstract pair of index types and the true original operator additive group; original real-to-complex scalar compatibility is supplied by the accepted source interface.

## Next strict LB1C1 — still OPEN

For **real skew** A, take the qualified LB1C0 source `originalSource48BivectorK_commutator_CAR_sum`. Separately collapse `δ(q,k)` to `∑p(A[p,k]/2)Γ_p` and `δ(p,k)` to `∑p(A[k,p]/2)Γ_p`, then apply original `A[k,p]=-A[p,k]` to derive
```text
[K(A),Γ_k] = ∑p A[p,k] Γ_p .
```
Prove the scalar arithmetic with source real-to-complex `smul` bridge, exactly preserving original 1/4 and original 24×2 labels; construct a distinct independent consumer and cold strict source CI, with its own exact source hash and artifacts. Do not infer the Lie bracket `[K(A),K(B)]=K([A,B])`, coherent global Spin9 Fock-vector unitary, central element lift, original gauge/full 16-charge domain invariance or any physical mass-gap/ground-state theorem.

**This receipt and associated roadmap edits are documentation-only descendants, not a new tested source commit.**
