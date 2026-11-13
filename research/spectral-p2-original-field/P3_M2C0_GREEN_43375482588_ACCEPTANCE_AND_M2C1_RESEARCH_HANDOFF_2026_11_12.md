# P3-M2C0 — GREEN acceptance and M2C1 norm-bound research handoff
**Recorded:** 2026-11-12 Pacific / 2026-11-13 UTC. **Project Lead verdict:** ACCEPT three exact original-source declarations; no operator-norm L² isometry or spectral promotion.

## Exact immutable qualification evidence
- [Strict run #43375482588](https://github.com/etblink/math/actions/runs/43375482588) completed SUCCESS first attempt at source SHA `548d7978779e0a9ca5a91e01fccb686a786640f1`, job `131720874325`.
- **94 of 94 exact source/independent-consumer Git blob pins** passed, inheriting 92 accepted predecessor files byte-identically. Lean **4.34.1**, Mathlib **d13f23b723b8a846827a245b89c10fc7d3f11612**, cold source build **9,209 successful jobs**, independent original Boson2/Fermion2 Fock-column consumer and source warnings-as-errors all PASS.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M2C0OriginalFockOperatorLpColumns.lean`, blob `db2bf9530b1fad0bd539a37cc7ef15fba798a409`. Independent consumer `lean/diagnostics/BFSSP3M2C0OriginalFockOperatorLpColumnsIndependentConsumer.lean`, blob `477ea9fd2baf5af9c53f61a4bbff928735222209`. Strict workflow blob `f21c7dc919a237ccfc117cf1e9b79eaa6bfacd17`.
- Actual CI log markers: `BFSS_P3_M2C0_ORIGINAL_OPERATOR_94_PIN_PREFLIGHT_PASS`, `BFSS_P3_M2C0_ORIGINAL_OPERATOR_FOCK_LP_COLUMNS_STRICT_GREEN`.
- Three named source and independent consumer `#print axioms` reports: only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`.
- Retained evidence artifact **14014294726**, 22,829 bytes, digest `sha256:0e35b0e2d8fafd8c4da16d5dafd23c4cae31394f70489454ad6668771986d702`. Separate administrative [roadmap watchdog #43375482581](https://github.com/etblink/math/actions/runs/43375482581) GREEN at candidate source SHA.

## Exactly accepted declarations
1. `FCP.BFSSP3M2C0OriginalFockOperatorLpColumns.originalFockOperatorLpColumnsEquiv`
2. `FCP.BFSSP3M2C0OriginalFockOperatorLpColumns.originalFockOperatorLpColumnsEquiv_apply_ae`
3. `FCP.BFSSP3M2C0OriginalFockOperatorLpColumns.originalFockOperatorLpColumnsEquiv_symm_apply_apply`

Actual original source:
```lean
OriginalFockOperatorLp =
  Lp (Fermion 2 →L[ℂ] Fermion 2) 2 (volume : Measure (Boson 2))
originalFockOperatorLpColumnsEquiv
  (b : OrthonormalBasis ι ℂ (Fermion 2)) :
  OriginalFockOperatorLp ≃L[ℂ]
    PiLp 2 (fun _ : ι =>
      Lp (Fermion 2) 2 (volume : Measure (Boson 2)))
```
The equivalence preserves the **original bounded-operator norm on its domain**, versus the **separately normed genuine source Fock-vector Hilbert columns**. The per-column a.e. law evaluates `(f x) (b i)`; the inverse reconstructs the original operator-valued `Lp` class. Independent consumer uses actual `Fin (2 ^ (8 * colorDim 2))` source Fock basis and both inverse class equations without basis enumeration.

## Prospective chronology and negative knowledge
- [M2C0 prospective source/evidence receipt](P3_M2C0_PROSPECTIVE_SOURCE_OPERATOR_TO_GENUINE_FOCK_LP_COLUMNS_RECEIPT_2026_11_12.md) committed `bc58467e0e0008ea7a0ae173769c291e7961a713` before source candidate `548d7978779e0a9ca5a91e01fccb686a786640f1`.
- M2C0 source reused B2 [#43371757607](https://github.com/etblink/math/actions/runs/43371757607) true original bounded operator `Lp` continuous equivalence and M2B1 [#43356859031](https://github.com/etblink/math/actions/runs/43356859031) true source Fock-vector HS-field isometry. No source carrier replacement, heartbeat escalation or finite basis enumeration.
- Prior B2 metadata-only watchdog red remains an administrative incident, not a Lean theorem failure. B2 and M2C0 strict tested proof blobs are untouched.

## Next P3-M2C1 — RESEARCH ONLY; NO LEAN SOURCE STAGED
Use accepted M2B2A original bounded operator/HS **fiber norm inequalities**, B1/B2 Lp-field transport and M2B1 source isometric columns to prove the field-level source inequalities:
```text
‖f‖_(original operator-valued L²) ≤ ‖C_b f‖_(PiLp2 Fock-vector L² columns)
‖C_b f‖_(PiLp2 columns) ≤ √(Fintype.card ι) * ‖f‖_(original operator-valued L²).
```
For the literal Fock basis `Fin (2^24)` the upper factor is mathematically `4096`, but **no 4096-specific Lean theorem has been qualified**. Check pinned `ContinuousLinearMap.norm_compLp_le`, the actual `Lp` norm APIs and finite original Fock bounds before staging. Split into separate lower/upper microgates if appropriate; commit a prospective receipt and independent original Fock consumer before any source.

## Physical route boundary
- [M2C0→M3/M5 source-reuse memo](P3_M2C0_TO_M3_M5_SOURCE_REUSE_AND_DOMAIN_GUARDRAILS_2026_11_12.md) identifies original `FullL2 2` left-output SU2 gauge action, fixedness and unitary candidate donors. Their current-tree exact qualification provenance must be checked before M3 promotion; operator conjugation is the wrong action for this source column-by-column route.
- Historical original BA–BH physical Hamiltonian gates were GREEN at original FCP commits; modified current BE/BF/BG/BH port source bytes require independent strict requalification before relying on source self-adjointness/domain. Bounded continuous equivalence alone does not transport adjoints or Hamiltonian self-adjointness.
- No M3 physical fixed-space equivalence, M4 original Spin(9) continuity/central parity, M5 closed physical H natural domain, or M6–M8 spectral/mass-gap results are accepted by M2C0.

**Project Lead decision:** ACCEPT M2C0; next M2C1 research-only with prospective source-evidence receipt, no changes to `main`, qualified proof blobs, or frozen monograph.