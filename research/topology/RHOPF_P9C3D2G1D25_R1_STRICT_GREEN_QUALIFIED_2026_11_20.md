# RHOPF-P9C3D2G1D25 R1 — original Gamma9 source inner core J4 orthogonality / skew strict GREEN

**Pacific date:** 2026-11-20. **Disposition:** ACCEPTED_STRICT_GREEN.  
**Canonical branch:** `integration/bfss-unified-research-20261108`; original Gamma9 and `main` unchanged.  
**Original strict run:** [#44839389468](https://github.com/etblink/math/actions/runs/44839389468), attempt 1 SUCCESS, tested SHA `ebf12fd54ec97e090d978f6661367a25c02fc99e`, original job `136643715452`.  
**Original artifact:** [#14680317352](https://github.com/etblink/math/actions/runs/44839389468/artifacts/14680317352).  
**Independently computed original ZIP SHA-256:** `166477419a60c11a3668fac24b64d91c96ae79032719c15af23d470e4f7220eb`, matching GitHub Actions original upload and artifact digest. Embedded `exact-tested-commit.txt` matches tested SHA.

## Original strict evidence
- Exact frozen original Gamma9/P/J/Circle, accepted D10/D19/D20–D24 sources and independent source signed-permutation integer fixture: PASS.
- Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Qualified original dependencies **9,072 jobs** built successfully.
- Native source and independent imported consumer warnings-as-errors: PASS.
- Four `#print axioms` reports (two native, two independent) contain only `[propext, Classical.choice, Quot.sound]`, no `sorryAx` or errors.
- Independently inspected all six original ZIP entries: `exact-tested-commit.txt`, `native-original-source-core-j4-orthogonal-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.

## Qualified original-source mathematics

```lean
theorem relationalSourceInnerCore_J4_invariant (x y : Fin 4 → ℝ) :
    relationalSourceInnerCore.inner
      (relationalPhaseJFourLinear x)
      (relationalPhaseJFourLinear y) =
    relationalSourceInnerCore.inner x y

theorem relationalSourceInnerCore_J4_skew (x y : Fin 4 → ℝ) :
    relationalSourceInnerCore.inner (relationalPhaseJFourLinear x) y =
      - relationalSourceInnerCore.inner x (relationalPhaseJFourLinear y)
```

Both refer to the **original** Gamma9-derived `J₄` and the exact source 16-spinor dot transported through the accepted noncanonical `E.symm`. D25 uses accepted original D10 `J₄²=-I`, D19 Q-polarization invariance, D20 equality with transported spinor dot, D23 bundled source real bilinear form, and D24 Mathlib `InnerProductSpace.Core`. These data are source-defined, not standard coordinate Euclidean dot; no global duplicate norm is installed.

## Next controlled boundary

Construct the original-source complex Hermitian candidate from `B_Q` and `J₄`: with convention **complex linear in the first argument**, `H(x,y) = B_Q(x,y) - i B_Q(J₄x,y)`. First verify exact real/imaginary components, conjugate symmetry and positivity; separately prove complex sesquilinearity and construct a suitable complex module, then a complex-dimension-two orthonormal frame and an explicit isometric intertwiner with scalar S¹ acting on ℂ². Preserve no-surrogate-metric and original-source contract.

**Not qualified:** complex module or full Hermitian inner-product-space instance, standard scalar Hopf correspondence/quotient/first Chern charge, original BFSS 48-Majorana Fock, Gauss, Hamiltonian, or stable hopfion. Do not touch `main`, original Gamma9, toolchain or evidence history.
