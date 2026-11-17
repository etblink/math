# BFSS × QIT × SCC W0A4 R2 — single namespace-resolution repair contract

Date: 2026-11-17 Pacific. **Pre-gate repair contract; R2 UNQUALIFIED.** Unified integration branch only. Original W0A4 R1 source, consumer, tested commit, failure and provider-original ZIP remain immutable in Git.

## Accepted predecessor and original RED

W0A3 R1 [strict green #44051746176](https://github.com/etblink/math/actions/runs/44051746176) is the *last-qualified* gate. W0A4 R1 [strict red #44055363556](https://github.com/etblink/math/actions/runs/44055363556), tested `14b96aca0d455098fcd54486840f3b905eda2dd7`, original source Git blob `606fcdd173d4c31f191d29e7de53a742cdcbf1aa`, consumer blob `18fec08b3259513e63deff44319eb90b759b6b5f`.

Original R1 ZIP artifact #14316043341 SHA-256 `7deda8b0723841d8a35e19dd8587211254b7e3a8cebaa317918321a54d96dcb6`, byte-identical Git blob `ef3ad039799680fde9f0d1669f130ef275f9a2a3` preserved through independent [GREEN archival run #44058037250](https://github.com/etblink/math/actions/runs/44058037250). Original complete job log blob `6f635122f8ab1a3078851aac68214462a4124488`.

R1 original source errors: line 34:2 unknown identifier `AlgebraTensorModule.lift`; line 48:2 failed `change` tactic while evaluating the not-constructed map. Pinned Mathlib `Mathlib/LinearAlgebra/TensorProduct/Tower.lean` line 51 opens `namespace TensorProduct`, line 53 opens `namespace AlgebraTensorModule`, line 110 defines the qualified function `TensorProduct.AlgebraTensorModule.lift`. This is an exact namespace mismatch, not a mathematical counterexample.

## R2 fixed mathematical first atom

**Single allowed source edit**:

```diff
-  AlgebraTensorModule.lift
+  TensorProduct.AlgebraTensorModule.lift
```

Expected R2 original source Git blob `489d71f3ac7d51f19caf45bd89640b646e9ca882`. All remaining source bytes are identical to R1. The original consumer is **unchanged** at `18fec08b3259513e63deff44319eb90b759b6b5f`. Do not change theorem statements, import set, mathematical assumptions, Fock carrier, scalar field, sigma conventions, original source gamma or Lean resource budgets.

R2 must strict qualify two public roots `activeGammaComplexLinear_tmul` and `originalComplexEquiv_allComplexGenerators_eq_activeGamma`, plus exactly two independently imported consumer roots and two controls. Pinned Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, donor byte pins, six negative auditor mutations, warning-as-error, original provider ZIP, member-level SHA-256 and complete workflow log evidence are mandatory.

## Stop rule and claim ceiling

If R2 fails in an analogous definitional/elaboration/type issue, it is the second analogous RED. STOP this architecture, preserve the full original source/consumer evidence and explicitly investigate a generic heterogeneous tensor map adapter; do not loop tactics, add axioms, use substitute Fock representation, or increase `maxRecDepth`/`maxHeartbeats`. If R2 GREEN, separately rehash/commit its original provider ZIP and promote W0A4 *only after* canonical acceptance and roadmap GREEN.

W0B0, W0B1, W0B2, W0C, full W0 witness, original K(A) Lie bracket and BFSS physical spectrum remain open; do not promote while R2 is pending. `main` untouched.
