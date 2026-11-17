# BFSS W0A0 R1 — strict RED: dependent Pi.single elaboration, not mathematical counterexample

Date: 2026-11-16 Pacific. **RED / UNQUALIFIED.** Exact run [#44033364617](https://github.com/etblink/math/actions/runs/44033364617), job `133870414373`, tested commit `d4f6c7a090ffba44ba7f091c831e568aba154c26`, conclusion `failure`.

## Qualified phases vs failed boundary

- Source/consumer and existing qualified donor Git blob preflight PASSED.
- Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration PASSED.
- Native cold source `P3M4W0A0OriginalSourceAxisWitness.lean:38:18` FAILED with `Application type mismatch` on untyped `Pi.single p (1 : ℝ)`, whose result dependent family was inferred as `?m.67 p`.
- Source root printed `sorryAx`; independent consumer and source/consumer allowed-axiom audit were NOT EXECUTED.
- The exact W0A0 theorem statement was not refuted. OP3-A2 and M3I qualified ancestors untouched; QTC1G0 #44024718712 remains last qualified.

## Source-exact causal account

Inside the local proof `haxis` an unannotated `change Pi.single ... = Pi.single p (1 : ℝ)` is too ambiguous for Lean's dependent `Pi.single` elaboration, despite the mathematical equality of source labels already established as `hlabel`. The next bounded repair must use `congrArg` with a fully typed codomain `Source48Vector` and an exact `sourceBlockColorAxis` unfolding. Do not revise the theorem, crosswalk, source objects, Fock module, approved axioms, or resource limits.

## Preserved evidence and integrity ceiling

- Original provider artifact [#14307206335](https://github.com/etblink/math/actions/runs/44033364617/artifacts/14307206335), **13,299 bytes**, SHA-256 `e805e4eb1515a045031768794d1cb74786b3c64c0caff708f16fac80db45b58b` independently rehashed after download; ZIP integrity `testzip(): None`.
- ZIP contains exactly `cold-source.log` (147,342 bytes, SHA-256 `29c06c7db965a99116bbf8d5d8744c9fb79eef0785627daaeaeb3e0b18a69227`), `preflight.log` (60 bytes, SHA-256 `0c875b9eaa7d76fe8facd26b24b126f49448087707570cc8ff80719f1091576d`), and `tested-commit.txt` (41 bytes, SHA-256 `9a37cd63fc1303930d8fe0efd6d7b3f6fbcdcae83b3e568098303d98ee8e11d3`).
- Original full 221,654-character decoded GitHub job log preserved verbatim as Git blob `1696f84aa7a54347107bcc7e9b5a7cc8a70311b0` at `research/quantum-information/diagnostics/BFSS_W0A0_R1_44033364617_complete_job.log`.
- Machine-readable evidence manifest at `research/quantum-information/diagnostics/BFSS_W0A0_R1_44033364617_evidence_manifest.json`.
- **Archive-preservation distinction**: original ZIP is independently retained in the current working container and available by GitHub artifact URL; the ZIP bytes have *not* yet been committed to Git, unlike the complete textual job log. Do not claim an archive Git blob or that a ZIP has been sealed in the repository.

Governance: one source RED; a bounded R2 is allowed. On two analogous source REDs stop and redesign. No QTC1/CT1 changes or full-W0 promotion.
