# RHOPF-P9C3D2A R1 — original Gamma9 circle action on spinor vectors strict GREEN

**Date:** 2026-11-19
**Canonical branch:** `integration/bfss-unified-research-20261108`
**Original strict run:** [#44626196617](https://github.com/etblink/math/actions/runs/44626196617), attempt 1, SUCCESS.
**Exact tested SHA:** `dc9d5ecd010b9c1e5a9246081a58a5240f5f21db`.
**Original CI job ID:** `135920564991`.
**Decision:** ACCEPT exact two native source-original real 16-spinor circle-action identities after native and independent strict qualification.

## Original/independent qualification

- Exact original source hashes, import/declaration and balanced section preflight PASS.
- Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; independently checked exact original Gamma9 signed-permutation matrix fixture; accepted cold native dependencies PASS.
- Native source warning-as-error Lean compilation PASS.
- Separately imported independent typed consumer Lean compilation PASS.
- Two source and two consumer root `#print axioms` for `relationalCircleVector_one`, `relationalCircleVector_mul`: only `propext`, `Classical.choice`, `Quot.sound`; zero `sorryAx` and compiler errors.
- Original archive [#14580821702](https://github.com/etblink/math/actions/runs/44626196617/artifacts/14580821702), downloaded independently, ZIP SHA-256 `1437835194ab56ffb8495c931422081a041fad416396e06a28499323f856251a` matching GitHub original digest. Independently inspected `exact-tested-commit.txt` matches exact SHA; source and independent axiom logs, original integer fixture, accepted dependency build and toolchain manifest preserved in ZIP.

## Qualified source mathematics

Using original `SpinIndex=Fin 16` and `GammaMatrix = Matrix SpinIndex SpinIndex ℝ`, define `relationalCircleVector z v := (relationalCircleMatrix z).mulVec v`. Two native original-source theorems qualified:

1. `FCP.RHOPFP9C3D2A.relationalCircleVector_one (v)`: `relationalCircleVector 1 v = v`.
2. `FCP.RHOPFP9C3D2A.relationalCircleVector_mul (z w v)`: `relationalCircleVector (z*w) v = relationalCircleVector z (relationalCircleVector w v)`.

The source-exact circle group action equations now hold on the original 16-real-spinor vector carrier and leverage the separately qualified continuity and orthogonality of the matrix family. A native packaged topological `MulAction` and proof of *joint continuity of vector action* are not included in this gate.

## Precise next obligations and limitations

The full 16-real-spinor vector action is not free: it fixes the 12-dimensional complement of the rank-four relational image. Next restrict to `P`-supported spinor vectors and prove projector-image invariance using the exact existing `P²=P, PJ=JP=J, QP=PQ=0` laws, then investigate continuous action and freeness on the **unit sphere of that four-real-dimensional subspace**. The topological Hopf (S^3/S^1cong S^2) construction, its identification with selected original Gamma9 coordinates, its Spin(9) compatibility, Fock/Clifford implementation and original physical gauge/Hamiltonian invariance remain unproved separate tasks. There is no claim of a stable physical Hopfion or new Standard Model particle.

The P9C3D2A run was first-try GREEN. All predecessors' exact original diagnostic REDs and resolved independent consumer failures remain preserved and must not be reclassified as native mathematical counterexamples.
