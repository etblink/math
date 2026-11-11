# NORM-0B eighth strict red — exact complex Fock target type, not another untyped lemma

**Date:** 2026-11-10 Pacific / 2026-11-11 UTC. **Status:** strict red, new candidate consumer repair NOT Lean-qualified.

## Evidence
- [Run 42975284760](https://github.com/etblink/math/actions/runs/42975284760), tested exact commit `33d426df4647c026356813a3b24ac59a71c09eb0`.
- Job `130372836698`; failure 2026-11-11 07:02:49 UTC.
- Diagnostic artifact ID `13836230664`, ZIP SHA256 `3ae2d60b6ac5ea1160763955ef5dfb3db9719a6bad4e335079f8e179a2f9a182`.
- All exact 106 original source/consumer pins qualified at preflight; Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored; original source cold-built 9068 jobs; all 4 source axiom roots and the 1st independent consumer axiom root printed standard axioms only.
- **One remaining error** at consumer line 58: term `smul_zero ↑(originalSpatialGram x i j)` has its operator type represented by unresolved metavariable `?m.59`. Expected type has exact `Fermion 2 →L[ℂ] Fermion 2` plus its concrete `ContinuousLinearMap.instSMul`. Earlier consumer attempts included untyped `exact smul_zero` (stuck typeclass), `simp only [smul_zero]` (no progress), and `show ... from smul_zero` (mismatch); they are failed *elaboration* attempts, not mathematical counterexamples. The first independent real/complex-negation consumer is now already compiling; preserve.

## Diagnosis and exact source check
Pinned Mathlib `Mathlib/Algebra/GroupWithZero/Action/Defs.lean` declares `@[simp] theorem smul_zero (a:M) : a • (0:A)=0` under `[SMulZeroClass M A]`. The class determines the target `A` from the expression's `0`. But elaborating an isolated `smul_zero a` term before fixing the target may leave `A` as a metavariable, and rewriting a target containing the **concrete** continuous-linear-map action is the source-faithful interface.

## Candidate bounded repair
Keep both explicit nested `Finset.sum_eq_zero` steps and the source-original 81-term Gram decomposition. Replace only the leaf proof with:

```lean
  change ((originalSpatialGram x i j : ℝ) : ℂ) •
    (0 : Fermion 2 →L[ℂ] Fermion 2) = 0
  rw [smul_zero]
```

The `change` tactic pins the expression in the goal to precisely the actual original bounded Fock operator. The `rw [smul_zero]` tactic rewrites in this typed expression instead of synthesizing a theorem term in a context lacking its target type. This is a candidate **not locally compiled**: a fresh strict green is required.

- Previous consumer blob `8ca4e9fc4231ad34698a6fc65a4f91837f0ef94f`; new candidate consumer blob `6775e7a6840a02062201d640cb06ae0e30deb7cf`.
- Previous workflow blob `07c17cca5900f3669658bc7e4d9bc66b0b19dba9`; new `0cba6b44fd3a40ccf95f95d192e42ef78fc09388`, changing only this consumer's hash in all 106 pins.
- Frozen original NORM-0B source blob `78cf0db748fc7d98bcd1f6c2629d75742c6d8097`, 104 accepted ancestor blobs unchanged.
- Toolchain, independent consumer and all six `#print axioms` checks unchanged. No weakening or workaround through new axioms/warnings.
- If red again, read first causal goal and prefer a separate explicit `smul_zero` instance/simp normalization diagnostic, not repeated speculative source rewrites.

**Scientific boundary:** The fixed-B pointwise NORM-0C bound and actual `FullL2 2` multiplier are downstream; no original Hamiltonian spectral or mass-gap result follows.
