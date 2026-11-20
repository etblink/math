# RHOPF-P9C3D2G1D24 R2 — original Gamma9 source real inner-product core strict GREEN

**Date:** 2026-11-20 Pacific. **Disposition:** ACCEPTED_STRICT_GREEN.  
**Canonical branch:** `integration/bfss-unified-research-20261108`, original Gamma9 and `main` unchanged.  
**Original strict run:** [#44836782767](https://github.com/etblink/math/actions/runs/44836782767), attempt 1 success, exact tested SHA `1b94c378c66a782668420929285c23b91e027b25`, original job `136635063027`.  
**Original artifact:** [#14679462679](https://github.com/etblink/math/actions/runs/44836782767/artifacts/14679462679).  
**Independently recalculated original ZIP SHA-256:** `64aafe028b66b22d82d821b7ce674c0bd7a3dc73ed9c26469b04deec8ba040d2`, identical to CI upload and GitHub artifact digest. Embedded `exact-tested-commit.txt` matches tested SHA.

## Strict evidence
- Original frozen source Gamma9/P/J/Circle and accepted source hashes preflight: PASS. Independent original Gamma9 source permutation integer fixture: PASS.
- Pinned Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original source dependency build **9,071 jobs** PASS.
- Native source and separately imported independent consumer `-DwarningAsError=true`: PASS.
- Six `#print axioms` reports (3 native, 3 consumer) only `[propext, Classical.choice, Quot.sound]`, without `sorryAx` or compiler errors.
- Independently downloaded ZIP SHA-256 and all six members inspected: `exact-tested-commit.txt`, `native-original-source-inner-core-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`. Toolchain checksums included.

## Accepted theorem scope

```lean
@[instance_reducible]
noncomputable def relationalSourceInnerCore :
    InnerProductSpace.Core ℝ (Fin 4 → ℝ)

theorem relationalSourceInnerCore_inner_apply (x y : Fin 4 → ℝ) :
    relationalSourceInnerCore.inner x y = relationalSourceBilinForm x y

theorem relationalSourceInnerCore_self_eq_quadratic (x : Fin 4 → ℝ) :
    relationalSourceInnerCore.inner x x = relationalRangeCoordinateDotSelf x
```

The core's `inner` is explicitly the already qualified original 16-spinor dot pulled back by noncanonical `E.symm`. It carries accepted source symmetry, positive definiteness and real bilinearity, and Q is its original quadratic diagonal. It is **standalone class-valued data**, not a global instance or duplicate norm on existing `Fin 4 → ℝ`.

**R1 rejected and preserved:** [run #44834708777](https://github.com/etblink/math/actions/runs/44834708777), exact tested `343ce04fe75cfc9fd364632c61d3cf485e7d5d25`, original RED archive checksum `618262c31cf5e378ac53fba5808652b1cb935cce506244446185f34d352f3b01`, diagnosed in [`57ff9ef1`](https://github.com/etblink/math/commit/57ff9ef1357ba9e2fc360f0ec4bf50f2ead03d5a). Correction supplied raw binary `inner` function and annotation `@[instance_reducible]`, without theorem/other source changes.

## Next mathematical boundary

Prove source-compatible `J₄` invariance of the now-bundled inner product using accepted D19 polarization invariance and D20 equality, then its skew property from `J₄²=-I`. Keep no global norm instance on canonical coordinates. A norm-compatible newtype or explicit complex module can follow with pin-exact Mathlib API and independent strict gate, then an explicit isometric complex coordinate equivalence with `ℂ²` and standard scalar S¹ action. The classical Hopf quotient/Chern charge, and original physical BFSS 48-Majorana Fock/Gauss/Hamiltonian and stable hopfion remain OPEN.
