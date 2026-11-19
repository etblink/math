# RHOPF-P9C1C1A R1 — native RED matrix-vector notation scope and bounded R2

**Date:** 2026-11-19.
**Branch:** `integration/bfss-unified-research-20261108`.
**Original strict run:** [#44535995764](https://github.com/etblink/math/actions/runs/44535995764), attempt 1 **RED**.
**Exact tested commit:** `f389c1a5a6ddbfcb0f62f6a6dfc0fb313bc53060`.
**Original evidence artifact:** [#14537111239](https://github.com/etblink/math/actions/runs/44535995764/artifacts/14537111239), ZIP SHA-256 `68c8476c7dc0047e811ab2707c527e3b6335e817a56e4109bfd4de15904428ff`, independently downloaded and matched to GitHub digest; archive exact-tested-commit.txt matches R1 tested SHA.

## R1 source-exact qualification boundary

Source/hash/declaration contract, original integer fixture, Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration, and accepted original Gamma9/P9C1C0 dependency build PASS. New native original-source equalizer module FAILS; independent consumer step SKIPPED.

At line 42 onward, all occurrences of `*ᵥ` produce error `elaboration function for Mathlib.Tactic.subscriptTerm has not been implemented`. This is because `*ᵥ` is declared with `scoped infixr:73 " *ᵥ " => Matrix.mulVec` in the pinned `Mathlib/Data/Matrix/Mul.lean`, and the new original and consumer modules did not issue `open scoped Matrix`. Lean consequently misparses the token as a multiplication and a detached subscript, producing cascade type errors (`Pi.single ... (1 : ℝ)` unexpectedly expected to be a function) and unrecognized theorems after their definitions fail.

All downstream declarations had `sorryAx` in failed-elaboration reports. **NONE of P9C1C1A's four claimed source theorems qualifies from R1.** This is an interface/notation scope failure, not a counterexample to the algebraic common-action equalizer.

## Bounded R2 operation

Add only `open scoped Matrix` in the existing original native equalizer module AND its independent consumer, so every token `*ᵥ` binds to the intended original matrix-vector operation. Update only the two exact Git blob hash pins in its strict workflow. Retain every theorem statement, proof strategy, exact original Gamma9 labels, accepted projector/rank/conditional-bridge imports, Lean/Mathlib pins, the standard axiom whitelist, all original source and fixture code and all CI timeout/resource settings.

The exact public Mathlib notation declaration was source-inspected at pinned `Mathlib/Data/Matrix/Mul.lean` in the current original Mathlib revision.

## R2 acceptance and further stop rule

R2 must pass fresh warning-as-error original Lean source compilation, separate independent original-source imported type consumer, eight native/independent axiom reports with ONLY `propext`, `Classical.choice`, `Quot.sound`, and original artifact archive checksum/tested SHA verification before qualification. Additional Lean tactic/type errors may remain after the notation issue is resolved; if so preserve the R2 diagnostic and repair the exact bottleneck before any GREEN declaration.

Even if this abstract common-action criterion succeeds, the original finite source proof of the four specific coordinate basis actions K1=K2=K3 remains unqualified. Do not infer a physical 3D hopfion, conserved Fock operator, original Hamiltonian protection or a new particle.
