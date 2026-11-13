# P3-M2B1 — exact original-Fock HS L² field qualification
**Recorded:** 2026-11-12 Pacific / strict workflow completed 2026-11-13 UTC
**Status:** GREEN ACCEPTED, exactly seven declarations, no operator-valued L² reconstruction or physical spectral claim.

## Strict original-source evidence
- [GitHub Actions #43356859031](https://github.com/etblink/math/actions/runs/43356859031) `completed/success`, run attempt 1, tested immutable source commit **`f3d741f8aedd9dbda5839e768e9d6bb41a0bcfb6`**.
- `source-and-independent-consumer` job **131660824165**. 83/83 unique exact source+consumer blob pins; Lean **4.34.1**, Mathlib **d13f23b723b8a846827a245b89c10fc7d3f11612**, 9,185-job cold Lake build, source warning-as-error compile, separate source-Fock consumer warning-as-error and seven complete `#print axioms` reports (each on source and independent consumer) all SUCCESS.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M2B1OriginalFockHSFieldColumns.lean`, Git blob **`e51e9db6d99adfdd9b077ffb846aef6155fecac6`**. Independent consumer `lean/diagnostics/BFSSP3M2B1OriginalFockHSFieldColumnsIndependentConsumer.lean`, Git blob **`01a72e91bbf8afd1f39d9083224220d6a6480b3d`**.
- Evidence artifact **14007023123**, digest `sha256:ff57500c180104e482f904b3e747d8d4594986854f81e28a05d7777949f2cf39`; strict preflight marker `BFSS_P3_M2B1_ORIGINAL_FOCK_83_PIN_PREFLIGHT_PASS`; strict final marker `BFSS_P3_M2B1_ORIGINAL_FOCK_HS_L2_FIELD_STRICT_GREEN`.
- Seven source declaration axiom inventories contain only `propext`, `Classical.choice`, `Quot.sound`. No `sorryAx`, new axiom, extra elaboration-limit flags or changed original representation.

## Exactly accepted source declarations
1. `FCP.BFSSP3M2B1OriginalFockHSFieldColumns.originalFockHSField_memLp_iff`
2. `FCP.BFSSP3M2B1OriginalFockHSFieldColumns.originalFockHSFieldColumnsEquiv`
3. `FCP.BFSSP3M2B1OriginalFockHSFieldColumns.originalFockHSFieldColumnsEquiv_apply`
4. `FCP.BFSSP3M2B1OriginalFockHSFieldColumns.originalFockHSFieldColumnsEquiv_apply_ae`
5. `FCP.BFSSP3M2B1OriginalFockHSFieldColumns.originalFockHSFieldColumnsEquiv_symm_apply_apply`
6. `FCP.BFSSP3M2B1OriginalFockHSFieldColumns.originalFockHSFieldColumnsEquiv_apply_symm_apply`
7. `FCP.BFSSP3M2B1OriginalFockHSFieldColumns.originalFockHSFieldColumnsEquiv_norm`

The accepted isometric equivalence is
`Lp (OriginalFockHSFiber ι) 2 μ ≃ₗᵢ[ℂ] PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ)`,
where `OriginalFockHSFiber` remains the transparent M2A **`PiLp 2` Hilbert-column carrier**. The source `Boson 2` volume consumer and concrete `EuclideanSpace.basisFun` original Fock basis compile; the a.e. component evaluation, forward projection, inverse laws, and HS-field norm identity are accepted.

**Nonclaims:** No isometry of the original `Fermion 2 →L[ℂ] Fermion 2` **operator norm** with HS norm; no a.e. measurable original bounded-operator reconstruction, physical gauge fixed space, continuous Spin9 original source action, closed Hamiltonian graph/form, reducing sectors, compact resolvent, eigenpair or mass gap.

## Research/workflow provenance
- First staged `f3d741f8`. Later checkpoint-only `b93dcd4f`, process-only `f85563e6` and acceptance documentation changes do not alter the tested proof SHA or pin manifest. Do not infer new qualification on later HEADs.
- [M2B1 retrospective pre-gate receipt](P3_M2B1_RETROSPECTIVE_PRE_GATE_EVIDENCE_RECEIPT_2026_11_12.md) documents original donor retrieval and explicitly acknowledges that it was written after candidate staging; this is a protocol correction, not a false chronological claim.
- [Operating efficiency review](../methodology/BFSS_P3_OPERATING_EFFICIENCY_EVIDENCE_REVIEW_2026_11_12.md) and its source-drift watcher control are administrative, not Lean acceptance evidence.

## Next bounded research obligation — P3-M2B2A, NOT STAGED
Prove on the actual original `Fermion 2 →L[ℂ] Fermion 2` source, with its existing operator norm and source orthonormal basis `b`, the comparison
```
‖T‖ ≤ ‖originalFockOperatorToHSFiber b T‖
‖originalFockOperatorToHSFiber b T‖ ≤ sqrt(card ι) * ‖T‖
```
after verifying exact donor theorem types in pinned Mathlib and `openai/math`. The concrete original source dimension is `2^24`, giving prospective upper constant `4096`, but this is **not yet Lean qualified**. M2B2B would address actual source-operator-valued L² measurable/a.e. reconstruction as an independent gate. M3–M8 remain unqualified. Complete a **prospective**, not retrospective, pre-gate receipt before M2B2A source staging.
