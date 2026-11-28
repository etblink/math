# Provenance-preserving working-tree cleanup — bounded pilot

Date: 2026-11-28 Pacific. Baseline and full evidence checkpoint `cab6a648457fbedfbb2451fd4b148323ec5a08ec`. Branch `research/provenance-gc-pilot-20261128`. Main remains unchanged; no merge until owner review.

## Protected provenance by Git identity

[Evidence checkpoint](https://github.com/etblink/math/tree/cab6a648457fbedfbb2451fd4b148323ec5a08ec) is a designated retained branch containing the complete pre-cleanup tree, including post-consolidation original artifact imports, RSKA and later spin-plane recovery. The separately retained pre-consolidation research commit `3f38e7d79ef7e49f5c8a5dcf37276d7b4d1e77bd` contains the exact original workflow tree. The two workflow directory identities are `e8471f123f74c86572a9b2390b1511f553e6a480`; 864/864 original file paths, modes and blob identities are identical by tree equality. No server-side branch protection or offsite backup is asserted. Do not delete or move these retention refs, and use immutable commit IDs in citations.

## First removal class

Replace only the duplicate inert workflow directory `archive/ci-workflows/2026-11-28/` with [a compact provenance index and navigation README](../../archive/ci-workflows/README.md). Historical archive README and all 864 workflow files survive in the checkpoint. The catalogue covers 13,107,893 original file bytes; it is not a copy of the workflow bodies. All 68 archived-workflow pin occurrences in the prior 232-pin compatibility receipt resolve with the exact expected blob identity in the catalogue. None of the 35 RSKA replay inputs are in the removed subtree, and V7 contains no literal references to that subtree. The remaining 164 compatibility pin occurrences stay in their original locations. No source, evidence ZIP, research log, proof receipt, registry, prior atlas, pilot input or checker is removed.

## Reference contract

Current navigation resolves old paths using the two explicit commit/prefix mappings; historical path assertions and receipts are not rewritten. The old watchdog remains inactive. Future candidate preflight must retrieve and pin historical donors by immutable ref and path rather than require historical workflow files on main. The current compatibility memorandum's watchdog link points to the frozen copy. Not a global link audit of every historical document; earlier relative links are interpreted in their historical snapshots. No native checkout or CI execution.

## Decision

This pilot tests working-tree reduction, not actual Git object garbage collection. No history rewrite, pruning, branch deletion or qualification change. Later phases may examine raw logs and original ZIPs separately after exact custody and active-use review, including scripts that consume them, provider artifact IDs and digests. Do not remove active computational inputs, witnesses or source. Freeze stays in force. Review this branch before merging.
