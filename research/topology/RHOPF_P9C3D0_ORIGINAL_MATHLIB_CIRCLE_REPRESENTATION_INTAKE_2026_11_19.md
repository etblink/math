# RHOPF-P9C3D0 — original Gamma9 / Mathlib Circle group representation intake

**Date:** 2026-11-19.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Status:** STRICT ORIGINAL-SOURCE CANDIDATE, unqualified until native and independent CI.
**Accepted prerequisite:** P9C3C R2 [run #44611540328](https://github.com/etblink/math/actions/runs/44611540328), exact tested source `d0763f39470cb12b281700bcd80a140b11ccd4bb`; qualification acceptance commit `15faacdafa6c1a10e78755c1c8b4a79b2ff8513c`.

## Why this is the next bounded step

P9C3B1 R3 established the exact original-source phase multiplication `R(a,b)R(c,d)=R(ac-bd,ad+bc)`. P9C3C R2 established `R(a,b)ᵀR(a,b)=I` on the unit real circle `a²+b²=1`. The source Gamma9 real 16-spinor projector/phase from the original Gamma9 source remains byte-frozen.

The pinned Mathlib module `Mathlib.Analysis.Complex.Circle` supplies a compact topological commutative group `Circle` as the unit complex numbers. In this gate define
[
\rho(z) := R(\operatorname{re}(z),\operatorname{im}(z)) \in \operatorname{Mat}_{16}(\mathbb R)
\quad (z\in \mathrm{Circle}).
]

The gate tests source-exact native equations:
1. `relationalCircleMatrix_one`: `rho(1)=I`.
2. `relationalCircleMatrix_mul (z w)`: `rho(z*w)=rho(z)*rho(w)`.
3. `relationalCircleMatrix_orthogonal (z)`: `rho(z)ᵀrho(z)=I`.
4. The bundled `relationalCircleRepresentation : Circle →* GammaMatrix` monoid homomorphism type, with independent source exact consumer.

Proof adapters use only accepted original source phase identities and pinned Mathlib `Circle.coe_one`, `Circle.coe_mul`, `Circle.normSq_coe`, `Complex.normSq_apply`, `Complex.mul_re` and `Complex.mul_im`. No original gamma-entry calculations, private signed permutation copies, resource overrides or modifications to original Gamma9/Core/Fock/Hamiltonian. Three public source theorems and bundled hom receive source and independently imported axiom reports. The strict workflow separately pins the new source and consumer bytes, includes exact source independence fixture and publishes original diagnostic artifacts.

## Qualification boundary

A bundled *algebraic* hom `Circle →* GammaMatrix` is **not** itself a bundled continuous hom to a topology on the target real matrices; nor does it by itself define a group action on the original real-spinor vectors. Both continuity and explicit on-vector circle action remain separate proof gates. A free action on the unit 3-sphere, an actual Hopf quotient, source-selected coordinates, a physical SU(2)-gauge invariant Fock implementer, dynamical vortex protection and Standard Model observable predictions remain open.

The native P9C3C R1 preflight RED and P9C3B1 R1/R2 proof diagnostics remain permanently preserved, as do the stopped direct original single-column source gamma-coordinate attempts.
