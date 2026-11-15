# HARDY-G9 R4 — original entry derivative accepted

Reviewed November 15, 2026 Pacific. Verdict: GREEN_QUALIFIED, limited to the six named source adapters below. This is a strict Lean gate receipt, not peer review or a physical conclusion.

[Strict #43681465949](https://github.com/etblink/math/actions/runs/43681465949), attempt 1, job `132712801846`, completed successfully at exact tested commit `e22dda02233c1e703cbb092e2ee705c3b169519a`. The preregistration and R3 red were committed first at `a7196d6248e7cafb5aae57eca6310de7b6a4552f`; [R4 contract](P3_AUX_HARDY_G9_R4_PRE_GATE_REUSE_EXACT_SOURCE_DERIVATIVE_2026_11_14.md), [launch binding](P3_AUX_HARDY_G9_R4_LAUNCH_BINDING_2026_11_14.md).

## Exact qualification

- Preflight: 162 recursively pinned original-source paths; manifest SHA256 `51f5a6eeb0cbaf4bc42c3f4c04a2ec480b5757d2ef3313fe2ec7390ac6b30bf3`.
- Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration PASS; cold original build PASS, 9,084 jobs.
- Early generic finite-operator helper: one report PASS. Early complex matrix-entry helper: three reports PASS. Both include fresh strict warning-as-error compiler invocations.
- Fresh original source: six exact standard-axiom reports PASS. Complete native independent consumer: twelve exact reports and all twelve examples PASS. Final strict scope audit PASS.
- Every audited root uses only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx` or unreviewed compiler warning is accepted.

| Object | Exact blob |
| --- | --- |
| `P3AuxHardyG9OriginalYEntryDerivativeBinding.lean` | `59a1360ee22b9ffa24fdcf018d9c9299a0b9ce11` |
| `P3AuxHardyG9ComplexMatrixEntryDerivative.lean` | `e7904e1edf3af664b3900c31c0757412d495d60c` |
| `BFSSP3AuxHardyG9OriginalYEntryDerivativeBindingIndependentConsumer.lean` | `88aa4d8382e62da727ef81b0f998673fe9f9513d` |
| G9 strict workflow | `5994f52f60019e2a9089131ec68f20ad1cca2f04` |

Artifact `14149490274`, 22,282 bytes: [complete fourteen-file ZIP](diagnostics/P3_AUX_HARDY_G9_R4_43681465949_evidence.zip). Download independently rehashed to SHA256 `4d3cb75b8649dac9d4ed9c3ac81543b1999ebd007fd078712acbe030852cef2e`, matching GitHub's digest. [Independent audit](diagnostics/P3_AUX_HARDY_G9_R4_GREEN_43681465949_AUDIT_2026_11_15.json) records every member hash. Tested SHA, manifest, source/helper/consumer/workflow hashes were checked; the original workflow's final auditor was rerun on the downloaded logs and reproduced the identical scope receipt.

## Accepted declarations and meaning

Namespace: `FCP.BFSSP3AuxHardyG9OriginalYEntryDerivativeBinding`.

1. `originalHardyYEntryCLM`: original complex scalar entry as a real continuous linear map.
2. `originalHardyYEntryCLM_apply`: literal original Y-entry evaluation.
3. `originalHardyY_entry_fderiv`: full real fderiv of that complex entry.
4. `originalHardyTauCoefficientDerivative_eq_basis`: actual G8 coefficient derivative equals the original G3 Y evaluated on the coordinate basis vector.
5. `originalHardyTauCoefficientDerivative_independent_point`: that derivative is independent of base point.
6. `originalHardyTauDerivative_eq_basis`: actual Fock multiplier is the corresponding finite original-theta sum.

The consumer uses literal paired `Boson 2`, `Fermion 2`, `SmoothCore 2` and `FullL2 2` carriers, all color directions, a diagonal-plane control and the accepted G3 real derivative/contraction and G8 product rule. G9 does not by itself contract the kinetic/tau CAR expression.

## Preserved negative knowledge and next obligation

R1/R2 exposed helper entry evaluation and redundant section instances; R3 resolved those helpers but failed the source-function presentation conversion. R4 succeeds by consuming the preceding exact original fderiv theorem and entry evaluation directly. This supports explicit source adapters before asking simplification to cross nested function presentations. All red ZIPs and receipts remain preserved.

Next: separately preregister the source-shaped kinetic/tau CAR contraction, distinguishing the first-order orbital term from the coefficient-derivative fermion term. Reuse the accepted trace and derivative identities, original `theta_CAR` normalization and literal source kinetic coefficients. Keep finite Fock identities, actual smooth-core assembly and closed operator/domain claims separate.

No full charge/tau rotation identity, tau norm, physical Spin(9) sector, singlet-to-spinor covariance, supercharge energy/domain identity, Hardy estimate, fidelity certificate, zero-mode existence theorem or BFSS mass gap is qualified here. The fixed-positive-regulator certificate remains conditional; the physical symmetry/energy-domain audit remains the highest forward-research priority. Original-H M5BF0 and G8 are retained as distinct accepted dependencies.
