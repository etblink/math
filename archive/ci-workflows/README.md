# Historical CI workflow provenance

**Cleanup pilot — November 28, 2026.** The original 864 historical workflow definitions are retained byte-for-byte at the [pre-cleanup evidence checkpoint](https://github.com/etblink/math/tree/cab6a648457fbedfbb2451fd4b148323ec5a08ec/archive/ci-workflows/2026-11-28/) and at their [original paths in the pre-consolidation research checkpoint](https://github.com/etblink/math/tree/3f38e7d79ef7e49f5c8a5dcf37276d7b4d1e77bd/.github/workflows). Both contain the same exact tree `e8471f123f74c86572a9b2390b1511f553e6a480`. The branch `archive/pre-gc-evidence-20261128` is designated for retention; no server-side branch protection is asserted.

The [machine-readable catalogue](WORKFLOW_PROVENANCE_INDEX.json) records all 864 filenames, blob IDs, modes, and byte sizes, totaling 13,107,893 bytes. Earlier references to `archive/ci-workflows/2026-11-28/<file>` resolve through the pinned snapshot, not a required current checkout file. Earlier references to `.github/workflows/<file>` resolve through the original commit. The original archive README is also available [at the checkpoint](https://github.com/etblink/math/blob/cab6a648457fbedfbb2451fd4b148323ec5a08ec/archive/ci-workflows/README.md).

To inspect a workflow without activating it, use a pinned GitHub link or, with the historical commit available locally:

```sh
git show cab6a648457fbedfbb2451fd4b148323ec5a08ec:archive/ci-workflows/2026-11-28/bfss-csqf2-original-common-square-strict.yml
git rev-parse cab6a648457fbedfbb2451fd4b148323ec5a08ec:archive/ci-workflows/2026-11-28/bfss-csqf2-original-common-square-strict.yml
```

Compare the resulting blob ID to the catalogue. No force push, history rewrite, CI dispatch or automatic restoration. Neither tree is an active workflow directory on the proposed cleanup branch. The historical registry and receipts retain their original paths and claims. New current proof contracts must reference archived donors by immutable commit/path/blob, not require old workflow files in the checkout. No mathematical qualification changes. See [cleanup review](../../research/maintenance/PROVENANCE_GC_PILOT_2026_11_28.md).
