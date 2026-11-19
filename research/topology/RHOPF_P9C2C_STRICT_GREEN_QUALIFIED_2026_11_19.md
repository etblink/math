# RHOPF-P9C2C — strict GREEN original relational phase partial-isometry

**Date:** 2026-11-19.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Original strict run:** [#44585835008](https://github.com/etblink/math/actions/runs/44585835008), attempt 1, conclusion SUCCESS.
**Exact tested SHA:** `6f62ed77f2afed6c0ed5b3d9e4a97d5363785dbc`.
**Decision:** **ACCEPT P9C2C**, exactly four original source declarations.

## Provenance and independently verified evidence

- Frozen original Gamma9/Core/projector/phase source hash and declaration contract passed, original source-exact signed-permutation integer fixture passed.
- Toolchain pinned to Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored; accepted original dependencies built.
- Original native Lean warning-as-error compilation and separately imported independent type consumer warning-as-error compilation passed.
- All four native plus four independently imported `#print axioms` reports list only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx` or compiler `error:`.
- Independently downloaded [artifact #14562205700](https://github.com/etblink/math/actions/runs/44585835008/artifacts/14562205700); original ZIP SHA-256 `f244fd678bde1eb28a0180877d8abaf0e06fe6156e72d575b428174e37cfd207`, identical to GitHub digest, ZIP `exact-tested-commit.txt` equals exact tested SHA. Original dependency, native proof, independent consumer and original fixture evidence retained.

## Native statements qualified

- `FCP.RHOPFP9C2C.relationalPhaseJ_transpose_mul_self`: `relationalPhaseJ.transpose * relationalPhaseJ = relationalProjector`.
- `FCP.RHOPFP9C2C.relationalPhaseJ_mul_transpose_self`: `relationalPhaseJ * relationalPhaseJ.transpose = relationalProjector`.
- `FCP.RHOPFP9C2C.relationalPhaseJ_mul_projector`: `relationalPhaseJ * relationalProjector = relationalPhaseJ`.
- `FCP.RHOPFP9C2C.relationalProjector_mul_phaseJ`: `relationalProjector * relationalPhaseJ = relationalPhaseJ`.

Together with accepted P9C1A idempotence, P9C1B1 rank4, P9C1C1A common-action range, P9C2A J²=-P and P9C2B transpose skew/symmetric properties, these provide original-Gamma9 representation-space partial-isometry/orthogonal-complex-structure algebra: initial and final projection are P, so J is an orthogonal transformation of im(P), zero outside im(P).

## Scientific and source-binding boundary

This does NOT prove an exact source-selected coordinate identification `im(P)=span_R(e0,e1,e8,e9)`; the source original column proof attempts P9C1C1B-D0 R1 [#44574592530](https://github.com/etblink/math/actions/runs/44574592530) and R2 [#44577006982](https://github.com/etblink/math/actions/runs/44577006982) remain RED/stopped. Neither an explicitly defined Hopf bundle/quotient, source-original 2^24-dimensional Fock implementer, gauge-fixed physical action, Hamiltonian conservation, topologically stable vortex nor particle/Standard Model prediction is established. Original Gamma9/Core/Hamiltonian/Fock implementations remain unchanged.

Next justified research: a tightly scoped intrinsic `ℂ`-structure/S¹ action or original real inner product equality on im(P) with independent types and axiom gates. Check relevant Mathlib interfaces before attempting a full Hopf-fibration theorem.
