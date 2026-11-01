# BFSS K1D18V10E — Gate 2 RED, exact definitional mismatch and Gate 3 corrective experiment

**Disposition:** GATE 2 FAILED. No V10E theorem qualified by this red. Gate 1 and Gate 2 retain separate immutable run evidence. Gate 3 is an UNQUALIFIED candidate until independently verified.

## Gate 2 exact failure

- [Run #41254379517](https://github.com/etblink/math/actions/runs/41254379517), job `124694323176`, **failure**, attempt 1, exact tested commit `cffa624aa3657f2845c7a71ddc27b1c2d8962bf2`.
- Failed artifact [#13062003867](https://github.com/etblink/math/actions/runs/41254379517/artifacts/13062003867), SHA-256 `442759d5cb5a5faaff0568fc6e945c9e4ffa713376cf1d9998ab789ae92237c5`. Retained red evidence.
- Source ancestor pinned toolchain Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored; exact source-hash preflight PASS; accepted V10D 8927 jobs rebuilt PASS. Fresh V10E strict compilation FAILED; independent audit skipped.
- First error `SU2BFSSPairedSpin9SourceSpinGammaOrthogonalProbe.lean:51:6`: `change` tactic failed. The proposed expression `source9GammaCliffordAlgHom (reverse (r • 1)) = (source9GammaCliffordAlgHom (r • 1))ᵀ` was **not definitionally equal** to the actual target `source9GammaCliffordAlgHom (reverse (algebraMap ℝ (CliffordAlgebra source9Quadratic) r)) = (source9GammaCliffordAlgHom (algebraMap ℝ (CliffordAlgebra source9Quadratic) r))ᵀ`. The previous Gate 1 notes inferred the `r • 1` normalization from diagnostics but that inference did NOT justify the Gate 2 `change`.
- Five downstream `#print axioms` dependencies contained `sorryAx` because the scalar induction branch is unproved in the failing compile. Their acceptance remains explicitly **NO**.

## Root cause and new bounded proof technique

The real source issue is a **distinction between definitional equality and a propositional scalar algebra-map theorem**. Do not ask `change` to replace `algebraMap` with `r • 1`. Instead, in the *exact algebraMap source goal*, introduce two typed witnesses using the pinned source:
1. `CliffordAlgebra.reverse.commutes r` establishes `reverse (algebraMap ℝ Cl(9) r) = algebraMap ℝ Cl(9) r`.
2. `source9GammaCliffordAlgHom.commutes r` establishes `γAlgHom (algebraMap ℝ Cl(9) r) = algebraMap ℝ GammaMatrix r`.
3. Connect these using explicit `congrArg` and a four-step `calc` chain, with the *only* scalar conversion confined to `(algebraMap ℝ GammaMatrix r).transpose` via `Algebra.algebraMap_eq_smul_one`, `Matrix.transpose_smul`, and `Matrix.transpose_one`.

No accepted theorem, source group, gamma family, original paired-index convention, workflow resource limit, or axiom whitelist changes. This is a source-preserving proof repair with a new source blob pin only. Verify exact statement/type and six declaration axiom reports on Gate 3. If this approach fails again, STOP broad gate churn and isolate `reverse.commutes` / `AlgHom.commutes` signatures in a tiny typed Lean fixture before another whole-module attempt.

**Status boundary:** V10D is ACCEPTED. V10E global Spin9 → O(16) remains **UNQUALIFIED**. Original paired SO(48), topology, Spin48 covering, Fock implementation, center action and physical BFSS claims remain separate open obligations.
