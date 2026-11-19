# RHOPF-P9C3D2C R1 — original Gamma9 J-kernel on projector image strict GREEN

**Date:** 2026-11-19
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Original strict run:** [#44634301641](https://github.com/etblink/math/actions/runs/44634301641), attempt 1, completed SUCCESS.
**Exact tested commit:** `0f668a4f73fceb8f1ec4db67c0c91d7b345af2e9`.
**Original CI job:** `135948737413`.
**Decision:** ACCEPT `FCP.RHOPFP9C3D2C.relationalPhaseJ_kernel_zero_on_projector_image` after source-original native/independent Lean and artifact qualification.

## Exact original evidence

- Exact-hash frozen original Core, Gamma9, rank-four source projector, accepted phase and vector-image invariance plus exact new source/consumer hash and declaration/section preflight: PASS.
- Pinned Lean `4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original signed-permutation integer fixture and accepted original-source cold build: PASS.
- Warnings-as-errors original native Lean compilation and separately imported independent type consumer: PASS.
- Native and imported consumer `#print axioms` both show ONLY `propext`, `Classical.choice`, and `Quot.sound`; zero `sorryAx` and no compilation errors.
- Independently downloaded original [artifact #14584746052](https://github.com/etblink/math/actions/runs/44634301641/artifacts/14584746052); original ZIP SHA-256 `40d2811dc760268373ee00f3db316479c45163ca6e9e869c690cc117779764f9`, verified independently and equal to GitHub original digest.
- Independently inspected ZIP entries `exact-tested-commit.txt`, `native-phase-kernel-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`. Embedded exact tested commit matches `0f668a4f73fceb8f1ec4db67c0c91d7b345af2e9`.

## Verified mathematical claim

On the original 16-real-spinor carrier and exact source-original rank-four projector `P` and partial complex-structure phase `J`:

```lean
theorem relationalPhaseJ_kernel_zero_on_projector_image
    (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v)
    (hJ : relationalPhaseJ.mulVec v = 0) :
    v = 0
```

This follows from the previously qualified original-source identity `J*J = -P` applied to `v`. It rules out any nonzero zero-mode of `J` on the `P` image. It does NOT by itself rule out all nonidentity `Circle` phases having fixed nonzero `P`-vectors.

## Preserved negatives and upcoming stop boundaries

No R1 RED for P9C3D2C. Preserve P9C3D2B R1 native rewrite RED [#44629640776](https://github.com/etblink/math/actions/runs/44629640776), P9C3D0 R1/R2/R3 preflight and consumer REDs, P9C3C R1, P9C3B1 R1/R2, and the original-coordinate gamma tactics as distinct negative knowledge.

**Next proof steps:** derive a fixed-point criterion for arbitrary `Circle` phase acting on `P`-supported nonzero real spinors; require source exactness and independent Lean consumer. A free action on the unit sphere of the four-dimensional relational subspace requires this criterion plus proof of the unit sphere's nonemptiness and proper action definition; identifying its quotient with `S²` / Hopf bundle requires further topology. Source-selected original gamma coordinates, total Spin(9) equivariance, original physical 24-mode Fock-space implementer, SU(2) gauge/Hamiltonian symmetry, vortex stability, and Standard Model observables remain unproved and must not be asserted.
