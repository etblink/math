# RHOPF-P9C3D2G1D9 R2 — original Gamma9 phase J linear on projector image: strict GREEN

**Date:** 2026-11-20 (Pacific). **Disposition:** ACCEPTED_STRICT_GREEN.  
**Canonical branch:** `integration/bfss-unified-research-20261108`; `main` untouched.  
**Original strict workflow:** [#44783238192](https://github.com/etblink/math/actions/runs/44783238192), completed 2026-11-20T17:38:39Z.  
**Exact tested commit:** `478e1acee1b190e9911420dde4e21721db5a54e4`, job `136451174017`.  
**Original archive:** [#14653477162](https://github.com/etblink/math/actions/runs/44783238192/artifacts/14653477162).  
**Independently recomputed ZIP SHA256:** `140cf69c60198c8a9fcd24dd94f554f8979184fd4d7e3a05f06fb2f945a68ca6`, identical to CI upload digest. Original `exact-tested-commit.txt` matches tested commit.

## Strict qualification evidence

- Frozen original Gamma9/projection/phase/Circle Git blobs and accepted G1D8 dependency preflight: PASS.
- Source-independent signed-permutation integer fixture: PASS.
- Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Dependency build: 9,056 jobs completed successfully.
- Native Lean compilation with warning-as-error: PASS.
- Independently imported consumer of typed real-linear operator and its square law: PASS.
- Two native and two independent `#print axioms`: each exactly `[propext, Classical.choice, Quot.sound]`; no `sorryAx`, no Lean errors.
- Original archive contains six files: `exact-tested-commit.txt`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `native-projector-range-phase-linear-and-axioms.log`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`. SHA and embedded commit independently checked.

## Accepted original-source mathematical result

```lean
noncomputable def relationalPhaseJRangeLinear :
    (LinearMap.range (Matrix.toLin' relationalProjector)) →ₗ[ℝ]
      (LinearMap.range (Matrix.toLin' relationalProjector))

theorem relationalPhaseJRangeLinear_square
    (v : LinearMap.range (Matrix.toLin' relationalProjector)) :
    relationalPhaseJRangeLinear (relationalPhaseJRangeLinear v) = -v
```

The new operator uses only the exact original Gamma9 `relationalPhaseJ` and projector range, and the qualified D8 vector-image identities. It proves the pointwise real-linear complex-structure square `J_range² = -id` on the original four-real-dimensional projector image, with no noncanonical coordinate assumptions.

### Preserved failure

R1 [#44780087045](https://github.com/etblink/math/actions/runs/44780087045) was native RED (two unresolved occurrences of accepted `relationalProjector_toLin_idempotent`, contaminated `sorryAx`). It is rejected and preserved in [`c0c7c5e3`](https://github.com/etblink/math/commit/c0c7c5e35d6f3a232d1e2463ba1b7d950847c081). R2 repaired only the imported accepted namespace and Git source pin, without changing proof objectives.

## Next microgate

Compose this exact original range endomorphism with the accepted, **noncanonical** G1C0 real-linear coordinate equivalence `E : im(P) ≃L[ℝ] (Fin 4 → ℝ)`. Establish the induced `J₄ = E ∘ J_range ∘ E⁻¹` and `J₄²=-id` as a source-exact real-linear operator. This alone is *not* standard complex scalar multiplication: G1C0 is not known orthonormal. Later independently verify skewness/orthogonality against the transported quadratic form, a compatible orthonormal complex basis and explicit circle intertwining before identifying the classical Hopf fibration. Hopf quotient/Chern class and physical 48-Majorana Fock, Hamiltonian/gauge covariance or stable soliton remain OPEN.
