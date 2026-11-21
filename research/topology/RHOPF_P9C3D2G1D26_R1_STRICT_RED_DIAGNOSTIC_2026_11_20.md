# RHOPF-P9C3D2G1D26 R1 — source-original Hermitian candidate native RED evidence

**Pacific date:** 2026-11-20. **Disposition:** REJECTED_NATIVE_RED.  
**Canonical branch:** `integration/bfss-unified-research-20261108`. Original Gamma9 and `main` untouched.  
**Original run:** [#44841481734](https://github.com/etblink/math/actions/runs/44841481734), attempt 1 failure, original job `136650673973`, exact tested SHA `11509183577c8c59ff88c33daee6e2c8c4f5c53a`.  
**Original artifact:** [#14682115371](https://github.com/etblink/math/actions/runs/44841481734/artifacts/14682115371); original ZIP independently recalculated SHA-256 `9381c55da2eb8ecfbcc7c861822b6b92d4ab674da6eaf83a8006cbc4f541f8be`, identical to GitHub metadata and original upload. Embedded `exact-tested-commit.txt` matches tested SHA; all five ZIP members inspected: tested SHA, independent source Gamma9 integer fixture, native failed source compilation/axiom report, qualified dependency build, exact toolchain hashes.

## Original diagnostics, not retrospectively rewritten

- Frozen source Gamma9/P/J/Circle and bounded D26 proof-contract preflight **PASS**, source-independent integer Gamma9 fixture **PASS**.
- Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` **PASS**.
- Source dependencies: **9,073 jobs successfully built**, including accepted D25.
- Native D26 compilation **RED**, independent consumer **SKIPPED**.
- Source `RHOPFP9C3D2G1D26OriginalGammaSourceHermitianCandidate.lean` line 55: `error(lean.unknownIdentifier): Unknown constant Complex.conj`. Consequently D26 `relationalSourceHermitianCandidate_conj_symm` axiom report includes `sorryAx`, and is **not accepted**. Other lines' reported axioms do not override failure.
- Pinned Mathlib `Mathlib/Basic/Complex/Basic.lean` implements complex conjugation by `StarRing ℂ`, and recommends scoped `conj` notation; no constant named `Complex.conj`.

## Bounded R2 recovery

Replace `Complex.conj (relationalSourceHermitianCandidate y x)` in the native theorem and independent imported consumer **by the same mathematical operation** `star (relationalSourceHermitianCandidate y x)`. This is an API-level spelling repair, not an alteration to the conjugation claim, source Gamma9, `J4`, `Q`, data or original proof theory. Update only the two new-source SHA pins in the original strict workflow and preserve all original R1 evidence.

Require R2 native and independent consumer Lean warning-as-error compilation, seven native and seven imported axiom reports with only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`, plus original ZIP independently checked. If RED, preserve the full original evidence and diagnose before any further changes. **No complex module, scalar S¹ conjugacy, Hopf quotient/Chern charge or original physical Fock claimed.**
