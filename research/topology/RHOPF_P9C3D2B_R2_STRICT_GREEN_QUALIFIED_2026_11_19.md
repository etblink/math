# RHOPF-P9C3D2B R2 — source-original Gamma9 relational-sector invariance strict GREEN

**Date:** 2026-11-19
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Run:** [#44631824647](https://github.com/etblink/math/actions/runs/44631824647), attempt 1, SUCCESS.
**Exact tested commit:** `21f0aba2b117352006bb171f312f0557ce43a985`.
**Original CI job:** `135940160538`.
**Decision:** ACCEPT original-source relational projector commutation and vector-image invariance after independent source-exact Lean checks.

## Exact provenance and qualification

- Frozen exact source hashes, import/declaration scope contract and source-original independent integer signed-permutation fixture: PASS.
- Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, accepted original Gamma9 dependency cold build: PASS.
- Native original-source warning-as-error Lean compilation: PASS.
- Independently imported type consumer warning-as-error Lean compilation: PASS.
- Native and independent reports for each of the two theorems: only `propext`, `Classical.choice`, `Quot.sound`; zero `sorryAx` or compiler `error:`.
- Original independently downloaded GitHub [artifact #14580864779](https://github.com/etblink/math/actions/runs/44631824647/artifacts/14580864779), ZIP SHA-256 `ea2a9993381113b5d36b6766bb59f28902e0a690559f9a8bba39d27c11b72eeb`, matches original GitHub digest. Verified embedded `exact-tested-commit.txt` matches tested SHA; native and independent axiom logs, accepted dependency build, original signed-permutation integer check, and toolchain checksum manifests preserved.

## Strict-qualified source-original mathematics

Using frozen P9C1A original rank-four projector `relationalProjector` and accepted P9C3D0 original source `relationalCircleMatrix z`:
1. `FCP.RHOPFP9C3D2B.relationalProjector_commutes_circleMatrix (z)`:
   `P*rho(z)=rho(z)*P`.
2. `FCP.RHOPFP9C3D2B.relationalCircleVector_preserves_projector_image (z v) (hv : P.mulVec v=v)`:
   `P.mulVec (rho(z).mulVec v)=rho(z).mulVec v`.

These establish that the **original Gamma9 real four-dimensional relational projector image is invariant under the accepted continuous circle matrix representation and algebraic vector action**. No new gamma data, original physical source changes, alternative representation or new axiom are involved. We have not yet bundled a continuous `MulAction` instance.

## Original RED preserved

P9C3D2B R1 [#44629640776](https://github.com/etblink/math/actions/runs/44629640776), exact SHA `8fd45a352d9fc8ee023c8642ba6e23307449be07`, failed native `rw` after its first rewrite removed both occurrences of `relationalCirclePhase`. Original axiom reports included `sorryAx`; independent consumer was skipped. The R2 minimal repair deleted only the redundant second rewrite and updated the exact source hash pin, preserving theorem types, signed-permutation original fixture and strict audit. Retain R1 artifact [#14582610477](https://github.com/etblink/math/actions/runs/44629640776/artifacts/14582610477), SHA-256 `b80799ec7c1cfa1c2a88746f173df7b664933ab555e1a06584630c01e15f6df9`. Do not retroactively classify that R1 run as qualified.

## Next bounded mathematical test

Before claiming a free circle action on the selected rank-four unit sphere, prove from the accepted original source laws `J²=-P`, `P²=P`, `PJ=JP=J` that `J` has trivial kernel on the `P`-image: if `Pv=v` and `Jv=0` then `v=0`. Use only exact original `GammaMatrix.mulVec` and source original theorems, with independently imported native Lean consumer. Then the harder fixed-point freeness criterion can be separated into its own theorem. This avoids importing unsupported topological identifications into a small algebraic proof.

## Scientific boundary

The full 16-dimensional circle action fixes the 12-dimensional complement of P and is **not** free there. Invariance is necessary but not sufficient for freeness on the source-derived unit 3-sphere, or for a Hopf quotient; coordinate-selected original source gamma-vector embeddings and topological bundle identification remain unproved. No original physical Fock/Spin(9)/gauge/Hamiltonian binding, vortex stability or Standard Model observable is inferred.
