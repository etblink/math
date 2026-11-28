# Provenance-preserving cleanup — archival evidence vault

2026-11-28 Pacific. Second bounded pilot at `c1e6352c992dc896568e9db93da38e5deca11698`, on `research/provenance-gc-pilot-20261128`. Main remains unchanged; merge requires owner review.

## Scope and checks

The retained [full evidence checkpoint](https://github.com/etblink/math/tree/cab6a648457fbedfbb2451fd4b148323ec5a08ec) contains all 225 recovered provider ZIPs and all five historical FCP decoded job logs at their exact original paths. File-by-file path, Git blob and size equality verified for all 230. All 225 ZIPs join uniquely to the nine original recovery/import manifests; all five logs join to HISTORICAL_FCP_PROVENANCE_V1. Where a receipt supplies an individual blob or size, it matches the checkpoint (46 individual blob pins, including five logs). Every ZIP retains prior SHA256 and CRC evidence; this audit does not freshly hash the raw ZIPs or run CRC again. The existing 370/372 known-original census is unchanged: 225 retained in this checkpoint vault, 145 original-provider ZIPs in other research paths unchanged, two known unlocated. The three other frozen research ZIP packages are not counted as originals.

The [evidence provenance catalogue](artifact-audit/EVIDENCE_PROVENANCE_INDEX.json) resolves each original full path to the exact immutable commit and blob, size, run/artifact/job identity, tested SHA and its original receipt. The five decoded logs remain distinct from original ZIPs. All existing custody manifests, historical run statuses, receipts and proof sources remain in the working tree unchanged. No V7 record, RSKA replay input, selected compatibility pin or current roadmap link points directly to a removed file. Targeted provider code search for artifact-audit/historical-fcp and selected custody-manifest references in Python, MJS and shell returned zero hits; it is not an exhaustive program-dependency analysis, does not establish absence of dynamic path construction, and no native checkout execution was performed. Historical receipt path strings remain exact; the new catalogue resolves them. A legacy verifier that requires local bytes must materialize the specific pinned file in a scratch checkout.

## Working-tree change

| Removed class | Files | Bytes |
|---|---:|---:|
| Recovered original provider ZIPs | 225 | 2809129 |
| Historical FCP decoded logs | 5 | 1850856 |
| Total | 230 | 4659985 |

Do not remove the active computational tree's 262 logs/archives/compressed arrays, including witness fixtures and replay outputs. Do not remove other track diagnostics, remaining 148 research ZIPs, recent spin-plane log, upstream comparator checks or research source files as part of this pilot. These need separate active-use and provenance review. No proof run, new CI, status promotion, history rewriting, branch deletion, object pruning, offsite backup claim or server-side protection claim. Main remains canonical, freeze remains in force.
