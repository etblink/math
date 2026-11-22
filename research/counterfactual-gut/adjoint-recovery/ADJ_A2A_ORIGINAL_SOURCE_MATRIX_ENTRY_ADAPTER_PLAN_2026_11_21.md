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



## Original implementation and CI launch receipt

Proof source [commit `8bf22fd72c1fe6c6315cfa46307da0c83927847c`](https://github.com/etblink/math/commit/8bf22fd72c1fe6c6315cfa46307da0c83927847c). Workflow initially created at `7547cfb1627a7925b9d1be3b94e7efa1e103d2e2`, then an independent preflight review found that the inherited source import expectation was `OAI.MathematicalPhysics.BFSS.FermionQuantization` whereas the new source imports qualified `OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSAdjointA1OriginalThetaPairRealScalarStar`. Corrected workflow-only in `45e51eab58ddd5e39cca48125420484cd6e6774d` without altering the Lean proof. Initial [run #44983114717](https://github.com/etblink/math/actions/runs/44983114717) at the earlier workflow commit cancelled via concurrency, not a Lean RED. Active strict [run #44983132507](https://github.com/etblink/math/actions/runs/44983132507) at exact SHA `45e51eab58ddd5e39cca48125420484cd6e6774d` **PENDING** at launch. Native/strict logs, two `#print axioms` roots, expected source pins, and original artifact require independent review before promotion. No A2a theorem is accepted merely because the workflow was launched.


## Independently verified strict R1 outcome — QUALIFIED GREEN

[Run #44983132507](https://github.com/etblink/math/actions/runs/44983132507), job `137087817244`, exact tested `45e51eab58ddd5e39cca48125420484cd6e6774d` **completed/success**. Frozen original BFSS source preflight, pinned Lean `4.34.1`/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, 8,953-job native original-source build, strict warning-as-error recompile, and two theorem `#print axioms` roots all PASS. Both `FCP.BFSSAdjointA2a.originalSkewFrequencyMatrix_entry` and `FCP.BFSSAdjointA2a.originalSkewFrequencyMatrix_thetaPair_star` depend only on `[propext, Classical.choice, Quot.sound]`. Required `BFSS_ADJ_A2A_SOURCE_ONLY_STRICT_GREEN` sentinel PASS. Original artifact [#14738512689](https://github.com/etblink/math/actions/runs/44983132507/artifacts/14738512689) 5,878 bytes, six files; SHA-256 independently recomputed `6dcd3270fc0ab70216a490013467b8a0c4811b1f50a9f1fdd8cbb4a5a0abd17b`, exact match to GitHub; archived tested SHA matches. Source Git blob `dc7b35d295af72109f600da06098ae752971e60f`.

**Accepted narrowly:** original source real skew-matrix entry identity and corresponding pointwise original theta-pair star reversal, assembled via separately typed `c,d`. This is not `M.quantizeFrequency K` self-adjointness or an unbounded physical Hamiltonian theorem. D1S4 remains frozen after two original strict REDs. ADJ-A2b finite sum and ADJ-A2c physical exact quantizer are outstanding, with separate CI qualifications required.
