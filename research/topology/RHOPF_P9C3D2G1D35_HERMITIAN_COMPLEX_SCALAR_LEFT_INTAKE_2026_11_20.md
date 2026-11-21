# RHOPF-P9C3D2G1D35 — exact original Gamma9 Hermitian arbitrary complex-scalar left linearity intake

**Date:** 2026-11-20 Pacific. **Canonical branch:** `integration/bfss-unified-research-20261108`. **UNQUALIFIED** until native/independent strict GREEN and original ZIP integrity verified.

D34 [run #44862052129](https://github.com/etblink/math/actions/runs/44862052129) GREEN at exact tested commit `44b2c10ebffe04b80b54549d1eb3bcd1f26d62d3`, original ZIP SHA256 independently recalculated `0cc0faa1ea392c90ca29ada563357ab1f42965a628d7325ca570b74fb8c6dab6`, accepted in `eb2bbdb9b7fadb40b5ef0bc082ac1b7058247223`. D33 R2 left real laws and D34 R1 right real laws now qualify.

## Bounded D35 theorem target

The complex scalar action `relationalSourceComplexScalarAction z x = z.re•x + z.im•J₄(x)` was qualified D29; D28 qualified source-original `H(J₄x,y)=I*H(x,y)`; D33 qualified left real homogeneity/additivity. Combine those pre-verified interfaces and pin-exact Mathlib `Complex.re_add_im`, algebra `ring`:

```lean
relationalSourceHermitianCandidate_complex_smul_left
    (z : ℂ) (x y : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate
      (relationalSourceComplexScalarAction z x) y =
    z * relationalSourceHermitianCandidate x y

relationalSourceComplexFourHermitian_smul_left
    (z : ℂ) (x y : RelationalSourceComplexFour) :
    relationalSourceComplexFourHermitian (z • x) y =
    z * relationalSourceComplexFourHermitian x y
```

**No full sesquilinearity claim yet**: right-variable arbitrary complex-scalar conjugate-linearity requires separate theorem (proposed D36). Neither an `InnerProductSpace ℂ` instance nor complex norm, `ℂ²` Q-orthonormal frame, classical Hopf quotient/Chern charge, original BFSS Fock/Gauss/Hamiltonian nor stable hopfion is qualified.

Native and independent imported consumer warning-as-error, 2+2 `#print axioms` reports limited to `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`, no proof budget changes. Exact Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Original Gamma9/P/J/Circle and accepted D34 source pins frozen; signed-permutation independent integer fixture and tested-commit-signed evidence ZIP retained and independently hashed before acceptance. Preserve RED diagnoses.
