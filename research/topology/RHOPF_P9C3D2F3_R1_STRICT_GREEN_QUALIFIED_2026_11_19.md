# RHOPF-P9C3D2F3 R1 — source-original circle vector joint continuity strict GREEN

**Date:** 2026-11-19 (America/Los_Angeles).
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Original strict run:** [#44659929627](https://github.com/etblink/math/actions/runs/44659929627), attempt 1, completed SUCCESS.
**Exact tested commit:** `8d8d1644e9b59487325255105458e86dbf1d57fe`.
**Original CI job:** `136035376552`.
**Disposition:** ACCEPT `FCP.RHOPFP9C3D2F3.relationalCircleVector_joint_continuous` as exact original source and imported independent strict GREEN.

## Exact original CI qualification

- Frozen accepted original BFSS Core/Gamma9, rank-four P-image/phase/Circle source interface hashes, exact import/declaration/noncomputable scope and no-new-axioms proof contract preflight: PASS.
- Pinned Lean `4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, accepted source Gamma9 cold dependency build and original independently generated signed-permutation integer fixture: PASS.
- Original native Lean warnings-as-errors compilation: PASS.
- Separately imported source exact independent consumer warnings-as-errors Lean compilation: PASS.
- One native and one independent `#print axioms` for `relationalCircleVector_joint_continuous`: each reports exactly `[propext, Classical.choice, Quot.sound]`, no `sorryAx` or error.
- Independently downloaded original [artifact #14596021633](https://github.com/etblink/math/actions/runs/44659929627/artifacts/14596021633) ZIP SHA-256 `737d2caf3d71b5d684e567d98c8285350c51d3c26b3baaad31f132240f74f695`, exact match to original GitHub digest. Extracted `exact-tested-commit.txt`: `8d8d1644e9b59487325255105458e86dbf1d57fe`, matching the tested SHA.
- Archive entries: `exact-tested-commit.txt`, `native-circle-vector-continuity-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.

## Qualified mathematical statement

For the original finite BFSS real-16-spinor Gamma9 vector carrier with exact accepted source Circle phase matrix `relationalCircleMatrix` and vector action `relationalCircleVector`, the new theorem proves:

```lean
theorem relationalCircleVector_joint_continuous :
    Continuous (fun p : Circle × (SpinIndex → ℝ) =>
      relationalCircleVector p.1 p.2)
```

The native proof uses the previously strictly qualified `FCP.RHOPFP9C3D1.relationalCircleMatrix_continuous`, continuous projections from the product phase/vector input, and Mathlib's source exact `Continuous.matrix_mulVec`. It does not use private Gamma9 coordinates or alternate physical definitions. This establishes joint continuity of the full real-spinor vector action, and supplies a reusable adapter for proving joint continuity of the action restricted to the previously accepted relational **unit sphere subtype**.

## Remaining independent obligations and negative knowledge

Next prove that `relationalUnitCircleAction : Circle → RelationalUnitSpinor → RelationalUnitSpinor` is jointly continuous in `Circle × RelationalUnitSpinor` using this theorem and subtype topology. Although P9C3D2F1/F2 already certified algebraic identity/composition and trivial stabilizers on the norm-one P-image, continuity of the subtype-valued action has not yet been accepted.

Separate hard obligations remain: prove original P-image unit sphere is nonempty and derive an exact four-real-dimensional geometric identification with `S³`, then construct the quotient and prove `S³/S¹ ≅ S²` with topological source compatibility. No source-original physical BFSS 48-Majorana/24-complex-mode Fock implementation, full Spin(9) covariance, Gauss/Hamiltonian invariance, stable hopfion/vortex, or Standard Model observation is established. Full 16-real-spinor action has a fixed 12-d complement and is not free.

Keep P9C3D2F0 R1 (broken vecMul notation), P9C3D2E1 R1 (missing namespace) and historical REDs preserved. Do not modify frozen accepted source, `main`, original physical implementations, or proof resource/axiom controls.
