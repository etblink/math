# Massless14 × D69 integration candidate R1 — preflight RED, missing shallow Git ancestor

**Disposition: PRE-NATIVE WORKFLOW RED. Candidate UNQUALIFIED.**

Original [strict integration run #45052784216](https://github.com/etblink/math/actions/runs/45052784216), job `137301371734`, attempt 1, exact tested commit `b079083b8c96e7ab9ce1cda2207d20212f1602b0`. Parent unified base `6f0603e6b73db3e7c808a1a91d54bb995c510333`; new candidate branch `integration/bfss-unified-massless14-candidate-20261122`.

## Original independent evidence

Original [artifact #14766247862](https://github.com/etblink/math/actions/runs/45052784216/artifacts/14766247862), exactly three files `environment-sha256.txt`, `preflight.log`, `tested-sha.txt`, independently downloaded: **SHA-256 `98dcfa3eedf749934727bce50955e009cb0de4e769014036b7bb32c0eb09534d`** matches GitHub artifact digest, ZIP CRC all PASS and `tested-sha.txt` matches exact tested commit. Preflight parsed all frozen BFSS source pin entries and imported source blob check declarations before encountering the first failure.

Original first-causal failure at preflight `<stdin>` line 57:

```
fatal: Not a valid commit name 6f0603e6b73db3e7c808a1a91d54bb995c510333
subprocess.CalledProcessError: Command ['git','merge-base','--is-ancestor',
 '6f0603e6b73db3e7c808a1a91d54bb995c510333','HEAD']
 returned non-zero exit status 128.
```

The checkout `actions/checkout@11d5960a326750d5838078e36cf38b85af677262` used default shallow `fetch-depth: 1`. The candidate parent SHA was therefore **not fetched** in the runner, even though the GitHub remote confirms the candidate is a four-commit fast-forward descendant of that parent and that the 17-file diff contains only 14 unchanged qualified Lean source files, the new independent consumer, the manifest and the new workflow.

**This is missing Git history, not failed ancestry or mathematical source disagreement.** Lean toolchain restore, full native build, independent consumer and strict axioms **SKIPPED**; no qualified integration theorem. R1 is NOT a native Lean RED and does not count against the two-native-RED stop rule.

## Bounded R2 correction

Change **only the candidate integration workflow checkout step**, adding `fetch-depth: 0` alongside existing `persist-credentials: false` to make the parent commit available for `git merge-base --is-ancestor` and exact `git diff --name-only` acceptance gates. This strengthens / enables the original ancestry guard rather than bypassing it. Preserve **all 14 original imported Git blobs**, the original D69 source, original donor/toolchain pins, independent consumer and provenance manifest byte-for-byte. Do not suppress failure or delete the guard. Exact R2 workflow SHA/run/artifact to be adjudicated independently when available.

The separate research branch `research/bfss-hopfion-gut-counterfactuals-20261121`, unified target `integration/bfss-unified-research-20261108`, and `main` must not be modified. The result will remain **UNQUALIFIED** until original native + independent imported strict consumer + complete ZIP pass.
