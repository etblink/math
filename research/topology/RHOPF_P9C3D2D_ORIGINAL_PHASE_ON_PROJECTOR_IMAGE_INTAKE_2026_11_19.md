# RHOPF-P9C3D2D — source-exact phase action on relational projector image intake

**Date:** 2026-11-19.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Status:** UNQUALIFIED candidate pending native and independent strict CI.
**Accepted predecessor:** P9C3D2C R1 original-source [#44634301641](https://github.com/etblink/math/actions/runs/44634301641), tested `0f668a4f73fceb8f1ec4db67c0c91d7b345af2e9`, acceptance `54db5c9f428037890d923221c11d7ba2e9610dbc`.

## Scope and proof plan

The native original Gamma9 rank-four relational projector P and partial complex-structure phase J are unchanged. Prior strictly accepted source algebra gives `Q=I-P`, `R(a,b)=Q+aP+bJ`, and `J²=-P`. This gate certifies the one exact source-original matrix-to-vector adapter:

```lean
theorem relationalCirclePhase_mulVec_on_projector_image
    (a b : ℝ) (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v) :
    (relationalCirclePhase a b).mulVec v =
      a • v + b • relationalPhaseJ.mulVec v
```

Use only qualified `relationalCirclePhase_eq_complement_sum`, source `relationalComplement=1-P`, and Mathlib `Matrix.sub_mulVec`, `Matrix.one_mulVec`, `Matrix.add_mulVec`, `Matrix.smul_mulVec`. Since `P v=v`, prove `Q v=0`; the stated identity then follows. No original gamma matrix entry expansion, new axioms, invented source basis or tactic-resource escalation.

This is a useful narrow algebraic interface for the later fixed-point calculation: `R(a,b)v=v` becomes `(a-1)v+bJv=0`, and one can investigate separately whether any such equation with `v≠0` and `P v=v` forces `(a,b)=(1,0)`. **That conclusion is not established by the present gate.**

## Strict qualification contract

One native theorem and one separately imported exact source-typed independent example, both `#print axioms` reports allowed roots `propext`, `Classical.choice`, `Quot.sound` only, zero `sorryAx`. Pin untouched Core/Gamma9, original P/J/Q and accepted circle-action source hashes, exact new source and consumer blobs, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; run the signed-permutation original source-independent integer fixture, scope/namespace and theorem-name contract preflight, native and independent warning-as-error builds. Archive the original run ZIP, exact tested SHA, original toolchain SHA manifest and RED or GREEN diagnostics. Preserve all predecessor REDs and their original integrity.

## Scope exclusions and stop rule

No free circle action on the rank-four unit sphere, no intrinsic `S³` identification, no Hopf quotient `S³/S¹≅S²`, no globally compatible Spin(9) equivariance, no original 24-complex-mode Fock implementer, SU(2) Gauss law or Hamiltonian invariance, and no experimental Standard Model prediction is claimed. The full 16-real-spinor action has a fixed complement and cannot be globally free. If the new native proof fails, keep the exact RED and narrow the proof according to the native error; do not broaden the gate or weaken native+independent qualification.
