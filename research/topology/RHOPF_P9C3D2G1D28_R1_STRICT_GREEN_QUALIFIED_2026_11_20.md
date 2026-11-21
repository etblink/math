# RHOPF-P9C3D2G1D28 R1 — original Gamma9 full complex Hermitian J4 identities strict GREEN

**Date:** 2026-11-20 Pacific. **Disposition:** ACCEPTED_STRICT_GREEN.  
**Canonical branch:** `integration/bfss-unified-research-20261108`, original Gamma9 and `main` unchanged.  
**Original strict run:** [#44849029523](https://github.com/etblink/math/actions/runs/44849029523), attempt 1 SUCCESS, exact tested SHA `c3427a7707d763b721b0ccb608a0b353c24b246b`, original job `136675715535`.  
**Original artifact:** [#14685102101](https://github.com/etblink/math/actions/runs/44849029523/artifacts/14685102101).  
**Independently recalculated original ZIP SHA-256:** `e09ab6c9263ce749c28e1b2d060687a83e196f798f0050b6ed76223fc008434a`, matching original CI uploader and GitHub artifact digest; embedded tested-commit file is exact.

## Strict acceptance evidence

- Frozen original Gamma9/P/J/Circle and accepted source hashes preflight PASS; independent original signed-permutation integer fixture PASS.
- Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Accepted dependency build **9,075 jobs** PASS.
- Native source and separately imported consumer warnings-as-errors PASS.
- Four `#print axioms` reports (2 native and 2 independent consumer) contain only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx` or Lean compiler errors.
- Original ZIP verified independently: six files `exact-tested-commit.txt`, `native-original-hermitian-j4-complex-identities-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.

## Formally verified original-source results

```lean
theorem relationalSourceHermitianCandidate_J4_left_mul_I
    (x y : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate (relationalPhaseJFourLinear x) y =
      Complex.I * relationalSourceHermitianCandidate x y

theorem relationalSourceHermitianCandidate_J4_right_neg_mul_I
    (x y : Fin 4 → ℝ) :
    relationalSourceHermitianCandidate x (relationalPhaseJFourLinear y) =
      -(Complex.I * relationalSourceHermitianCandidate x y)
```

These are full complex-number equalities, not merely component relations, for the exact source original Gamma9 metric Q and J4. D28 uses accepted D27 components and pin-exact Mathlib `Complex.ext`, `Complex.I_mul_re` and `Complex.I_mul_im`.

**Not qualified:** a defined `ℂ`-scalar action on `Fin 4 → ℝ`, module laws, full `ℂ`-sesquilinearity or a bundled `InnerProductSpace ℂ`, a Q-orthonormal `ℂ²` coordinate frame, standard scalar Circle action/Hopf quotient and Chern class, or physical original BFSS Fock/Gauss/Hamiltonian and stable hopfion.

## Recommended D29 boundary

Construct a standalone function `relationalSourceComplexScalarAction (z : ℂ) (x : Fin 4 → ℝ) := z.re • x + z.im • relationalPhaseJFourLinear x` and prove its zero, unit, imaginary unit, and additivity laws without installing a complex module or changing existing norm/typeclass instances. Later prove scalar associativity using J4²=-I, the complex module laws, and full sesquilinearity of H.

Retain frozen source hash pins, independent integer fixture, exact tested SHA and native/consumer axiom reports in every gate. No changes to `main` or Gamma9 and no speculative physical claims.
