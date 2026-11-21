# RHOPF-P9C3D2G1D31 R1 — isolated original Gamma9 complex Module strict GREEN

**Date:** 2026-11-20 Pacific. **Disposition:** ACCEPTED_STRICT_GREEN.  
**Canonical branch:** `integration/bfss-unified-research-20261108`, original Gamma9 and `main` unchanged.  
**Original strict run:** [#44854814114](https://github.com/etblink/math/actions/runs/44854814114), attempt 1 SUCCESS, **exact tested** `834a8c12fedc00e90989b52ffa7ff721276a2b17`, job `136694420840`.  
**Original artifact:** [#14687427421](https://github.com/etblink/math/actions/runs/44854814114/artifacts/14687427421).  
**Independently calculated original ZIP SHA-256:** `154c263ed26c9f93e66727402a9fa2ded1e873061a100968adc9f48a3e7136d1`, identical to CI original uploader and GitHub artifact digest. Embedded tested-commit file matches exact SHA.

## Strict qualification evidence

- Frozen exact original Gamma9/P/J/Circle and qualified D30 dependency hashes PASS, independently executed source signed-permutation integer fixture PASS.
- Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` PASS.
- Original accepted dependency build **9,078 jobs** PASS.
- Native source and independently imported consumer warnings-as-errors PASS.
- Twelve `#print axioms` reports, six native and six imported consumer, contain only `[propext, Classical.choice, Quot.sound]` and no `sorryAx` or compiler errors.
- Original ZIP independently downloaded and hashed; six files inspected: `exact-tested-commit.txt`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `native-original-isolated-complex-module-and-axioms.log`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.

## Qualified mathematics

```lean
@[ext]
structure RelationalSourceComplexFour where
  coordinates : Fin 4 → ℝ

def relationalSourceComplexFourEquiv :
    RelationalSourceComplexFour ≃ (Fin 4 → ℝ)

noncomputable instance relationalSourceComplexFourAddCommGroup :
    AddCommGroup RelationalSourceComplexFour

noncomputable instance relationalSourceComplexFourSMul :
    SMul ℂ RelationalSourceComplexFour

noncomputable instance relationalSourceComplexFourModule :
    Module ℂ RelationalSourceComplexFour

theorem relationalSourceComplexFour_smul_coordinates
    (z : ℂ) (x : RelationalSourceComplexFour) :
    (z • x).coordinates =
      relationalSourceComplexScalarAction z x.coordinates

theorem relationalSourceComplexFour_I_coordinates
    (x : RelationalSourceComplexFour) :
    (Complex.I • x).coordinates =
      relationalPhaseJFourLinear x.coordinates
```

Module ℂ on the **isolated wrapper** is source exact, constructed from the accepted Gamma9 `J₄` and accepted D29/D30 scalar-action laws. This does not install competing norm/complex instances on the original `Fin 4 → ℝ`; Q remains the source-E-inverse transported original 16-spinor dot, distinct from the ordinary coordinate Euclidean metric.

## Next bounded D32 gate

Bind the previously qualified D26 source Hermitian candidate `H(x,y)` to `RelationalSourceComplexFour` via `x.coordinates,y.coordinates`, then prove exact wrapper-level conjugate symmetry, Q-positive diagonal, and `H(i•x,y)=i H(x,y)`, `H(x,i•y)=-i H(x,y)` by the accepted D28/D31 interfaces. Full complex sesquilinearity and normed inner-product-space construction are later separately qualified gates, not claimed here. Follow independent native/consumer warnings-as-error, hash pins, and original ZIP integrity in all stages.

No classical scalar Hopf quotient/Chern charge, original physical BFSS Fock/Gauss/Hamiltonian or stable hopfion claim. Do not touch `main`, original Gamma9 or history.
