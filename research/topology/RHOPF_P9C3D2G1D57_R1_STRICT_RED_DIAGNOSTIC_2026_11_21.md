# RHOPF-P9C3D2G1D57 R1 — strict RED: implicit orbit Setoid in Quotient.eq transitivity

**Date Pacific:** 2026-11-21. **Disposition: STRICT RED; D57 NOT QUALIFIED.**

Original [run #44966122245](https://github.com/etblink/math/actions/runs/44966122245), job `137035428740`, attempt 1, exact tested commit `b21450b661f69da8d20c1967da366ae5f6868aed`.

## Original immutable evidence

[Original artifact #14732117069](https://github.com/etblink/math/actions/runs/44966122245/artifacts/14732117069) independently downloaded. Its SHA-256 `cc4bae4b0618f85e717081aedb663d4e55b5e3dbb17b1631633e9b05a1bca987` independently recalculated, exactly matching original GitHub artifact digest. ZIP integrity PASS, exactly five original files, embedded `exact-tested-commit.txt` exactly `b21450b661f69da8d20c1967da366ae5f6868aed`.

## Independent native failure inspection

- Original Gamma9 frozen source SHA/contract preflight PASS; independent original Gamma9 finite integer signed-permutation fixture PASS.
- Exact Lean 4.34.1, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, 9,104 dependency jobs PASS.
- D57 `relationalEuclideanUnitCircleOrbitSetoid` and `relationalEuclideanUnitCircleOrbitClass` compiled, both `#print axioms` reports clean, exactly `propext`, `Classical.choice`, `Quot.sound`.
- D57 first theorem `relationalEuclideanUnitCircleRelated_iff_orbitClass_eq` failed at line 62: `Application type mismatch` in `Iff.trans (Iff.symm MulAction.mem_orbit_symm) (Iff.symm Quotient.eq)`. Lean could not resolve the implicit Setoid of the RHS `Quotient.eq`, even though the intended two quotient representatives are from `relationalEuclideanUnitCircleOrbitSetoid`.
- The first failed theorem and its dependent `relationalSourceOrbitClass_eq_iff_standard` both reported `sorryAx`. Independent D57 consumer SKIPPED; **R1 not qualified**. This is Lean elaboration/implicit relation specification, not a counterexample about original Gamma9 or standard orbit classes.

## Bounded R2 correction

Preserve D57 theorem statements, first two definitions and imported independent consumer byte-for-byte. In only the first D57 theorem's proof, use an explicit named `relationalEuclideanUnitCircleOrbitSetoid` in the quotient equality, add a typed intermediate `hReachability : (∃ z, z • x = y) ↔ relationalEuclideanUnitCircleOrbitSetoid x y`, prove it using the pinned `MulAction.mem_orbit_symm`, then compose with `(Quotient.eq).symm` with its Setoid now constrained. Update only the exact D57 source hash in strict workflow; no linter setting, axiom whitelist, pins of original Gamma9 source, or toolchain relaxed.

R2 must separately verify native source, independent imported consumer, four native and four independent allowed axiom reports, original artifact SHA-256, ZIP integrity and embedded exact tested commit. Retain R1 RED as negative knowledge. No `main`, accepted D45–D56 source, quotient topology, CP¹/S², Chern or physical BFSS claims altered.
