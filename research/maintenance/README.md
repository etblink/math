# Repository consolidation and maintenance register

**Owner authorization:** 2026-11-28, full authorization to consolidate into main and undertake focused housekeeping. Maintenance takes priority over new mathematics. This is a repository-management record, not a new theorem qualification.

## Immutable starting checkpoints

| Branch | Commit |
|---|---|
| archive/pre-consolidation-main-20261128 | fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb |
| archive/pre-consolidation-research-20261128 | 3f38e7d79ef7e49f5c8a5dcf37276d7b4d1e77bd |
| integration/bfss-unified-research-20261108 | 3f38e7d79ef7e49f5c8a5dcf37276d7b4d1e77bd |

Original research head was 3,495 commits ahead of main and zero behind; main is its ancestor. Promote a maintenance child of the research head via non-forced fast-forward; retain all history. No squash/rebase and no upstream writes. The research snapshot, proofs, all original CI definitions, historical receipts and raw data are preserved.

## Safety and decisions

- Latest visible original-branch CI entries completed; exact latest [roadmap consistency #46123329003](https://github.com/etblink/math/actions/runs/46123329003) green at frozen head. The connector's in-progress filter returned an inconsistent count (4, empty list), so global run emptiness is **not established**. No new native run launched. Branch protection details not accessible (403); no force or bypass.
- The original main had no workflow files; integration had 864. Rather than assert a complete trigger-content audit, place the entire original workflow tree in a non-executable archive with its exact Git tree SHA. This prevents activation on consolidated main and preserves original workflow bytes and pinned history. Pages deployment temporarily paused as well. Workflows on the unchanged historical integration ref are not remotely disabled; do not push or dispatch there. No mass deletion of evidence.
- [Draft PR #1](https://github.com/etblink/math/pull/1) remains open: head b9cd9e58ba41fcd9fe1860d6999dc40e3176e27d diverges by two commits. Its SpinPlaneCovariance.lean blob c262821f5532953048c9b2f3ecfbc04fa3b73f43 is identical to the research snapshot; its separate workflow is absent from research snapshot. Keep the PR and branch intact pending explicit reconciliation; do not merge/close or rebase it blindly.
- Full local git clone unavailable (network/DNS); scoped untruncated Git tree inventory via connector. Entire Lean recursive inventory truncated, so only exact BFSS subtree counted. The 2.19 MB historical gate-state JSON was subsequently parsed in full using its pinned Git blob; see the normalized gate index below. The original file is unchanged.

## Maintenance workboard

| Stage | Status |
|---|---|
| Preserve both branch checkpoints, freeze mathematical frontier | Complete |
| Exact scoped inventory (research, BFSS Lean, contributions, CI) | Complete |
| Archive historical roadmap and executable CI definitions | Complete; exact tree and historical blob verified |
| Reconcile qualification and historical evidence, including expiring original artifacts | In progress; 2,319 run metadata records, 187 normalized registry runs and cross-index links |
| Build full theorem and dependency catalogue, map superseded research and negative knowledge | Open |
| Audit links, relative references, preflight and CI compatibility | Open |
| Selectively restore a minimal approved CI suite | Open |
| Review frozen research frontier and end maintenance | Open |

## Inventory

[Baseline inventory JSON](RESEARCH_INVENTORY_2026_11_28.json): 5,846 files in four untruncated selected Git trees: 2,843 research files, 1,392 BFSS subtree files, 747 contribution files, 864 historical workflows. 39 byte-identical groups across 115 paths, not deletion candidates without provenance review. File kind is heuristic, not proof or evidence status. Baseline inventory intentionally records original paths; workflow entries include the new archive path.

## Rules for next stages

1. Index before moving. Keep existing source, data, evidence paths stable, exact historical hashes and REDs intact. Preserve superseded receipts and status separately.
2. One concise roadmap for current priorities. Existing full registry is preserved pending verified migration; no silent changes to qualification semantics.
3. Map exact Lean declaration/type, source blob, tested commit, independent consumer, axioms, run, artifact and dependency scope; computational receipts get separate provenance and status. Recover missing accepted runs without unnecessary recompilation.
4. Check historical links against their tested commit, update live navigation and old workflow references via explicit mapping. Archival roadmap bytes have old relative links; view its original pinned location for resolved paths. Existing scripts that expect the historical roadmap or workflow path must be audited before reactivation.
5. Do not restart research or execute old workflows until the gate/atlas reconciliation and trigger review are complete. Local static checks first; an actual Lean build is a later acceptance requirement where justified.

## Completed post-consolidation indexing

- [CI run catalogue](ci-run-index/README.md), 2,319 unique provider runs across 919 historical workflow IDs, no duplication across pages. Exact current main and original integration head verified after consolidation. No new consolidation-triggered run seen in latest provider list; no blanket assertion about remote CI configuration.
- [Normalized legacy gate index](NORMALIZED_LEGACY_GATE_INDEX.json): 1,813 run-bearing occurrences, only 187 distinct run IDs, 224 distinct local scalar variants, maximum nesting 49. The original registry is retained unchanged. Multiple historical status labels on 13 runs and mixed qualification flags on 3 runs are review candidates, not contradictions by themselves. No recorded complete tested SHA conflicts with provider metadata and no explicit qualified=true occurrence maps to a non-success provider result within this extraction.
- [Receipt discovery join](RECEIPT_DISCOVERY_JOIN.json): 483 distinct run IDs linked to at least one filename, registry or atlas record; 401 with a known memo/receipt pointer. All 175 registry receipt path references resolve in the original research tree. The filename-only index is intentionally incomplete; a lack of match does not show absence of evidence. Exact artifact-ID filename matches are not a complete preservation audit.
- [Baseline consolidated main](https://github.com/etblink/math/commit/b6c882db204d624b7d0bcd5e8bc7abe6db643189), [CI catalogue commit](https://github.com/etblink/math/commit/d8491154fb68784e7a9cc026406854a3a12f130c). The old integration head remains frozen. The draft PR is still open and untouched.

Next maintenance tasks: targeted qualification reconciliation across all tracks; audit original artifact retention, then dependency-indexed theorem signature catalogue. Do not turn historical labels or provider statuses into fresh proof claims. No proof gate or computational experiment resumed.

### Qualification reconciliation batch 1 (2026-11-28)

[Lifecycle reconciliation and retention triage](QUALIFICATION_LIFECYCLE_RECONCILIATION_V1.json): all 13 multi-status legacy runs reviewed against exact historical acceptance/negative receipts or manifest: nine previously qualified, four RED. Three mixed qualification flags are pending-to-acceptance transitions, not conflicting new findings. Preserve both historical states. 12/12 reported original ZIP paths confirmed at the frozen baseline by Git blob lookup (no new SHA-256 rehash). GM4B2 R2 and CSQ-F2 R1 original ZIPs are provider-only according to receipts, with live provider expiry dates Dec 23 and Dec 28 UTC respectively; QTC0A expiry Dec 1 has a repository archive. Retention audit is not complete; prioritize provider-only original binaries. No new proof qualification or CI launch. Maintenance freeze remains.

### Original artifact retention audit (2026-11-28, batch 1)

[Registry artifact discovery](artifact-audit/REGISTRY_ARTIFACT_DISCOVERY.json) lists 162 exact artifact pointers (56 have run/ID ZIP filename candidates, 106 do not). All 39 original ZIP paths in computational and integration tracks were fetched and SHA-256 recomputed ([001](artifact-audit/ZIP_DIGESTS_001.json), [002](artifact-audit/ZIP_DIGESTS_002.json), [003](artifact-audit/ZIP_DIGESTS_003.json)); 109 remaining ZIP paths across other tracks still need digest checks. [Provider triage](artifact-audit/PROVIDER_TRIAGE_002.json) covers the oldest 22 filename-unmatched records, all provider IDs found, 17 exact archived SHA-256 matches, one newly preserved expiring preflight-only RED ZIP ([original recovery](artifact-audit/ORIGINAL_RECOVERY_001.json)), and four original ZIPs recovered outside the repository. [Recovery batch 2](artifact-audit/ORIGINAL_RECOVERY_002.json) records eight independently verified original provider ZIPs (including the four unmatched cases, GM4B2 R2, CSQ-F1 R1/R2 and CSQ-F2 R1). Their binary bytes have not been committed; no claim of durable Git preservation. Exact provider identity, including reused gate names, is keyed by run and artifact ID, not filenames. The global artifact listing endpoint was rejected; per-run listing is available. Continue remaining per-run lookups and digest joins; audit other receipt-only artifact IDs after registry subset. No new CI or mathematical qualification. Maintenance freeze remains.

### Artifact audit checkpoint 2 (2026-11-28)

Complete frozen research ZIP digest inventory: [consolidated digest join](artifact-audit/FROZEN_RESEARCH_ZIP_DIGEST_JOIN_V1.json), 148 paths, 148 distinct SHA-256 digests, 2,277,132 bytes, zero blob/size discrepancies. Subsequent [missing digest metadata 1](artifact-audit/MISSING_DIGEST_PROVIDER_001.json) and [2](artifact-audit/MISSING_DIGEST_PROVIDER_002.json) recover all 19 missing/malformed digest records; 18 exact repository matches, one provider-only. Combining the joins, 91/162 registry originals match frozen ZIPs, 1 newly archived (LB1P0B R1), and 70 recovered verified originals await binary commit. The [63-original recovery record](artifact-audit/ORIGINAL_RECOVERY_003.json) confirms all 63 remaining registry-linked originals were downloaded and passed CRC, SHA-256 and embedded commit comparisons against the expected vector; 818,393 bytes. Together with previous eight recovered provider originals (seven registry-linked plus GM4B2 R2), 71 original ZIPs, 998,482 bytes, were bundled separately; bundle SHA-256 e90b4ab4978367128c14451e64ef4770e983bded2c93d9418f6acffa6a753bb0. **Binary commit is still blocked** by unavailable local Git network and no direct larger binary handoff to the connector; metadata is not binary preservation. Retain backup and commit exact bytes when possible.

[Receipt-only discovery queue](artifact-audit/RECEIPT_ONLY_DISCOVERY_QUEUE_V1.json): 321 run IDs in receipt join outside the 162 artifact-bearing registry pointers, 54 have ZIP filename candidates; 57 frozen ZIPs not joined to registry (54 have run candidates, three research packages have none). This is a discovery queue, not an artifact count. [Oldest 15 receipt-only provider checks](artifact-audit/RECEIPT_ONLY_PROVIDER_TRIAGE_001.json) returned ten empty artifact listings and five lookup errors; neither demonstrates historical absence. Resolve against pinned original repo and receipt contents, preserve recoverable evidence, do not conflate infrastructure runs with mathematical qualification. No new experiments, Lean gates, CI, source changes or workflow reactivation; maintenance freeze remains.

### Cross-track artifact reconciliation checkpoint 3 (2026-11-28)

[Known artifact checkpoint](artifact-audit/KNOWN_ARTIFACT_RECONCILIATION_CHECKPOINT_V1.json) consolidates 341 distinct artifact IDs: 162 registry-linked and 179 receipt-only. All 321 receipt-only run IDs were queried, with 179 artifact listings, 137 empty same-repository listings, and five initial 404s subsequently resolved to the companion FCP repository (all five artifact listings there empty). The [compact receipt-only disposition index](artifact-audit/RECEIPT_ONLY_PROVIDER_DISPOSITION_V1.json) links each run to its immutable audit shard. The [companion FCP provenance record](artifact-audit/HISTORICAL_FCP_PROVENANCE_V1.json) preserves five original decoded logs and 12 exact declaration-specific standard-axiom reports; historical qualifications do not imply integrated-port qualification.

All 145 provider-associated frozen ZIPs now match known original artifact digests; the other three are standalone research packages. Four additional original ZIPs have been committed (LB1P0B R1 previously and three small preflight/diagnostic artifacts in [recovery 005](artifact-audit/ORIGINAL_RECOVERY_005.json)). Total known original ZIPs durably present in Git: 149. [Recovery 004](artifact-audit/ORIGINAL_RECOVERY_004.json), [005](artifact-audit/ORIGINAL_RECOVERY_005.json), and [006](artifact-audit/ORIGINAL_RECOVERY_006.json) record 124 newly retrieved and verified originals, including 24 expiring November 28 UTC and 55 near-expiry records dated November 15–16; three of the 124 are now committed. The 192 still-uncommitted exact original ZIPs are packaged in a consolidated backup (2,548,897 original bytes; outer ZIP SHA-256 `9498b70278479822766c4613708181be2d078c6a7e8c21fb88a011b5a9c61b79`). This supersedes earlier bundles. Local Git DNS/binary handoff remains blocked; do not call backup a permanent Git commit. Preserve all evidence until exact binary import and readback.

Known-discovery audit complete, but this is not an exhaustive provider-wide artifact census or proof qualification audit. Empty listings do not imply no historical artifacts. Next: body-level receipt/source declaration cross-index, reconcile mathematical scopes across research tracks and catalogue theorem dependencies; use remaining provider-history discovery as warranted. No CI launched or workflow reactivated, no new mathematical claims. Freeze remains in force.

### Scientific knowledge atlas checkpoint 1 (2026-11-28)

[Atlas navigation](knowledge-atlas/README.md) and [unified machine index](knowledge-atlas/ATLAS_INDEX_V1.json): 97 scoped records (83 inherited plus 14 selected cross-track), 197 distinct named declarations/axiom requests, 118 editorial dependencies, 26 exact Lean source modules, 187 lexical declarations, 140 source axiom requests and 45 direct file imports. 99/99 inherited source/consumer pins and 14/14 cross-track source checks match. All recorded scientific edges resolve and are acyclic; dependency completeness remains partial and no new native qualification asserted. Historical statuses retained; N-05 cited run 43095354808 is cancelled and titled D1-B, exact association requires review. Cross-track selection distinguishes formal results, finite-tested methodology and empirical transcription. 

[Body-level discovery and recovery 007](artifact-audit/ORIGINAL_RECOVERY_007.json) adds seven original Hopf/IBI ZIPs outside previous census (including two REDs expiring November 29), all downloaded and independently verified for provider digest, size, CRC and embedded tested SHA. Known original census now 348 (149 committed, 199 verified local backups awaiting binary import). Updated backup `BFSS_original_CI_evidence_recovery_atlas_2026-11-28.zip`, SHA-256 `ba9499ce1e8964001b39b4dcbdd512233ca2138ac013e7a16d3aafe5ecef9cda`; supersedes 192-original bundle. No binary Git import in this interval. Continue body-level discovery, cross-track declaration and actual dependencies, negative knowledge, conversion mapping, reference/CI review. Freeze remains.

### Original artifact binary import — verified checkpoint 4 (2026-11-28)

Owner imported the 199 recovered original ZIPs in [commit 3b4c09706e4ed](https://github.com/etblink/math/commit/3b4c09706e4ed84b41a6d2b95ddd8f25ac1c613c). [Independent binary-import verification](artifact-audit/BINARY_IMPORT_VERIFICATION_V1.json): all 199 local archive Git blob hashes and sizes match the pinned GitHub directory inventory by canonical SHA-256 digest; 2,602,833 original bytes, all nested ZIP CRC tests pass, four preexisting entries unchanged. **All 348 currently known original provider artifacts are now preserved in Git; zero known originals awaiting import.** Earlier recovery records remain historical. Provider-wide completeness is not claimed. No CI, mathematical source edits or qualification promotions. Maintenance freeze remains in force.

### Targeted FCP source-lineage evidence and PBW atlas (2026-11-28)

Prioritize scientifically reusable evidence over indiscriminate administrative history. [FCP recovery 001](artifact-audit/FCP_PBW_ORIGINAL_RECOVERY_001.json): 21 scientifically relevant run listings inspected (20 historical source successes, one precise F1 RED); 18 original ZIPs recovered, verified for SHA-256/size/CRC, no matching Git blobs in checked current research/contributions and FCP main trees. Three empty listings do not prove expiration. 348 previously known archives remain committed; 18 additional FCP originals await binary import, 366 known in this expanded census. Existing 22-module/47-root local compiler closure reused rather than rerun; all 22 current pins match. [Atlas V3](knowledge-atlas/ATLAS_INDEX_V3.json) and [source lineage](knowledge-atlas/PBW_SOURCE_LINEAGE_001.json) preserve separate historical FCP and local compiler evidence classes. No new CI, proof qualification or source changes. Maintenance freeze remains.

### FCP PBW binary custody — verified (2026-11-28)

Owner imported 18 exact original FCP archives in [commit 634065bb9a5f](https://github.com/etblink/math/commit/634065bb9a5fe2d291e9ef52c30594eff71be7f8). [Independent verification](artifact-audit/FCP_PBW_BINARY_IMPORT_VERIFICATION_001.json) confirms 18/18 exact Git blob and size matches to the recovery manifest, 82,052 bytes, all 203 prior directory entries unchanged, no unexpected additions. Expanded known original evidence census: 366/366 committed, zero known awaiting import. The previous recovery manifest remains historical. This does not establish exhaustive coverage of either repository. No source edits, CI or qualification promotion; maintenance freeze remains.

### Original reciprocal donor and live roadmap reconciliation (2026-11-28)

[Atlas V4](knowledge-atlas/ATLAS_INDEX_V4.json) and [reciprocal shard](knowledge-atlas/SPECTRAL_RECIPROCAL_RECEIPTS_002.json): ten historical strict receipts reviewed, 20/20 current source/consumer blob pins matched, 38 historical roots and eight RED diagnostics indexed. Positive-regulator scalar, L∞, genuine original FullL2 action, AE formula, SU2 preservation, ratio, and CERT-P0 duality separated by scope. Current known artifact custody (366/366) and atlas counts now reflected in live roadmap; historic checkpoint notes unchanged. No new evidence download, CI or qualification; freeze remains.

### Hardy chain and frontier reconciliation (2026-11-28)

[Atlas V5](knowledge-atlas/ATLAS_INDEX_V5.json) and [Hardy chain](knowledge-atlas/HARDY_SOURCE_CHAIN_001.json): 21 historical strict acceptance receipts, 42/42 source/consumer pin matches, 107 main-source roots indexed (native-only diagnostic/helper reports excluded), five diagnostic scopes. G14 literal core-collapse and G15 four-plane tau norm reduction already accepted. D1B1 ordered-word bridge and Frobenius refolding remain proposed; use existing D0/D1A/D1B0 and GammaWords donors, not duplicate gamma tables. Physical phase-fixed Spin9 action, compression and graph-domain transfer remain open. All seven previously open/conditional existence records unchanged. 366 known originals remain committed; no fresh provider check, CI, math source changes or new qualification. Freeze remains.

### Spin(9) and Fock source-lineage reconciliation (2026-11-28)

[Atlas V6](knowledge-atlas/ATLAS_INDEX_V6.json) and [Spin9/Fock lineage](knowledge-atlas/SPIN9_FOCK_SOURCE_LINEAGE_001.json): 19 historical receipts reviewed; 38/38 source/consumer pin matches; 58 audited source requests; 22 historical negative run references. Operator HS, central sign, source skew K, Majorana covariance, sparse-plane and tensor donors, witness and conditional Lie-defect trace kept separate from physical Fock-vector group action and closed charge domains. Five older source files present with exact current pins, historical independent receipt reconciliation pending. All seven open/conditional existence records unchanged; full Lie bracket remains unqualified; no forced global so48 dependency. 366 known originals remain committed. No CI, fresh provider-log checks or math changes. Freeze remains.
