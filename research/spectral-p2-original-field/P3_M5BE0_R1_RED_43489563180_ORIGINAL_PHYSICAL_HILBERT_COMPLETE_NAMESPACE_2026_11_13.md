# P3-M5BE0 R1 RED — missing original physical Hilbert completeness namespace

**Date:** 2026-11-13 Pacific. **Strict verdict:** VERIFIED RED; original Hamiltonian import compiled; **no new candidate declaration is accepted**.

## Frozen CI experiment and first causal error
- [Run #43489563180](https://github.com/etblink/math/actions/runs/43489563180), attempt 1, completed FAILURE; tested exact commit `b54bb9e3b62bf4012a6cad441627c77e1ace7e1b`, job `132106826109`.
- New adapter `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M5BE0OriginalNativeHamiltonianPort.lean` exact Git blob `785633769214dcdfa6ef8517d58497f83fe30760`; independent original FullL2/Fock consumer `lean/diagnostics/BFSSP3M5BE0OriginalNativeHamiltonianPortIndependentConsumer.lean` blob `9e0c5538b19cba6d5952ed95636c02f37d12677f`. **Independent consumer did not execute** because the source compilation failed.
- Unchanged current imported BE Hamiltonian source blob `0afafb8eae4b5efdbd4f95eff2ae1e9352dfe7c5`. Original BE compiles as a dependency with all fourteen `#print axioms` declarations (permitted `propext`, `Classical.choice`, `Quot.sound`), and the exact `(1/16)T†T` native domain/source definitions are unchanged.
- Exact source-closure preflight `BFSS_P3_M5BE0_EXACT_ORIGINAL_BE_SOURCE_PREFLIGHT_PASS 202 306954aa34374a58b4ab0ca93339ce90f8983519cbba6abae1b5c7025fe542af`. **202** unique source+consumer local OAI imported paths, all historically pinned to `c6253c7c8bec20ede9ac9cb725fb694c5e55d6b5` except two new candidate files; pinned Lean 4.34.1/Mathlib restoration PASS.
- **First causal error**: `P3M5BE0OriginalNativeHamiltonianPort.lean:69:6: Unknown identifier originalPhysicalHilbertComplete`. With `autoImplicit false`, the native completeness instance cannot be found. Provisional `sorryAx` in `originalPairedNormalizedH_selfAdjoint` is derivative of this failed elaboration; six other adapter root axiom prints showed no unapproved axiom but neither adapter nor consumer was qualified as a complete gate.
- Actual original theorem is defined in `FCP.BFSSSU2PhysicalDomainL6H5E8BB`, `SU2BFSSPhysicalDomainL6H5E8BBOriginalPhysicalHilbertChargeAdjointProbe.lean`, near line 37. The imported historical BE source opens the BB namespace; our adapter opened AY, BC and BE but omitted BB.
- [R1 artifact #14069639347](https://github.com/etblink/math/actions/runs/43489563180/artifacts/14069639347), 24,905 bytes, digest `sha256:ce3633dee324174a3a7ffb01b60760c83211172d15088cffbea01e0c1a8370d7`, retained by GitHub for limited period. This note preserves first-causal evidence beyond artifact expiry.

## Scoped R2 proposal
Add only one `open FCP.BFSSSU2PhysicalDomainL6H5E8BB` declaration to the **new source adapter** and the **new independent original physical Hilbert consumer**. Re-pin only their two Git blobs in the strict workflow and advisory checkpoint checker. Do not modify the historical BE source, natural domain, `(1/16)` normalization, theorem statements or existing theorem proof bodies. Then rerun identical exact source+consumer+21-root axiom gate.

## Epistemic boundary
This is a Lean namespace/elaboration issue, **not** an eigenstate counterexample, self-adjointness disproof, change of original Hamiltonian, or original BFSS mass-gap claim. M3W0D0 exact [#43484147197](https://github.com/etblink/math/actions/runs/43484147197) GREEN remains the sole latest accepted mathematics; BE0 R1 RED does not diminish its conclusion.
