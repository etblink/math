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
- Full local git clone unavailable (network/DNS); scoped untruncated Git tree inventory via connector. Entire Lean recursive inventory truncated, so only exact BFSS subtree counted. The 2.19 MB historical gate-state JSON has not been fully parsed through connector; preserve unchanged and reconcile later with local tooling.

## Maintenance workboard

| Stage | Status |
|---|---|
| Preserve both branch checkpoints, freeze mathematical frontier | Complete |
| Exact scoped inventory (research, BFSS Lean, contributions, CI) | Complete |
| Archive historical roadmap and executable CI definitions | Prepared in consolidation commit |
| Reconcile qualification and historical evidence, including expiring original artifacts | Open |
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
