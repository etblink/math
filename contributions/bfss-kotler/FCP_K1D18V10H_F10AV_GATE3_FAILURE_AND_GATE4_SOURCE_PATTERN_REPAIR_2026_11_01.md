# K1D18V10H F10AV — Gate 3 failure review and bounded Gate 4 source-pattern repair

**Date:** 2026-11-01 Pacific / 2026-11-02 UTC  
**Branch:** research/fcp-k1d17-ancestor-cache-pilot-20261028  
**Status:** Gate 3 failed; Gate 4 is a new unqualified candidate.

## Immutable Gate 3 evidence

[Run #41377923513](https://github.com/etblink/math/actions/runs/41377923513), job 125062157316, tested commit 65d15b989c42170776d83bc5e9d678e56428d9c2, completed red. Failure artifact ID 13112985380; artifact zip SHA256 8c3e835c672f6a232130b4deb19db373bdd92de986e5f79d5440ae266b1ba227.

Passed: exact source/ancestry preflight; pinned Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 restore; F10AU exhaustive original gamma bracket rebuild; V9F source-native skew-plane spanning rebuild.

Failed: fresh F10AV warnings-as-errors compilation. Independent eight-declaration exact-type/axiom audit was skipped.

### Exact diagnostics

1. At line 127:49, hrs.symm is invalid because hrs : r ≠ s elaborates as r = s → False; Lean attempts to find a nonexistent Function.symm field.
2. The same exact error occurs at line 151:57.
3. At line 164:2, simp only reports no progress, with a follow-on transparency diagnostic (function expected: A i). The previous proof had split map linearity, outer transpose rewriting, generator transpose rewriting, and sign/sum simplification into multiple tactic invocations. The accepted V9C proof instead uses one source-explicit simp only over the full finite-sum rewrite set.

The downstream coordinate-plane transpose, arbitrary-skew transpose, and mem_so declarations print sorryAx after these compiler errors. This is failed elaboration fallout, not an axiom-clean result. No mathematical theorem is accepted by this run.

## Source-bound repair rationale

- Replace hrs.symm with explicit Ne.symm hrs. This exact namespace-qualified idiom already appears in the accepted SU2RealGammaProbe.lean source at its finite-index inequality simplification, and is unambiguous for a negated equality.
- Recompose the arbitrary-skew proof into the accepted V9C finite-sum pattern: one simp only includes map_smul, map_sum, Matrix.transpose_smul, Matrix.transpose_sum, the already-proved coordinate-plane transpose identity, smul_neg, and Finset.sum_neg_distrib. This is directly adapted from the qualified coordinateToPairedLinearMap_image_transpose proof in SU2BFSSPairedSpin9LinearMapImageSkewProbe.lean; no new basis, representation, or algebraic identity is introduced.
- Keep all theorem statements, coefficient normalization, original gamma generators, input/output carriers, imports, pinned dependencies, and accepted ancestors unchanged.
- Update only the candidate source blob pin in the strict workflow.

## Method audit and anti-pattern update

The FCP truth-seeking protocol requires immutable historical runs and prospective correction only for confirmed defects. The prior Gate 3 repair made a valid source-level simplification choice for the conditional rewrite but failed to audit the existing inequality proof's binder type, and did not transplant the accepted finite-sum simplification pattern as one complete tactic block. The repair process must therefore:
- inspect exact local binder types before using relation symmetry;
- adapt accepted proofs at the level of the entire tactic sequence, not merely copy one tactic name;
- separate compiler errors from print-axioms fallout;
- stop speculative successive edits if the next exact diagnostic is not understood.

No warning/linter suppression, proof-limit increase, axiom relaxation, theorem weakening, source-basis substitution, or physical-claim promotion is permitted.

## Gate 4 qualification contract

At the exact tested commit, require successful source and ancestry checks, pinned restore, fresh warnings-as-errors compile, all eight independent exact theorem-type elaborations, and declaration-level axiom reports containing only the permitted propext, Classical.choice, and Quot.sound with no sorryAx. Preserve full logs and artifact identity. Any red result remains immutable and must be classified from its first causal diagnostic.

Even a green F10AV gate would prove only that the stated source-native linear map sends skew 9x9 inputs into native so(16,R). It would not prove arbitrary bracket preservation, a LieHom, Spin(9) group integration, a Spin(48) lift, gauge/physical-domain compatibility, or BFSS spectral claims.
