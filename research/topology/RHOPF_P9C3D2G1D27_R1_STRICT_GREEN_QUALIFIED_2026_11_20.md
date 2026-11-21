# RHOPF-P9C3D2G1D27 R1 — source-original Gamma9 Hermitian J4 components strict GREEN

**Pacific date:** 2026-11-20. **Disposition:** ACCEPTED_STRICT_GREEN.  
**Canonical branch:** `integration/bfss-unified-research-20261108`. Original Gamma9 and `main` untouched.  
**Original strict run:** [#44847059964](https://github.com/etblink/math/actions/runs/44847059964), attempt 1 success, **exact tested commit** `70cfd69c9e8137e1ea19001162af463c4a868892`, original job `136669255188`.  
**Original archive:** [#14684711439](https://github.com/etblink/math/actions/runs/44847059964/artifacts/14684711439).  
**Independently recalculated original ZIP SHA-256:** `d0f9e108100ff648c94de1a7807dd1e98d90a6e2b1a72ffa9e151b5cf197aca3`, exactly matches original GitHub Actions upload and artifact metadata. Embedded `exact-tested-commit.txt` matches `70cfd69c9e8137e1ea19001162af463c4a868892`.

## Strict qualification evidence

- Frozen original Gamma9/P/J/Circle and accepted D26 dependency hashes preflight PASS; independent original signed-permutation Gamma9 integer fixture PASS.
- Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` PASS.
- Original accepted dependencies **9,074 jobs** built successfully.
- Native and independently imported consumer warning-as-error Lean compilations PASS.
- Eight `#print axioms` reports (4 native, 4 independently imported) list only `[propext, Classical.choice, Quot.sound]`, without `sorryAx` or Lean compilation errors.
- Original ZIP independently downloaded and all six files inspected: `exact-tested-commit.txt`, `native-original-hermitian-j4-components-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, and `toolchain-sha256.txt`.

## Qualified original-source result

The source-original real-four Gamma9 Hermitian candidate
`H(x,y) = B_Q(x,y) - i B_Q(J4 x,y)` has four separately proved component identities:
```lean
relationalSourceHermitianCandidate_J4_left_re
relationalSourceHermitianCandidate_J4_left_im
relationalSourceHermitianCandidate_J4_right_re
relationalSourceHermitianCandidate_J4_right_im
```
They state
`Re H(J4x,y)=-Im H(x,y)`,
`Im H(J4x,y)=Re H(x,y)`,
`Re H(x,J4y)=Im H(x,y)`,
`Im H(x,J4y)=-Re H(x,y)`.

These are the exact original-source components of `H(J4x,y)=i H(x,y)` and `H(x,J4y)=-i H(x,y)`. D27 **does not** yet install a complex scalar action, prove all sesquilinearity, give an `InnerProductSpace ℂ` or any standard Hopf quotient. No ordinary coordinate Euclidean metric is substituted for source Q.

## Next narrow gate

Use pinned Mathlib `Complex.ext` and complex multiplication-by-`I` real and imaginary parts to combine D27 source-typed component identities into **two full complex equations** for `H(J4x,y)` and `H(x,J4y)`. Only after strict qualification construct and prove complex scalar action `(a+ib) • x := a • x + b • J4x`, first/second sesquilinearity, and source-compatible complex geometry.

No original physical 48-Majorana Fock/Gauss/Hamiltonian implementer or stable hopfion, no scalar Hopf quotient or Chern charge qualified. Preserve all red/green provenance and do not alter `main`, original Gamma9 or pinned toolchain.
