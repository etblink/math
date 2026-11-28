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
