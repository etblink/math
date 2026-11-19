# RHOPF-P9C1B1 — native rank-four original relational projector intake

**Date:** November 19, 2026. **Status:** STAGED / NOT YET QUALIFIED.
**Branch:** `integration/bfss-unified-research-20261108`.
**Accepted predecessor:** RHOPF-P9C1B0 R2 GREEN [#44519484672](https://github.com/etblink/math/actions/runs/44519484672) at exact tested commit `f373a3686f0b2157c45e5d81e49c4f8a33064d88`; acceptance commit `21849c786059db1b7ea56f266719fbdc35f2b1ab`.

## Bounded typed original-source theorem

The accepted original GammaMatrix relationalProjector P satisfies `P*P=P` (P9C1A) and `Matrix.trace P=4` (P9C1B0).
The pinned Mathlib source `Mathlib/LinearAlgebra/Trace.lean` at Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, Git blob `aead033d4d6f66f283cd51f072c24a2f5b16a97e`, includes `LinearMap.IsProj.trace` at lines 327–330. It relates an idempotent endomorphism's trace to `Module.finrank` of its range.
Also source-verified at the exact pin:
- `Matrix.trace_toLin'_eq` (Trace.lean)
- `Matrix.rank` definition via finrank of mulVecLin range (Mathlib/LinearAlgebra/Matrix/Rank.lean blob `31faae9f47694f8f386f96f3529dfb84a0d6fb2a`)
- `Matrix.toLin'_mul` and `Matrix.toLin'_apply'` (Mathlib/LinearAlgebra/Matrix/ToLin.lean blob `e27ea745bb8ab9f7766890e55c6a48e85d89a370`).

The candidate has exactly three public original-source claims:
1. `IsIdempotentElem (Matrix.toLin' P)`,
2. `Module.finrank ℝ (LinearMap.range (Matrix.toLin' P)) = 4`,
3. `Matrix.rank P = 4`.

This is **not** a source-coordinate proof identifying the image with `span{e_0,e_1,e_8,e_9}`, and does not imply protected three-dimensional vortex/hopfion, original BFSS Fock vector Spin9 group lift, gauge-invariant physical Noether charge, or new Standard Model particle.

## CI and scope

Strict original-source hash and declaration checks, Lean 4.34.1/Mathlib exact restoration, warnings-as-errors native proof, independent typed Lean consumer, six root axiom reports, source independent integer fixture consumer, archived exact tested commit and every GREEN/RED artifact. No custom axioms, 'sorry', private import, 16x16 gamma expansion, resource override, or modification to original Core, Fock or Hamiltonian.

Stop rule: preserve any RED unqualified, classify error as source/theorem/proof/CI script before patching. The coordinate identification should be P9C1C only after this rank theorem is native-qualified.
