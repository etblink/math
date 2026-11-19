# RHOPF-P9C1B1 R1 — native RED proof-interface diagnosis and bounded R2

**Date:** 2026-11-19. **Branch:** `integration/bfss-unified-research-20261108`.
**R1 original run:** [#44522055912](https://github.com/etblink/math/actions/runs/44522055912), completed FAILURE.
**Exact tested commit:** `56fdd7dec467fd8a0c349548c01d5b7ecf388ffb`.
**Artifact:** [#14530005644](https://github.com/etblink/math/actions/runs/44522055912/artifacts/14530005644).
**Downloaded ZIP SHA-256:** `afda1e06506382776da9a6f39440d133b1db818177c60d4e46afa71fc8958e5f` matching GitHub digest. Original archived exact-tested-commit.txt matches.

## R1 result: native RED, not infrastructure failure

PASS: original source/hash/declaration preflight, Lean 4.34.1 + Mathlib exact restoration, independent original integer consumer, and qualified BFSS/P9C1B0 source dependency build.

R1 native original file `RHOPFP9C1B1OriginalGammaRelationalRank.lean` failed at:
- line 57 `lean.invalidField`: Lean treated `relationalProjector_toLin_idempotent` as `Eq` (the definitional representation of `IsIdempotentElem`) and could not resolve the dotted `.isProj_range` method from an Eq-valued term. This is a proof-interface/elaboration error, not evidence that trace-rank is false.
- line 69: the final `simpa only [Matrix.toLin'_apply']` failed a type conversion between the toLin' and mulVecLin presentations; rendered expected/actual terms were textually identical.
- The first theorem, `relationalProjector_toLin_idempotent`, compiled with only `propext`, `Classical.choice`, `Quot.sound`. The two downstream failed declarations reported `sorryAx` and are NOT qualified. Independent Lean consumer step was skipped.

## R2 bounded repair

Preserve ALL mathematical theorem statements and existing original BFSS original Gamma9 source, pinned Lean/Mathlib, axiom whitelist and the independent consumer byte-for-byte. Modify only two Lean proof terms in the candidate P9C1B1 file and its new source hash pin in the workflow.

1. Replace the fragile dotted method by the original pinned Mathlib `LinearMap.isProj_range_iff_isIdempotentElem` equivalence applied explicitly to the exact `Matrix.toLin' relationalProjector` endomorphism, followed by the qualified `LinearMap.IsProj.trace` theorem.
2. Replace the terminal `simpa only` conversion by a direct `change` to the exact `Matrix.toLin' relationalProjector` range-finrank target and an `exact` reference to the preceding theorem.

The pinned Mathlib source for these operations: `Mathlib/LinearAlgebra/Trace.lean` (blob `aead033d4d6f66f283cd51f072c24a2f5b16a97e`), `Mathlib/LinearAlgebra/Projection.lean` and `Mathlib/LinearAlgebra/Matrix/ToLin.lean` (blob `e27ea745bb8ab9f7766890e55c6a48e85d89a370`). These are source-typed interface fixes; they do not relax proof obligations.

## Stop rule and ceiling

R1 stays RED even if R2 passes. Only qualify R2 after warning-as-error native compilation, independent original-source type consumer, six source/consumer axiom reports without `sorryAx`, and original artifact digest and exact-tested commit verification. If R2 fails, preserve its error and change proof architecture only as the exact compiler evidence warrants.

No selected four-coordinate Hopf image identification, Fock-vector Spin9 lift, dynamic conserved charge, stable hopfion, physical particle or Standard Model result is established by this gate.
