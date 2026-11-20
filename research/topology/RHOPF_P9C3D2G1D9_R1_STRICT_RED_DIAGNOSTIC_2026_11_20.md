# RHOPF-P9C3D2G1D9 R1 — independently verified native RED

**Disposition:** REJECTED; **not** strict qualified.  
**Original run:** [#44780087045](https://github.com/etblink/math/actions/runs/44780087045), attempt 1, tested `ccd39d4f052dfd8632cdf4ab08906655b71c1d01`.  
**Original job:** `136440133928`.  
**Original RED artifact:** [#14651843940](https://github.com/etblink/math/actions/runs/44780087045/artifacts/14651843940), independently recomputed ZIP SHA-256 `2367d8006772bd323ebd338987e9abe897defb863777152701442db08b0db32f` exactly equals workflow upload and GitHub artifact metadata; `exact-tested-commit.txt` matches tested SHA; five original entries preserved.

Frozen original Gamma9 source preflight passed, pinned Lean 4.34.1/Mathlib restoration passed, full accepted dependency build completed **9,056 jobs**. The new native D9 failed in the original Lean source at lines 40 and 72 with `Unknown identifier relationalProjector_toLin_idempotent`; independent consumer was skipped. Both native axiom reports include `sorryAx` and **MUST NOT** be accepted.

**Root cause verified against accepted source:** `relationalProjector_toLin_idempotent` is defined in `FCP.RHOPFP9C1B1` in `RHOPFP9C1B1OriginalGammaRelationalRank.lean`, already imported through D9's accepted G1A chain. D9 opens `RHOPFP9C1A`, `RHOPFP9C2A`, `RHOPFP9C3D2G1D8`, but not `FCP.RHOPFP9C1B1`. The exact same visibility defect affects both use sites, which explains the `sorryAx` contamination.

**Bounded recovery:** Add only `open FCP.RHOPFP9C1B1` to the D9 native module, repin its exact Git blob SHA in the G1D9 strict workflow, retain all source-original Gamma9/projection/phase/accepted dependencies and exact toolchain/fixture unchanged; no new axioms, sorry, proof budget, main writes, or mathematical claim. Strict R2 still requires native and independent consumer GREEN, clean axioms, and independent archive checksum verification.
