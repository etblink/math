# P3-M2C1 — prospective evidence receipt: true original operator-valued L² to Fock-column L² two-sided norm bounds
**Recorded:** 2026-11-12 Pacific / 2026-11-13 UTC. **Status:** BEFORE ANY M2C1 LEAN SOURCE OR CONSUMER. No new mathematical result claimed.
**Canonical branch/head at pre-gate analysis:** `integration/bfss-unified-research-20261108`, `b3430dfe7a16d5cc6438e49ac463cc793e845f1f`.

## A. Exact original-source carrier and proposed two declarations
Keep `F := Fermion 2 = EuclideanSpace ℂ (Fin (2^(8*colorDim 2)))`, `X := Boson 2`, `μ := (volume : Measure (Boson 2))`, and the ORIGINAL operator-norm source `OriginalFockOperatorLp := Lp (F →L[ℂ] F) 2 μ`. The accepted M2C0 map `C_b := originalFockOperatorLpColumnsEquiv b` is a `≃L[ℂ]` into the separate Hilbert PiLp2 of original `Lp F 2 μ` columns.
**Only proposed statements:**
```lean
‖f‖ ≤ ‖originalFockOperatorLpColumnsEquiv b f‖
‖originalFockOperatorLpColumnsEquiv b f‖ ≤
  Real.sqrt (Fintype.card ι : ℝ) * ‖f‖
```
for any finite original Fock ONB `b : OrthonormalBasis ι ℂ F`. In literal original `Fin (2^24)` source the upper constant is mathematically 4096; that numerical Lean specialization is NOT part of this minimal gate. Crucially no equality/isometry between the source operator-norm Lp and the HS Hilbert column Lp is asserted.

## B. Exact original source and pinned donor matrix
| Candidate | Exact source evidence | Transfer obligation |
|---|---|---|
| M2C0 `originalFockOperatorLpColumnsEquiv` | Source `P3M2C0OriginalFockOperatorLpColumns.lean` exact blob `db2bf9530b1fad0bd539a37cc7ef15fba798a409`; [strict #43375482588](https://github.com/etblink/math/actions/runs/43375482588), source SHA `548d7978779e0a9ca5a91e01fccb686a786640f1` | genuine original operator-norm Lp → source Fock-vector columns **CONTINUOUS**, not isometric
| M2B2A finite-fiber `originalFockOperator_norm_le_hs` and `originalFockOperator_hs_le_sqrt_card_mul_norm` | Source `P3M2B2AOriginalFockOperatorHSNorm.lean` blob `14692ec746de15615e3cb7fce0323af3212589df`, [strict #43361307455](https://github.com/etblink/math/actions/runs/43361307455) | pointwise source operator norm and HS fiber norm, two-sided constants `1` and `sqrt(card ι)`
| B2 `originalFockOperatorLpHSContinuousEquiv_apply_ae` | Source `P3M2B2B2OriginalOperatorLpContinuousEquiv.lean` blob `7bab48f3da13633049afe94100bcde80e2be0c27`, [strict #43371757607](https://github.com/etblink/math/actions/runs/43371757607) | original `Boson 2` operator-valued Lp field pointwise HS column equals literal source `originalFockOperatorHSContinuousEquiv b (f x)` almost everywhere
| M2B1 `originalFockHSFieldColumnsEquiv_norm` | Source `P3M2B1OriginalFockHSFieldColumns.lean` blob `e51e9db6d99adfdd9b077ffb846aef6155fecac6`, [strict #43356859031](https://github.com/etblink/math/actions/runs/43356859031) | exact norm identity of HS-field Lp with true PiLp2 of Fock Lp columns; NOT original operator-norm isometry
| Pinned Mathlib `Lp.norm_le_norm_of_ae_le` | `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean` at rev `d13f23b723b8a846827a245b89c10fc7d3f11612`, line 357 | once `∀ᵐ x, ‖f x‖ ≤ ‖(B2 b f) x‖`, conclude whole-field lower norm comparison
| Pinned Mathlib `Lp.norm_le_mul_norm_of_ae_le_mul` | same exact pinned Mathlib source, lines 348–355 | once `∀ᵐ x, ‖(B2 b f) x‖ ≤ sqrt(card ι) * ‖f x‖`, conclude whole-field upper norm bound directly
| B0 original `originalFockOperatorHSContinuousEquiv` | Source `P3M2B2B0OriginalFockOperatorHSContinuousEquiv.lean`, blob `3344283458bce762149d2ef00c445b1608bdb725`, strict [#43364964618](https://github.com/etblink/math/actions/runs/43364964618) | source finite-fiber map definitionally agrees with M2B2A original `originalFockOperatorToHSFiber` in both inequalities

## C. Proof plan and smallest independently consumed gate
1. Minimal source imports qualified M2C0 and pinned Mathlib LpSpace.Basic; existing M2C0 imports B2 and M2B1, B0 and M2B2A transitively. Use accepted namespace names, no new source Fock carrier or norm instance.
2. Prove tiny local norm identity `‖originalFockOperatorLpColumnsEquiv b f‖ = ‖originalFockOperatorLpHSContinuousEquiv b f‖` by unfolding M2C0 composite **once** and calling accepted `originalFockHSFieldColumnsEquiv_norm`.
3. For the lower bound, obtain B2's `=ᵐ[volume]` forward representative, transport M2B2A's `‖T‖ ≤ ‖originalFockOperatorToHSFiber b T‖` pointwise, then use pinned `Lp.norm_le_norm_of_ae_le`. Rewrite with the tiny composite norm identity.
4. For the upper bound, use the other M2B2A pointwise `sqrt(card ι)` norm bound through exactly the same a.e. source representative, then pinned `Lp.norm_le_mul_norm_of_ae_le_mul`. Rewrite with source/composite norm identity.
5. Independent consumer requires genuine `OriginalFockOperatorLp` over actual `Boson 2` volume, source `Fermion 2 →L[ℂ] Fermion 2`, explicit canonical `EuclideanSpace.basisFun` with `OriginalFockIndex := Fin (2 ^ (8 * colorDim 2))`, and each public source theorem; audit explicit source and consumer `#print axioms` declarations. No actual enumeration.
6. Strict workflow inherit **94 exact M2C0 predecessor pins** unchanged plus M2C1 source and independent consumer (**96 distinct pins**), pinned Lean 4.34.1 and pinned Mathlib revision, full cold build, consumer warning-as-error, only `propext`, `Classical.choice`, `Quot.sound` and immutable evidence artifact; later qualified status requires a full strict green at SAME source SHA.

## D. First-causal negative knowledge, search scope, falsifiers
Reviewed current B2/M2B1/M2B2A/M2C0 exact Lean sources and job evidence, original B0 finite fiber, exact pinned Mathlib LpSpace.Basic norm comparison signatures, roadmap operating-efficiency ledger and previous manifest/opaque-def/administrative-watchdog reds. Historical M2A duplicate manifest R1, opaque def R2 and later administrative B2 acceptance SHA field RED demonstrate why this prospective receipt and explicit 96 unique pins matter. No exhaustive FCP historical branch checkout or local 9,000-job Lean build was performed; no global novelty claim.
Falsifiers: a.e. normalization mismatch; definally unequal normed source (operator norm accidentally replaced with HS norm); `Lp` coercion/namespace failure; composite `norm_map` fails because of wrong orientation; proof only checks abstract HS fields and omits true original bounded operator `Lp`; concurrent branch/drift manifest; source no longer imports exact accepted modules. After two analogous reds preserve first causal logs and split lower/upper inequalities rather than tactic cycling or increasing heartbeats.

## E. Project Lead decision
**CONDITIONAL GO** for one bounded two-inequality source-exact gate after this prospective receipt commit. No M3 left-output SU2 fixed-sector, M4 Spin9, M5 original Hamiltonian or M6–M8 spectral claim is licensed; historical FCP BA–BH operator-domain port still needs current-source requalification. Do not modify `main`, accepted previous mathematical sources, monograph, original FCP historical proofs, or introduce new infrastructure.
