# ADJ-A2a — original skew-matrix entry adapter to qualified theta-pair theorem

**Date:** 2026-11-21 (America/Los_Angeles). **Scope:** independent source-level original finite-Fock *pairwise* bridge only. This file is a gate contract and launch record, **not** proof qualification.

## Accepted parents and preserved negative knowledge

- ADJ-A0 finite abstract star-skew double-sum theorem: strict GREEN [#44981248994](https://github.com/etblink/math/actions/runs/44981248994), exact `66edb4caf5c59aba3bc3cddb902435f6da3618f7`.
- ADJ-A1 original theta-pair with real typed scalar: strict GREEN [#44982026198](https://github.com/etblink/math/actions/runs/44982026198), exact `5afd9befcc2b16e52cdc991e6d18234d373dfb6f`; original [artifact #14738775824](https://github.com/etblink/math/actions/runs/44982026198/artifacts/14738775824), SHA-256 `a678e6dff92891ef8f72cfa5907970ba4c117deac2b839109bb3b720522a95c5`, both roots only `[propext, Classical.choice, Quot.sound]`.
- D1S3 original physical `fermionCoefficient` skew source GREEN [#44976962312](https://github.com/etblink/math/actions/runs/44976962312).
- D1S4 R1 [#44978109630](https://github.com/etblink/math/actions/runs/44978109630) and R2 [#44979114078](https://github.com/etblink/math/actions/runs/44979114078) remain RED, **FROZEN**. Do not edit or import D1S4; no R3, no `sorry`, no suppression of Lean warnings, no change to original source files.

## Two isolated Lean targets

New original source file `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSAdjointA2aOriginalSkewMatrixEntryThetaPair.lean`, importing only the qualified ADJ-A1 source file (which imports original FermionQuantization). Namespace `FCP.BFSSAdjointA2a`.

1. Original `K : FrequencyMatrix N` entry relation: from `K.transpose = -K`, establish `K r s = -K s r` using the component equation at indices `s r` and `Matrix.transpose_apply`/`Matrix.neg_apply`. This theorem is **outside** any continuous-linear-map expression.
2. Original source pair-star bridge: define `let c : ℝ := K r s` and `let d : ℝ := K s r`. Derive `c=-d` using the first theorem, then **directly apply** `FCP.BFSSAdjointA1.originalThetaPairRealCoefficient_skew M r s c d hcd` on the literal source `M.theta` operator. Use a single expected-type `change` to expose typed scalar locals. No `rw` or `simp` under `K r s` nested in the original Fock operator.

## Strict qualification contract

- New path-scoped strict workflow for the new module and its own workflow file; no edits to source A0/A1, original BFSS, frozen D1S4, main, integration, FCP or RHOPF.
- Original `Core`, `FermionFrequency`, `FermionQuantization`, `FrequencyContraction`, and accepted A1 source SHA pins; Lean `4.34.1`; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Native cold original-source build, warning-as-error Lean recompile, two **exact** `#print axioms` roots, only permitted `propext`, `Classical.choice`, `Quot.sound`, absence of `sorryAx`, and unconditional archive of native/strict/preflight/pins logs with the tested commit.
- **Stop rule:** first RED preserve original diagnostics; one evidence-motivated local repair max; second RED freeze this gate and return to architecture review. A green workflow label alone is insufficient; verify job log, two axiom outputs, tested SHA and original archive before promotion.

## Claim boundary and future work

A2a GREEN will establish the source-exact *pointwise* (K)-coefficient theta-pair star reversal. It does not assemble the source finite double sum (future A2b), prove `M.quantizeFrequency K` self-adjoint (future A2c), qualify an external consumer, or say anything about gauge-physical domain, unbounded Hamiltonian, mass gap, Hopfion, Standard Model or GUT. Preserve the distinction between a proof architecture working and a physical theorem being established.

**Status at authoring:** implementation candidate to be placed under its own exact-source CI; no ADJ-A2a GREEN claimed.
