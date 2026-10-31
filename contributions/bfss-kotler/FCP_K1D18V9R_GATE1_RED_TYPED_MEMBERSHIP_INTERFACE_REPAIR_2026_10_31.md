# Project Lead — V9R Gate 1 RED: explicit membership-to-matrix identity bridge

**Date:** 2026-10-31 UTC
**Research branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`
**Outcome:** V9R Gate 1 **UNQUALIFIED**. Preserve this failure regardless of subsequent outcome.

## Reproducible red evidence

- Workflow: https://github.com/etblink/math/actions/runs/41221956469
- Tested SHA: `52a89c9e9e80c8f285eb6e936218986ca11adc9a`
- Source blob: `6a0e0a11c47341425a4c072eddefa2843be48c14`
- Failed job ID: `124598191041`
- Compiler artifact ID: `13050383412`
- Artifact ZIP SHA-256 reported by uploader: `5059f10904cf0fab06f7c0049dc506392be1c12f40bde4d59975b2fd5ef156fb`
- Exact pins, dependency restore, 8,992-job accepted V9Q ancestry compilation: all successful.
- First actual error line 36: `rewrite` found no `(?M + ?N).transpose` because the goal remained `A + B ∈ {A | A.transpose = -A}`.
- Same error repeated on source/target skew add and real scalar closure (lines 39, 52, 55).
- Declaration `coordinateToPairedSkewLieHom` printed `sorryAx`; independent theorem/axiom audit skipped.

## Causal classification

**Lean interface / proof-goal unfolding mismatch**, not a countermodel of real skew-matrix closure or of the source-exact LieHom statement. Membership in a custom set was definitionally convertible to the transpose identity, but the `rw` tactic did not unfold the membership proposition automatically. The baseline V9P, V9Q ancestry was intact.

## Narrow corrective test

Expand the hypotheses and goals explicitly with `change` in the four closure branches. Retain exact definitions of native `SpaceIndex`, original paired `Source48Label`, actual matrix commutator, accepted map, and all theorem statements. Do not alter any ancestor, mathematical representation, pinned Lean/Mathlib version, proof resource limits or accepted axiom list.

Update only the V9R source hash and focused syntax/shape preflight. Submit a fresh strict GitHub Action with exact tested SHA, warning-as-error compilation, independent instance/theorem checks and declaration-level axiom audit. **Do not mark V9R accepted until all pass.**

## Explicitly unproved

A continuous original-source Spin(9) lift, group integration and topology, exact Fock operator action, gauge covariance, closed form invariance and spectral/physical BFSS existence remain OPEN independently of the experimental V9R result.
