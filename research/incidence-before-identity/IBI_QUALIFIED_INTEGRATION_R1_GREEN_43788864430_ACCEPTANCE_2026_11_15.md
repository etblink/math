# BFSS IBI 17-module unified-baseline import — R1 strict GREEN acceptance

Date: 2026-11-15 Pacific (GitHub Actions completed 2026-11-16 UTC).  
Repository: `etblink/math`. Candidate branch: `integration/bfss-ibi-qualified-candidate-20261115`.  
**Status: GREEN_QUALIFIED for clean-source import compilation and independent consumers; NOT unified promotion and NOT physical-strategy adoption.**

## Exactly tested immutable run

- Workflow [#43788864430](https://github.com/etblink/math/actions/runs/43788864430), event `push`, attempt 1, overall `completed/success`.
- Exact tested candidate commit: `bbc22c6e7dbb46b09db5f0b11a6ef25270a3b8e4`.
- Current unified-integration parent of candidate: `d8abb410437e0caf442dc34ff7c7d7f200dca03e`; original IBI provenance snapshot: `42aae017ab8135394f1f0910b71fdf8610cc29db`.
- Actions job `133042516651` (`current-unified-base-cold-source-and-17-independent-consumers`), all eight job steps `success`.
- Exact file & toolchain pin preflight: `BFSS_IBI_17_QUALIFIED_BLOB_AND_UNIFIED_PIN_PREFLIGHT_PASS`, 54 pins (17 Lean source blobs, 17 distinct independent-consumer blobs, 16 historical GREEN receipt blobs, original G2A/G3A donor blobs and Lean/Mathlib pins).
- Toolchain Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, native `lake build` and separately compiled source/consumers.
- Fresh build log: `Build completed successfully (9033 jobs).`
- Strict independent evidence marker: `BFSS_IBI_17_SOURCE_17_CONSUMERS_STRICT_GREEN 17 17 54`.
- 54 independently examined source `#print axioms` reports, restricted to `{propext, Classical.choice, Quot.sound}`, no `sorryAx` or compiler `error:`. 17 separately compiled independent consumer logs passed `-DautoImplicit=false -DwarningAsError=true`. The workflow checks build logs and rejects unrecognized warnings; package working-tree warnings are explicitly distinguished.
- [Preserved evidence artifact #14192405680](https://github.com/etblink/math/actions/runs/43788864430/artifacts/14192405680), 20,707 uploaded bytes reported by API; ZIP SHA-256 `33a6815c110d13efd51eb4ab656f8dbe7852d687f5e98c8230139a0ae2c996f9`. Hash is GitHub Actions' uploaded ZIP digest; it is not a separate local download/re-hash.
- Complete original source/consumer/receipt list with exact Git blobs: [import manifest](IBI_QUALIFIED_IMPORT_CANDIDATE_MANIFEST_2026_11_15.md).

## Accepted import contract

This confirms compatibility of the 17 previously qualified source-exact incidence modules with **this exact original unified-integration baseline and import closure**. It qualifies original boson Gram and signed-triple invariance, native SU2 color coefficient/determinant relationships and the typed original `GaugeGroup 2 →* SO(3)` hom and surjectivity, within the exact claims made by the already accepted source files. Every source and independent-consumer blob is unchanged from its prior experimental green evidence. The candidate diff before adding this receipt comprised precisely 17 source modules, 17 consumers, 16 prior GREEN receipts, one integration manifest and one new combined strict workflow; zero unexpected paths.

No native G14/G15 spectral/Hardy consumer was re-proved by this import workflow, no original boson orbit-classification converse was constructed, and the original physical Fock/energy/domain, Spin9, and Hardy prerequisites remain open. Prior G14/G15 qualification retains its own exact tested commit and is not automatically re-certified at this import SHA.

## Explicit negative controls, promotion policy and next action

- `IBIG2AOriginalBosonColorMatrixAdapter.lean` and its independent consumer **NOT IMPORTED**: first-causal typed mismatch in original run [#43785446322](https://github.com/etblink/math/actions/runs/43785446322), at line 42:34 `colorConjugate_coefficient` expects `GaugeGroup 2`, not raw `ColorMatrix 2`. This source and its red evidence remain on research branch.
- Octonionic Fano/gamma-source work, general bosonic orbit classification, Fock central sign, groupoid descent and ontology claims remain *unqualified/unimported* and have not been accidentally promoted.
- No full IBI branch merge and no historical research record rewrite. `main` and `integration/bfss-unified-research-20261108` were unchanged by this run or this receipt.
- **For formal promotion:** refresh candidate and current unified branch SHAs, check exact ahead/behind and source diff; verify no new unified movement; ascertain at least one nontrivial mainline consumer/utility or secure clear owner acceptance of importing as approved qualified infrastructure; if required, run a new strict gate on the exact final candidate SHA (adding this receipt should not invalidate prior compiled bytes, but it changes commit identity). Present the exact candidate SHA and bound scope for explicit owner approval before any unified ref update. Promotion must be non-force with a ref lease and must not involve `main`.

Scientific and procedural conclusion: **MATH_INTEGRATION_CANDIDATE_QUALIFIED; STRATEGY_AND_PHYSICAL_SCOPE_UNCHANGED.**
