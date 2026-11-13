# P3-AUX-G0B2 R2 — repair strict preflight false positive without weakening checks

**Date:** 2026-11-13 Pacific. **Status:** R2 PROSPECTIVE/UNQUALIFIED pending full strict Lean source+consumer+root audit.

R1 [strict RED #43530051259](https://github.com/etblink/math/actions/runs/43530051259) failed at Python preflight assertion line 21: the source comment line beginning `axiom audit pass` was matched by the strict source-token scan (`^\s*(sorry|admit|axiom|unsafe)\b`). The initial cold Lean source and consumer were **never compiled** in R1. [Immutable first-causal ledger](P3_AUX_G0B2_R1_RED_43530051259_FIRST_CAUSAL_2026_11_13.md), artifact #14086443357.

## One substantive administrative scope correction

1. In new G0B2 source's **documentation header only**, change `axiom audit pass` to `standard proof audit pass`. Exact theorem statement, type, proof steps, original `pairedGaugeData.fiberAction` and pinned `FullL2 2` remain byte-identical.
2. In the new G0B2 strict workflow, correct the inherited evidence directory and artifact name from `bfss-aux-g0b1-evidence` to `bfss-aux-g0b2-evidence`. No change to allowed axioms, root checks, source checks, toolchain pins, or CI failure handling. Exact source/consumer paths unchanged.
3. Keep the original native independent consumer blob `55fbf74c19b3224faa1db25a956ace44f4aa3a99` **unchanged**.

Do not promote G0B2 based on the preflight repair. Require new strict source+consumer+sole root allowed-axiom audit GREEN. No physicalSpace preservation or auxiliary Hamiltonian or spectral gap. All previously accepted original R0A/R0B1/R0B2A/G0A/G0B0/G0B1 and original M5BF0 remain intact.
