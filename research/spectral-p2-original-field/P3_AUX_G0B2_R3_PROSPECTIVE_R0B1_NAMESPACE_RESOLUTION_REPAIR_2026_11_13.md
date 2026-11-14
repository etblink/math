# P3-AUX-G0B2 R3 — native reciprocal field namespace repair

**Date:** November 13, 2026 (Pacific). **Verdict:** STAGED/UNQUALIFIED until new strict source and native independent-consumer green.

R2 [#43530462404](https://github.com/etblink/math/actions/runs/43530462404), tested `ff8037b400fa66a2aad3db021156917374c47b0f`, passed original frozen-source/toolchain preflight, but failed source lines 47,49,52,54 with `Unknown identifier originalReciprocalField`; the consequent unsolved goal and `sorryAx` do not constitute a valid qualification. [Immutable R2 first-causal ledger](P3_AUX_G0B2_R2_RED_43530462404_FIRST_CAUSAL_2026_11_13.md), artifact #14088315554.

**Only source proof-environment change:** add `open FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity` in `P3AuxG0B2OriginalReciprocalFermionGaugeCommutation.lean` after its original G4J namespace open. The original real/complex scalar `originalReciprocalField` exists in accepted R0B1 and is imported transitively; this simply enables unqualified reference resolution.

The original theorem statement, all proof tactics, true `FullL2 2`, original `pairedGaugeData.fiberAction g`, source Fock representation and measure, independent consumer blob `55fbf74c19b3224faa1db25a956ace44f4aa3a99`, strict workflow blob `087b3e41734876309f884db9da5d3f8d6a8977a0`, and accepted source hash freezes are unchanged.

R1 [#43530051259](https://github.com/etblink/math/actions/runs/43530051259) remains the separate preflight-comment false positive; R2 the actual name-resolution failure. Neither is a mathematical disproof. Only a complete fresh strict GREEN source+consumer+allowed-axiom root can qualify G0B2. G0B3 physicalSpace, Noether generator, weighted 16-charge and spectral results remain unproved.
