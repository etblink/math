# BFSS × QIT × SCC W0C2B2 R2 — opaque original Fock commutator-subtraction proof repair

Date: 2026-11-18 Pacific. **Prospective, not qualified.** Unified integration branch only; no edits to accepted donors or `main`.

## Exact R1 causal failure and independently archived evidence

Original [W0C2B2 R1 strict #44274131658](https://github.com/etblink/math/actions/runs/44274131658) completed **NATIVE SOURCE RED**, tested commit `8dc20592dc7739d3b7a5438bed945efb2c6d720e`, job `134697829384`. Exact donor SHA preflight and pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restore PASS. Native source failed at `P3M4W0C2B2OriginalSource48KLieDefectGammaCentrality.lean:137:6` with `(kernel) deterministic timeout` during expanded `abel`; the dependent proof failed with an unknown generated `_abel_1_1` constant. The first two source theorem roots, native skew K(A) complex gamma covariance and K-bracket covariance, had permitted `propext, Classical.choice, Quot.sound` axioms. The defective gamma-zero and all-48 centrality roots were NOT qualified. Independent importing consumer never ran.

R1 immutable source blob `aae0746f002b1c74bf7712c59d7b5abfe4c8019a`, consumer blob `69f06d3c451f9a2ca09ff49fb1c752ad49033544`, strict workflow blob `776f5fc85b18fa1d74433f66f0604fd62ee5fd56`.

Original provider artifact #14414399337 ZIP 20,357 bytes SHA-256 `44c16b6bf846278c43ddb2d262d16e3a14c7643c6d22d3b6e5e2ad570c34c50a`; independent evidence [#44279294974](https://github.com/etblink/math/actions/runs/44279294974) **GREEN**, Git commit `3812602415b2b3069b2a0120dd47050aa0abff13`. Git-pinned original ZIP `research/quantum-information/diagnostics/BFSS_M4_W0C2B2_R1_44274131658_NATIVE_RED_evidence.zip` blob `12b5843b116bae63e2183049cae572cb1fcc051b`; full job transcript blob `782ad9cbaa7f55be2592b8f1ca9bd5c9ad6e0481`, 337,919 bytes SHA-256 `138c178baacb34515be63321227f42e2465a29d4e614dc04ad655b54c329383e`; six?-member count actually **three original provider ZIP members** (preflight.log, cold-source.log, tested-commit.txt), per-member SHA256/CRC manifest blob `18a759d4ba00b6e818ef445d0333e0342a77e010`. Retain the provider's three-member evidence without modification.

This is **one comparable native RED** for W0C2B2, not a harness failure. The original real-coefficient W0C2B0 two-native-RED architecture remains stopped; original B1 R1 native RED remains archived.

## Exact bounded repair — no theorem statement changes

Keep R1 four *public* root theorem statements byte-for-byte, retaining original `Fermion 2 →L[ℂ] Fermion 2` carrier, original `Source48Label`, `originalSource48BivectorK`, `originalSource48K_lieDefect`, and real transpose-skew hypotheses.

The only R2 proof-architecture change is to add an opaque original Fock helper:

```lean
private theorem originalFock_commutator_sub (P Q X : Op) :
    (P - Q) * X - X * (P - Q) =
    (P * X - X * P) - (Q * X - X * Q) := by
  simp only [sub_mul, mul_sub]
  abel
```

Then *only* replace R1's expanded source-specific subtraction proof's `unfold originalSource48K_lieDefect; simp only [sub_mul, mul_sub]; abel` with `exact originalFock_commutator_sub (K(A)*K(B)-K(B)*K(A)) (K(AB-BA)) Γ_k`. The complex coefficient contraction and gamma covariance proofs remain unchanged, the original R1 files untouched. The helper normalizes **three opaque original Fock operators** with no unfolding of source K or gamma; its theorem body is verified independently by the strict native build, not assumed.

New separate `P3M4W0C2B2OriginalSource48KLieDefectGammaCentralityR2.lean`, independent source-importing consumer `BFSSP3M4W0C2B2OriginalSource48KLieDefectGammaCentralityIndependentConsumerR2.lean`, and isolated strict workflow. **Four published source axiom roots** and four consumer roots, four native original Fock/Source48 controls, six negative auditor mutants. The private helper is additionally checked by an optional `#print axioms`? Do **not** expand the strict four-root contract; verify via the public root dependencies. Only accepted `propext`, `Classical.choice`, `Quot.sound`, no `sorry`/unexpected warnings, increased recursion/heartbeats, fake commutativity, or donor edits.

If R2 is a second comparable NATIVE RED, independently archive provider ZIP/full job/manifest and **STOP** this expanded B2 architecture. Do not silently stage R3. A harness-only RED does not count as a native failure.

## Original accepted ancestry and eventual claim ceiling

Predecessor W0C2B1 R2 exact source strict [#44267283653](https://github.com/etblink/math/actions/runs/44267283653) GREEN, independent archive #44269104447 GREEN, canonical accept `69e30339d8a323785acdcf1000a4c7aa1d99b641`, post-acceptance roadmap [#44269796901](https://github.com/etblink/math/actions/runs/44269796901) GREEN. **27 immutable anchors**. Original W0C2A conditional Lie-defect theorem, LB1C1 original skew K/gamma covariance, B0M coefficient contraction, B0N real-complex transport remain pinned.

If R2 native source+consumer GREEN, preserve provider-original ZIP/full Actions log and per-member SHA256/CRC independently; only then promote **28th** anchor and run post-acceptance roadmap guard. **W0C2B3 unconditional skew-`K(A)` bracket remains PROSPECTIVE_NOT_STAGED**, and physical Spin(9), gauge admissibility, ground state, spectral gap, mass gap, and SCC operational conclusions remain unproved.
