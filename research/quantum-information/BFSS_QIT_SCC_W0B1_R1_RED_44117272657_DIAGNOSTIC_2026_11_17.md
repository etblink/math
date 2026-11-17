# BFSS × QIT × SCC — W0B1 R1 original source RED, strict evidence preserved

Date: 2026-11-17 Pacific. **RED_UNQUALIFIED**. Last-qualified remains original W0B0 R2 strict GREEN [#44109519633](https://github.com/etblink/math/actions/runs/44109519633). No change to mathematically accepted theorems or source interpretation.

## Exact first-causal original failure

- Original strict [run #44117272657](https://github.com/etblink/math/actions/runs/44117272657), job `134158680276`, tested SHA `c486662c149af872a88e97f485befe61fe1522f5`.
- Original W0B1 source Git blob `6c9cae683665fb6cda2a6e8ff10d388f6a268a05`, independent consumer Git blob `9ea114c7f8a8c26b814b3abe9fd5c6a1e853e53a`, strict workflow Git blob `6565dd372ccb5ba6f553242b3180de8de1ac7e21`.
- Frozen original W0B1 contract `77bee50307dce781239c768fc65e281490b205b7`.
- Pinned Lean 4.34.1 and exact Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored; original W0B0 qualified and W0A4 stop ancestry preflight PASS.
- Cold source compilation failed at `P3M4W0B1OriginalFullCliffordCommutantInduction.lean:43:18` with `Unknown identifier map_algebraMap`. The scalar `algebraMap` induction case also produced a type mismatch because the image of the scalar map under `originalComplexCliffordFockAlgEquiv` was not rewritten to the target algebra's `algebraMap`.
- Source `#print axioms` showed `sorryAx` from Lean's incomplete compilation. No source qualification, no independent consumer qualification, no final auditor qualification. This is a proof-interface failure, **not** evidence that Clifford-image commutation is false.

## Provider-original RED evidence

Provider [artifact #14343844353](https://github.com/etblink/math/actions/runs/44117272657/artifacts/14343844353) is 13,688 bytes, SHA-256 `3fd4c088723dae5cee7fdb68db391b482d26e1af5a241b1cb27541b11948b1b9`, Git blob `a448d2ae775926ee05ab4a9028e29e8061fecdac`, stored exactly at `research/quantum-information/diagnostics/BFSS_M4_W0B1_R1_44117272657_RED_evidence.zip`.

Original ZIP members `cold-source.log`, `preflight.log`, `tested-commit.txt` verified by the archiver with CRC and SHA-256; independently fetched full original Actions job log is stored at `research/quantum-information/diagnostics/BFSS_W0B1_R1_44117272657_complete_job.log`, Git blob `7e8310126b2e5af543ec1f7274ce5467dbc59552`, 234,908 bytes, SHA-256 `ff1594dd65f641b566975e80cd550bf63b46070fd8169c1ed228b043e25a0c80`. Machine-readable verification manifest Git blob `a78963305bb75e7ab154f8c40a0c8d5ab7299f29`.

Independent ZIP rehash, byte-identical Git archival and full original log capture: [preservation #44126231073](https://github.com/etblink/math/actions/runs/44126231073) **GREEN**.

## Bounded repair idea, not yet qualified

The exact pinned Mathlib `Mathlib/Algebra/Algebra/Equiv.lean` contains `AlgEquiv.commutes`, which rewrites an `AlgEquiv` applied to the scalar `algebraMap` into its target scalar `algebraMap`. Replace the unknown `map_algebraMap` in the single W0B1 R1 scalar induction case by `AlgEquiv.commutes`. Preserve the W0B1 theorem statement, generator/mul/add cases, accepted W0B0 donor, independently importing consumer, explicit axiom auditor and original source exactness. No proof-resource escalation. The next original strict source and consumer run determines whether this bounded repair qualifies. On a second analogous source RED, stop this induction route, preserve evidence and reconsider the generic algebra adapter architecture.

Retain W0A4 original R1/R2 source RED stop and all previous QIT/QTC negative outcomes. No parity-sensitive W0D or physical BFSS conclusions are promoted by this repair. `main` untouched.
