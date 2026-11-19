# RHOPF-P9C3D0 R4 — original Gamma9 Mathlib Circle group representation strict GREEN

**Date:** November 19, 2026.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Strict run:** [#44620961318](https://github.com/etblink/math/actions/runs/44620961318), attempt 1, SUCCESS.
**Exact tested commit:** `493283ce5e94d5da162d8ae18915d8fa191cc8a5`.
**Decision:** ACCEPT four native source declarations and their independently imported type consumer.

## Exact original-source and independent evidence

- Frozen exact source-hash, declaration-kind and import preflight: PASS.
- Original source-independent signed-permutation integer fixture and pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Accepted original Gamma9 phase/circle dependency cold build: PASS.
- Original native warning-as-error source compilation and separately imported independent type consumer compilation: PASS.
- Four native and four imported consumer `#print axioms` reports contain only `propext`, `Classical.choice`, and `Quot.sound`; zero `sorryAx`, zero native or imported `error:`.
- Original independently downloaded artifact [#14577192541](https://github.com/etblink/math/actions/runs/44620961318/artifacts/14577192541); independently computed ZIP SHA-256 `0e57d51ddb2ede31aa13ace28be4d16603de99a50ae7b7b8abee4cfaed1d171f`, identical to original GitHub digest; ZIP's embedded `exact-tested-commit.txt` matches the tested SHA. Archive retains native and independent reports, original integer fixture, original dependency-build transcript, and toolchain checksum manifest.

## Qualified original-source mathematics

Let `relationalCircleMatrix z := relationalCirclePhase (z:ℂ).re (z:ℂ).im` for `z:Circle`, where `Circle` is Mathlib's unit-complex-number topological group and `relationalCirclePhase` is constructed from the frozen real 16-dimensional original Gamma9 source.

- `FCP.RHOPFP9C3D0.relationalCircleMatrix_one`: `rho(1)=I`.
- `FCP.RHOPFP9C3D0.relationalCircleMatrix_mul`: `rho(z*w)=rho(z)*rho(w)`.
- `FCP.RHOPFP9C3D0.relationalCircleMatrix_orthogonal`: `rho(z)ᵀ rho(z)=I`.
- `FCP.RHOPFP9C3D0.relationalCircleRepresentation : Circle →* GammaMatrix`, a source-exact algebraic circle monoid homomorphism.

This establishes a native algebraic unit-circle orthogonal **matrix representation** of the original Gamma9 carrier. It does not by itself prove continuity or an action on vectors, a free action on the selected rank-four unit sphere, an actual Hopf quotient, a global Spin(9) intertwinement, or a physical BFSS Fock/gauge/Hamiltonian symmetry.

## Distinct REDs retained

- R1 [#44614805120](https://github.com/etblink/math/actions/runs/44614805120): source-contract preflight misclassified bundled `noncomputable def` as theorem; Lean not run.
- R2 [#44615621684](https://github.com/etblink/math/actions/runs/44615621684): native source passed; independent consumer did not enter a `noncomputable` scope when constructing noncomputable representation.
- R3 [#44618214974](https://github.com/etblink/math/actions/runs/44618214974): native source and independent examples passed, but new unnamed `noncomputable section` lacked a closing `end`.
- R4 added only the missing section terminator, updated frozen consumer hash, and passed all original/independent strict checks.

These failures identify a concrete guardrail for future strict workflows: distinguish theorem versus def kinds, enforce correct noncomputable mode, and close nested scopes. Preserve all earlier P9C3C P9C3B1 original REDs, their artifact evidence, and STOPPED direct selected-column gamma tactics.

## Next bounded work

Prove continuity of `relationalCircleMatrix : Circle → GammaMatrix` using the source-defined finite real matrix carrier, continuity of `Complex.re`, `Complex.im`, real scalar actions and matrix addition. Qualify a source-native theorem and independent imported source-typed consumer before naming it a continuous orthogonal representation. A vector action, free Hopf quotient and physical binding remain separate proof gates.
