# RHOPF-P9C3D2G1D22 R1 — original Gamma9 transported-dot real bilinearity strict GREEN

**Pacific date:** 2026-11-20. **Disposition:** ACCEPTED_STRICT_GREEN.  
**Canonical branch:** `integration/bfss-unified-research-20261108`. Original source Gamma9 and `main` unchanged.  
**Original strict run:** [#44829697615](https://github.com/etblink/math/actions/runs/44829697615), attempt 1 SUCCESS, exact tested commit `6a4477a975a120dcd5b1d6a53edd5fe22f45a763`, original job `136611214724`.  
**Original artifact:** [#14677840437](https://github.com/etblink/math/actions/runs/44829697615/artifacts/14677840437).  
**Independently recalculated ZIP SHA-256:** `8735cccc5ec0a33aa3a688e3a75b39a707240bd8b01c0790223b3233534f43df`, identical to GitHub original upload and artifact digest. Embedded `exact-tested-commit.txt` matches original tested commit.

## Strict qualification
- Frozen original Gamma9/P/J/Circle, G1C0/C1 and D21 SHA pins and accepted source preflight: PASS; independent original Gamma9 signed-permutation integer fixture PASS.
- Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` PASS.
- Source dependencies **9,069 jobs** built successfully.
- Native Lean warning-as-error and independent imported source consumer PASS.
- Eight `#print axioms` reports (four each native and consumer) list only `[propext, Classical.choice, Quot.sound]`, no `sorryAx`, no Lean error.
- Original artifact independently downloaded; six members inspected: `exact-tested-commit.txt`, `independent-original-integer-consumer.json`, `independent-lean-types-and-axioms.log`, `native-original-transported-dot-bilinearity-and-axioms.log`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.

## Qualified mathematics

```lean
relationalSourceTransportedDot_add_left
relationalSourceTransportedDot_smul_left
relationalSourceTransportedDot_add_right
relationalSourceTransportedDot_smul_right
```

These are the source-exact four real bilinearity laws for the actual original 16-real-spinor dot product transported through **the accepted noncanonical** `E.symm`. Combined with D20 equality to the Q polarization and D21 symmetry and positive definiteness, these provide all basic properties of a real inner product on `Fin 4 → ℝ` with original metric Q, though the corresponding Lean bundled structure has not yet been qualified. The original `E` is **not assumed** to preserve ordinary coordinate Euclidean dot.

## Next proof boundary

Construct a reusable, non-global source-specific real bilinear form (or inner product if the exact pinned Mathlib API supports it cleanly), whose application is definitionally the previously accepted `relationalSourceTransportedDot`; prove it equals source B_Q, is symmetric and positive. Then use accepted original `J4²=-I` and `B_Q(J4x,J4y)=B_Q(x,y)` for compatible complex inner product and orthonormal C2 basis.

No standard scalar Hopf equivariance, quotient/Chern class, original BFSS physical 48-Majorana Fock/Gauss/Hamiltonian or stable hopfion claims are yet qualified. Preserve original RED diagnostics and do not change Gamma9, `main` or toolchain.
