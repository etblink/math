# RHOPF-P9C3D2E2 R1 — original Gamma9 circle nonzero projector-image invariance strict GREEN

**Date:** 2026-11-19.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Original strict run:** [#44646838489](https://github.com/etblink/math/actions/runs/44646838489), attempt 1, completed SUCCESS.
**Exact tested commit:** `b77f446400ffddf03fedc5072150424b331d6a33`.
**Original CI job:** `135991467636`.
**Qualification:** ACCEPT original native and independently imported Lean theorems `FCP.RHOPFP9C3D2E2.relationalCircleVector_ne_zero` and `FCP.RHOPFP9C3D2E2.relationalCircleVector_preserves_nonzero_projector_image`.

## Strict original artifact and source evidence

- Frozen original BFSS Core/Gamma9 original source hash/declaration/import, exact section-scope preflight, independently checked source-original integer signed permutation fixture: PASS.
- Lean toolchain `4.34.1` and pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, accepted native source dependency build: PASS.
- Native warning-as-error Lean compilation: PASS.
- Separately imported independent exact source-typed Lean consumer: PASS.
- Two source and two independent `#print axioms` root reports: each `[propext, Classical.choice, Quot.sound]`; no `sorryAx`, no original or independent compiler errors.
- Independently downloaded original [artifact #14589014277](https://github.com/etblink/math/actions/runs/44646838489/artifacts/14589014277), ZIP SHA-256 `c51d09a492f02be5683cffefd4e94762d9a818589b4dbc48ec80c07688fc0c06`, matches exact original GitHub digest. Embedded `exact-tested-commit.txt` is exact tested SHA.
- Original artifact six files: `exact-tested-commit.txt`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `native-circle-nonzero-invariance-and-axioms.log`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.

## Qualified source-exact mathematics

The original Gamma9 real 16-spinor carrier uses `SpinIndex=Fin 16`, the original rank-four projector `P`, and accepted continuous orthogonal `Circle` matrix map `rho`. Define source-original vector action `relationalCircleVector z v = rho(z).mulVec v`.

Strict native and independent Lean prove:
1. `relationalCircleVector_ne_zero (z) (v) (hne : v ≠ 0) : relationalCircleVector z v ≠ 0`. Proof invokes inverse Mathlib Circle element and qualified vector-action composition law.
2. `relationalCircleVector_preserves_nonzero_projector_image (z) (v) (hv : P.mulVec v=v) (hne : v≠0)` gives both `P.mulVec (rho(z).mulVec v)=rho(z).mulVec v` and `rho(z).mulVec v≠0`. Proof reuses separately accepted P9C3D2B invariant-sector theorem.

Combined with strict qualified P9C3D2E1 R2 `Pv=v ∧ v≠0 ∧ rho(z)v=v → z=1`, these supply the algebraic prerequisites for a free Circle action on the intrinsic nonzero projector image. A packaged intrinsic `MulAction` is NOT yet verified; neither is joint continuity nor unit-sphere topology.

## Next bounded gate and scientific boundary

Package only the original `P`-supported nonzero real-spinor *subtype*, a source-original `Circle` vector action on it, and independently verify identity/composition plus trivial stabilizers, using the accepted native source theorems. To avoid global typeclass collisions, consider explicit action function and isolated laws before introducing a global `MulAction` instance. Preserve strict original frozen source bytes and independently imported consumer. Later investigate the rank-four norm-one sphere's topology, continuity, true quotient and identification with `S³/S¹ ≅ S²`.

The 12-dimensional complement of the original P image stays pointwise fixed, so no free action on the full 16-real-spinor carrier is claimed. Physical BFSS 48-Majorana/24-complex-mode Fock implementation, exact Spin(9) compatibility, SU(2) Gauss/Hamiltonian invariance, solitonic vortex stability, Standard Model observables and SCC empirical discrimination remain independent unproved duties. Preserve all earlier native and consumer RED artifacts and mathematical dead ends in their original source/provenance context.
